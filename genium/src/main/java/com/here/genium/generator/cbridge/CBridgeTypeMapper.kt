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

package com.here.genium.generator.cbridge

import com.here.genium.generator.cbridge.CBridgeNameRules.BASE_HANDLE_IMPL_FILE
import com.here.genium.generator.cbridge.CBridgeNameRules.BASE_REF_NAME
import com.here.genium.generator.cpp.CppLibraryIncludes
import com.here.genium.generator.cpp.CppIncludeResolver
import com.here.genium.generator.cpp.CppNameResolver
import com.here.genium.generator.cpp.CppTypeMapper
import com.here.genium.model.cbridge.CBridgeIncludeResolver
import com.here.genium.model.cbridge.CType
import com.here.genium.model.cbridge.CType.VOID
import com.here.genium.model.common.Include
import com.here.genium.model.cpp.CppTypeRef
import com.here.genium.model.lime.LimeArray
import com.here.genium.model.lime.LimeBasicType
import com.here.genium.model.lime.LimeBasicType.TypeId
import com.here.genium.model.lime.LimeContainer
import com.here.genium.model.lime.LimeEnumeration
import com.here.genium.model.lime.LimeMap
import com.here.genium.model.lime.LimeNamedElement
import com.here.genium.model.lime.LimeStruct
import com.here.genium.model.lime.LimeType
import com.here.genium.model.lime.LimeTypeDef
import com.here.genium.model.lime.LimeTypeHelper

class CBridgeTypeMapper(
    private val cppIncludeResolver: CppIncludeResolver,
    private val cppNameResolver: CppNameResolver,
    private val includeResolver: CBridgeIncludeResolver,
    val enumHashType: String
) {
    private val byteBufferTypeInfo = CppTypeInfo(
        CppTypeMapper.BYTE_BUFFER_POINTER_TYPE.name,
        CType(BASE_REF_NAME),
        CType.BYTE_ARRAY_REF,
        CppTypeInfo.TypeCategory.BUILTIN_BYTEBUFFER,
        listOf(Include.createInternalInclude(BASE_HANDLE_IMPL_FILE))
    )

    fun mapType(limeType: LimeType): CppTypeInfo =
        when (limeType) {
            is LimeBasicType -> mapBasicType(limeType)
            is LimeTypeDef -> mapTypeDef(limeType)
            is LimeContainer -> createCustomTypeInfo(limeType, CppTypeInfo.TypeCategory.CLASS)
            is LimeStruct -> createCustomTypeInfo(limeType, CppTypeInfo.TypeCategory.STRUCT)
            is LimeEnumeration -> createEnumTypeInfo(limeType)
            is LimeArray -> createArrayTypeInfo(mapType(limeType.elementType.type))
            else -> CppTypeInfo(VOID)
        }

    fun createCustomTypeInfo(
        limeElement: LimeNamedElement,
        category: CppTypeInfo.TypeCategory
    ): CppTypeInfo {
        val baseApiName = cppNameResolver.getFullyQualifiedName(limeElement)
        val baseApiCall = CBridgeNameRules.getBaseApiCall(category, baseApiName)

        val publicInclude = includeResolver.resolveInclude(limeElement)
        val structCType = CType(BASE_REF_NAME, publicInclude)

        val includes = listOf(publicInclude, CppLibraryIncludes.OPTIONAL) +
            cppIncludeResolver.resolveIncludes(limeElement) + BASE_HANDLE_IMPL_INCLUDE +
            CppLibraryIncludes.MEMORY + CppLibraryIncludes.NEW

        return CppTypeInfo(baseApiCall, structCType, structCType, category, includes)
    }

    fun createEnumTypeInfo(limeType: LimeType): CppTypeInfo {
        val publicInclude = includeResolver.resolveInclude(limeType)
        val baseApiIncludes = cppIncludeResolver.resolveIncludes(limeType)

        val enumCType = CType(CBridgeNameRules.getEnumName(limeType), publicInclude)

        return CppTypeInfo(
            cppNameResolver.getFullyQualifiedName(limeType),
            enumCType,
            enumCType,
            CppTypeInfo.TypeCategory.ENUM,
            listOf(publicInclude) + baseApiIncludes
        )
    }

    private fun mapBasicType(limeType: LimeBasicType) =
        when (limeType.typeId) {
            TypeId.VOID -> CppTypeInfo(CType.VOID)
            TypeId.INT8 -> CppTypeInfo(CType.INT8)
            TypeId.UINT8 -> CppTypeInfo(CType.UINT8)
            TypeId.INT16 -> CppTypeInfo(CType.INT16)
            TypeId.UINT16 -> CppTypeInfo(CType.UINT16)
            TypeId.INT32 -> CppTypeInfo(CType.INT32)
            TypeId.UINT32 -> CppTypeInfo(CType.UINT32)
            TypeId.INT64 -> CppTypeInfo(CType.INT64)
            TypeId.UINT64 -> CppTypeInfo(CType.UINT64)
            TypeId.BOOLEAN -> CppTypeInfo(CType.BOOL)
            TypeId.FLOAT -> CppTypeInfo(CType.FLOAT)
            TypeId.DOUBLE -> CppTypeInfo(CType.DOUBLE)
            TypeId.STRING -> CppTypeInfo.STRING
            TypeId.BLOB -> byteBufferTypeInfo
        }

    private fun mapTypeDef(limeTypeDef: LimeTypeDef): CppTypeInfo {
        val actualType = LimeTypeHelper.getActualType(limeTypeDef.typeRef.type)
        return when (actualType) {
            is LimeMap -> mapMapType(actualType, cppNameResolver.getFullyQualifiedName(limeTypeDef))
            else -> mapType(actualType)
        }
    }

    private fun mapMapType(limeMap: LimeMap, cppName: String): CppTypeInfo {
        val keyType = mapType(limeMap.keyType.type)
        val valueType = mapType(limeMap.valueType.type)

        val includes = mutableListOf(
            Include.createInternalInclude(BASE_HANDLE_IMPL_FILE),
            CppLibraryIncludes.MAP
        )

        val enumHash: String?
        if (keyType.typeCategory === CppTypeInfo.TypeCategory.ENUM) {
            includes.add(CppLibraryIncludes.ENUM_HASH)
            enumHash = enumHashType
        } else {
            enumHash = null
        }

        return CppMapTypeInfo(
            cppName,
            CType(BASE_REF_NAME),
            CType(BASE_REF_NAME),
            includes,
            keyType,
            valueType,
            enumHash
        )
    }

    companion object {
        val BASE_HANDLE_IMPL_INCLUDE =
            Include.createInternalInclude(CBridgeNameRules.BASE_HANDLE_IMPL_FILE)

        private fun createArrayTypeInfo(elementTypeInfo: CppTypeInfo) =
            CppArrayTypeInfo(
                "std::vector<" + elementTypeInfo.name + ">",
                CType(BASE_REF_NAME),
                CType(BASE_REF_NAME),
                listOf(
                    Include.createInternalInclude(BASE_HANDLE_IMPL_FILE),
                    CppLibraryIncludes.VECTOR
                ),
                elementTypeInfo
            )

        fun createNullableTypeInfo(
            baseTypeInfo: CppTypeInfo,
            cppTypeRef: CppTypeRef
        ) = CppTypeInfo(
            cppTypeRef.fullyQualifiedName,
            CType(BASE_REF_NAME),
            CType(BASE_REF_NAME),
            CppTypeInfo.TypeCategory.CLASS,
            baseTypeInfo.includes + cppTypeRef.includes + CppLibraryIncludes.OPTIONAL
        )
    }
}
