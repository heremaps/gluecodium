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

package com.here.gluecodium.generator.cbridge

import com.here.gluecodium.cli.GluecodiumExecutionException
import com.here.gluecodium.generator.common.NameResolver
import com.here.gluecodium.generator.common.ReferenceMapBasedResolver
import com.here.gluecodium.generator.swift.SwiftNameRules
import com.here.gluecodium.generator.swift.SwiftSignatureResolver
import com.here.gluecodium.model.lime.LimeAttributeType
import com.here.gluecodium.model.lime.LimeAttributeValueType
import com.here.gluecodium.model.lime.LimeBasicType
import com.here.gluecodium.model.lime.LimeBasicType.TypeId
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeEnumeration
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeGenericType
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeList
import com.here.gluecodium.model.lime.LimeMap
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeReturnType
import com.here.gluecodium.model.lime.LimeSet
import com.here.gluecodium.model.lime.LimeType
import com.here.gluecodium.model.lime.LimeTypeAlias
import com.here.gluecodium.model.lime.LimeTypeRef

internal class CBridgeNameResolver(
    limeReferenceMap: Map<String, LimeElement>,
    private val swiftNameRules: SwiftNameRules,
    private val internalPrefix: String
) : ReferenceMapBasedResolver(limeReferenceMap), NameResolver {

    private val signatureResolver = SwiftSignatureResolver(limeReferenceMap, swiftNameRules)

    override fun resolveName(element: Any): String =
        when (element) {
            is LimeGenericType -> resolveGenericTypeName(element)
            is LimeType -> resolveNestedNames(element).joinToString("_")
            is LimeFunction -> resolveFunctionName(element)
            is LimeReturnType -> resolveTypeRef(element.typeRef)
            is LimeTypeRef -> resolveTypeRef(element)
            is LimeNamedElement -> swiftNameRules.getName(element)
            else -> throw GluecodiumExecutionException("Unsupported element type ${element.javaClass.name}")
        }

    private fun resolveFunctionName(limeFunction: LimeFunction): String {
        val suffix = when {
            !signatureResolver.isOverloaded(limeFunction) -> emptyList()
            limeFunction.parameters.isEmpty() -> listOf("")
            else -> signatureResolver.getSignature(limeFunction).map { mangleSignature(it) }
        }
        val parentElement = getParentElement(limeFunction)
        val functionName = when (parentElement) {
            is LimeLambda -> "call"
            else -> CBridgeNameRules.mangleName(swiftNameRules.getName(limeFunction))
        }
        return (resolveNestedNames(parentElement) + functionName + suffix).joinToString("_")
    }

    private fun resolveNestedNames(limeElement: LimeNamedElement): List<String> =
        when {
            limeElement.path.hasParent -> resolveNestedNames(getParentElement(limeElement))
            else -> limeElement.path.head
        } + CBridgeNameRules.mangleName(swiftNameRules.getName(limeElement))

    private fun resolveTypeRef(limeTypeRef: LimeTypeRef): String {
        if (limeTypeRef.isNullable) return HANDLE
        return when (val limeType = limeTypeRef.type.actualType) {
            is LimeBasicType -> resolveBasicType(limeType.typeId)
            is LimeEnumeration -> resolveName(limeType)
            else -> HANDLE
        }
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
            TypeId.DATE, TypeId.DURATION -> "double"
            else -> HANDLE
        }

    private fun resolveGenericTypeName(limeType: LimeGenericType) =
        when (limeType) {
            is LimeList -> "${internalPrefix}ArrayOf_${resolveElementTypeName(limeType.elementType)}"
            is LimeMap -> {
                val keyTypeName = resolveElementTypeName(limeType.keyType)
                val valueTypeName = resolveElementTypeName(limeType.valueType)
                "${internalPrefix}MapOf_${keyTypeName}_To_$valueTypeName"
            }
            is LimeSet -> "${internalPrefix}SetOf_${resolveElementTypeName(limeType.elementType)}"
            else -> throw GluecodiumExecutionException("Unsupported element type ${limeType.javaClass.name}")
        }

    private fun resolveElementTypeName(limeTypeRef: LimeTypeRef): String {
        val limeType = limeTypeRef.type
        if (limeType is LimeTypeAlias) return resolveElementTypeName(limeType.typeRef)

        val prefix = when {
            limeTypeRef.isNullable -> "nullable_"
            limeType is LimeBasicType -> "_"
            else -> ""
        }
        val cppType = limeTypeRef.attributes.get(LimeAttributeType.CPP, LimeAttributeValueType.TYPE, String::class.java)
        val suffix = cppType?.let { "_" + mangleSignature(it) } ?: ""
        return prefix + resolveName(limeType) + suffix
    }

    companion object {
        private const val HANDLE = "_baseRef"

        private fun mangleSignature(name: String) =
            name.replace("_", "_1").replace(":", "_2")
                .replace("[", "_3").replace("]", "_4")
                .replace("<", "_5").replace(">", "_6")
    }
}
