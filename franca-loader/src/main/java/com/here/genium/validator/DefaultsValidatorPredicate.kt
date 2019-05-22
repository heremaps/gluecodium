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

import com.here.genium.franca.FrancaDeploymentModel
import com.here.genium.franca.FrancaTypeHelper
import org.franca.core.framework.FrancaHelpers
import org.franca.core.franca.FArrayType
import org.franca.core.franca.FBasicTypeId
import org.franca.core.franca.FEnumerationType
import org.franca.core.franca.FField
import org.franca.core.franca.FMapType
import org.franca.core.franca.FStructType
import java.math.BigInteger
import java.util.Arrays
import java.util.HashSet

/**
 * Validates the struct field default values against the following conditions:
 *
 *  * The string content can be converted to the actual type of the field.
 *  * The "null" flag should only be set on a field marked as "nullable".
 *  * The "empty" flag should only be set on a field of collection or struct type.
 *  * No more than one default value property should be set.
 *
 * Defaults are set as strings in the deployment model, validate that the content can be converted
 * to the actual type of the field.
 */
class DefaultsValidatorPredicate : ValidatorPredicate<FField> {

    override val elementClass = FField::class.java

    override fun validate(deploymentModel: FrancaDeploymentModel, francaElement: FField): String? {

        val hasNullDefaultValue = deploymentModel.hasNullDefaultValue(francaElement)
        val hasEmptyDefaultValue = deploymentModel.hasEmptyDefaultValue(francaElement)
        val stringValue = deploymentModel.getDefaultValue(francaElement)

        val numberOfDefaults = (if (hasNullDefaultValue) 1 else 0)
                + (if (hasEmptyDefaultValue) 1 else 0)
                + (if (stringValue != null) 1 else 0)
        if (numberOfDefaults > 1) {
            return String.format(
                CONFLICTING_DEFAULTS_FORMAT,
                FrancaTypeHelper.getFullName(francaElement)
            )
        }

        if (hasEmptyDefaultValue) {
            if (francaElement.isArray) {
                return null
            }
            val francaType = FrancaHelpers.getActualDerived(francaElement.type)
            return if (francaType is FArrayType || francaType is FMapType ||
                francaType is FStructType) {
                null
            } else {
                String.format(INVALID_EMPTY_FORMAT, FrancaTypeHelper.getFullName(francaElement))
            }
        }
        if (hasNullDefaultValue) {
            return if (deploymentModel.isNullable(francaElement)) {
                null
            } else {
                String.format(INVALID_NULL_FORMAT, FrancaTypeHelper.getFullName(francaElement))
            }
        }
        if (stringValue == null) {
            return null
        }

        val fieldType = francaElement.type
        val francaComplexType = FrancaHelpers.getActualDerived(fieldType)
        if (francaComplexType is FEnumerationType) {
            return validateDefaultValue(
                francaElement,
                stringValue,
                { checkEnumValue(francaComplexType, it) },
                "Enumeration"
            )
        }
        return when (fieldType.predefined) {
            FBasicTypeId.BOOLEAN ->
                validateDefaultValue(
                    francaElement,
                    stringValue,
                    { checkBooleanValue(it) },
                    "Boolean"
                )
            FBasicTypeId.FLOAT, FBasicTypeId.DOUBLE ->
                validateDefaultValue(francaElement, stringValue, { checkFloatValue(it) }, "Float")
            FBasicTypeId.INT8, FBasicTypeId.INT16, FBasicTypeId.INT32, FBasicTypeId.INT64,
            FBasicTypeId.UINT8, FBasicTypeId.UINT16, FBasicTypeId.UINT32,
            FBasicTypeId.UINT64 ->
                validateDefaultValue(
                    francaElement,
                    stringValue,
                    { checkIntegerValue(it) },
                    "Integer"
                )
            else -> null
        }
    }

    private fun validateDefaultValue(
        francaField: FField,
        defaultValue: String,
        predicate: (String) -> Boolean,
        typeName: String
    ) = when {
        predicate(defaultValue) -> null
        else -> String.format(
            INVALID_DEFAULT_FORMAT,
            typeName,
            defaultValue,
            FrancaTypeHelper.getFullName(francaField)
        )
    }

    companion object {
        private const val INVALID_DEFAULT_FORMAT = "Invalid '%s' default value '%s' for '%s' field."
        private const val INVALID_NULL_FORMAT =
            "Invalid 'null' default value for non-nullable '%s' field."
        private const val INVALID_EMPTY_FORMAT =
            "Invalid 'empty' default value for non-collection non-struct '%s' field."
        private const val CONFLICTING_DEFAULTS_FORMAT =
            "Several conflicting defaults are specified for '%s' field."
        private val BOOLEAN_VALUES = HashSet(Arrays.asList("true", "false"))

        private fun checkIntegerValue(stringValue: String) =
            try {
                BigInteger(stringValue).longValueExact()
                true
            } catch (e: NumberFormatException) {
                false
            } catch (e: ArithmeticException) {
                false
            }

        private fun checkFloatValue(stringValue: String) =
            try {
                java.lang.Float.parseFloat(stringValue)
                true
            } catch (e: NumberFormatException) {
                false
            }

        private fun checkBooleanValue(stringValue: String) = BOOLEAN_VALUES.contains(stringValue)

        private fun checkEnumValue(francaEnum: FEnumerationType, stringValue: String) =
            francaEnum.enumerators.any { stringValue == it.name }
    }
}
