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

import com.here.genium.common.FrancaTypeHelper
import com.here.genium.generator.cbridge.CArrayMapper
import com.here.genium.generator.cbridge.CBridgeNameRules
import com.here.genium.model.common.InstanceRules
import com.here.genium.model.franca.FrancaDeploymentModel
import com.here.genium.model.swift.SwiftArray
import com.here.genium.model.swift.SwiftEnum
import com.here.genium.model.swift.SwiftStruct
import com.here.genium.model.swift.SwiftType
import com.here.genium.model.swift.SwiftType.TypeCategory.CLASS
import com.here.genium.model.swift.SwiftType.TypeCategory.DICTIONARY
import com.here.genium.model.swift.SwiftType.TypeCategory.STRUCT
import org.franca.core.franca.FArrayType
import org.franca.core.franca.FBasicTypeId
import org.franca.core.franca.FEnumerationType
import org.franca.core.franca.FInterface
import org.franca.core.franca.FMapType
import org.franca.core.franca.FStructType
import org.franca.core.franca.FType
import org.franca.core.franca.FTypeDef
import org.franca.core.franca.FTypeRef
import org.franca.core.franca.FTypedElement

/**
 * Maps Franca type references to their Swift counterparts. These references are used as parameters,
 * in typedefs, array members etc.
 */
class SwiftTypeMapper(private val deploymentModel: FrancaDeploymentModel) {

    fun mapType(type: FTypeRef): SwiftType {
        val derived = type.derived

        var swiftType = derived?.let { mapDerived(it) } ?: mapPredefined(type)
        if (FrancaTypeHelper.isImplicitArray(type)) {
            swiftType = SwiftArray(swiftType, CArrayMapper.getArrayName(type))
        }

        val parentElement = type.eContainer()
        if (parentElement is FTypedElement && deploymentModel.isNullable(parentElement)) {
            swiftType = swiftType.withOptional(true)
        }

        return swiftType
    }

    fun getActualTypeKey(francaTypeRef: FTypeRef): String {
        val derivedType = francaTypeRef.derived
        return when {
            derivedType == null -> mapPredefined(francaTypeRef).name
            InstanceRules.isInstanceId(francaTypeRef) -> mapDerived(derivedType).name
            derivedType is FTypeDef -> getActualTypeKey(derivedType.actualType)
            derivedType is FArrayType -> {
                val innerTypeKey = getActualTypeKey(derivedType.elementType)
                "[$innerTypeKey]"
            }
            derivedType is FMapType -> {
                val keyTypeKey = getActualTypeKey(derivedType.keyType)
                val valueTypeKey = getActualTypeKey(derivedType.valueType)
                "[$keyTypeKey:$valueTypeKey]"
            }
            else -> mapDerived(derivedType).name
        }
    }

    fun mapArrayType(arrayType: FArrayType) =
        SwiftArray(mapType(arrayType.elementType), CArrayMapper.getArrayName(arrayType))

    private fun mapDerived(derived: FType) =
        when (derived) {
            is FStructType -> getStructType(derived)
            is FEnumerationType ->
                SwiftEnum(SwiftNameRules.getEnumTypeName(derived, deploymentModel))
            is FTypeDef -> mapTypeDef(derived)
            is FArrayType -> mapArrayType(derived)
                .withAlias(SwiftNameRules.getTypeDefName(derived, deploymentModel))
            is FMapType -> mapMapType(derived)
            else -> SwiftType.VOID
        }

    private fun mapMapType(francaMapType: FMapType) =
        SwiftStruct(
            SwiftNameRules.getMapName(francaMapType, deploymentModel),
            CBridgeNameRules.getStructBaseName(francaMapType), null,
            DICTIONARY,
            false,
            SwiftNameRules.getTypeName(francaMapType, deploymentModel)
        )

    private fun mapTypeDef(francaTypeDef: FTypeDef): SwiftType {
        if (InstanceRules.isInstanceId(francaTypeDef)) {
            return getClassType(francaTypeDef)
        }
        val typedefType = mapType(francaTypeDef.actualType)
        return typedefType.withAlias(SwiftNameRules.getTypeDefName(francaTypeDef, deploymentModel))
    }

    private fun getStructType(francaStructType: FStructType) =
        SwiftStruct(
            SwiftNameRules.getStructName(francaStructType, deploymentModel),
            CBridgeNameRules.getStructBaseName(francaStructType),
            null,
            STRUCT
        )

    private fun getClassType(francaTypeDef: FTypeDef) =
        SwiftStruct(
            SwiftNameRules.getClassName(francaTypeDef.name),
            CBridgeNameRules.getInstanceBaseName(francaTypeDef), null,
            CLASS,
            deploymentModel.isInterface(francaTypeDef.eContainer() as FInterface)
        )

    companion object {
        const val OBJC_PARENT_CLASS = "NSObject"

        private fun mapPredefined(type: FTypeRef) =
            when (type.predefined.value) {
                FBasicTypeId.INT8_VALUE -> SwiftType.INT8
                FBasicTypeId.UINT8_VALUE -> SwiftType.UINT8
                FBasicTypeId.INT16_VALUE -> SwiftType.INT16
                FBasicTypeId.UINT16_VALUE -> SwiftType.UINT16
                FBasicTypeId.INT32_VALUE -> SwiftType.INT32
                FBasicTypeId.UINT32_VALUE -> SwiftType.UINT32
                FBasicTypeId.INT64_VALUE -> SwiftType.INT64
                FBasicTypeId.UINT64_VALUE -> SwiftType.UINT64
                FBasicTypeId.BOOLEAN_VALUE -> SwiftType.BOOL
                FBasicTypeId.STRING_VALUE -> SwiftType.STRING
                FBasicTypeId.FLOAT_VALUE -> SwiftType.FLOAT
                FBasicTypeId.DOUBLE_VALUE -> SwiftType.DOUBLE
                FBasicTypeId.BYTE_BUFFER_VALUE -> SwiftType.DATA
                else -> SwiftType.VOID
            }
    }
}
