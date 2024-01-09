/*
 * Copyright (C) 2016-2020 HERE Europe B.V.
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
import com.here.gluecodium.model.lime.LimeAttributeType.CACHED
import com.here.gluecodium.model.lime.LimeAttributeType.CPP
import com.here.gluecodium.model.lime.LimeAttributeValueType.REF
import com.here.gluecodium.model.lime.LimeContainerWithInheritance
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimeProperty

internal class LimePropertiesValidator(private val logger: LimeLogger) {
    fun validate(limeModel: LimeModel): Boolean {
        val validationResults =
            limeModel.referenceMap.values
                .filterIsInstance<LimeContainerWithInheritance>()
                .map { validateProperties(it) }

        return !validationResults.contains(false)
    }

    private fun validateProperties(limeContainer: LimeContainerWithInheritance): Boolean {
        val allPropertyNames = (limeContainer.properties + limeContainer.inheritedProperties).map { it.name }
        return !limeContainer.properties
            .map { validateProperty(it, allPropertyNames, limeContainer) }
            .contains(false)
    }

    private fun validateProperty(
        limeProperty: LimeProperty,
        allPropertyNames: List<String>,
        parentElement: LimeContainerWithInheritance,
    ): Boolean {
        var result = true
        if (allPropertyNames.filter { it == limeProperty.name }.size > 1) {
            logger.error(limeProperty, "property has conflicting overloads")
            result = false
        }
        if (limeProperty.attributes.have(CACHED) && limeProperty.setter != null) {
            logger.error(limeProperty, "read-write property cannot be @Cached")
            result = false
        }
        if (limeProperty.attributes.have(CPP, REF) && parentElement is LimeInterface) {
            logger.error(limeProperty, "property in an interface cannot be marked with @Cpp(Ref)")
            result = false
        }
        return result
    }
}
