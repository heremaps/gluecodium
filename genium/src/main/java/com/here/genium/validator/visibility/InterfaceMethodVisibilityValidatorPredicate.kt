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

package com.here.genium.validator.visibility

import com.here.genium.common.FrancaTypeHelper
import com.here.genium.model.franca.FrancaDeploymentModel
import com.here.genium.validator.ValidatorPredicate
import org.franca.core.franca.FInterface
import org.franca.core.franca.FMethod

/**
 * Visibility predicate for method inside interfaces with "IsInterface=true". Conditions checked against:
 * * An interface with "IsInterface=true" should not have any "internal" methods.
 */
class InterfaceMethodVisibilityValidatorPredicate : ValidatorPredicate<FMethod> {

    override val elementClass = FMethod::class.java

    override fun validate(deploymentModel: FrancaDeploymentModel, francaElement: FMethod): String? {
        val parentInterface = francaElement.eContainer() as FInterface
        return if (deploymentModel.isInterface(parentInterface) &&
            deploymentModel.isInternal(francaElement)) {

            String.format(
                InterfaceMethodVisibilityValidatorPredicate.INTERNAL_METHOD_MESSAGE,
                FrancaTypeHelper.getFullName(francaElement),
                FrancaTypeHelper.getFullName(parentInterface)
            )
        } else {
            null
        }
    }

    companion object {
        private const val INTERNAL_METHOD_MESSAGE =
            "Internal methods are not allowed inside interfaces/protocols: " +
                    "method '%s' in interface '%s'."
    }
}
