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
import com.here.gluecodium.model.lime.LimeBasicType
import com.here.gluecodium.model.lime.LimeBasicType.TypeId
import com.here.gluecodium.model.lime.LimeConstant
import com.here.gluecodium.model.lime.LimeField
import com.here.gluecodium.model.lime.LimeGenericType
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeType
import com.here.gluecodium.model.lime.LimeTypeHelper
import com.here.gluecodium.model.lime.LimeTypedElement
import com.here.gluecodium.model.lime.LimeValue

/**
 * Validates values assigned to constants and fields for correctness.
 */
internal class LimeValuesValidator(private val logger: LimeLogger) {

    fun validate(limeModel: LimeModel): Boolean {
        val allFields = limeModel.referenceMap.values.filterIsInstance<LimeField>()
        val allConstants = limeModel.referenceMap.values.filterIsInstance<LimeConstant>()
        val validationResults = allFields.map { validateField(it) } + allConstants.map { validateValue(it, it.value) }
        return !validationResults.contains(false)
    }

    private fun validateField(limeField: LimeField) =
        limeField.defaultValue?.let { validateValue(limeField, it) } ?: true

    private fun validateValue(limeElement: LimeTypedElement, limeValue: LimeValue): Boolean {
        val actualType = limeElement.typeRef.type.actualType
        when (limeValue) {
            is LimeValue.Literal -> if (!validateLiteral(limeElement, actualType, limeValue)) return false
            is LimeValue.Constant -> {
                if (actualType.fullName != limeValue.valueRef.typeRef.type.fullName) {
                    logger.error(limeElement, "constant value does not have a matching type")
                    return false
                }
            }
            is LimeValue.InitializerList -> if (!isCollectionType(actualType)) {
                logger.error(limeElement, "initializer list values can only be assigned to collection types")
                return false
            }
            is LimeValue.KeyValuePair -> {
                logger.error(limeElement, "key-value pair values can only be used inside initializer lists")
                return false
            }
            is LimeValue.Null -> if (!limeElement.typeRef.isNullable) {
                logger.error(limeElement, "`null` value can only be assigned to a nullable type")
                return false
            }
            is LimeValue.Special -> if (actualType !is LimeBasicType || !actualType.typeId.isNumericType) {
                logger.error(limeElement, "special numeric values can only be assigned to numeric types")
                return false
            }
            is LimeValue.StructInitializer -> if (actualType !is LimeStruct) {
                logger.error(limeElement, "struct initializer values can only be assigned to `struct` types")
                return false
            }
        }
        return true
    }

    private fun validateLiteral(
        limeElement: LimeNamedElement,
        limeType: LimeType,
        limeValue: LimeValue.Literal
    ): Boolean {
        if (limeType !is LimeBasicType) {
            logger.error(limeElement, "literal values cannot be assigned to non-basic types")
            return false
        }
        if (limeType.typeId == TypeId.BLOB || limeType.typeId == TypeId.DURATION) {
            logger.error(
                limeElement,
                "string or numeric literal values cannot be assigned to `Blob` or `Duration` types"
            )
            return false
        }
        if (limeType.typeId == TypeId.DATE && LimeTypeHelper.dateLiteralEpochSeconds(limeValue.value) == null) {
            logger.error(limeElement, "invalid `Date` literal:  '$limeValue'")
            return false
        }
        if (limeType.typeId == TypeId.LOCALE && LimeTypeHelper.normalizeLocaleTag(limeValue.value) == null) {
            logger.error(limeElement, "invalid `Locale` literal:  '$limeValue'")
            return false
        }
        return true
    }

    private fun isCollectionType(limeType: LimeType) = when {
        limeType is LimeGenericType -> true
        limeType !is LimeBasicType -> false
        limeType.typeId == TypeId.BLOB -> true
        else -> false
    }
}
