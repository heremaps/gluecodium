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
import com.here.genium.model.cbridge.CType
import com.here.genium.model.common.Include
import com.here.genium.model.common.InstanceRules
import org.franca.core.franca.FArrayType
import org.franca.core.franca.FMapType
import org.franca.core.franca.FType
import org.franca.core.franca.FTypeDef
import org.franca.core.franca.FTypeRef

object CArrayMapper {
    private val BASE_REF_TYPE = CType(BASE_REF_NAME)

    fun createArrayReference(innerType: CppTypeInfo) =
        CppArrayTypeInfo(
            "std::vector<" + innerType.name + ">",
            BASE_REF_TYPE,
            BASE_REF_TYPE,
            listOf(
                Include.createInternalInclude(BASE_HANDLE_IMPL_FILE),
                CppLibraryIncludes.VECTOR
            ),
            innerType
        )

    fun getArrayName(francaTypeRef: FTypeRef) = getArrayName(getTypeName(francaTypeRef))

    fun getArrayName(francaArray: FArrayType): String = getTypeName(francaArray)

    private fun getArrayName(elementName: String) = "ArrayOf_$elementName"

    private fun getTypeName(francaType: FType): String =
        when (francaType) {
            is FTypeDef -> when {
                InstanceRules.isInstanceId(francaType) -> francaType.name
                else -> getTypeName(francaType.actualType)
            }
            is FArrayType -> getArrayName(getTypeName(francaType.elementType))
            is FMapType ->
                "MapOf_${getTypeName(francaType.keyType)}_To_${getTypeName(francaType.valueType)}"
            else -> francaType.name
        }

    private fun getTypeName(francaTypeRef: FTypeRef): String =
        when {
            francaTypeRef.derived != null -> getTypeName(francaTypeRef.derived)
            else -> francaTypeRef.predefined.getName()
        }
}
