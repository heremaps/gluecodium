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

import com.here.genium.franca.FrancaDeploymentModel
import com.here.genium.franca.FrancaTypeHelper
import org.franca.core.franca.FArrayType

/** Validates that the Array types with "IsSet" flag have either Primitive or Enum keys. */
class SetElementValidatorPredicate : HashableTypesValidatorPredicate<FArrayType>() {

    override val elementClass = FArrayType::class.java

    override fun validate(deploymentModel: FrancaDeploymentModel, francaElement: FArrayType) =
        when {
            !deploymentModel.isSetType(francaElement) ||
                isHashableType(francaElement.elementType) -> null
            else -> String.format(
                INVALID_ELEMENT_TYPE_MESSAGE,
                FrancaTypeHelper.getFullName(francaElement)
            )
        }

    companion object {
        private const val INVALID_ELEMENT_TYPE_MESSAGE =
            "Complex elements are not allowed: set '%s'."
    }
}
