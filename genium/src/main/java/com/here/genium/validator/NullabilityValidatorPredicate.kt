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
import com.here.genium.model.common.InstanceRules
import com.here.genium.model.franca.FrancaDeploymentModel
import org.franca.core.franca.FTypedElement

/**
 * Validate that nullability properties are used correctly:
 *
 * <ul>
 *   <li>"NotNull" property is only used for instance type fields, attributes or parameters.
 *   <li>"Nullable" property is only used for non-instance type fields, attributes or parameters.
 * </ul>
 */
internal class NullabilityValidatorPredicate : ValidatorPredicate<FTypedElement> {

    override fun getElementClass(): Class<FTypedElement> = FTypedElement::class.java

    override fun validate(deploymentModel: FrancaDeploymentModel, francaTypedElement: FTypedElement): String? {

        if (InstanceRules.isInstanceId(francaTypedElement.type)) {
            if (deploymentModel.isNullable(francaTypedElement)) {
                return String.format(NULLABLE_MESSAGE_FORMAT, FrancaTypeHelper.getFullName(francaTypedElement))
            }
        } else {
            if (deploymentModel.isNotNull(francaTypedElement)) {
                return String.format(NOT_NULL_MESSAGE_FORMAT, FrancaTypeHelper.getFullName(francaTypedElement))
            }
        }
        return null
    }

    companion object {
        private const val NOT_NULL_MESSAGE_FORMAT =
            "Field %s with non-Instance type cannot be marked as 'NotNull'."
        private const val NULLABLE_MESSAGE_FORMAT =
            "Field %s with Instance type cannot be marked as 'Nullable'."
    }
}
