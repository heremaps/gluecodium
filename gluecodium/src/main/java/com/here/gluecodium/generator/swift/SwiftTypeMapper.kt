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

package com.here.gluecodium.generator.swift

import com.here.gluecodium.cli.GluecodiumExecutionException
import com.here.gluecodium.generator.cbridge.CBridgeCollectionNameResolver
import com.here.gluecodium.generator.cbridge.CBridgeNameRules
import com.here.gluecodium.model.lime.LimeBasicType
import com.here.gluecodium.model.lime.LimeBasicType.TypeId
import com.here.gluecodium.model.lime.LimeClass
import com.here.gluecodium.model.lime.LimeEnumeration
import com.here.gluecodium.model.lime.LimeException
import com.here.gluecodium.model.lime.LimeExternalDescriptor.Companion.FRAMEWORK_NAME
import com.here.gluecodium.model.lime.LimeGenericType
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeList
import com.here.gluecodium.model.lime.LimeMap
import com.here.gluecodium.model.lime.LimeSet
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeType
import com.here.gluecodium.model.lime.LimeTypeAlias
import com.here.gluecodium.model.lime.LimeTypeRef
import com.here.gluecodium.model.lime.LimeTypesCollection
import com.here.gluecodium.model.swift.SwiftArray
import com.here.gluecodium.model.swift.SwiftClosure
import com.here.gluecodium.model.swift.SwiftDictionary
import com.here.gluecodium.model.swift.SwiftEnum
import com.here.gluecodium.model.swift.SwiftSet
import com.here.gluecodium.model.swift.SwiftStruct
import com.here.gluecodium.model.swift.SwiftType

class SwiftTypeMapper(
    private val nameResolver: SwiftNestedNamesResolver,
    private val cbridgeCollectionNameResolver: CBridgeCollectionNameResolver
) {

    private val genericsCollector = mutableMapOf<String, SwiftType>()
    val generics: Map<String, SwiftType> = genericsCollector

    fun mapType(limeTypeRef: LimeTypeRef): SwiftType {
        val limeType = limeTypeRef.type
        val collectGenerics = limeType.actualType is LimeGenericType
        return mapType(limeType, collectGenerics).withOptional(limeTypeRef.isNullable)
    }

    private fun mapType(limeType: LimeType, collectGenerics: Boolean = false): SwiftType {
        return when (limeType) {
            is LimeBasicType -> mapBasicType(limeType)
            is LimeStruct -> SwiftStruct(
                nameResolver.getFullName(limeType),
                CBridgeNameRules.getTypeName(limeType),
                externalFramework = limeType.external?.swift?.get(FRAMEWORK_NAME)
            )
            is LimeEnumeration -> SwiftEnum(
                nameResolver.getFullName(limeType),
                externalFramework = limeType.external?.swift?.get(FRAMEWORK_NAME)
            )
            is LimeTypeAlias ->
                mapType(limeType.typeRef.type, collectGenerics)
                    .withAlias(nameResolver.getFullName(limeType))
            is LimeClass, is LimeTypesCollection -> SwiftStruct(
                name = nameResolver.getFullName(limeType),
                cPrefix = CBridgeNameRules.getNestedSpecifierString(limeType),
                category = SwiftType.TypeCategory.CLASS
            )
            is LimeInterface -> SwiftStruct(
                name = nameResolver.getFullName(limeType),
                cPrefix = CBridgeNameRules.getNestedSpecifierString(limeType),
                category = SwiftType.TypeCategory.CLASS,
                isInterface = true
            )
            is LimeList -> mapArrayType(limeType, collectGenerics)
            is LimeMap -> mapMapType(limeType, collectGenerics)
            is LimeSet -> mapSetType(limeType, collectGenerics)
            is LimeException -> SwiftEnum(nameResolver.getFullName(limeType.errorType.type))
            is LimeLambda ->
                SwiftClosure(
                    name = nameResolver.getFullName(limeType),
                    parameters = limeType.parameters.map { mapType(it.typeRef.type) },
                    returnType = mapType(limeType.returnType.typeRef.type)
                )
            else -> throw GluecodiumExecutionException("Unmapped type: " + limeType.name)
        }
    }

    private fun getActualTypeKey(limeType: LimeType): String =
        when (limeType) {
            is LimeTypeAlias -> getActualTypeKey(limeType.typeRef.type)
            is LimeList -> "[${getActualTypeKey(limeType.elementType.type)}]"
            is LimeMap -> {
                val keyTypeKey = getActualTypeKey(limeType.keyType.type)
                val valueTypeKey = getActualTypeKey(limeType.valueType.type)
                "[$keyTypeKey:$valueTypeKey]"
            }
            is LimeSet -> "[${getActualTypeKey(limeType.elementType.type)}:]"
            else -> mapType(limeType).name
        }

    private fun mapArrayType(limeType: LimeList, collectGenerics: Boolean): SwiftArray {
        val result = SwiftArray(
            mapType(limeType.elementType.type, collectGenerics),
            cbridgeCollectionNameResolver.getCollectionName(limeType)
        )
        val actualType = limeType.actualType as LimeList
        val elementTypeKey = getActualTypeKey(actualType.elementType.type)

        if (collectGenerics) {
            genericsCollector.putIfAbsent(elementTypeKey, result.withoutAlias())
        }

        return result
    }

    private fun mapMapType(limeType: LimeMap, collectGenerics: Boolean): SwiftDictionary {
        val result = SwiftDictionary(
            mapType(limeType.keyType.type, collectGenerics),
            mapType(limeType.valueType.type, collectGenerics),
            cbridgeCollectionNameResolver.getCollectionName(limeType)
        )
        val actualType = limeType.actualType as LimeMap
        val keyTypeKey = getActualTypeKey(actualType.keyType.type)
        val valueTypeKey = getActualTypeKey(actualType.valueType.type)

        if (collectGenerics) {
            genericsCollector.putIfAbsent("$keyTypeKey:$valueTypeKey", result)
        }

        return result
    }

    private fun mapSetType(limeType: LimeSet, collectGenerics: Boolean): SwiftSet {
        val result = SwiftSet(
            mapType(limeType.elementType.type, collectGenerics),
            cbridgeCollectionNameResolver.getCollectionName(limeType)
        )
        val actualType = limeType.actualType as LimeSet
        val elementTypeKey = getActualTypeKey(actualType.elementType.type)

        if (collectGenerics) {
            genericsCollector.putIfAbsent("$elementTypeKey:", result)
        }

        return result
    }

    companion object {
        const val OBJC_PARENT_CLASS = "NSObject"

        private fun mapBasicType(limeType: LimeBasicType) =
            when (limeType.typeId) {
                TypeId.VOID -> SwiftType.VOID
                TypeId.INT8 -> SwiftType.INT8
                TypeId.UINT8 -> SwiftType.UINT8
                TypeId.INT16 -> SwiftType.INT16
                TypeId.UINT16 -> SwiftType.UINT16
                TypeId.INT32 -> SwiftType.INT32
                TypeId.UINT32 -> SwiftType.UINT32
                TypeId.INT64 -> SwiftType.INT64
                TypeId.UINT64 -> SwiftType.UINT64
                TypeId.BOOLEAN -> SwiftType.BOOL
                TypeId.STRING -> SwiftType.STRING
                TypeId.FLOAT -> SwiftType.FLOAT
                TypeId.DOUBLE -> SwiftType.DOUBLE
                TypeId.BLOB -> SwiftType.DATA
                TypeId.DATE -> SwiftType.DATE
                TypeId.LOCALE -> SwiftType.LOCALE
            }
    }
}
