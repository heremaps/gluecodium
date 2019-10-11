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
import com.here.gluecodium.model.lime.LimeContainerWithInheritance
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimeStruct

// Validate serializable structs to ensure their fields have serializable types.
internal class LimeSerializableStructsValidator(private val logger: LimeLogger) {

    fun validate(limeModel: LimeModel): Boolean {
        val allElements = limeModel.referenceMap.values
        val validationResults = allElements
            .filterIsInstance<LimeStruct>()
            .filter { it.attributes.have(LimeAttributeType.SERIALIZABLE) }
            .map { validateStruct(it) }

        return !validationResults.contains(false)
    }

    private fun validateStruct(limeStruct: LimeStruct): Boolean {
        val allFieldTypes = limeStruct.childTypes.map { it.type }

        return when {
            allFieldTypes.filterIsInstance<LimeContainerWithInheritance>().isNotEmpty() -> {
                logger.error(limeStruct, MESSAGE)
                false
            }
            allFieldTypes
                .filterIsInstance<LimeStruct>()
                .filterNot { it.attributes.have(LimeAttributeType.SERIALIZABLE) }
                .isNotEmpty() -> {
                logger.error(limeStruct, MESSAGE)
                false
            }
            else -> true
        }
    }

    companion object {
        private const val MESSAGE =
            "fields of non-serializable types are not supported for serializable structs"
    }
}
