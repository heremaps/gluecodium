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

package com.here.gluecodium.generator.cbridge

import com.here.gluecodium.generator.cbridge.CBridgeNameRules.BASE_HANDLE_IMPL_FILE
import com.here.gluecodium.generator.cbridge.CBridgeNameRules.BASE_REF_NAME
import com.here.gluecodium.generator.cpp.CppIncludeResolver
import com.here.gluecodium.generator.cpp.CppLibraryIncludes
import com.here.gluecodium.generator.cpp.CppNameResolver
import com.here.gluecodium.model.cbridge.CArray
import com.here.gluecodium.model.cbridge.CBridgeIncludeResolver
import com.here.gluecodium.model.cbridge.CCollectionType
import com.here.gluecodium.model.cbridge.CMap
import com.here.gluecodium.model.cbridge.CSet
import com.here.gluecodium.model.cbridge.CType
import com.here.gluecodium.model.common.Include
import com.here.gluecodium.model.cpp.CppElementWithIncludes
import com.here.gluecodium.model.cpp.CppTemplateTypeRef
import com.here.gluecodium.model.cpp.CppTypeRef
import com.here.gluecodium.model.lime.LimeBasicType
import com.here.gluecodium.model.lime.LimeBasicType.TypeId
import com.here.gluecodium.model.lime.LimeContainerWithInheritance
import com.here.gluecodium.model.lime.LimeEnumeration
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeList
import com.here.gluecodium.model.lime.LimeMap
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeSet
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeType
import com.here.gluecodium.model.lime.LimeTypeAlias
import com.here.gluecodium.model.lime.LimeTypeRef

class CBridgeTypeMapper(
    private val cppIncludeResolver: CppIncludeResolver,
    private val cppNameResolver: CppNameResolver,
    private val includeResolver: CBridgeIncludeResolver,
    private val internalNamespace: List<String>
) {
    private val genericsCollector = mutableMapOf<String, CCollectionType>()
    val generics: Map<String, CCollectionType> = genericsCollector

    private val byteBufferTypeInfo = CppTypeInfo(
        "::std::shared_ptr< ::std::vector< uint8_t > >",
        CType(BASE_REF_NAME),
        CType.BYTE_ARRAY_REF,
        listOf(BASE_HANDLE_IMPL_INCLUDE)
    )

    fun mapType(limeTypeRef: LimeTypeRef, cppTypeRef: CppTypeRef): CppTypeInfo {
        val typeInfo = mapType(limeTypeRef.type, cppTypeRef)
        return when {
            limeTypeRef.isNullable -> createNullableTypeInfo(typeInfo, cppTypeRef)
            else -> typeInfo
        }
    }

    private fun mapType(limeType: LimeType, cppTypeRef: CppTypeRef): CppTypeInfo =
        when (limeType) {
            is LimeBasicType -> mapBasicType(limeType)
            is LimeTypeAlias ->
                mapType(limeType.actualType, cppTypeRef.actualType)
            is LimeContainerWithInheritance -> createCustomTypeInfo(limeType, isClass = true)
            is LimeStruct -> createCustomTypeInfo(limeType)
            is LimeEnumeration -> createEnumTypeInfo(limeType)
            is LimeList -> createArrayTypeInfo(limeType, cppTypeRef.actualType)
            is LimeMap -> createMapTypeInfo(limeType, cppTypeRef.actualType)
            is LimeSet -> createSetTypeInfo(limeType, cppTypeRef.actualType)
            is LimeLambda -> createFunctionalTypeInfo(cppTypeRef)
            else -> CppTypeInfo(CType.VOID)
        }

    fun createCustomTypeInfo(limeElement: LimeNamedElement, isClass: Boolean = false): CppTypeInfo {

        val baseApiName = cppNameResolver.getFullyQualifiedName(limeElement)
        val baseApiCall = if (isClass) "std::shared_ptr<$baseApiName>" else baseApiName

        val publicInclude = includeResolver.resolveInclude(limeElement)
        val structCType = CType(BASE_REF_NAME, publicInclude)

        val includes = listOf(publicInclude, cppIncludeResolver.optionalInclude) +
            cppIncludeResolver.resolveIncludes(limeElement) + BASE_HANDLE_IMPL_INCLUDE +
            CppLibraryIncludes.MEMORY + CppLibraryIncludes.NEW

        return CppTypeInfo(baseApiCall, structCType, structCType, includes)
    }

    fun createEnumTypeInfo(limeType: LimeType): CppTypeInfo {
        val publicInclude = includeResolver.resolveInclude(limeType)
        val baseApiIncludes = cppIncludeResolver.resolveIncludes(limeType)
        val typeName = CBridgeNameRules.getTypeName(limeType)

        return CppTypeInfo(
            name = cppNameResolver.getFullyQualifiedName(limeType),
            cType = CType(typeName, publicInclude),
            functionReturnType = CType(typeName, listOf(publicInclude)),
            includes = listOf(publicInclude) + baseApiIncludes,
            typeCategory = CppTypeInfo.TypeCategory.ENUM
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
            TypeId.DATE -> CppTypeInfo.DATE
        }

    private fun createMapTypeInfo(limeType: LimeMap, cppType: CppTypeRef): CppMapTypeInfo {

        val cppMapTypeRef = cppType as CppTemplateTypeRef
        val cppKeyType = cppMapTypeRef.templateParameters.first()
        val cppValueType = cppMapTypeRef.templateParameters.last()
        var keyType = mapType(limeType.keyType.type, cppKeyType)
        if (limeType.keyType.isNullable) {
            keyType = createNullableTypeInfo(keyType, cppKeyType)
        }
        var valueType = mapType(limeType.valueType.type, cppValueType)
        if (limeType.valueType.isNullable) {
            valueType = createNullableTypeInfo(valueType, cppValueType)
        }

        val hasStdHash = CppLibraryIncludes.hasStdHash(limeType.keyType)
        val keyTypeName = keyType.name
        val valueTypeName = valueType.name
        val cppName = if (hasStdHash) {
            "std::unordered_map<$keyTypeName, $valueTypeName>"
        } else {
            val namespace = internalNamespace.joinToString("::")
            "std::unordered_map<$keyTypeName, $valueTypeName, $namespace::hash<$keyTypeName>>"
        }
        val result = CppMapTypeInfo(
            cppName,
            CType(BASE_REF_NAME),
            listOf(BASE_HANDLE_IMPL_INCLUDE, CppLibraryIncludes.MAP),
            keyType,
            valueType
        )

        val mapName = CBridgeNameResolver.getCollectionName(limeType)
        val cMap = CMap(mapName, keyType, valueType, CppLibraryIncludes.MAP, hasStdHash)
        genericsCollector.putIfAbsent(mapName, cMap)
        return result
    }

    private fun createSetTypeInfo(
        limeType: LimeSet,
        cppType: CppTypeRef
    ): CppSetTypeInfo {

        val cppElementType = (cppType as CppTemplateTypeRef).templateParameters.first()
        var elementType = mapType(limeType.elementType.type, cppElementType)
        if (limeType.elementType.isNullable) {
            elementType = createNullableTypeInfo(elementType, cppElementType)
        }

        val keyTypeName = elementType.name
        val hasStdHash = CppLibraryIncludes.hasStdHash(limeType.elementType)
        val cppName = if (hasStdHash) {
            "std::unordered_set<$keyTypeName>"
        } else {
            val namespace = internalNamespace.joinToString("::")
            "std::unordered_set<$keyTypeName, $namespace::hash<$keyTypeName>>"
        }
        val result = CppSetTypeInfo(
            cppName,
            CType(BASE_REF_NAME),
            listOf(BASE_HANDLE_IMPL_INCLUDE, CppLibraryIncludes.SET),
            elementType
        )

        val setName = CBridgeNameResolver.getCollectionName(limeType)
        val cSet = CSet(setName, elementType, CppLibraryIncludes.SET, hasStdHash)
        genericsCollector.putIfAbsent(setName, cSet)

        return result
    }

    private fun createArrayTypeInfo(limeType: LimeList, cppType: CppTypeRef): CppArrayTypeInfo {

        val cppElementType = (cppType as CppTemplateTypeRef).templateParameters.first()
        var elementType = mapType(limeType.elementType.type, cppElementType)
        if (limeType.elementType.isNullable) {
            elementType = createNullableTypeInfo(elementType, cppElementType)
        }

        val result = CppArrayTypeInfo(
            "std::vector<${elementType.name}>",
            CType(BASE_REF_NAME),
            CType(BASE_REF_NAME),
            listOf(BASE_HANDLE_IMPL_INCLUDE, CppLibraryIncludes.VECTOR),
            elementType
        )

        val arrayName = CBridgeNameResolver.getCollectionName(limeType)
        genericsCollector.putIfAbsent(arrayName, CArray(arrayName, result))

        return result
    }

    fun createNullableTypeInfo(
        baseTypeInfo: CppTypeInfo,
        cppTypeRef: CppTypeRef
    ) = CppTypeInfo(
        cppTypeRef.fullyQualifiedName,
        CType(BASE_REF_NAME),
        CType(BASE_REF_NAME),
        baseTypeInfo.includes + cppTypeRef.includes + cppIncludeResolver.optionalInclude
    )

    companion object {
        val BASE_HANDLE_IMPL_INCLUDE = Include.createInternalInclude(BASE_HANDLE_IMPL_FILE)

        fun createFunctionalTypeInfo(cppElement: CppElementWithIncludes) =
            CppTypeInfo(
                cppElement.fullyQualifiedName,
                CType(BASE_REF_NAME),
                CType(BASE_REF_NAME),
                cppElement.includes + BASE_HANDLE_IMPL_INCLUDE
            )
    }
}
