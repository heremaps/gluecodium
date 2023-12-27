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

package com.here.gluecodium.validator

import com.here.gluecodium.common.LimeLogger
import com.here.gluecodium.model.lime.LimeFieldConstructor
import com.here.gluecodium.model.lime.LimeFieldRef
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimeModelLoaderException
import com.here.gluecodium.model.lime.LimeStruct

/* *
 * * Validates all field references by trying to resolve each one and reporting any resulting exceptions.
 * * Validates that all there are no duplicate field references inside each field constructor.
 * * Validates that all omitted fields have default values.
 */
internal class LimeFieldConstructorsValidator(private val logger: LimeLogger) {
    fun validate(limeModel: LimeModel): Boolean {
        val allFieldConstructors = limeModel.referenceMap.values.filterIsInstance<LimeFieldConstructor>()
        val validationResults = allFieldConstructors.map { validateFieldConstructor(it) }
        return !validationResults.contains(false)
    }

    private fun validateFieldConstructor(fieldConstructor: LimeFieldConstructor): Boolean {
        val fieldsRefValidationResults = fieldConstructor.fieldRefs.map { validateRef(fieldConstructor.struct, it) }
        if (fieldsRefValidationResults.contains(false)) return false

        val constructorFields = fieldConstructor.fields
        val uniqueFields = constructorFields.map { it.path.toString() }.distinct()
        if (uniqueFields.size != constructorFields.size) {
            logger.error(fieldConstructor.struct, "a field constructor should not have duplicate field entries")
            return false
        }
        if (fieldConstructor.omittedFields.any { it.defaultValue == null }) {
            logger.error(
                fieldConstructor.struct,
                "all fields omitted by a field constructor should have default values",
            )
            return false
        }
        return true
    }

    private fun validateRef(
        limeStruct: LimeStruct,
        limeFieldRef: LimeFieldRef,
    ) = try {
        limeFieldRef.field
        true
    } catch (e: LimeModelLoaderException) {
        logger.error(limeStruct, e.message ?: "")
        false
    }
}
