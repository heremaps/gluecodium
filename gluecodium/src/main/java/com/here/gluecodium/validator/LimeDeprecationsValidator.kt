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
import com.here.gluecodium.model.lime.LimeAttributeType.JAVA
import com.here.gluecodium.model.lime.LimeAttributeType.POINTER_EQUATABLE
import com.here.gluecodium.model.lime.LimeAttributeValueType.BUILDER
import com.here.gluecodium.model.lime.LimeContainerWithInheritance
import com.here.gluecodium.model.lime.LimeNamedElement

/**
 * Validate against deprecated LIME attributes.
 */
internal class LimeDeprecationsValidator(
    private val logger: LimeLogger,
    private val werror: Boolean
) {
    private val logFunction: LimeLogger.(LimeNamedElement, String) -> Unit =
        if (werror) { limeElement: LimeNamedElement, message: String ->
            this.error(limeElement, message)
        } else { limeElement: LimeNamedElement, message: String ->
            this.warning(limeElement, message)
        }

    fun validate(limeElements: List<LimeNamedElement>): Boolean {
        val validationResults = limeElements
            .filterIsInstance<LimeContainerWithInheritance>()
            .map { validateContainer(it) }

        return !werror || !validationResults.contains(false)
    }

    private fun validateContainer(limeContainer: LimeContainerWithInheritance) =
        when {
            limeContainer.attributes.have(POINTER_EQUATABLE) -> {
                logger.logFunction(limeContainer, "@PointerEquatable attribute is deprecated")
                false
            }
            limeContainer.attributes.have(JAVA, BUILDER) -> {
                logger.logFunction(limeContainer, "@Java(Builder) attribute is deprecated")
                false
            }
            else -> true
        }
}
