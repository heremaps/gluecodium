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

import com.here.genium.model.lime.LimeAttributeType.CPP
import com.here.genium.model.lime.LimeAttributeValueType
import com.here.genium.model.lime.LimeAttributeValueType.EXTERNAL_GETTER
import com.here.genium.model.lime.LimeAttributeValueType.EXTERNAL_NAME
import com.here.genium.model.lime.LimeAttributeValueType.EXTERNAL_SETTER
import com.here.genium.model.lime.LimeElement
import com.here.genium.model.lime.LimeModel
import com.here.genium.model.lime.LimeNamedElement

/**
 * Validate each element with "@Cpp(ExternalName)", "@Cpp(ExternalGetter)" or "@Cpp(ExternalSetter)"
 * property set against the following conditions:
 *  * Should have "@Cpp(ExternalType)" property set on itself or on one it enclosing elements.
 *  * Should not have "@Cpp(Name)" property set.
 */
internal class LimeExternalTypesValidator(private val logger: LimeLogger) {

    fun validate(limeModel: LimeModel): Boolean {
        val allElements = limeModel.referenceMap.values.filterIsInstance<LimeNamedElement>()
        val validationResults =
            validateExternalNames(allElements, limeModel.referenceMap, EXTERNAL_NAME) +
                validateExternalNames(allElements, limeModel.referenceMap, EXTERNAL_GETTER) +
                validateExternalNames(allElements, limeModel.referenceMap, EXTERNAL_SETTER)

        return !validationResults.contains(false)
    }

    private fun validateExternalNames(
        allElements: List<LimeNamedElement>,
        referenceMap: Map<String, LimeElement>,
        attributeValueType: LimeAttributeValueType
    ) = allElements
        .filter { it.attributes.have(CPP, attributeValueType) }
        .map { validateExternalElement(it, referenceMap, attributeValueType.toString()) }

    private fun validateExternalElement(
        limeElement: LimeNamedElement,
        referenceMap: Map<String, LimeElement>,
        propertyName: String
    ) = when {
        !isInExternalType(limeElement, referenceMap) -> {
            logger.error(limeElement, "an element with '$propertyName' also" +
                    " needs to have 'ExternalType' set for itself or one of its enclosing elements")
            false
        }
        limeElement.attributes.have(CPP, LimeAttributeValueType.NAME) -> {
            logger.error(limeElement, "an element with '@Cpp($propertyName)' cannot" +
                    " have '@Cpp(Name)' set at the same time")
            false
        }
        else -> true
    }

    private fun isInExternalType(
        limeElement: LimeNamedElement,
        referenceMap: Map<String, LimeElement>
    ) = generateSequence(limeElement) {
        when {
            it.path.tail.isNotEmpty() -> referenceMap[it.path.parent.toString()] as? LimeNamedElement
            else -> null
        }
    }.any { it.attributes.have(CPP, LimeAttributeValueType.EXTERNAL_TYPE) }
}
