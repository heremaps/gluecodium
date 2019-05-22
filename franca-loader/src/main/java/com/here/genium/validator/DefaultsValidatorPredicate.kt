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

package com.here.genium.validator;

import com.here.genium.franca.FrancaDeploymentModel;
import com.here.genium.franca.FrancaTypeHelper;
import java.math.BigInteger;
import java.util.*;
import java.util.function.Predicate;
import org.franca.core.framework.FrancaHelpers;
import org.franca.core.franca.*;

/**
 * Validates the struct field default values against the following conditions:
 *
 * <ul>
 *   <li>The string content can be converted to the actual type of the field.
 *   <li>The "null" flag should only be set on a field marked as "nullable".
 *   <li>The "empty" flag should only be set on a collection type field.
 *   <li>No more than one default value property should be set.
 * </ul>
 *
 * Defaults are set as strings in the deployment model, validate that the content can be converted
 * to the actual type of the field.
 */
public final class DefaultsValidatorPredicate implements ValidatorPredicate<FField> {

  private static final String INVALID_DEFAULT_FORMAT =
      "Invalid '%s' default value '%s' for '%s' field.";
  private static final String INVALID_NULL_FORMAT =
      "Invalid 'null' default value for non-nullable '%s' field.";
  private static final String CONFLICTING_DEFAULTS_FORMAT =
      "Several conflicting defaults are specified for '%s' field.";
  private static final Set<String> BOOLEAN_VALUES = new HashSet<>(Arrays.asList("true", "false"));

  @Override
  public Class<FField> getElementClass() {
    return FField.class;
  }

  @Override
  public String validate(final FrancaDeploymentModel deploymentModel, final FField francaField) {

    boolean hasNullDefaultValue = deploymentModel.hasNullDefaultValue(francaField);
    boolean hasEmptyDefaultValue = deploymentModel.hasEmptyDefaultValue(francaField);
    String stringValue = deploymentModel.getDefaultValue(francaField);

    int numberOfDefaults =
        (hasNullDefaultValue ? 1 : 0)
            + (hasEmptyDefaultValue ? 1 : 0)
            + (stringValue != null ? 1 : 0);
    if (numberOfDefaults > 1) {
      return String.format(CONFLICTING_DEFAULTS_FORMAT, FrancaTypeHelper.getFullName(francaField));
    }

    if (hasEmptyDefaultValue) {
      if (francaField.isArray()) {
        return null;
      }
      FType francaType = FrancaHelpers.getActualDerived(francaField.getType());
      if (francaType instanceof FArrayType || francaType instanceof FMapType) {
        return null;
      } else {
        return String.format(INVALID_NULL_FORMAT, FrancaTypeHelper.getFullName(francaField));
      }
    }
    if (hasNullDefaultValue) {
      if (deploymentModel.isNullable(francaField)) {
        return null;
      } else {
        return String.format(INVALID_NULL_FORMAT, FrancaTypeHelper.getFullName(francaField));
      }
    }
    if (stringValue == null) {
      return null;
    }

    Predicate<String> predicate;
    String typeName;

    FTypeRef fieldType = francaField.getType();
    FType francaComplexType = fieldType.getDerived();
    if (francaComplexType instanceof FEnumerationType) {
      predicate =
          value ->
              DefaultsValidatorPredicate.checkEnumValue(
                  (FEnumerationType) francaComplexType, value);
      typeName = "Enumeration";
    } else {
      switch (fieldType.getPredefined()) {
        case BOOLEAN:
          predicate = DefaultsValidatorPredicate::checkBooleanValue;
          typeName = "Boolean";
          break;
        case FLOAT:
        case DOUBLE:
          predicate = DefaultsValidatorPredicate::checkFloatValue;
          typeName = "Float";
          break;
        case INT8:
        case INT16:
        case INT32:
        case INT64:
        case UINT8:
        case UINT16:
        case UINT32:
        case UINT64:
          predicate = DefaultsValidatorPredicate::checkIntegerValue;
          typeName = "Integer";
          break;
        default:
          return null;
      }
    }

    if (predicate.test(stringValue)) {
      return null;
    } else {
      return String.format(
          INVALID_DEFAULT_FORMAT, typeName, stringValue, FrancaTypeHelper.getFullName(francaField));
    }
  }

  @SuppressWarnings("ResultOfMethodCallIgnored")
  private static boolean checkIntegerValue(final String stringValue) {
    try {
      new BigInteger(stringValue).longValueExact();
      return true;
    } catch (NumberFormatException | ArithmeticException e) {
      return false;
    }
  }

  private static boolean checkFloatValue(final String stringValue) {
    try {
      Float.parseFloat(stringValue);
      return true;
    } catch (NumberFormatException e) {
      return false;
    }
  }

  private static boolean checkBooleanValue(final String stringValue) {
    return BOOLEAN_VALUES.contains(stringValue);
  }

  private static boolean checkEnumValue(
      final FEnumerationType francaEnum, final String stringValue) {

    return francaEnum
        .getEnumerators()
        .stream()
        .anyMatch(enumerator -> stringValue.equals(enumerator.getName()));
  }
}
