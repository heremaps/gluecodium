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

import com.here.genium.common.FrancaSignatureResolver
import com.here.genium.common.FrancaTypeHelper
import com.here.genium.model.franca.FrancaDeploymentModel
import org.franca.core.franca.FInterface

/** Validate that there is no signature clash between different constructors of the same class. */
class ConstructorsValidatorPredicate : ValidatorPredicate<FInterface> {

    override fun getElementClass() = FInterface::class.java

    override fun validate(deploymentModel: FrancaDeploymentModel, francaInterface: FInterface): String? {

        val signatureResolver = FrancaSignatureResolver()
        val allConstructorSignatures = francaInterface.methods
            .filter(deploymentModel::isConstructor)
            .map(signatureResolver::getSignature)

        return if (allConstructorSignatures.size != allConstructorSignatures.toSet().size) {
            String.format(SIGNATURE_CLASH_MESSAGE, FrancaTypeHelper.getFullName(francaInterface))
        } else {
            null
        }
    }

    companion object {
        private val SIGNATURE_CLASH_MESSAGE =
            "There is a signature clash among the constructors of the interface '%s'."
    }
}
