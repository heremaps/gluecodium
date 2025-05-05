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
import com.here.gluecodium.model.lime.LimeAttributeType
import com.here.gluecodium.model.lime.LimeAttributeValueType
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimeNamedElement

class LimeAndroidAttributesMismatchValidator(private val limeLogger: LimeLogger) {
    fun validate(limeModel: LimeModel) {
        val allElements = limeModel.referenceMap.values
        allElements.filterIsInstance<LimeNamedElement>().forEach { element ->
            val javaAttributes = element.attributes.getAllAttributeValueTypes(LimeAttributeType.JAVA)
            val kotlinAttributes = element.attributes.getAllAttributeValueTypes(LimeAttributeType.KOTLIN)
            val commonAttributes = kotlinAttributes intersect javaAttributes

            val attributesMissingInJava = kotlinAttributes subtract commonAttributes
            if (attributesMissingInJava.isNotEmpty()) {
                logAttributesMismatch(
                    element = element,
                    attributes = attributesMissingInJava,
                    present = "Kotlin",
                    missing = "Java",
                )
            }

            val attributesMissingInKotlin = javaAttributes subtract commonAttributes
            if (attributesMissingInKotlin.isNotEmpty()) {
                logAttributesMismatch(
                    element = element,
                    attributes = attributesMissingInKotlin,
                    present = "Java",
                    missing = "Kotlin",
                )
            }
        }
    }

    private fun logAttributesMismatch(
        element: LimeNamedElement,
        attributes: Set<LimeAttributeValueType>,
        present: String,
        missing: String,
    ) {
        val warningMessage = "Attributes missing in $missing, but present in $present: $attributes"
        limeLogger.warning(element, warningMessage)
    }
}
