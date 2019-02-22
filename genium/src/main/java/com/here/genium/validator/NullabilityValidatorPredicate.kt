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

import com.here.genium.common.FrancaTypeHelper
import com.here.genium.model.franca.FrancaDeploymentModel
import org.franca.core.franca.FInterface
import org.franca.core.franca.FMethod

/**
 * Validate that "Nullable" property cannot be used on constructor return values.
 */
internal class NullabilityValidatorPredicate : ValidatorPredicate<FMethod> {

    override val elementClass = FMethod::class.java

    override fun validate(deploymentModel: FrancaDeploymentModel, francaElement: FMethod) =
        if (deploymentModel.isConstructor(francaElement) &&
            deploymentModel.isNullable(francaElement.outArgs[0])) {
            String.format(
                CONSTRUCTOR_MESSAGE_FORMAT,
                FrancaTypeHelper.getFullName(francaElement),
                FrancaTypeHelper.getFullName(francaElement.eContainer() as FInterface)
            )
        } else {
            null
        }

    companion object {
        private const val CONSTRUCTOR_MESSAGE_FORMAT =
            "Constructor return value cannot be marked as 'Nullable': constructor %s of class %s."
    }
}
