/*
 * Copyright (C) 2016-2025 HERE Europe B.V.
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

package com.here.gluecodium.generator.kotlin

import com.here.gluecodium.cli.GluecodiumExecutionException
import com.here.gluecodium.common.LimeLogger
import com.here.gluecodium.generator.common.CommentsProcessor
import com.here.gluecodium.generator.common.NameResolver
import com.here.gluecodium.generator.common.ReferenceMapBasedResolver
import com.here.gluecodium.model.lime.LimeAttributeType
import com.here.gluecodium.model.lime.LimeAttributeValueType.FUNCTION_NAME
import com.here.gluecodium.model.lime.LimeBasicType
import com.here.gluecodium.model.lime.LimeBasicType.TypeId
import com.here.gluecodium.model.lime.LimeComment
import com.here.gluecodium.model.lime.LimeContainerWithInheritance
import com.here.gluecodium.model.lime.LimeDirectTypeRef
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeEnumeration
import com.here.gluecodium.model.lime.LimeExternalDescriptor.Companion.NAME_NAME
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
import com.here.gluecodium.model.lime.LimeType
import com.here.gluecodium.model.lime.LimeTypeAlias
import com.here.gluecodium.model.lime.LimeTypeRef
import com.here.gluecodium.model.lime.LimeTypedElement
import com.here.gluecodium.model.lime.LimeValue

internal class KotlinNameResolver(
    limeReferenceMap: Map<String, LimeElement>,
    private val kotlinNameRules: KotlinNameRules,
    private val limeLogger: LimeLogger,
    private val commentsProcessor: CommentsProcessor,
    private val signatureResolver: KotlinSignatureResolver,
    private val basePackages: List<String>,
) : ReferenceMapBasedResolver(limeReferenceMap), NameResolver {
    private val kotlinValueResolver = KotlinValueResolver(this)
    private val limeToKotlinNames: Map<String, String> = buildPathMap()
    private val duplicateNames: Set<String>
    val typesWithDuplicateNames: Set<String>

    init {
        val duplicateNamesMap = buildDuplicateNames()
        duplicateNames = duplicateNamesMap.keys
        typesWithDuplicateNames = duplicateNamesMap.values.flatten().map { it.fullName }.toSet()
    }

    override fun resolveName(element: Any): String =
        when (element) {
            is LimeComment -> resolveComment(element)
            is LimeValue -> resolveValue(element)
            is LimeTypeAlias -> kotlinNameRules.getName(element)
            is LimeType -> resolveTypeName(element)
            is LimeTypeRef -> resolveTypeRef(element)
            is LimeReturnType -> resolveTypeRef(element.typeRef)
            is LimeFunction -> resolveFunctionName(element)
            is LimeNamedElement -> kotlinNameRules.getName(element)
            else -> throw GluecodiumExecutionException("Unsupported element type ${element.javaClass.name}")
        }

    override fun resolveReferenceName(element: Any) =
        when (element) {
            is LimeTypeRef -> resolveTypeRef(element)
            is LimeType -> resolveTypeRef(LimeDirectTypeRef(element))
            else -> null
        }

    fun resolveFullReferenceName(element: LimeNamedElement): String {
        val elementName = resolveName(element)
        if (!element.path.hasParent) {
            return (resolvePackageNames(element) + elementName).joinToString(".")
        }

        val parentElement = getParentElement(element)
        val prefix = resolveFullReferenceName(parentElement)

        return "$prefix.$elementName"
    }

    override fun resolveGetterName(element: Any) = (element as? LimeTypedElement)?.let { kotlinNameRules.getGetterName(it) }

    override fun resolveSetterName(element: Any) = (element as? LimeTypedElement)?.let { kotlinNameRules.getSetterName(it) }

    private fun resolveComment(limeComment: LimeComment): String {
        val commentText = limeComment.getFor("Kotlin")
        if (commentText.isBlank()) return ""

        val exactElement = limeReferenceMap[limeComment.path.toString()] as? LimeNamedElement
        val commentedElement = exactElement ?: getParentElement(limeComment.path, withSuffix = true)
        return commentsProcessor.process(commentedElement.fullName, commentText, limeToKotlinNames, limeLogger)
    }

    private fun resolveValue(limeValue: LimeValue): String {
        return kotlinValueResolver.resolveValue(limeValue)
    }

    private fun resolveTypeName(limeType: LimeType) =
        when (val actualType = limeType.actualType) {
            is LimeBasicType -> resolveBasicType(actualType.typeId)
            else -> kotlinNameRules.getName(actualType)
        }

    private fun resolveBasicType(typeId: TypeId) =
        when (typeId) {
            TypeId.VOID -> "Unit"
            TypeId.INT8 -> "Byte"
            TypeId.UINT8, TypeId.INT16 -> "Short"
            TypeId.UINT16, TypeId.INT32 -> "Int"
            TypeId.UINT32, TypeId.INT64, TypeId.UINT64 -> "Long"
            TypeId.BOOLEAN -> "Boolean"
            TypeId.FLOAT -> "Float"
            TypeId.DOUBLE -> "Double"
            TypeId.STRING -> "String"
            TypeId.BLOB -> "ByteArray"
            TypeId.DATE -> "Date"
            TypeId.DURATION -> "Duration"
            TypeId.LOCALE -> "Locale"
        }

    fun resolveTypeRef(limeTypeRef: LimeTypeRef): String {
        val limeType = limeTypeRef.type.actualType
        val externalName = limeType.external?.kotlin?.get(NAME_NAME)

        val typeString =
            when {
                externalName != null -> externalName
                limeType is LimeGenericType -> resolveGenericTypeRef(limeType)
                limeType !is LimeBasicType -> {
                    val nestedName = resolveNestedNames(limeType).joinToString(".")
                    if (duplicateNames.contains(nestedName)) {
                        (resolvePackageNames(limeType) + nestedName).joinToString(".")
                    } else {
                        nestedName
                    }
                }
                else -> resolveBasicType(limeType.typeId)
            }

        val suffix = if (limeTypeRef.isNullable) "?" else ""
        return typeString + suffix
    }

    private fun resolveGenericTypeRef(limeType: LimeGenericType) =
        when (limeType) {
            is LimeList -> "List<${resolveContainerParamType(limeType.elementType)}>"
            is LimeSet -> "Set<${resolveContainerParamType(limeType.elementType)}>"
            is LimeMap -> "Map<${resolveContainerParamType(limeType.keyType)}, ${resolveContainerParamType(limeType.valueType)}>"
            else -> throw GluecodiumExecutionException("Unsupported element type ${limeType.javaClass.name}")
        }

    private fun resolveContainerParamType(typeRef: LimeTypeRef) =
        if (needsToSuppressWildcards(typeRef.type)) {
            "@JvmSuppressWildcards ${resolveTypeRef(typeRef)}"
        } else {
            resolveTypeRef(typeRef)
        }

    // The parameters of generic types (List, Set, Map) must use '@JvmSuppressWildcards'
    // for 'open' types to avoid compilation problems when accessed from Java code.
    private fun needsToSuppressWildcards(type: LimeType) =
        when (type) {
            is LimeContainerWithInheritance -> type.isOpen
            is LimeLambda -> true
            is LimeEnumeration -> true
            else -> false
        }

    private fun resolveNestedNames(limeElement: LimeNamedElement): List<String> {
        val elementName = kotlinNameRules.getName(limeElement)
        val parentElement = if (limeElement.path.hasParent) getParentElement(limeElement) else null
        return when {
            parentElement != null -> resolveNestedNames(parentElement) + elementName
            else -> listOf(elementName)
        }
    }

    private fun resolveFunctionName(limeFunction: LimeFunction): String {
        val parentElement = getParentElement(limeFunction)
        return when {
            parentElement is LimeLambda -> parentElement.attributes.get(LimeAttributeType.KOTLIN, FUNCTION_NAME) ?: "apply"
            parentElement is LimeProperty && limeFunction === parentElement.setter -> resolveSetterName(parentElement)
            parentElement is LimeProperty -> resolveGetterName(parentElement)
            else -> kotlinNameRules.getName(limeFunction)
        } ?: throw GluecodiumExecutionException("Unsupported parent element ${parentElement.path}")
    }

    private fun buildPathMap(): Map<String, String> {
        val result =
            limeReferenceMap.values
                .filterIsInstance<LimeNamedElement>()
                .filterNot { it is LimeFunction || it is LimeParameter }
                .associateBy({ it.path.toAmbiguousString() }, { resolveFullName(it) })
                .toMutableMap()

        result +=
            limeReferenceMap.values.filterIsInstance<LimeParameter>()
                .associateBy({ it.fullName }, { resolveFullName(it) })

        limeReferenceMap.values.filterIsInstance<LimeFunction>().forEach { function ->
            val ambiguousKey = function.path.toAmbiguousString()
            val unambiguousKey =
                ambiguousKey +
                    function.parameters.joinToString(prefix = "(", postfix = ")", separator = ",") { it.typeRef.toString() }
            val fullName = resolveFullName(function)

            result[function.fullName] = fullName
            result[ambiguousKey] = fullName
            result[unambiguousKey] = fullName
        }

        val properties = limeReferenceMap.values.filterIsInstance<LimeProperty>()
        result += properties.associateBy({ it.path.toAmbiguousString() + ".get" }, { resolveFullName(it) })
        result +=
            properties.filter { it.setter != null }
                .associateBy({ it.path.toAmbiguousString() + ".set" }, { resolveFullName(it) })

        return result
    }

    private fun resolveFullName(limeElement: LimeNamedElement): String {
        val elementName = resolveName(limeElement)

        if (!limeElement.path.hasParent) {
            return (resolvePackageNames(limeElement) + elementName).joinToString(".")
        }

        val parentElement = getParentElement(limeElement)
        val prefix = resolveFullName(parentElement)

        val ownName =
            if (limeElement is LimeFunction && limeElement.isConstructor) resolveName(parentElement) else elementName
        return "$prefix.$ownName"
    }

    private fun buildDuplicateNames() =
        limeReferenceMap.values
            .filterIsInstance<LimeType>()
            .filterNot { it is LimeTypeAlias }
            .filter { it.external?.java == null }
            .groupBy { resolveNestedNames(it).joinToString(".") }
            .filterValues { it.size > 1 }

    fun resolvePackageNames(limeElement: LimeNamedElement) = (basePackages + limeElement.path.head).map { normalizePackageName(it) }

    companion object {
        fun normalizePackageName(name: String) = name.replace("_", "")
    }
}
