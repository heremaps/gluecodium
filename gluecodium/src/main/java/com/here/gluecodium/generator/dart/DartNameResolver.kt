/*
 * Copyright (C) 2016-2019 HERE Europe B.V.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
 * License-Filename: LICENSE
 */

package com.here.gluecodium.generator.dart

import com.here.gluecodium.cli.GluecodiumExecutionException
import com.here.gluecodium.common.LimeLogger
import com.here.gluecodium.generator.common.CommentsProcessor
import com.here.gluecodium.generator.common.NameHelper
import com.here.gluecodium.generator.common.NameResolver
import com.here.gluecodium.generator.common.NameRules
import com.here.gluecodium.generator.common.ReferenceMapBasedResolver
import com.here.gluecodium.model.lime.LimeAttributeType.DART
import com.here.gluecodium.model.lime.LimeAttributeValueType
import com.here.gluecodium.model.lime.LimeAttributeValueType.DEFAULT
import com.here.gluecodium.model.lime.LimeAttributeValueType.NAME
import com.here.gluecodium.model.lime.LimeBasicType
import com.here.gluecodium.model.lime.LimeBasicType.TypeId
import com.here.gluecodium.model.lime.LimeComment
import com.here.gluecodium.model.lime.LimeDirectTypeRef
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeEnumerator
import com.here.gluecodium.model.lime.LimeExternalDescriptor.Companion.IMPORT_PATH_NAME
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeGenericType
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeList
import com.here.gluecodium.model.lime.LimeMap
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeParameter
import com.here.gluecodium.model.lime.LimeProperty
import com.here.gluecodium.model.lime.LimeReturnType
import com.here.gluecodium.model.lime.LimeSet
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeType
import com.here.gluecodium.model.lime.LimeTypeAlias
import com.here.gluecodium.model.lime.LimeTypeHelper
import com.here.gluecodium.model.lime.LimeTypeRef
import com.here.gluecodium.model.lime.LimeValue
import com.here.gluecodium.model.lime.LimeValue.Duration.TimeUnit

internal class DartNameResolver(
    limeReferenceMap: Map<String, LimeElement>,
    private val nameRules: NameRules,
    private val limeLogger: LimeLogger,
    private val commentsProcessor: CommentsProcessor,
) : ReferenceMapBasedResolver(limeReferenceMap), NameResolver {
    private val joinInfix = nameRules.ruleSet.joinInfix ?: ""
    private val duplicateNames: Set<String>
    private val limeToDartNames: Map<String, String>

    val typesWithDuplicateNames: Set<String>

    init {
        val duplicateNamesMap = buildDuplicateNames()
        duplicateNames = duplicateNamesMap.keys
        typesWithDuplicateNames = duplicateNamesMap.values.flatten().map { it.fullName }.toSet()
        limeToDartNames = buildPathMap()
    }

    override fun resolveName(element: Any): String =
        when (element) {
            is LimeComment -> resolveComment(element)
            is TypeId -> resolveBasicType(element)
            is LimeReturnType -> resolveName(element.typeRef)
            is LimeBasicType -> resolveBasicType(element.typeId)
            is LimeValue -> resolveValue(element)
            is LimeGenericType -> resolveGenericType(element)
            is LimeTypeRef -> resolveTypeRefName(element)
            is LimeTypeAlias -> resolveName(element.typeRef)
            is LimeType -> resolveTypeName(element)
            is LimeNamedElement -> getPlatformName(element)
            else ->
                throw GluecodiumExecutionException("Unsupported element type ${element.javaClass.name}")
        }

    override fun resolveReferenceName(element: Any) =
        when (element) {
            is LimeType -> resolveTypeRefName(LimeDirectTypeRef(element), ignoreDuplicates = true)
            else -> null
        }

    fun resolveFileName(limeElement: LimeNamedElement) =
        NameHelper.toLowerSnakeCase(resolveName(limeElement)).replace('<', '_').replace('>', '_')

    private fun resolveBasicType(typeId: TypeId) =
        when (typeId) {
            TypeId.VOID -> "void"
            TypeId.INT8, TypeId.UINT8, TypeId.INT16, TypeId.UINT16,
            TypeId.INT32, TypeId.UINT32, TypeId.INT64, TypeId.UINT64,
            -> "int"
            TypeId.BOOLEAN -> "bool"
            TypeId.FLOAT, TypeId.DOUBLE -> "double"
            TypeId.STRING -> "String"
            TypeId.BLOB -> "Uint8List"
            TypeId.DATE -> "DateTime"
            TypeId.DURATION -> "Duration"
            TypeId.LOCALE -> "Locale"
        }

    private fun resolveValue(limeValue: LimeValue): String =
        when (limeValue) {
            is LimeValue.Literal -> resolveLiteralValue(limeValue)
            is LimeValue.Constant -> resolveConstantValue(limeValue)
            is LimeValue.Special -> {
                val specialName =
                    when (limeValue.value) {
                        LimeValue.Special.ValueId.NAN -> "nan"
                        LimeValue.Special.ValueId.INFINITY -> "infinity"
                        LimeValue.Special.ValueId.NEGATIVE_INFINITY -> "negativeInfinity"
                    }
                "double.$specialName"
            }
            is LimeValue.Null -> "null"
            is LimeValue.InitializerList -> resolveListValue(limeValue)
            is LimeValue.StructInitializer -> {
                val actualType = limeValue.typeRef.type.actualType
                if (actualType !is LimeStruct) {
                    throw GluecodiumExecutionException("Unsupported type ${actualType.javaClass.name} for struct initializer")
                }
                val useDefaultsConstructor = actualType.fields.isNotEmpty() && limeValue.values.isEmpty()
                val noFieldsConstructor = actualType.noFieldsConstructor
                val constructorName =
                    when {
                        !useDefaultsConstructor -> ""
                        noFieldsConstructor == null ->
                            if (DartGeneratorPredicates.allFieldsCtorIsPublic(actualType)) ".withDefaults" else ""
                        noFieldsConstructor.attributes.have(DART, DEFAULT) -> ""
                        else -> resolveName(noFieldsConstructor).let { if (it.isEmpty()) "" else ".$it" }
                    }
                limeValue.values.joinToString(
                    prefix = "${resolveTypeRefName(limeValue.typeRef, ignoreNullability = true)}$constructorName(",
                    postfix = ")",
                    separator = ", ",
                ) { resolveValue(it) }
            }
            is LimeValue.KeyValuePair -> "${resolveValue(limeValue.key)}: ${resolveValue(limeValue.value)}"
            is LimeValue.Duration -> resolveDurationValue(limeValue)
        }

    private fun resolveLiteralValue(limeValue: LimeValue.Literal): String {
        val limeType = limeValue.typeRef.type.actualType
        if (limeType !is LimeBasicType) return limeType.toString()
        return when (limeType.typeId) {
            TypeId.DATE -> {
                val epochSeconds = LimeTypeHelper.dateLiteralEpochSeconds(limeValue.value)?.let { it * 1000 }
                "DateTime.fromMillisecondsSinceEpoch($epochSeconds)"
            }
            TypeId.LOCALE -> {
                val localeTag = LimeTypeHelper.normalizeLocaleTag(limeValue.value)
                "Locale.parse(\"$localeTag\")"
            }
            else -> limeValue.toString()
        }
    }

    private fun resolveConstantValue(limeValue: LimeValue.Constant): String {
        val limeElement = limeValue.valueRef.element
        val typeRef =
            when (limeElement) {
                is LimeEnumerator -> limeValue.typeRef
                else -> LimeDirectTypeRef(getParentElement(limeElement) as LimeType)
            }
        return "${resolveName(typeRef)}.${resolveName(limeElement)}"
    }

    private fun resolveListValue(limeValue: LimeValue.InitializerList): String {
        val limeType = limeValue.typeRef.type.actualType
        val values = limeValue.values.joinToString(separator = ", ") { resolveValue(it) }
        return when {
            limeType is LimeList -> "[$values]"
            limeType is LimeBasicType && limeType.typeId == TypeId.BLOB -> "Uint8List.fromList([$values])"
            else -> "{$values}"
        }
    }

    private fun resolveDurationValue(limeValue: LimeValue.Duration): String {
        val parameterName: String =
            when (limeValue.timeUnit) {
                TimeUnit.DAY -> "days"
                TimeUnit.HOUR -> "hours"
                TimeUnit.MINUTE -> "minutes"
                TimeUnit.SECOND -> "seconds"
                TimeUnit.MILLISECOND -> "milliseconds"
                TimeUnit.MICROSECOND, TimeUnit.NANOSECOND -> "microseconds"
            }
        val valueLiteral =
            when (limeValue.timeUnit) {
                // Convert to microseconds during generation to have a compile-time constant in Dart.
                TimeUnit.NANOSECOND -> (limeValue.value.toDouble() / 1000.0).toInt().toString()
                else -> limeValue.value
            }
        return "const Duration($parameterName: $valueLiteral)"
    }

    private fun resolveGenericType(limeType: LimeGenericType) =
        when (limeType) {
            is LimeList -> "List<${resolveName(limeType.elementType)}>"
            is LimeMap ->
                "Map<${resolveName(limeType.keyType)}, ${resolveName(limeType.valueType)}>"
            is LimeSet -> "Set<${resolveName(limeType.elementType)}>"
            else -> throw GluecodiumExecutionException(
                "Unsupported element type ${limeType.javaClass.name}",
            )
        }

    private fun resolveTypeName(limeType: LimeType): String {
        val enforcedFullName = limeType.attributes.get(DART, LimeAttributeValueType.FULL_NAME)
        if (enforcedFullName != null) return enforcedFullName

        val typeName = getPlatformName(limeType)
        val parentType = if (limeType.path.hasParent) getParentElement(limeType) as? LimeType else null
        return when (parentType) {
            null -> listOf(typeName)
            else -> listOf(resolveTypeName(parentType), typeName)
        }.joinToString(joinInfix)
    }

    private fun resolveComment(limeComment: LimeComment): String {
        var commentText = limeComment.getFor("Dart")
        if (commentText.isBlank()) return ""
        val limeElement = limeReferenceMap[limeComment.path.toString()] as? LimeNamedElement

        if (isNeededToSeparateFirstLine(limeElement, limeComment)) {
            commentText = commentText.replaceFirst(END_OF_SENTENCE, ".\n\n")
        }

        val commentedElement = limeElement ?: getParentElement(limeComment.path)
        return commentsProcessor.process(commentedElement.fullName, commentText, limeToDartNames, limeLogger)
    }

    private fun isNeededToSeparateFirstLine(
        limeElement: LimeNamedElement?,
        limeComment: LimeComment,
    ): Boolean {
        val isParameterComment =
            limeElement is LimeLambda &&
                limeElement.parameters.any { it.comment === limeComment }

        if (isParameterComment) {
            return false
        }

        // For functions and types, separate first sentence with double line break.
        return when (limeElement) {
            is LimeType -> true
            is LimeFunction -> true
            else -> false
        }
    }

    private fun getPlatformName(element: LimeNamedElement) =
        when {
            element.attributes.have(DART, DEFAULT) -> "\$init"
            else -> element.attributes.get(DART, NAME) ?: nameRules.getName(element)
        }

    private fun resolveFullName(limeElement: LimeNamedElement): String {
        if (limeElement is LimeType || !limeElement.path.hasParent) {
            return resolveName(limeElement)
        }
        val parentElement = getParentElement(limeElement)
        val ownName =
            when {
                limeElement is LimeFunction && limeElement.isConstructor && !limeElement.attributes.have(DART, NAME) ->
                    "${resolveName(parentElement)}()"
                else -> resolveName(limeElement)
            }
        return "${resolveFullName(parentElement)}.$ownName"
    }

    private fun resolveTypeRefName(
        limeTypeRef: LimeTypeRef,
        ignoreDuplicates: Boolean = false,
        ignoreNullability: Boolean = false,
    ): String {
        val typeName = resolveName(limeTypeRef.type)
        val importPath = limeTypeRef.type.actualType.external?.dart?.get(IMPORT_PATH_NAME)
        val alias =
            when {
                importPath != null -> computeAlias(importPath)
                ignoreDuplicates -> null
                duplicateNames.contains(typeName) -> limeTypeRef.type.actualType.path.head.joinToString("_")
                else -> null
            }
        val suffix = if (limeTypeRef.isNullable && !ignoreNullability) "?" else ""
        return listOfNotNull(alias, typeName).joinToString(".") + suffix
    }

    private fun buildPathMap(): Map<String, String> {
        val result =
            limeReferenceMap.values
                .filterIsInstance<LimeNamedElement>()
                .filterNot { it is LimeParameter }
                .associateBy({ it.path.toAmbiguousString() }, { resolveFullName(it) })
                .toMutableMap()

        result +=
            limeReferenceMap.values.filterIsInstance<LimeParameter>()
                .associateBy({ it.fullName }, { resolveFullName(it) })

        val functions = limeReferenceMap.values.filterIsInstance<LimeFunction>()
        result += functions.associateBy({ it.path.toAmbiguousString() }, { resolveFullName(it) })
        result +=
            functions.associateBy(
                { function ->
                    function.path.toAmbiguousString() +
                        function.parameters
                            .joinToString(prefix = "(", postfix = ")", separator = ",") { it.typeRef.toString() }
                },
                { resolveFullName(it) },
            )

        val properties = limeReferenceMap.values.filterIsInstance<LimeProperty>()
        result += properties.associateBy({ it.path.toAmbiguousString() + ".get" }, { resolveFullName(it) })
        result +=
            properties.filter { it.setter != null }
                .associateBy({ it.path.toAmbiguousString() + ".set" }, { resolveFullName(it) })

        return result
    }

    private fun buildDuplicateNames() =
        limeReferenceMap.values
            .filterIsInstance<LimeType>()
            .filterNot { it is LimeTypeAlias || it is LimeGenericType || it is LimeBasicType }
            .filter { it.external?.dart == null }
            .groupBy { resolveTypeName(it) }
            .filterValues { it.size > 1 }

    companion object {
        private val END_OF_SENTENCE = "\\.\\s+".toRegex()

        fun computeAlias(importPath: String) = importPath.split(':').last().split('/').last().split('.').first()
    }
}
