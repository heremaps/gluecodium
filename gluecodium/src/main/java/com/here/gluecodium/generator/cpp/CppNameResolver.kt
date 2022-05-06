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
import com.here.gluecodium.generator.common.CommentsProcessor
import com.here.gluecodium.generator.common.NameResolver
import com.here.gluecodium.generator.common.ReferenceMapBasedResolver
import com.here.gluecodium.model.lime.LimeAttributeType.CPP
import com.here.gluecodium.model.lime.LimeAttributeType.OPTIMIZED
import com.here.gluecodium.model.lime.LimeAttributeValueType.ACCESSORS
import com.here.gluecodium.model.lime.LimeAttributeValueType.TYPE
import com.here.gluecodium.model.lime.LimeAttributes
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
import com.here.gluecodium.model.lime.LimeType
import com.here.gluecodium.model.lime.LimeTypeAlias
import com.here.gluecodium.model.lime.LimeTypeHelper
import com.here.gluecodium.model.lime.LimeTypeRef
import com.here.gluecodium.model.lime.LimeValue
import com.here.gluecodium.model.lime.LimeValue.Duration.TimeUnit
import com.here.gluecodium.model.lime.LimeValue.Special.ValueId

/**
 * Main name resolver for the C++ generator. Resolves names for types, type references and comments.
 * Type names are resolved as own names (unqualified names, without namespaces or outer types).
 */
internal class CppNameResolver(
    limeReferenceMap: Map<String, LimeElement>,
    internalNamespace: List<String>,
    private val nameCache: CppNameCache,
    private val limeLogger: LimeLogger? = null,
    private val commentsProcessor: CommentsProcessor? = null,
    private val forceFullNames: Boolean = false,
    private val forceFollowThrough: Boolean = false
) : ReferenceMapBasedResolver(limeReferenceMap), NameResolver {

    private val hashTypeName = (listOf("") + internalNamespace + "hash").joinToString("::")
    private val optionalTypeName = (listOf("") + internalNamespace + "optional").joinToString("::")
    private val localeTypeName = (listOf("") + internalNamespace + "Locale").joinToString("::")

    private val signatureResolver = CppSignatureResolver(limeReferenceMap, nameCache.nameRules)
    private val limeToCppNames = buildPathMap()

    override fun resolveName(element: Any): String =
        when (element) {
            is LimeComment -> resolveComment(element)
            is TypeId -> resolveBasicType(element)
            is LimeValue -> resolveValue(element)
            is LimeType -> resolveTypeName(element, isFullName = false)
            is LimeTypeRef -> resolveTypeRef(element)
            is LimeReturnType -> resolveTypeRef(element.typeRef)
            is LimeNamedElement -> nameCache.getName(element)
            else -> throw GluecodiumExecutionException("Unsupported element type ${element.javaClass.name}")
        }

    override fun resolveGetterName(element: Any) =
        when (element) {
            is LimeProperty -> nameCache.getGetterName(element)
            is LimeField -> when {
                element.external?.cpp?.get(GETTER_NAME_NAME) != null ->
                    nameCache.getGetterName(element)
                getParentElement(element).attributes.have(CPP, ACCESSORS) ->
                    nameCache.getGetterName(element)
                else -> null
            }
            else ->
                throw GluecodiumExecutionException("Unsupported element type ${element.javaClass.name}")
        }

    override fun resolveSetterName(element: Any) =
        when (element) {
            is LimeProperty -> nameCache.getSetterName(element)
            is LimeField -> when {
                element.external?.cpp?.get(SETTER_NAME_NAME) != null ->
                    nameCache.getSetterName(element)
                getParentElement(element).attributes.have(CPP, ACCESSORS) ->
                    nameCache.getSetterName(element)
                else -> null
            }
            else ->
                throw GluecodiumExecutionException("Unsupported element type ${element.javaClass.name}")
        }

    private fun resolveTypeRef(limeTypeRef: LimeTypeRef): String {
        val typeName = resolveTypeName(limeTypeRef.type, isFullName = true, limeTypeRef.attributes)
        return when {
            limeTypeRef.isNullable && limeTypeRef.type.actualType !is LimeContainerWithInheritance ->
                "$optionalTypeName< $typeName >"
            else -> typeName
        }
    }

    private fun resolveTypeName(limeType: LimeType, isFullName: Boolean, attributes: LimeAttributes? = null): String =
        when {
            forceFollowThrough && limeType is LimeTypeAlias ->
                resolveTypeName(limeType.typeRef.type, isFullName, limeType.typeRef.attributes)
            limeType is LimeBasicType -> resolveBasicType(limeType.typeId, attributes)
            limeType is LimeGenericType -> resolveGenericType(limeType, attributes)
            limeType is LimeException -> "::std::error_code"
            isFullName -> when (limeType.actualType) {
                is LimeContainerWithInheritance ->
                    "::std::shared_ptr< ${nameCache.getFullyQualifiedName(limeType)} >"
                else -> nameCache.getFullyQualifiedName(limeType)
            }
            forceFullNames -> nameCache.getFullyQualifiedName(limeType)
            else -> nameCache.getName(limeType)
        }

    private fun resolveBasicType(typeId: TypeId, attributes: LimeAttributes? = null) =
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
            TypeId.DATE -> attributes?.get(CPP, TYPE) ?: "::std::chrono::system_clock::time_point"
            TypeId.DURATION -> attributes?.get(CPP, TYPE) ?: "::std::chrono::seconds"
            TypeId.LOCALE -> localeTypeName
        }

    private fun resolveValue(limeValue: LimeValue): String =
        when (limeValue) {
            is LimeValue.Literal -> resolveLiteralValue(limeValue)
            is LimeValue.Enumerator -> nameCache.getFullyQualifiedName(limeValue.valueRef.enumerator)
            is LimeValue.Special -> {
                val valueType = limeValue.typeRef.type
                val isFloat = valueType is LimeBasicType && valueType.typeId == TypeId.FLOAT
                val signPrefix = if (limeValue.value == ValueId.NEGATIVE_INFINITY) "-" else ""
                val typeString = if (isFloat) "float" else "double"
                val valueString = if (limeValue.value == ValueId.NAN) "quiet_NaN" else "infinity"
                "${signPrefix}std::numeric_limits<$typeString>::$valueString()"
            }
            is LimeValue.Null -> "${resolveName(limeValue.typeRef)}()"
            is LimeValue.InitializerList -> resolveListValue(limeValue)
            is LimeValue.StructInitializer ->
                limeValue.values.joinToString(", ", "${resolveName(limeValue.typeRef)}{", "}") { resolveValue(it) }
            is LimeValue.KeyValuePair -> "{${resolveValue(limeValue.key)}, ${resolveValue(limeValue.value)}}"
            is LimeValue.Duration -> resolveDurationValue(limeValue)
        }

    private fun resolveLiteralValue(limeValue: LimeValue.Literal): String {
        val valueType = limeValue.typeRef.type.actualType
        if (valueType !is LimeBasicType) return limeValue.toString()
        return when (valueType.typeId) {
            TypeId.FLOAT -> "${limeValue}f"
            TypeId.DATE -> {
                val epochSeconds = LimeTypeHelper.dateLiteralEpochSeconds(limeValue.value)
                "::std::chrono::system_clock::from_time_t($epochSeconds)"
            }
            TypeId.LOCALE -> {
                val localeTag = LimeTypeHelper.normalizeLocaleTag(limeValue.value)
                "$localeTypeName(std::string{\"$localeTag\"})"
            }
            else -> limeValue.toString()
        }
    }

    private fun resolveListValue(limeValue: LimeValue.InitializerList): String {
        val limeType = limeValue.typeRef.type.actualType
        val values = limeValue.values.joinToString(", ", "{", "}") { resolveValue(it) }
        return when {
            limeType is LimeBasicType && limeType.typeId == TypeId.BLOB ->
                "::std::make_shared<::std::vector<uint8_t>>(::std::vector<uint8_t>($values))"
            else -> values
        }
    }

    private fun resolveDurationValue(limeValue: LimeValue.Duration): String {
        val typeName = resolveBasicType(TypeId.DURATION, limeValue.typeRef.attributes)
        val factoryMethod = when (limeValue.timeUnit) {
            TimeUnit.DAY, TimeUnit.HOUR -> "::std::chrono::hours"
            TimeUnit.MINUTE -> "::std::chrono::minutes"
            TimeUnit.SECOND -> "::std::chrono::seconds"
            TimeUnit.MILLISECOND -> "::std::chrono::milliseconds"
            TimeUnit.MICROSECOND -> "::std::chrono::microseconds"
            TimeUnit.NANOSECOND -> "::std::chrono::nanoseconds"
        }
        val multiplierSuffix = when (limeValue.timeUnit) {
            TimeUnit.DAY -> " * 24"
            else -> ""
        }
        return "::std::chrono::duration_cast<$typeName>($factoryMethod(${limeValue.value}$multiplierSuffix))"
    }

    private fun resolveGenericType(limeType: LimeGenericType, attributes: LimeAttributes? = null) =
        when (limeType) {
            is LimeList -> {
                val elementType = limeType.elementType
                val elementName = when {
                    (attributes?.have(OPTIMIZED) == true) &&
                        elementType.type.actualType !is LimeContainerWithInheritance ->
                        "::std::shared_ptr< ${resolveName(elementType)} >"
                    else -> resolveName(elementType)
                }
                "::std::vector< $elementName >"
            }
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
        nameCache.getFullyQualifiedName(limeElement) +
            when {
                limeElement is LimeFunction && signatureResolver.isOverloaded(limeElement) ->
                    limeElement.parameters.joinToString(prefix = "(", postfix = ")") {
                        "const ${resolveTypeRef(it.typeRef)}" + if (needsRefSuffix(it.typeRef)) "&" else ""
                    }
                else -> ""
            }

    private fun buildPathMap(): Map<String, String> {
        val result = limeReferenceMap.values
            .filterIsInstance<LimeNamedElement>()
            .filterNot { it is LimeProperty || it is LimeException || it is LimeBasicType || it is LimeParameter }
            .associateBy({ it.path.toAmbiguousString() }, { getFullyQualifiedReference(it) })
            .toMutableMap()

        result += limeReferenceMap.values.filterIsInstance<LimeException>()
            .associateBy({ it.path.toAmbiguousString() }, { resolveName(it.errorType) })
        result += limeReferenceMap.values.filterIsInstance<LimeParameter>()
            .associateBy({ it.fullName }, { resolveName(it) })

        val functions = limeReferenceMap.values.filterIsInstance<LimeFunction>()
        result += functions.associateBy({ it.path.toAmbiguousString() }, { getFullyQualifiedReference(it) })
        result += functions.associateBy(
            { function ->
                function.path.toAmbiguousString() + function.parameters
                    .joinToString(prefix = "(", postfix = ")", separator = ",") { it.typeRef.toString() }
            },
            { getFullyQualifiedReference(it) }
        )

        val properties = limeReferenceMap.values.filterIsInstance<LimeProperty>()
        result += properties.associateBy(
            { it.path.toAmbiguousString() },
            { nameCache.getFullyQualifiedGetterName(it) }
        )
        result += properties.associateBy(
            { it.path.toAmbiguousString() + ".get" },
            { nameCache.getFullyQualifiedGetterName(it) }
        )
        result += properties.filter { it.setter != null }.associateBy(
            { it.path.toAmbiguousString() + ".set" },
            { nameCache.getFullyQualifiedSetterName(it) }
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
