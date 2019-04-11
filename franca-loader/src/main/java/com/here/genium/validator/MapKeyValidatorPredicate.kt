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

package com.here.genium.validator

import com.here.genium.franca.FrancaTypeHelper
import com.here.genium.franca.FrancaDeploymentModel
import org.franca.core.franca.FBasicTypeId
import org.franca.core.franca.FEnumerationType
import org.franca.core.franca.FMapType
import org.franca.core.franca.FTypeDef
import org.franca.core.franca.FTypeRef

/** Validates that the Map types have either Primitive or Enum keys.  */
class MapKeyValidatorPredicate : ValidatorPredicate<FMapType> {

    override val elementClass = FMapType::class.java

    override fun validate(
        deploymentModel: FrancaDeploymentModel,
        francaElement: FMapType
    ) = if (isComplexType(francaElement.keyType)) String.format(
        INVALID_KEY_TYPE_MESSAGE,
            FrancaTypeHelper.getFullName(francaElement)
        ) else {
            null
        }

    companion object {
        private const val INVALID_KEY_TYPE_MESSAGE = "Complex keys are not allowed: map '%s'."

        private fun isComplexType(francaTypeRef: FTypeRef): Boolean {
            val derivedType = francaTypeRef.derived
            return when {
                derivedType is FTypeDef -> isComplexType(
                    derivedType.actualType
                )
                derivedType != null -> derivedType !is FEnumerationType
                else ->
                    // ByteBuffers are not allowed as keys. "Undefined" means either an Instance or
                    // a broken type reference, neither of those are allowed too.
                    francaTypeRef.predefined == FBasicTypeId.BYTE_BUFFER ||
                            francaTypeRef.predefined == FBasicTypeId.UNDEFINED
            }
        }
    }
}
