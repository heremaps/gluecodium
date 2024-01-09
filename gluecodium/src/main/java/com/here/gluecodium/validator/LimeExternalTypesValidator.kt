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

package com.here.gluecodium.validator

import com.here.gluecodium.common.LimeLogger
import com.here.gluecodium.model.lime.LimeAttributeType.CPP
import com.here.gluecodium.model.lime.LimeAttributeValueType
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeExternalDescriptor.Companion.INCLUDE_NAME
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimeNamedElement

/**
 * Validate each element with "cpp: externalName", "cpp: externalGetter" or "cpp: externalSetter" external descriptor
 * set against the following conditions:
 *  * Should have "cpp: externalType" descriptor set on itself or on one it enclosing elements.
 *  * Should not have "@Cpp(Name)" attribute.
 */
internal class LimeExternalTypesValidator(private val logger: LimeLogger) {
    fun validate(limeModel: LimeModel): Boolean {
        val allElements = limeModel.referenceMap.values.filterIsInstance<LimeNamedElement>()
        val validationResults =
            validateExternalNames(allElements, limeModel.referenceMap, "name") +
                validateExternalNames(allElements, limeModel.referenceMap, "getterName") +
                validateExternalNames(allElements, limeModel.referenceMap, "setterName")

        return !validationResults.contains(false)
    }

    private fun validateExternalNames(
        allElements: List<LimeNamedElement>,
        referenceMap: Map<String, LimeElement>,
        valueName: String,
    ) = allElements
        .filter { it.external?.cpp?.get(valueName) != null }
        .map { validateExternalElement(it, referenceMap, valueName) }

    private fun validateExternalElement(
        limeElement: LimeNamedElement,
        referenceMap: Map<String, LimeElement>,
        propertyName: String,
    ) = when {
        !isInExternalType(limeElement, referenceMap) -> {
            logger.error(
                limeElement,
                "an element with '$propertyName' also" +
                    " needs to have 'cpp: externalType' set for itself or one of its enclosing elements",
            )
            false
        }
        limeElement.attributes.have(CPP, LimeAttributeValueType.NAME) -> {
            logger.error(
                limeElement,
                "an element with 'cpp: $propertyName' cannot" +
                    " have '@Cpp(Name)' set at the same time",
            )
            false
        }
        else -> true
    }

    private fun isInExternalType(
        limeElement: LimeNamedElement,
        referenceMap: Map<String, LimeElement>,
    ) = generateSequence(limeElement) {
        when {
            it.path.tail.isNotEmpty() -> referenceMap[it.path.parent.toString()] as? LimeNamedElement
            else -> null
        }
    }.any { it.external?.cpp?.get(INCLUDE_NAME) != null }
}
