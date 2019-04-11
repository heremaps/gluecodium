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

package com.here.genium.franca

import org.franca.core.framework.FrancaHelpers
import org.franca.core.franca.FArgument
import org.franca.core.franca.FArrayType
import org.franca.core.franca.FMapType
import org.franca.core.franca.FMethod
import org.franca.core.franca.FTypeRef

open class FrancaSignatureResolver {

    private val signatureCache = hashMapOf<String, List<String>>()

    open fun getSignature(francaMethod: FMethod): List<String> {
        val key = FrancaTypeHelper.getFullName(francaMethod)
        return signatureCache.getOrPut(key) { computeSignature(francaMethod) }
    }

    protected open fun getArrayName(elementType: FTypeRef) = "[${getTypeName(elementType)}]"

    protected open fun getMapName(keyType: FTypeRef, valueType: FTypeRef) =
        "[${getTypeName(keyType)}:${getTypeName(valueType)}]"

    private fun computeSignature(francaMethod: FMethod) =
        francaMethod.inArgs.map { getTypeName(it) }

    private fun getTypeName(francaArgument: FArgument) =
        if (francaArgument.isArray) {
            getArrayName(francaArgument.type)
        } else {
            getTypeName(francaArgument.type)
        }

    private fun getTypeName(francaTypeRef: FTypeRef): String {
        if (InstanceRules.isInstanceId(francaTypeRef)) {
            return francaTypeRef.derived.name
        }

        val actualDerived = FrancaHelpers.getActualDerived(francaTypeRef)
        return when (actualDerived) {
            null -> FrancaHelpers.getActualPredefined(francaTypeRef).getName()
            is FArrayType -> getArrayName(actualDerived.elementType)
            is FMapType -> getMapName(actualDerived.keyType, actualDerived.valueType)
            else -> actualDerived.name ?: ""
        }
    }
}
