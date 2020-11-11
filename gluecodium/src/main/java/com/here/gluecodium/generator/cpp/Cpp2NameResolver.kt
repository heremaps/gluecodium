/*
 * Copyright (C) 2016-2020 HERE Europe B.V.
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

package com.here.gluecodium.generator.cpp

import com.here.gluecodium.cli.GluecodiumExecutionException
import com.here.gluecodium.common.LimeLogger
import com.here.gluecodium.generator.common.ReferenceMapNameResolver
import com.here.gluecodium.model.lime.LimeAttributeType.CPP
import com.here.gluecodium.model.lime.LimeAttributeValueType.ACCESSORS
import com.here.gluecodium.model.lime.LimeBasicType
import com.here.gluecodium.model.lime.LimeBasicType.TypeId
import com.here.gluecodium.model.lime.LimeComment
import com.here.gluecodium.model.lime.LimeContainerWithInheritance
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeEnumeration
import com.here.gluecodium.model.lime.LimeException
import com.here.gluecodium.model.lime.LimeExternalDescriptor.Companion.GETTER_NAME_NAME
import com.here.gluecodium.model.lime.LimeExternalDescriptor.Companion.SETTER_NAME_NAME
import com.here.gluecodium.model.lime.LimeField
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeGenericType
import com.here.gluecodium.model.lime.LimeList
import com.here.gluecodium.model.lime.LimeMap
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeParameter
import com.here.gluecodium.model.lime.LimeProperty
import com.here.gluecodium.model.lime.LimeReturnType
import com.here.gluecodium.model.lime.LimeSet
import com.here.gluecodium.model.lime.LimeSignatureResolver
import com.here.gluecodium.model.lime.LimeType
import com.here.gluecodium.model.lime.LimeTypeRef
import com.here.gluecodium.model.lime.LimeValue
import com.here.gluecodium.model.lime.LimeValue.Special.ValueId
import com.here.gluecodium.platform.common.CommentsProcessor

/**
 * Main name resolver for the C++ generator. Resolves names for types, type references and comments.
 * Type names are resolved as own names (unqualified names, without namespaces or outer types).
 */
internal class Cpp2NameResolver(
    limeReferenceMap: Map<String, LimeElement>,
    internalNamespace: List<String>,
    private val cachingNameResolver: CppNameResolver,
    private val limeLogger: LimeLogger? = null,
    private val commentsProcessor: CommentsProcessor? = null
) : ReferenceMapNameResolver(limeReferenceMap) {

    private val signatureResolver = LimeSignatureResolver(limeReferenceMap)
    private val limeToCppNames = buildPathMap()

    private val hashTypeName = (listOf("") + internalNamespace + "hash").joinToString("::")
    private val optionalTypeName = (listOf("") + internalNamespace + "optional").joinToString("::")
    private val localeTypeName = (listOf("") + internalNamespace + "Locale").joinToString("::")

    override fun resolveName(element: Any): String =
        when (element) {
            is LimeComment -> resolveComment(element)
            is TypeId -> resolveBasicType(element)
            is LimeValue -> resolveValue(element)
            is LimeType -> resolveTypeName(element, isFullName = false)
            is LimeTypeRef -> resolveTypeRef(element)
            is LimeReturnType -> resolveTypeRef(element.typeRef)
            is LimeNamedElement -> cachingNameResolver.getName(element)
            else ->
                throw GluecodiumExecutionException("Unsupported element type ${element.javaClass.name}")
        }

    override fun resolveGetterName(element: Any) =
        when (element) {
            is LimeProperty -> cachingNameResolver.getGetterName(element)
            is LimeField -> when {
                element.external?.cpp?.get(GETTER_NAME_NAME) != null ->
                    cachingNameResolver.getGetterName(element)
                getParentElement(element).attributes.have(CPP, ACCESSORS) ->
                    cachingNameResolver.getGetterName(element)
                else -> null
            }
            else ->
                throw GluecodiumExecutionException("Unsupported element type ${element.javaClass.name}")
        }

    override fun resolveSetterName(element: Any) =
        when (element) {
            is LimeProperty -> cachingNameResolver.getSetterName(element)
            is LimeField -> when {
                element.external?.cpp?.get(SETTER_NAME_NAME) != null ->
                    cachingNameResolver.getSetterName(element)
                getParentElement(element).attributes.have(CPP, ACCESSORS) ->
                    cachingNameResolver.getSetterName(element)
                else -> null
            }
            else ->
                throw GluecodiumExecutionException("Unsupported element type ${element.javaClass.name}")
        }

    private fun resolveTypeRef(limeTypeRef: LimeTypeRef): String {
        val typeName = resolveTypeName(limeTypeRef.type, isFullName = true)
        return when {
            limeTypeRef.isNullable &&
                    limeTypeRef.type.actualType !is LimeContainerWithInheritance ->
                "$optionalTypeName< $typeName >"
            else -> typeName
        }
    }

    private fun resolveTypeName(limeType: LimeType, isFullName: Boolean) =
        when {
            limeType is LimeBasicType -> resolveBasicType(limeType.typeId)
            limeType is LimeGenericType -> resolveGenericType(limeType)
            limeType is LimeException -> "::std::error_code"
            isFullName -> when (limeType.actualType) {
                is LimeContainerWithInheritance ->
                    "::std::shared_ptr< ${cachingNameResolver.getFullyQualifiedName(limeType)} >"
                else -> cachingNameResolver.getFullyQualifiedName(limeType)
            }
            else -> cachingNameResolver.getName(limeType)
        }

    private fun resolveBasicType(typeId: TypeId) =
        when (typeId) {
            TypeId.VOID -> "void"
            TypeId.INT8 -> "int8_t"
            TypeId.UINT8 -> "uint8_t"
            TypeId.INT16 -> "int16_t"
            TypeId.UINT16 -> "uint16_t"
            TypeId.INT32 -> "int32_t"
            TypeId.UINT32 -> "uint32_t"
            TypeId.INT64 -> "int64_t"
            TypeId.UINT64 -> "uint64_t"
            TypeId.BOOLEAN -> "bool"
            TypeId.FLOAT -> "float"
            TypeId.DOUBLE -> "double"
            TypeId.STRING -> "::std::string"
            TypeId.BLOB -> "::std::shared_ptr< ::std::vector< uint8_t > >"
            TypeId.DATE -> "::std::chrono::system_clock::time_point"
            TypeId.LOCALE -> localeTypeName
        }

    private fun resolveValue(limeValue: LimeValue): String =
        when (limeValue) {
            is LimeValue.Literal -> {
                val valueType = limeValue.typeRef.type
                val isFloat = valueType is LimeBasicType && valueType.typeId == TypeId.FLOAT
                limeValue.toString() + if (isFloat) "f" else ""
            }
            is LimeValue.Enumerator ->
                cachingNameResolver.getFullyQualifiedName(limeValue.valueRef.enumerator)
            is LimeValue.Special -> {
                val valueType = limeValue.typeRef.type
                val isFloat = valueType is LimeBasicType && valueType.typeId == TypeId.FLOAT
                val signPrefix = if (limeValue.value == ValueId.NEGATIVE_INFINITY) "-" else ""
                val typeString = if (isFloat) "float" else "double"
                val valueString = if (limeValue.value == ValueId.NAN) "quiet_NaN" else "infinity"
                "${signPrefix}std::numeric_limits<$typeString>::$valueString()"
            }
            is LimeValue.Null -> "${resolveName(limeValue.typeRef)}()"
            is LimeValue.InitializerList ->
                limeValue.values.joinToString(", ", "{", "}") { resolveValue(it) }
            is LimeValue.KeyValuePair ->
                "{${resolveValue(limeValue.key)}, ${resolveValue(limeValue.value)}}"
        }

    private fun resolveGenericType(limeType: LimeGenericType) =
        when (limeType) {
            is LimeList -> "::std::vector< ${resolveName(limeType.elementType)} >"
            is LimeMap -> {
                val keyName = resolveName(limeType.keyType)
                val valueName = resolveName(limeType.valueType)
                val hashInfix = resolveHashInfix(limeType.keyType, keyName)
                "::std::unordered_map< $keyName, $valueName$hashInfix >"
            }
            is LimeSet -> {
                val elementName = resolveName(limeType.elementType)
                val hashInfix = resolveHashInfix(limeType.elementType, elementName)
                "::std::unordered_set< $elementName$hashInfix >"
            }
            else -> throw GluecodiumExecutionException(
                "Unsupported element type ${limeType.javaClass.name}"
            )
        }

    private fun resolveHashInfix(limeTypeRef: LimeTypeRef, resolvedName: String) =
        if (CppLibraryIncludes.hasStdHash(limeTypeRef)) "" else ", $hashTypeName< $resolvedName >"

    private fun resolveComment(limeComment: LimeComment) =
        commentsProcessor?.process(
            limeComment.path.toString(),
            limeComment.getFor("Cpp"),
            limeToCppNames,
            limeLogger
        ) ?: ""

    private fun getFullyQualifiedReference(limeElement: LimeNamedElement) =
        cachingNameResolver.getFullyQualifiedName(limeElement) +
            when {
                limeElement is LimeFunction && signatureResolver.isOverloaded(limeElement) ->
                    limeElement.parameters.joinToString(prefix = "(", postfix = ")") {
                        "const ${resolveName(it.typeRef)}" + if (needsRefSuffix(it.typeRef)) "&" else ""
                    }
                else -> ""
            }

    private fun buildPathMap(): Map<String, String> {
        val result = limeReferenceMap.values
            .filterIsInstance<LimeNamedElement>()
            .filterNot { it is LimeProperty || it is LimeException || it is LimeBasicType || it is LimeParameter }
            .associateBy({ it.fullName }, { getFullyQualifiedReference(it) })
            .toMutableMap()

        result += limeReferenceMap.values.filterIsInstance<LimeException>()
            .associateBy({ it.fullName }, { resolveName(it.errorType) })
        result += limeReferenceMap.values.filterIsInstance<LimeParameter>()
            .associateBy({ it.fullName }, { resolveName(it) })

        val functions = limeReferenceMap.values.filterIsInstance<LimeFunction>()
        result += functions.associateBy(
            { it.path.withSuffix("").toString() },
            { getFullyQualifiedReference(it) }
        )
        result += functions.associateBy(
            { function -> function.path.withSuffix("").toString() + function.parameters
                .joinToString(prefix = "(", postfix = ")", separator = ",") { it.typeRef.toString() } },
            { getFullyQualifiedReference(it) }
        )

        val properties = limeReferenceMap.values.filterIsInstance<LimeProperty>()
        result += properties.associateBy(
            { it.fullName },
            { cachingNameResolver.getFullyQualifiedGetterName(it) }
        )
        result += properties.associateBy(
            { it.fullName + ".get" },
            { cachingNameResolver.getFullyQualifiedGetterName(it) }
        )
        result += properties.filter { it.setter != null }.associateBy(
            { it.fullName + ".set" },
            { cachingNameResolver.getFullyQualifiedSetterName(it) }
        )

        return result
    }

    companion object {
        // / Determine whether the C++ representation of the given type reference would need a
        // / reference '&' suffix when used as a function parameter type.
        fun needsRefSuffix(limeTypeRef: LimeTypeRef): Boolean {
            if (limeTypeRef.isNullable) return true
            return when (val actualType = limeTypeRef.type.actualType) {
                is LimeBasicType -> when (actualType.typeId) {
                    TypeId.STRING -> true
                    TypeId.BLOB -> true
                    TypeId.DATE -> true
                    TypeId.LOCALE -> true
                    else -> false
                }
                is LimeEnumeration -> false
                else -> true
            }
        }
    }
}
