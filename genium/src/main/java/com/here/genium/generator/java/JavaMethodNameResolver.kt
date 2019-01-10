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

package com.here.genium.generator.java

import com.here.genium.common.FrancaTypeHelper
import com.here.genium.model.common.InstanceRules
import org.franca.core.framework.FrancaHelpers
import org.franca.core.franca.FArgument
import org.franca.core.franca.FArrayType
import org.franca.core.franca.FMapType
import org.franca.core.franca.FMethod

open class JavaMethodNameResolver {

    private val signatureCache = hashMapOf<String, List<String>>()

    open fun getName(francaMethod: FMethod): String {
        val selector = if (needsSelector(francaMethod)) francaMethod.selector else ""
        return JavaNameRules.getMethodName(francaMethod.name, selector)
    }

    private fun needsSelector(francaMethod: FMethod): Boolean {
        val signature = getSignature(francaMethod)
        return FrancaTypeHelper.getAllOverloads(francaMethod)
            .map { getSignature(it) }
            .filter { signature == it }
            .count() > 1
    }

    private fun getSignature(francaMethod: FMethod): List<String>? {
        val key = FrancaTypeHelper.getFullName(francaMethod)
        return signatureCache.getOrPut(key) { computeSignature(francaMethod) }
    }

    companion object {
        private const val TYPE_ERASED_ARRAY = "List<>"
        private const val TYPE_ERASED_MAP = "Map<>"

        private fun computeSignature(francaMethod: FMethod) =
            francaMethod.inArgs.map { getTypeName(it) }

        private fun getTypeName(francaArgument: FArgument): String {
            if (francaArgument.isArray) {
                return TYPE_ERASED_ARRAY
            }

            val francaTypeRef = francaArgument.type
            if (InstanceRules.isInstanceId(francaTypeRef)) {
                return francaTypeRef.derived.name
            }

            val actualDerived = FrancaHelpers.getActualDerived(francaTypeRef)
            return when (actualDerived) {
                null -> FrancaHelpers.getActualPredefined(francaTypeRef).getName()
                is FArrayType -> TYPE_ERASED_ARRAY
                is FMapType -> TYPE_ERASED_MAP
                else -> actualDerived.name ?: ""
            }
        }
    }
}
