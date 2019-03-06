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
import com.here.genium.generator.cpp.CppLibraryIncludes
import com.here.genium.model.cbridge.CType
import com.here.genium.model.common.Include
import com.here.genium.model.common.InstanceRules
import org.franca.core.franca.FArrayType
import org.franca.core.franca.FEnumerationType
import org.franca.core.franca.FMapType
import org.franca.core.franca.FModelElement
import org.franca.core.franca.FStructType
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

    fun getArrayName(elementType: FTypeRef): String {
        return "arrayCollection_" + getName(elementType)
    }

    fun getArrayName(elementType: FModelElement): String {
        return "arrayCollection_" + getName(elementType)
    }

    private fun getName(francaElement: FModelElement) =
        when (francaElement) {
            is FTypeDef -> if (InstanceRules.isInstanceId(francaElement)) {
                francaElement.name
            } else {
                getName(francaElement.actualType)
            }
            is FStructType, is FEnumerationType -> (francaElement as FType).name
            is FArrayType -> {
                getName(francaElement.elementType) + "Array"
            }
            is FMapType ->
                getName(francaElement.keyType) + "To" + getName(francaElement.valueType) + "Map"
            else -> ""
        }

    private fun getName(francaTypeRef: FTypeRef): String {
        val elementName = if (francaTypeRef.derived != null) {
            getName(francaTypeRef.derived)
        } else {
            francaTypeRef.predefined.getName()
        }
        return if (FrancaTypeHelper.isImplicitArray(francaTypeRef)) {
            elementName + "Array"
        } else {
            elementName
        }
    }
}
