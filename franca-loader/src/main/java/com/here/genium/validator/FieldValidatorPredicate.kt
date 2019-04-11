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
import org.franca.core.franca.FArrayType
import org.franca.core.franca.FBasicTypeId
import org.franca.core.franca.FField
import org.franca.core.franca.FMapType
import org.franca.core.franca.FStructType
import org.franca.core.franca.FTypeDef
import org.franca.core.franca.FTypeRef

/**
 * Validate each field in structs marked with specific Boolean deployment property against the
 * following conditions:
 *  * Should not contain Instance type fields.
 *  * All Struct type fields should be of a Struct type marked with the same deployment property.
 */
abstract class FieldValidatorPredicate : ValidatorPredicate<FField> {

    protected abstract val instanceErrorMessageFormat: String

    protected abstract val mismatchErrorMessageFormat: String

    override val elementClass = FField::class.java

    protected abstract fun hasDeploymentProperty(
        deploymentModel: FrancaDeploymentModel,
        francaStruct: FStructType
    ): Boolean

    override fun validate(deploymentModel: FrancaDeploymentModel, francaElement: FField): String? {

        val francaStruct = francaElement.eContainer() as FStructType
        if (!hasDeploymentProperty(deploymentModel, francaStruct)) {
            return null
        }

        var messageFormat: String? = null
        val underlyingType = getUnderlyingType(francaElement.type)
        val derivedType = underlyingType.derived
        if (derivedType == null) {
            if (underlyingType.predefined == FBasicTypeId.UNDEFINED) {
                messageFormat = instanceErrorMessageFormat
            }
        } else if (derivedType is FStructType &&
            !hasDeploymentProperty(deploymentModel, derivedType)
        ) {
            messageFormat = mismatchErrorMessageFormat
        }

        return if (messageFormat != null) String.format(
            messageFormat, francaElement.name, FrancaTypeHelper.getFullName(francaStruct)
        ) else {
            null
        }
    }

    private fun getUnderlyingType(declaredType: FTypeRef): FTypeRef {
        val derivedType = declaredType.derived
        return when (derivedType) {
            is FTypeDef -> getUnderlyingType(derivedType.actualType)
            is FArrayType -> getUnderlyingType(derivedType.elementType)
            is FMapType ->
                // No validation against Map keys, since only primitive and enum keys are supported.
                getUnderlyingType(derivedType.valueType)
            else -> declaredType
        }
    }
}
