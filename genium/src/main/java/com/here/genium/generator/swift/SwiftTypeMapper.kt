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

package com.here.genium.generator.swift

import com.here.genium.cli.GeniumExecutionException
import com.here.genium.generator.cbridge.CBridgeNameResolver
import com.here.genium.generator.cbridge.CBridgeNameRules
import com.here.genium.model.lime.LimeBasicType
import com.here.genium.model.lime.LimeBasicType.TypeId
import com.here.genium.model.lime.LimeClass
import com.here.genium.model.lime.LimeEnumeration
import com.here.genium.model.lime.LimeException
import com.here.genium.model.lime.LimeInterface
import com.here.genium.model.lime.LimeList
import com.here.genium.model.lime.LimeMap
import com.here.genium.model.lime.LimeSet
import com.here.genium.model.lime.LimeStruct
import com.here.genium.model.lime.LimeType
import com.here.genium.model.lime.LimeTypeAlias
import com.here.genium.model.lime.LimeTypeHelper
import com.here.genium.model.lime.LimeTypesCollection
import com.here.genium.model.swift.SwiftArray
import com.here.genium.model.swift.SwiftDictionary
import com.here.genium.model.swift.SwiftEnum
import com.here.genium.model.swift.SwiftSet
import com.here.genium.model.swift.SwiftStruct
import com.here.genium.model.swift.SwiftType

class SwiftTypeMapper(private val nameResolver: SwiftNameResolver) {

    private val genericsCollector = mutableMapOf<String, SwiftType>()
    val generics: Map<String, SwiftType> = genericsCollector

    fun mapType(limeType: LimeType): SwiftType {
        return when (limeType) {
            is LimeBasicType -> mapBasicType(limeType)
            is LimeStruct -> SwiftStruct(
                nameResolver.getFullName(limeType),
                CBridgeNameRules.getTypeName(limeType)
            )
            is LimeEnumeration -> SwiftEnum(nameResolver.getFullName(limeType))
            is LimeTypeAlias ->
                mapType(limeType.typeRef.type).withAlias(nameResolver.getFullName(limeType))
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
            is LimeList -> mapArrayType(limeType)
            is LimeMap -> mapMapType(limeType)
            is LimeSet -> mapSetType(limeType)
            is LimeException -> SwiftEnum(nameResolver.getFullName(limeType.errorEnum.type))
            else -> throw GeniumExecutionException("Unmapped type: " + limeType.name)
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

    private fun mapArrayType(limeType: LimeList): SwiftArray {
        val result = SwiftArray(
            mapType(limeType.elementType.type),
            CBridgeNameResolver.getCollectionName(limeType)
        )
        val actualType = LimeTypeHelper.getActualType(limeType) as LimeList
        val elementTypeKey = getActualTypeKey(actualType.elementType.type)
        genericsCollector.putIfAbsent(elementTypeKey, result.withoutAlias())

        return result
    }

    private fun mapMapType(limeType: LimeMap): SwiftDictionary {
        val result = SwiftDictionary(
            mapType(limeType.keyType.type),
            mapType(limeType.valueType.type),
            CBridgeNameResolver.getCollectionName(limeType)
        )
        val actualType = LimeTypeHelper.getActualType(limeType) as LimeMap
        val keyTypeKey = getActualTypeKey(actualType.keyType.type)
        val valueTypeKey = getActualTypeKey(actualType.valueType.type)
        genericsCollector.putIfAbsent("$keyTypeKey:$valueTypeKey", result)

        return result
    }

    private fun mapSetType(limeType: LimeSet): SwiftSet {
        val result = SwiftSet(
            mapType(limeType.elementType.type),
            CBridgeNameResolver.getCollectionName(limeType)
        )
        val actualType = LimeTypeHelper.getActualType(limeType) as LimeSet
        val elementTypeKey = getActualTypeKey(actualType.elementType.type)
        genericsCollector.putIfAbsent("$elementTypeKey:", result)

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
            }
    }
}
