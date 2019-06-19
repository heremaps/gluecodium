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
import org.franca.core.franca.FAttribute
import org.franca.core.franca.FModelElement
import org.franca.core.franca.FTypedElement

/**
 * Validate each field or attribute with "ExternalGetter" or "ExternalSetter" properties set against
 * the following conditions:
 *
 *  * Should either have both "ExternalGetter" or "ExternalSetter" properties set, or none.
 *  * Should be in a struct or interface which has "ExternalType" property set.
 *  * Attribute in an interface which has "ExternalType" property set should have
 * "ExternalGetter" and "ExternalSetter" properties set, as appropriate to its "readonly" flag.
 *  * Should not have "CppGetterName" or "CppSetterName" properties set.
 */
class ExternalElementsValidatorPredicate : ValidatorPredicate<FTypedElement> {

    override val elementClass = FTypedElement::class.java

    override fun validate(
        deploymentModel: FrancaDeploymentModel,
        francaElement: FTypedElement
    ): String? {

        val isReadonly = francaElement is FAttribute && francaElement.isReadonly

        val hasExternalGetter = deploymentModel.getExternalGetter(francaElement) != null
        val hasExternalSetter = deploymentModel.getExternalSetter(francaElement) != null

        val parentElement = francaElement.eContainer() as FModelElement

        var messageFormat: String? = null
        if (deploymentModel.isExternalType(parentElement)) {
            if (francaElement is FAttribute) {
                if (!hasExternalGetter) {
                    messageFormat = if (isReadonly)
                        READONLY_EXTERNAL_ATTRIBUTES_MESSAGE
                    else
                        EXTERNAL_ATTRIBUTES_MESSAGE
                } else if (hasExternalGetter != hasExternalSetter && !isReadonly) {
                    messageFormat = BOTH_PROPERTIES_MESSAGE
                } else if (deploymentModel.getCppGetterName(francaElement) != null ||
                        deploymentModel.getCppSetterName(francaElement) != null) {
                    messageFormat = PLATFORM_NAME
                }
            } else if (hasExternalGetter != hasExternalSetter && !isReadonly) {
                messageFormat = BOTH_PROPERTIES_MESSAGE
            }
        } else if (hasExternalGetter || hasExternalSetter) {
            messageFormat = NON_EXTERNAL_TYPE_MESSAGE
        }

        return if (messageFormat != null)
            String.format(
                messageFormat, francaElement.name, FrancaTypeHelper.getFullName(parentElement)
            )
        else
            null
    }

    companion object {
        private const val BOTH_PROPERTIES_MESSAGE =
            "External elements should have both 'ExternalGetter' and 'ExternalSetter' properties " +
                    "set: element '%s' in type '%s'."
        private const val NON_EXTERNAL_TYPE_MESSAGE =
            "The type containing external elements should have 'ExternalType' property set: " +
                    "element '%s' in type '%s'."
        private const val EXTERNAL_ATTRIBUTES_MESSAGE =
            "Attributes in an external interface should have both 'ExternalGetter' and " +
                    "'ExternalSetter' properties set: attribute '%s' in interface '%s'."
        private const val READONLY_EXTERNAL_ATTRIBUTES_MESSAGE =
            "Readonly attributes in an external interface should have 'ExternalGetter' property " +
                    "set: attribute '%s' in interface '%s'."
        private const val PLATFORM_NAME =
            "Attributes in an external interface should not have 'CppGetterName' or " +
                    "'CppSetterName' properties set: attribute '%s' in interface '%s'."
    }
}
