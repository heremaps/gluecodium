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
import com.here.genium.franca.SpecialTypeRules
import com.here.genium.validator.FieldValidatorPredicate.Companion.getUnderlyingType
import org.franca.core.franca.FField
import org.franca.core.franca.FInterface
import org.franca.core.franca.FStructType

/**
 * Validate each field in "Equatable" structs against the following conditions:
 *  * Should not contain Instance type fields.
 *  * All Struct type fields should be of some "Equatable" Struct type.
 */
class EquatableValidatorPredicate : ValidatorPredicate<FField> {

    override val elementClass = FField::class.java

    override fun validate(deploymentModel: FrancaDeploymentModel, francaElement: FField): String? {

        val francaStruct = francaElement.eContainer() as FStructType
        if (!deploymentModel.isEquatable(francaStruct)) {
            return null
        }

        var messageFormat: String? = null
        val underlyingType = getUnderlyingType(francaElement.type)
        val derivedType = underlyingType.derived

        if (SpecialTypeRules.isInstanceId(francaElement.type)) {
            val container = francaElement.type.derived.eContainer() as FInterface
            val isEquatable =
                deploymentModel.isEquatable(container) ||
                        deploymentModel.isPointerEquatable(container)
            if (!isEquatable) {
                messageFormat = NON_EQUATABLE_MESSAGE
            }
        } else if (derivedType is FStructType && !deploymentModel.isEquatable(derivedType)
        ) {
            messageFormat = NON_EQUATABLE_MESSAGE
        }

        return if (messageFormat != null) String.format(
            messageFormat, francaElement.name, FrancaTypeHelper.getFullName(francaStruct)
        ) else {
            null
        }
    }

    companion object {
        private const val NON_EQUATABLE_MESSAGE =
            "Fields of non-equatable types are not supported for equatable structs: " +
                    "field '%s' in struct '%s'."
    }
}
