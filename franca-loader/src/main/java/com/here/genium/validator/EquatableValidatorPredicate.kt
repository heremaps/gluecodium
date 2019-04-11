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
import org.franca.core.franca.FStructType

/**
 * Validate each field in "Equatable" structs against the following conditions:
 *  * Should not contain Instance type fields.
 *  * All Struct type fields should be of some "Equatable" Struct type.
 */
class EquatableValidatorPredicate : FieldValidatorPredicate() {

    override val instanceErrorMessageFormat =
        INSTANCE_MESSAGE

    override val mismatchErrorMessageFormat =
        NON_EQUATABLE_MESSAGE

    override fun hasDeploymentProperty(
        deploymentModel: FrancaDeploymentModel,
        francaStruct: FStructType
    ) = deploymentModel.isEquatable(francaStruct)

    companion object {
        private const val INSTANCE_MESSAGE =
            "Instance fields are not supported for equatable structs: " +
                    "field '%s' in struct '%s'."
        private const val NON_EQUATABLE_MESSAGE =
            "Fields of non-equatable struct types are not supported for equatable structs: " +
                    "field '%s' in struct '%s'."
    }
}
