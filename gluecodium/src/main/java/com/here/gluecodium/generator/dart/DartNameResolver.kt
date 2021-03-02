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
import com.here.gluecodium.generator.common.NameResolver
import com.here.gluecodium.generator.common.NameRules
import com.here.gluecodium.generator.common.ReferenceMapBasedResolver
import com.here.gluecodium.model.lime.LimeAttributeType
import com.here.gluecodium.model.lime.LimeAttributeValueType
import com.here.gluecodium.model.lime.LimeBasicType
import com.here.gluecodium.model.lime.LimeBasicType.TypeId
import com.here.gluecodium.model.lime.LimeComment
import com.here.gluecodium.model.lime.LimeDirectTypeRef
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeExternalDescriptor.Companion.IMPORT_PATH_NAME
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeGenericType
import com.here.gluecodium.model.lime.LimeList
import com.here.gluecodium.model.lime.LimeMap
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeProperty
import com.here.gluecodium.model.lime.LimeSet
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeType
import com.here.gluecodium.model.lime.LimeTypeAlias
import com.here.gluecodium.model.lime.LimeTypeRef
import com.here.gluecodium.model.lime.LimeTypesCollection
import com.here.gluecodium.model.lime.LimeValue
import com.here.gluecodium.model.lime.LimeVisibility

internal class DartNameResolver(
    limeReferenceMap: Map<String, LimeElement>,
    private val nameRules: NameRules,
    private val limeLogger: LimeLogger,
    private val commentsProcessor: CommentsProcessor
) : ReferenceMapBasedResolver(limeReferenceMap), NameResolver {

    private val joinInfix = nameRules.ruleSet.joinInfix ?: ""
    private val limeToDartNames = buildPathMap()

    override fun resolveName(element: Any): String =
        when (element) {
            is LimeComment -> resolveComment(element)
            is TypeId -> resolveBasicType(element)
            is LimeVisibility -> resolveVisibility(element)
            is LimeBasicType -> resolveBasicType(element.typeId)
            is LimeValue -> resolveValue(element)
            is LimeGenericType -> resolveGenericType(element)
            is LimeTypeRef -> resolveTypeRefName(element)
            is LimeTypeAlias -> resolveName(element.typeRef)
            is LimeType -> resolveType(element)
            is LimeNamedElement -> getPlatformName(element)
            else ->
                throw GluecodiumExecutionException("Unsupported element type ${element.javaClass.name}")
        }

    override fun resolveReferenceName(element: Any) =
        when (element) {
            is LimeTypeRef -> resolveTypeRefName(element)
            is LimeType -> resolveTypeRefName(LimeDirectTypeRef(element))
            else -> null
        }

    private fun resolveVisibility(limeVisibility: LimeVisibility) =
        when (limeVisibility) {
            LimeVisibility.INTERNAL -> "internal$joinInfix"
            else -> ""
        }

    private fun resolveBasicType(typeId: TypeId) =
        when (typeId) {
            TypeId.VOID -> "void"
            TypeId.INT8, TypeId.UINT8, TypeId.INT16, TypeId.UINT16,
            TypeId.INT32, TypeId.UINT32, TypeId.INT64, TypeId.UINT64 -> "int"
            TypeId.BOOLEAN -> "bool"
            TypeId.FLOAT, TypeId.DOUBLE -> "double"
            TypeId.STRING -> "String"
            TypeId.BLOB -> "Uint8List"
            TypeId.DATE -> "DateTime"
            TypeId.LOCALE -> "Locale"
        }

    private fun resolveValue(limeValue: LimeValue): String =
        when (limeValue) {
            is LimeValue.Literal -> limeValue.toString()
            is LimeValue.Enumerator -> {
                val enumerator = limeValue.valueRef.enumerator
                val enumeration = getParentElement(enumerator)
                "${resolveName(enumeration)}.${resolveName(enumerator)}"
            }
            is LimeValue.Special -> {
                val specialName = when (limeValue.value) {
                    LimeValue.Special.ValueId.NAN -> "nan"
                    LimeValue.Special.ValueId.INFINITY -> "infinity"
                    LimeValue.Special.ValueId.NEGATIVE_INFINITY -> "negativeInfinity"
                }
                "double.$specialName"
            }
            is LimeValue.Null -> "null"
            is LimeValue.InitializerList -> {
                val actualType = limeValue.typeRef.type.actualType
                val prefix: String
                val postfix: String
                when (actualType) {
                    is LimeStruct -> {
                        val useDefaultsConstructor =
                            actualType.fields.isNotEmpty() && limeValue.values.isEmpty()
                        val constructorName = if (useDefaultsConstructor) ".withDefaults" else ""
                        prefix = "${resolveName(actualType)}$constructorName("
                        postfix = ")"
                    }
                    is LimeList -> {
                        prefix = "["
                        postfix = "]"
                    }
                    else -> {
                        prefix = "{"
                        postfix = "}"
                    }
                }
                limeValue.values.joinToString(
                    prefix = prefix,
                    postfix = postfix,
                    separator = ", "
                ) { resolveValue(it) }
            }
            is LimeValue.KeyValuePair ->
                "${resolveValue(limeValue.key)}: ${resolveValue(limeValue.value)}"
        }

    private fun resolveGenericType(limeType: LimeGenericType) =
        when (limeType) {
            is LimeList -> "List<${resolveName(limeType.elementType)}>"
            is LimeMap ->
                "Map<${resolveName(limeType.keyType)}, ${resolveName(limeType.valueType)}>"
            is LimeSet -> "Set<${resolveName(limeType.elementType)}>"
            else -> throw GluecodiumExecutionException(
                "Unsupported element type ${limeType.javaClass.name}"
            )
        }

    private fun resolveType(limeType: LimeType): String {
        val typeName = getPlatformName(limeType)
        val parentType = if (limeType.path.hasParent) getParentElement(limeType) else null
        return when (parentType) {
            null -> listOf(typeName)
            is LimeTypesCollection -> listOf(typeName)
            else -> listOf(resolveName(parentType), typeName)
        }.joinToString(joinInfix)
    }

    private fun resolveComment(limeComment: LimeComment): String {
        var commentText = limeComment.getFor("Dart")
        if (commentText.isBlank()) return ""

        val exactElement = limeReferenceMap[limeComment.path.toString()] as? LimeNamedElement
        if (exactElement is LimeType || exactElement is LimeFunction) {
            // For functions and types, separate first sentence with double line break.
            commentText = commentText.replaceFirst(END_OF_SENTENCE, ".\n\n")
        }

        val commentedElement = exactElement ?: getParentElement(limeComment.path)
        return commentsProcessor.process(commentedElement.fullName, commentText, limeToDartNames, limeLogger)
    }

    private fun getPlatformName(element: LimeNamedElement) =
        when {
            element.attributes.have(LimeAttributeType.DART, LimeAttributeValueType.DEFAULT) -> "\$init"
            else -> element.attributes.get(LimeAttributeType.DART, LimeAttributeValueType.NAME)
                ?: nameRules.getName(element)
        }

    private fun resolveFullName(limeElement: LimeNamedElement): String {
        if (limeElement is LimeType || !limeElement.path.hasParent) {
            return resolveName(limeElement)
        }
        val parentElement = getParentElement(limeElement)
        return "${resolveFullName(parentElement)}.${resolveName(limeElement)}"
    }

    private fun resolveTypeRefName(limeTypeRef: LimeTypeRef): String {
        val typeName = resolveName(limeTypeRef.type)
        val alias = limeTypeRef.type.actualType.external?.dart?.get(IMPORT_PATH_NAME)?.let {
            DartImportResolver.computeAlias(it)
        }
        return listOfNotNull(alias, typeName).joinToString(".")
    }

    private fun buildPathMap(): Map<String, String> {
        val result = limeReferenceMap.values
            .filterIsInstance<LimeNamedElement>()
            .associateBy({ it.fullName }, { resolveFullName(it) })
            .toMutableMap()

        val functions = limeReferenceMap.values.filterIsInstance<LimeFunction>()
        result += functions.associateBy({ it.path.withSuffix("").toString() }, { resolveFullName(it) })
        result += functions.associateBy(
            { function -> function.path.withSuffix("").toString() + function.parameters
                .joinToString(prefix = "(", postfix = ")", separator = ",") { it.typeRef.toString() } },
            { resolveFullName(it) }
        )

        val properties = limeReferenceMap.values.filterIsInstance<LimeProperty>()
        result += properties.associateBy({ it.fullName + ".get" }, { resolveFullName(it) })
        result += properties.filter { it.setter != null }.associateBy({ it.fullName + ".set" }, { resolveFullName(it) })

        return result
    }

    companion object {
        private val END_OF_SENTENCE = "\\.\\s+".toRegex()
    }
}
