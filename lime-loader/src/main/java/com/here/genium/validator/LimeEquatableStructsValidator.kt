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

import com.here.genium.model.lime.LimeAttributeType
import com.here.genium.model.lime.LimeContainer
import com.here.genium.model.lime.LimeModel
import com.here.genium.model.lime.LimeStruct

// Validate equatable structs to ensure their fields have equatable types.
internal class LimeEquatableStructsValidator(private val logger: LimeLogger) {

    fun validate(limeModel: LimeModel): Boolean {
        val allElements = limeModel.referenceMap.values
        val validationResults = allElements
            .filterIsInstance<LimeStruct>()
            .filter { it.attributes.have(LimeAttributeType.EQUATABLE) }
            .map { validateStruct(it) }

        return !validationResults.contains(false)
    }

    private fun validateStruct(limeStruct: LimeStruct): Boolean {
        val nonEquatableFieldTypes = limeStruct.childTypes.map { it.type }
            .filterNot { it.attributes.have(LimeAttributeType.EQUATABLE) }
            .filterNot { it.attributes.have(LimeAttributeType.POINTER_EQUATABLE) }

        return when {
            nonEquatableFieldTypes.any { it is LimeStruct || it is LimeContainer } -> {
                logger.error(
                    limeStruct,
                    "fields of non-equatable types are not supported for equatable structs"
                )
                false
            }
            else -> true
        }
    }
}
