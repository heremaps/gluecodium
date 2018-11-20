/*
 * Copyright (C) 2016-2018 HERE Europe B.V.
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
import org.franca.core.franca.FField

/** Validate that "NotNull" property is only used for instance type fields.  */
internal class NotNullValidatorPredicate : ValidatorPredicate<FField> {

    override fun getElementClass(): Class<FField> = FField::class.java

    override fun validate(deploymentModel: FrancaDeploymentModel, francaField: FField): String? =
        if (deploymentModel.isNotNull(francaField) &&
            !InstanceRules.isInstanceId(francaField.type)) {
            String.format(ERROR_MESSAGE_FORMAT, FrancaTypeHelper.getFullName(francaField))
        } else {
            null
        }

    companion object {
        private const val ERROR_MESSAGE_FORMAT =
            "Field %s with non-Instance type cannot be marked as 'NotNull'."
    }
}
