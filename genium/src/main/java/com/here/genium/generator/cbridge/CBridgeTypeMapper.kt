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

import com.here.genium.common.FrancaTypeHelper
import com.here.genium.generator.cbridge.CBridgeNameRules.BASE_HANDLE_IMPL_FILE
import com.here.genium.generator.cbridge.CBridgeNameRules.BASE_REF_NAME
import com.here.genium.generator.cbridge.CppTypeInfo.TypeCategory.BUILTIN_BYTEBUFFER
import com.here.genium.generator.cbridge.CppTypeInfo.TypeCategory.CLASS
import com.here.genium.generator.cbridge.CppTypeInfo.TypeCategory.ENUM
import com.here.genium.generator.cbridge.CppTypeInfo.TypeCategory.STRUCT
import com.here.genium.generator.cpp.CppLibraryIncludes
import com.here.genium.generator.cpp.CppNameResolver
import com.here.genium.model.cbridge.CBridgeIncludeResolver
import com.here.genium.model.cbridge.CType
import com.here.genium.model.cbridge.CType.VOID
import com.here.genium.model.common.Include
import com.here.genium.model.common.InstanceRules.isInstanceId
import com.here.genium.model.cpp.CppIncludeResolver
import com.here.genium.model.cpp.CppTypeRef
import org.franca.core.franca.FArrayType
import org.franca.core.franca.FBasicTypeId
import org.franca.core.franca.FEnumerationType
import org.franca.core.franca.FInterface
import org.franca.core.franca.FMapType
import org.franca.core.franca.FModelElement
import org.franca.core.franca.FStructType
import org.franca.core.franca.FType
import org.franca.core.franca.FTypeDef
import org.franca.core.franca.FTypeRef
import java.util.LinkedList

class CBridgeTypeMapper(
    private val cppIncludeResolver: CppIncludeResolver,
    private val cppNameResolver: CppNameResolver,
    private val includeResolver: CBridgeIncludeResolver,
    val enumHashType: String,
    byteBufferType: String
) {
    private val byteBufferTypeInfo =
        CppTypeInfo(
            byteBufferType,
            CType(BASE_REF_NAME),
            CType.BYTE_ARRAY_REF,
            BUILTIN_BYTEBUFFER,
            listOf(Include.createInternalInclude(BASE_HANDLE_IMPL_FILE))
        )

    fun mapType(typeRef: FTypeRef): CppTypeInfo {
        var typeResult = typeRef.derived?.let { mapType(it) } ?: mapPredefined(typeRef)
        if (FrancaTypeHelper.isImplicitArray(typeRef)) {
            typeResult = CArrayMapper.createArrayReference(typeResult)
        }
        return typeResult
    }

    private fun mapType(derived: FType) =
        when (derived) {
            is FStructType -> createCustomTypeInfo(derived, STRUCT)
            is FTypeDef -> mapTypeDef(derived)
            is FEnumerationType -> createEnumTypeInfo(derived)
            is FArrayType -> CArrayMapper.createArrayReference(mapType(derived.elementType))
            else -> (derived as? FMapType)?.let { mapMapType(it) } ?: CppTypeInfo(VOID)
        }

    private fun mapTypeDef(derived: FTypeDef) =
        when {
            isInstanceId(derived) -> createCustomTypeInfo(derived.eContainer() as FInterface, CLASS)
            else -> mapType(derived.actualType)
        }

    private fun mapPredefined(type: FTypeRef) =
        when (type.predefined.value) {
            FBasicTypeId.INT8_VALUE -> CppTypeInfo(CType.INT8)
            FBasicTypeId.UINT8_VALUE -> CppTypeInfo(CType.UINT8)
            FBasicTypeId.INT16_VALUE -> CppTypeInfo(CType.INT16)
            FBasicTypeId.UINT16_VALUE -> CppTypeInfo(CType.UINT16)
            FBasicTypeId.INT32_VALUE -> CppTypeInfo(CType.INT32)
            FBasicTypeId.UINT32_VALUE -> CppTypeInfo(CType.UINT32)
            FBasicTypeId.INT64_VALUE -> CppTypeInfo(CType.INT64)
            FBasicTypeId.UINT64_VALUE -> CppTypeInfo(CType.UINT64)
            FBasicTypeId.BOOLEAN_VALUE -> CppTypeInfo(CType.BOOL)
            FBasicTypeId.FLOAT_VALUE -> CppTypeInfo(CType.FLOAT)
            FBasicTypeId.DOUBLE_VALUE -> CppTypeInfo(CType.DOUBLE)
            FBasicTypeId.STRING_VALUE -> CppTypeInfo.STRING
            FBasicTypeId.BYTE_BUFFER_VALUE -> byteBufferTypeInfo
            else -> CppTypeInfo(VOID)
        }

    fun createCustomTypeInfo(
        modelElement: FModelElement,
        category: CppTypeInfo.TypeCategory
    ): CppTypeInfo {

        val baseApiName = cppNameResolver.getFullyQualifiedName(modelElement)
        val baseApiCall = CBridgeNameRules.getBaseApiCall(category, baseApiName)

        val publicInclude = includeResolver.resolveInclude(modelElement)
        val baseApiIncludes = cppIncludeResolver.resolveIncludes(modelElement)

        val structCType = CType(BASE_REF_NAME, publicInclude)

        val includes = LinkedList(
            listOf(
                publicInclude,
                CppLibraryIncludes.OPTIONAL,
                BASE_HANDLE_IMPL_INCLUDE,
                CppLibraryIncludes.MEMORY,
                CppLibraryIncludes.NEW
            )
        )
        includes.addAll(1, baseApiIncludes)

        return CppTypeInfo(baseApiCall, structCType, structCType, category, includes)
    }

    fun createEnumTypeInfo(francaEnum: FEnumerationType): CppTypeInfo {
        val publicInclude = includeResolver.resolveInclude(francaEnum)
        val baseApiIncludes = cppIncludeResolver.resolveIncludes(francaEnum)

        val enumCType = CType(CBridgeNameRules.getEnumName(francaEnum), publicInclude)

        return CppTypeInfo(
            cppNameResolver.getFullyQualifiedName(francaEnum),
            enumCType,
            enumCType,
            ENUM,
            listOf(publicInclude) + baseApiIncludes
        )
    }

    fun createErrorTypeInfo(francaEnum: FEnumerationType): CppTypeInfo {
        val errorEnumInfo = createEnumTypeInfo(francaEnum)
        errorEnumInfo.functionReturnType.includes.add(CType.BOOL_INCLUDE)
        return errorEnumInfo
    }

    private fun mapMapType(francaMapType: FMapType): CppTypeInfo {

        val cType = CType(BASE_REF_NAME)
        val keyType = mapType(francaMapType.keyType)
        val valueType = mapType(francaMapType.valueType)

        val includes = mutableListOf(
            Include.createInternalInclude(BASE_HANDLE_IMPL_FILE),
            CppLibraryIncludes.MAP
        )

        var enumHash: String? = null
        if (keyType.typeCategory === CppTypeInfo.TypeCategory.ENUM) {
            includes.add(CppLibraryIncludes.ENUM_HASH)
            enumHash = enumHashType
        }

        return CppMapTypeInfo(
            cppNameResolver.getFullyQualifiedName(francaMapType),
            cType,
            cType,
            includes,
            keyType,
            valueType,
            enumHash
        )
    }

    companion object {
        private val BASE_HANDLE_IMPL_INCLUDE =
            Include.createInternalInclude(CBridgeNameRules.BASE_HANDLE_IMPL_FILE)

        fun createNullableTypeInfo(baseTypeInfo: CppTypeInfo, cppTypeRef: CppTypeRef): CppTypeInfo {
            val structCType = CType(BASE_REF_NAME)
            return CppTypeInfo(
                cppTypeRef.fullyQualifiedName,
                structCType,
                structCType,
                CLASS,
                baseTypeInfo.includes + cppTypeRef.includes + CppLibraryIncludes.OPTIONAL
            )
        }
    }
}
