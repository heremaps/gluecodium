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
import org.franca.core.franca.FInterface

/** Validate that:
 * <li> PointerEquatable and Equatable are not set at the same time
 * <li> PointerEquatable or Equatable are not set on an Interface with IsInterface=true
 */
class InterfaceEquatableValidatorPredicate : ValidatorPredicate<FInterface> {
    override val elementClass = FInterface::class.java

    override fun validate(
        deploymentModel: FrancaDeploymentModel,
        francaElement: FInterface
    ): String? {
        if (deploymentModel.isPointerEquatable(francaElement) && deploymentModel.isEquatable(francaElement)) {
            return String.format(CONFLICTING_EQUATABLE_TYPES, FrancaTypeHelper.getFullName(francaElement))
        }
        if ((deploymentModel.isPointerEquatable(francaElement) || deploymentModel.isEquatable(francaElement)) &&
            deploymentModel.isInterface(francaElement)) {
            return String.format(INTERFACE_EQUATABLE_NOT_SUPPORTED, FrancaTypeHelper.getFullName(francaElement))
        }
        return null
    }

    companion object {
        val CONFLICTING_EQUATABLE_TYPES = "PointerEquatable and Equatable cannot be set at the same time at %s"
        val INTERFACE_EQUATABLE_NOT_SUPPORTED = "PointerEquatable and Equatable are not supported on Interface %s with IsInterface=true"
    }
}
