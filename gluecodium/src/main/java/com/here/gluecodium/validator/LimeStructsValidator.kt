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
import com.here.gluecodium.model.lime.LimeAttributeType
import com.here.gluecodium.model.lime.LimeContainer
import com.here.gluecodium.model.lime.LimeContainerWithInheritance
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimeStruct

/**
 * Validates equatable structs to ensure their fields have equatable types. Validates structs with
 * instance functions to ensure they have fields.
 */
internal class LimeStructsValidator(private val logger: LimeLogger) {

    fun validate(limeModel: LimeModel): Boolean {
        val allStructs = limeModel.referenceMap.values.filterIsInstance<LimeStruct>()
        val validationResults = allStructs
                .filter { it.attributes.have(LimeAttributeType.EQUATABLE) }
                .map { validateEquatable(it) } +
            allStructs.map { validateConstructability(it) }

        return !validationResults.contains(false)
    }

    private fun validateEquatable(limeStruct: LimeStruct): Boolean {
        val nonEquatableFieldTypes = limeStruct.childTypes.asSequence()
            .map { it.type }
            .filterNot { it is LimeContainerWithInheritance }
            .filterNot { it.attributes.have(LimeAttributeType.EQUATABLE) }

        return when {
            limeStruct.fields.isEmpty() -> {
                logger.error(limeStruct, "an equatable struct should have at least one field")
                false
            }
            nonEquatableFieldTypes.any { it is LimeContainer } -> {
                logger.error(
                    limeStruct,
                    "fields of non-equatable types are not supported for equatable structs"
                )
                false
            }
            else -> true
        }
    }

    private fun validateConstructability(limeStruct: LimeStruct): Boolean {
        val instanceFunctions = limeStruct.functions.filterNot { it.isStatic }
        return when {
            instanceFunctions.isNotEmpty() && limeStruct.fields.isEmpty() -> {
                logger.error(
                    limeStruct,
                    "instance functions are not supported for structs without fields"
                )
                false
            }
            else -> true
        }
    }
}
