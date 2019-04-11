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
import org.franca.core.franca.FInterface
import org.franca.core.franca.FModelElement

/** Validate that static elements are not contained in Franca interfaces with IsInterface "true". */
abstract class StaticElementsValidatorPredicate<T : FModelElement> : ValidatorPredicate<T> {

    protected abstract fun isStatic(
        deploymentModel: FrancaDeploymentModel,
        francaElement: T
    ): Boolean

    override fun validate(deploymentModel: FrancaDeploymentModel, francaElement: T): String? {

        val francaInterface = francaElement.eContainer() as FInterface
        return if (isStatic(deploymentModel, francaElement) &&
            deploymentModel.isInterface(francaInterface)
        ) {
            String.format(
                STATIC_ELEMENTS_MESSAGE,
                francaElement.name,
                FrancaTypeHelper.getFullName(francaInterface)
            )
        } else {
            null
        }
    }

    companion object {
        private const val STATIC_ELEMENTS_MESSAGE =
            "Static elements are not allowed in interfaces : elements '%s' in interface '%s'."
    }
}
