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
import org.franca.core.franca.FModelElement

/**
 * Validate each type with "ExternalName" property set against the following conditions:
 *  * Should have "ExternalType" property set.
 */
class ExternalTypesValidatorPredicate : ValidatorPredicate<FModelElement> {

    override val elementClass = FModelElement::class.java

    override fun validate(
        deploymentModel: FrancaDeploymentModel,
        francaElement: FModelElement
    ) = if (deploymentModel.getExternalName(francaElement) != null &&
        !deploymentModel.isExternalType(francaElement)) {

        String.format(NON_EXTERNAL_TYPE_MESSAGE, FrancaTypeHelper.getFullName(francaElement))
    } else {
        null
    }

    companion object {
        private const val NON_EXTERNAL_TYPE_MESSAGE =
            "The type with 'ExternalName' should have 'ExternalType' property set: type '%s'."
    }
}
