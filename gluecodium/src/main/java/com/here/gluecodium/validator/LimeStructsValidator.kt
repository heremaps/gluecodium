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
 *
 * With [strictMode] enabled, there are additional validations: a struct must have explicit constructors defined if
 * * either it is `@Immutable`,
 * * or if it has any `internal` fields which don't have default values set.
 */
internal class LimeStructsValidator(private val logger: LimeLogger, private val strictMode: Boolean) {

    fun validate(limeModel: LimeModel): Boolean {
        val allStructs = limeModel.referenceMap.values.filterIsInstance<LimeStruct>()
        val equatableValidationResults = allStructs
            .filter { it.attributes.have(LimeAttributeType.EQUATABLE) }
            .map { validateEquatable(it) }
        val constrValidationResults = allStructs.map { validateConstructability(it) }
        val strictValidationResults =
            when {
                strictMode -> allStructs.map { validateStrict(it) }
                else -> emptyList()
            }

        return !(equatableValidationResults + constrValidationResults + strictValidationResults).contains(false)
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

    private fun validateStrict(limeStruct: LimeStruct): Boolean {
        if (limeStruct.fieldConstructors.isNotEmpty() || limeStruct.constructors.isNotEmpty()) return true

        var result = true
        if (limeStruct.attributes.have(LimeAttributeType.IMMUTABLE)) {
            logger.error(limeStruct, "an immutable struct should have at least one explicit constructor")
            result = false
        }
        if (limeStruct.internalFields.any { it.defaultValue == null }) {
            logger.error(
                limeStruct,
                "if any internal field does not have a default value, " +
                    "the struct should have at least one explicit constructor"
            )
            result = false
        }
        return result
    }
}
