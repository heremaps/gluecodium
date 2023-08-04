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

package com.here.gluecodium.generator.swift

import com.here.gluecodium.cli.GluecodiumExecutionException
import com.here.gluecodium.common.LimeLogger
import com.here.gluecodium.generator.common.CommentsProcessor
import com.here.gluecodium.generator.common.NameResolver
import com.here.gluecodium.generator.common.ReferenceMapBasedResolver
import com.here.gluecodium.model.lime.LimeAttributeType.OPTIMIZED
import com.here.gluecodium.model.lime.LimeAttributeType.SWIFT
import com.here.gluecodium.model.lime.LimeAttributeValueType.OPTION_SET
import com.here.gluecodium.model.lime.LimeBasicType
import com.here.gluecodium.model.lime.LimeBasicType.TypeId
import com.here.gluecodium.model.lime.LimeClass
import com.here.gluecodium.model.lime.LimeComment
import com.here.gluecodium.model.lime.LimeConstant
import com.here.gluecodium.model.lime.LimeContainer
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeEnumeration
import com.here.gluecodium.model.lime.LimeException
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeGenericType
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeLambdaParameter
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

internal class SwiftNameResolver(
    limeReferenceMap: Map<String, LimeElement>,
    private val nameRules: SwiftNameRules,
    private val limeLogger: LimeLogger,
    private val commentsProcessor: CommentsProcessor,
    private val signatureResolver: SwiftSignatureResolver
) : ReferenceMapBasedResolver(limeReferenceMap), NameResolver {

    private val limeToSwiftNames = buildPathMap()

    override fun resolveName(element: Any): String =
        when (element) {
            is TypeId -> resolveBasicType(element)
            is LimeComment -> resolveComment(element)
            is LimeBasicType -> resolveBasicType(element.typeId)
            is LimeValue -> resolveValue(element)
            is LimeGenericType -> resolveGenericType(element)
            is LimeTypeRef -> resolveTypeRefName(element)
            is LimeReturnType -> resolveTypeRefName(element.typeRef)
            is LimeNamedElement -> nameRules.getName(element)
            is LimeLambdaParameter -> resolveTypeRefName(element.typeRef)
            else -> throw GluecodiumExecutionException("Unsupported element type ${element.javaClass.name}")
        }

    override fun resolveReferenceName(element: Any): String? =
        when (element) {
            is LimeTypeRef -> resolveReferenceName(element.type.actualType)
            is LimeType -> resolveFullName(element)
            else -> null
        }

    private fun resolveBasicType(typeId: TypeId) =
        when (typeId) {
            TypeId.VOID -> "Void"
            TypeId.INT8 -> "Int8"
            TypeId.UINT8 -> "UInt8"
            TypeId.INT16 -> "Int16"
            TypeId.UINT16 -> "UInt16"
            TypeId.INT32 -> "Int32"
            TypeId.UINT32 -> "UInt32"
            TypeId.INT64 -> "Int64"
            TypeId.UINT64 -> "UInt64"
            TypeId.BOOLEAN -> "Bool"
            TypeId.FLOAT -> "Float"
            TypeId.DOUBLE -> "Double"
            TypeId.STRING -> "String"
            TypeId.BLOB -> "Data"
            TypeId.DATE -> "Date"
            TypeId.DURATION -> "TimeInterval"
            TypeId.LOCALE -> "Locale"
        }

    private fun resolveValue(limeValue: LimeValue): String =
        when (limeValue) {
            is LimeValue.Literal -> resolveLiteralValue(limeValue)
            is LimeValue.Constant -> {
                val limeElement = limeValue.valueRef.element
                val parentElement = getParentElement(limeElement)
                "${resolveReferenceName(parentElement)}.${resolveName(limeElement)}"
            }
            is LimeValue.Special -> {
                val signPrefix = if (limeValue.value == LimeValue.Special.ValueId.NEGATIVE_INFINITY) "-" else ""
                val valueType = limeValue.typeRef.type.actualType as LimeBasicType
                val typePrefix = if (valueType.typeId == TypeId.FLOAT) "Float" else "Double"
                val valueName = if (limeValue.value == LimeValue.Special.ValueId.NAN) "nan" else "infinity"
                "$signPrefix$typePrefix.$valueName"
            }
            is LimeValue.Null -> "nil"
            is LimeValue.InitializerList -> resolveListValue(limeValue)
            is LimeValue.StructInitializer -> {
                val actualType = limeValue.typeRef.type.actualType
                if (actualType !is LimeStruct) {
                    throw GluecodiumExecutionException("Unsupported type ${actualType.javaClass.name} for struct initializer")
                }
                limeValue.values
                    .mapIndexed { index, it -> resolveName(actualType.fields[index]) + ": " + resolveValue(it) }
                    .joinToString(prefix = "${resolveReferenceName(actualType)}(", postfix = ")", separator = ", ")
            }
            is LimeValue.KeyValuePair -> "${resolveValue(limeValue.key)}: ${resolveValue(limeValue.value)}"
            is LimeValue.Duration -> resolveDurationValue(limeValue)
        }

    private fun resolveLiteralValue(limeValue: LimeValue.Literal): String {
        val limeType = limeValue.typeRef.type.actualType
        if (limeType !is LimeBasicType) return limeType.toString()
        return when (limeType.typeId) {
            TypeId.DATE -> {
                val epochSeconds = LimeTypeHelper.dateLiteralEpochSeconds(limeValue.value)
                "Date(timeIntervalSince1970: $epochSeconds)"
            }
            TypeId.LOCALE -> {
                val localeTag = LimeTypeHelper.normalizeLocaleTag(limeValue.value)
                "Locale(identifier: \"$localeTag\")"
            }
            else -> limeValue.toString()
        }
    }

    private fun resolveListValue(limeValue: LimeValue.InitializerList): String {
        val limeType = limeValue.typeRef.type.actualType
        if (limeType is LimeMap && limeValue.values.isEmpty()) return "[:]"

        val values = limeValue.values.joinToString(prefix = "[", postfix = "]", separator = ", ") { resolveValue(it) }
        return when {
            limeType is LimeBasicType && limeType.typeId == TypeId.BLOB -> "Data($values)"
            else -> values
        }
    }

    private fun resolveDurationValue(limeValue: LimeValue.Duration): String {
        val multiplier = when (limeValue.timeUnit) {
            TimeUnit.DAY -> 3600 * 24
            TimeUnit.HOUR -> 3600
            TimeUnit.MINUTE -> 60
            TimeUnit.SECOND -> null
            TimeUnit.MILLISECOND -> 1e-3
            TimeUnit.MICROSECOND -> 1e-6
            TimeUnit.NANOSECOND -> 1e-9
        }
        val multiplierSuffix = multiplier?.let { " * $it" } ?: ""
        return limeValue.value + multiplierSuffix
    }

    private fun resolveGenericType(limeType: LimeGenericType) =
        when (limeType) {
            is LimeList -> "[${resolveName(limeType.elementType)}]"
            is LimeMap -> "[${resolveName(limeType.keyType)}: ${resolveName(limeType.valueType)}]"
            is LimeSet -> {
                val actualType = limeType.elementType.type.actualType
                val elementTypeName = resolveName(limeType.elementType)
                when {
                    actualType is LimeEnumeration && actualType.attributes.have(SWIFT, OPTION_SET) -> elementTypeName
                    else -> "Set<$elementTypeName>"
                }
            }
            else -> throw GluecodiumExecutionException("Unsupported element type ${limeType.javaClass.name}")
        }

    private fun resolveComment(limeComment: LimeComment): String {
        val commentText = limeComment.getFor("Swift")
        if (commentText.isBlank()) return ""

        val exactElement = limeReferenceMap[limeComment.path.toString()] as? LimeNamedElement
        val commentedElement = exactElement ?: getParentElement(limeComment.path, withSuffix = true)
        return commentsProcessor.process(commentedElement.fullName, commentText, limeToSwiftNames, limeLogger)
    }

    private fun resolveTypeRefName(limeTypeRef: LimeTypeRef): String {
        if (limeTypeRef.attributes.have(OPTIMIZED)) {
            val elementName = resolveName((limeTypeRef.type.actualType as LimeList).elementType)
            return "CollectionOf<$elementName>"
        }
        return resolveFullName(limeTypeRef.type) + if (limeTypeRef.isNullable) "?" else ""
    }

    private fun resolveFullName(limeElement: LimeNamedElement) = getNestedNames(limeElement).joinToString(".")

    private fun getNestedNames(limeElement: LimeNamedElement): List<String> {
        val parentElement = limeReferenceMap.takeIf { limeElement.path.hasParent }
            ?.get(limeElement.path.parent.toString()) as? LimeNamedElement

        val name = if (limeElement is LimeFunction && limeElement.isConstructor) "init" else resolveName(limeElement)
        return when {
            parentElement == null -> listOf(name)
            limeElement is LimeInterface -> listOf(name)
            limeElement is LimeConstant -> getNestedNames(parentElement) + name
            parentElement !is LimeContainer -> getNestedNames(parentElement) + name
            parentElement is LimeClass || parentElement is LimeStruct -> getNestedNames(parentElement) + name
            parentElement is LimeInterface && (limeElement is LimeTypeAlias || limeElement is LimeLambda) ->
                getNestedNames(parentElement) + name
            parentElement is LimeInterface &&
                limeElement is LimeException && name != resolveName(limeElement.errorType) ->
                getNestedNames(parentElement) + name
            else -> listOf(name)
        }
    }

    private fun buildPathMap(): Map<String, String> {
        val result = limeReferenceMap.values
            .filterIsInstance<LimeNamedElement>()
            .filterNot { it is LimeParameter }
            .associateBy({ it.path.toAmbiguousString() }, { resolveFullName(it) })
            .toMutableMap()

        limeReferenceMap.values.filterIsInstance<LimeFunction>().forEach { function ->
            val ambiguousKey = function.path.toAmbiguousString()
            val functionCommentRef = resolveCommentRef(function, signatureResolver)
            result[ambiguousKey] = functionCommentRef

            val unambiguousKey = ambiguousKey +
                function.parameters.joinToString(prefix = "(", postfix = ")", separator = ",") { it.typeRef.toString() }
            result[unambiguousKey] = functionCommentRef

            result += function.parameters.associateBy({ it.fullName }, { "$functionCommentRef.${resolveName(it)}" })
        }

        val properties = limeReferenceMap.values.filterIsInstance<LimeProperty>()
        result += properties.associateBy({ it.path.toAmbiguousString() + ".get" }, { resolveFullName(it) })
        result += properties.filter { it.setter != null }
            .associateBy({ it.path.toAmbiguousString() + ".set" }, { resolveFullName(it) })

        return result
    }

    private fun resolveCommentRef(limeFunction: LimeFunction, signatureResolver: SwiftSignatureResolver): String {
        val fullName = resolveFullName(limeFunction)
        return fullName + when {
            signatureResolver.isOverloaded(limeFunction) ->
                limeFunction.parameters.joinToString(prefix = "(", postfix = ")") { resolveTypeRefName(it.typeRef) }
            else -> "(...)"
        }
    }
}
