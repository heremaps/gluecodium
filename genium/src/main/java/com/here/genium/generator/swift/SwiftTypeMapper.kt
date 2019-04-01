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

import com.here.genium.generator.cbridge.CBridgeNameResolver
import com.here.genium.generator.cbridge.CBridgeNameRules
import com.here.genium.model.lime.LimeArray
import com.here.genium.model.lime.LimeBasicType
import com.here.genium.model.lime.LimeBasicType.TypeId
import com.here.genium.model.lime.LimeContainer
import com.here.genium.model.lime.LimeEnumeration
import com.here.genium.model.lime.LimeMap
import com.here.genium.model.lime.LimeStruct
import com.here.genium.model.lime.LimeType
import com.here.genium.model.lime.LimeTypeDef
import com.here.genium.model.swift.SwiftArray
import com.here.genium.model.swift.SwiftEnum
import com.here.genium.model.swift.SwiftStruct
import com.here.genium.model.swift.SwiftType

class SwiftTypeMapper(private val nameResolver: SwiftNameResolver) {

    fun mapType(limeType: LimeType): SwiftType =
        when (limeType) {
            is LimeBasicType -> mapBasicType(limeType)
            is LimeStruct -> SwiftStruct(
                nameResolver.getFullName(limeType),
                CBridgeNameRules.getStructBaseName(limeType)
            )
            is LimeEnumeration -> SwiftEnum(nameResolver.getFullName(limeType))
            is LimeTypeDef ->
                mapType(limeType.typeRef.type).withAlias(nameResolver.getFullName(limeType))
            is LimeContainer -> SwiftStruct(
                name = nameResolver.getFullName(limeType),
                cPrefix = CBridgeNameRules.getNestedSpecifierString(limeType),
                category = SwiftType.TypeCategory.CLASS,
                isInterface = limeType.type == LimeContainer.ContainerType.INTERFACE
            )
            is LimeArray -> SwiftArray(
                mapType(limeType.elementType.type),
                CBridgeNameResolver.getTypeName(limeType)
            )
            else -> SwiftType.VOID
        }

    fun getActualTypeKey(limeType: LimeType): String =
        when (limeType) {
            is LimeTypeDef -> getActualTypeKey(limeType.typeRef.type)
            is LimeArray -> "[${getActualTypeKey(limeType.elementType.type)}]"
            is LimeMap -> {
                val keyTypeKey = getActualTypeKey(limeType.keyType.type)
                val valueTypeKey = getActualTypeKey(limeType.valueType.type)
                "[$keyTypeKey:$valueTypeKey]"
            }
            else -> mapType(limeType).name
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
            }
    }
}
