/*
 * Copyright (C) 2016-2025 HERE Europe B.V.
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
import com.here.gluecodium.generator.common.GeneratorOptions
import com.here.gluecodium.model.lime.LimeAttributeType
import com.here.gluecodium.model.lime.LimeAttributeValueType
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeProperty

class LimeAndroidAttributesMismatchValidator(private val limeLogger: LimeLogger, generatorOptions: GeneratorOptions = GeneratorOptions()) {
    private val werror = generatorOptions.werror.contains(GeneratorOptions.WARNING_ANDROID_ATTRIBUTES_MISMATCH)
    private val maybeError: LimeLogger.(LimeNamedElement, String) -> Unit =
        if (werror) LimeLogger::error else LimeLogger::warning

    fun validate(limeModel: LimeModel): Boolean {
        val allElements = limeModel.referenceMap.values
        val validationResults =
            allElements.filterIsInstance<LimeNamedElement>().map { validateLimeNamedElement(it) }

        return !validationResults.contains(false)
    }

    private fun validateLimeNamedElement(element: LimeNamedElement): Boolean {
        val javaAttributes = element.attributes.getAllAttributeValueTypes(LimeAttributeType.JAVA)
        val kotlinAttributes = element.attributes.getAllAttributeValueTypes(LimeAttributeType.KOTLIN)
        val commonAttributes = kotlinAttributes intersect javaAttributes

        var result = true
        val attributesMissingInJava = kotlinAttributes subtract commonAttributes
        if (attributesMissingInJava.isNotEmpty()) {
            logAttributesMismatch(
                element = element,
                attributes = attributesMissingInJava,
                present = "Kotlin",
                missing = "Java",
            )

            if (werror) {
                result = false
            }
        }

        val attributesMissingInKotlin = javaAttributes subtract commonAttributes
        if (attributesMissingInKotlin.isNotEmpty()) {
            logAttributesMismatch(
                element = element,
                attributes = attributesMissingInKotlin,
                present = "Java",
                missing = "Kotlin",
            )

            if (werror) {
                result = false
            }
        }

        if (element is LimeProperty && !validatePropertyAccessors(element)) {
            result = false
        }

        return result
    }

    private fun validatePropertyAccessors(limeProperty: LimeProperty): Boolean {
        // Getter is always validated. Setter is validated only when present. If not present then pass validation.
        val setterValidationResult = limeProperty.setter?.let { validateLimeNamedElement(it) } ?: true
        val getterValidationResult = validateLimeNamedElement(limeProperty.getter)

        return getterValidationResult && setterValidationResult
    }

    private fun logAttributesMismatch(
        element: LimeNamedElement,
        attributes: Set<LimeAttributeValueType>,
        present: String,
        missing: String,
    ) {
        val message = "Attributes missing in $missing, but present in $present: $attributes"
        limeLogger.maybeError(element, message)
    }
}
