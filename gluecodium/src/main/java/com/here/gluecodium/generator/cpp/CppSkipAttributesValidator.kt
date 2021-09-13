/*
 * Copyright (C) 2016-2021 HERE Europe B.V.
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

package com.here.gluecodium.generator.cpp

import com.here.gluecodium.common.LimeLogger
import com.here.gluecodium.model.lime.LimeAttributeType
import com.here.gluecodium.model.lime.LimeAttributeValueType
import com.here.gluecodium.model.lime.LimeFieldConstructor
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimeNamedElement

/**
 * Validate that `@Cpp(Skip)` attribute is only used on field constructors of structs.
 */
internal class CppSkipAttributesValidator(private val logger: LimeLogger) {

    fun validate(limeModel: LimeModel): Boolean {
        val allElements = limeModel.referenceMap.values
        val validationResults = allElements.filterIsInstance<LimeNamedElement>().map { validateElement(it) }

        return !validationResults.contains(false)
    }

    private fun validateElement(limeElement: LimeNamedElement) =
        when {
            limeElement is LimeFieldConstructor -> true
            limeElement.attributes.have(LimeAttributeType.CPP, LimeAttributeValueType.SKIP) -> {
                logger.error(limeElement, "`@Cpp(Skip)` attribute can only be used on a field constructor")
                false
            }
            else -> true
        }
}
