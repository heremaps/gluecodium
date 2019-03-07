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

import com.here.genium.common.FrancaTypeHelper;
import com.here.genium.model.franca.FrancaDeploymentModel;
import java.math.BigInteger;
import java.util.*;
import java.util.function.Predicate;
import org.franca.core.franca.*;

/**
 * Defaults are set as strings in the deployment model, validate that the content can be converted
 * to the actual type of the field.
 */
public final class DefaultsValidatorPredicate implements ValidatorPredicate<FField> {

  private static final String ERROR_MESSAGE_FORMAT = "Invalid %s default value '%s' for %s field.";
  private static final Set<String> BOOLEAN_VALUES = new HashSet<>(Arrays.asList("true", "false"));

  @Override
  public Class<FField> getElementClass() {
    return FField.class;
  }

  @Override
  public String validate(final FrancaDeploymentModel deploymentModel, final FField francaField) {

    String stringValue = deploymentModel.getDefaultValue(francaField);
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
      return formatErrorMessage(francaField, typeName, stringValue);
    }
  }

  private static String formatErrorMessage(
      final FField francaField, final String typeName, final String stringValue) {

    return String.format(
        ERROR_MESSAGE_FORMAT, typeName, stringValue, FrancaTypeHelper.getFullName(francaField));
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

  @SuppressWarnings("ResultOfMethodCallIgnored")
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
