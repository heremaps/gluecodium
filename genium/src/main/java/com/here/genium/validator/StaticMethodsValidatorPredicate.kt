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

import com.here.genium.model.franca.FrancaDeploymentModel
import org.franca.core.franca.FMethod

/** Validate that static methods are not contained in Franca interfaces with IsInterface "true".  */
class StaticMethodsValidatorPredicate : StaticElementsValidatorPredicate<FMethod>() {

    override fun getElementClass() = FMethod::class.java

    override fun isStatic(deploymentModel: FrancaDeploymentModel, francaElement: FMethod) =
        deploymentModel.isStatic(francaElement) || deploymentModel.isConstructor(francaElement)
}
