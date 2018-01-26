/*
 * Copyright (C) 2017 HERE Global B.V. and its affiliate(s). All rights reserved.
 *
 * This software, including documentation, is protected by copyright controlled by
 * HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
 * adapting or translating, any or all of this material requires the prior written
 * consent of HERE Global B.V. This material also contains confidential information,
 * which may not be disclosed to others without prior written consent of HERE Global B.V.
 *
 */

package com.here.ivi.api.validator;

import com.here.ivi.api.model.franca.DefinedBy;
import com.here.ivi.api.model.franca.FrancaDeploymentModel;
import java.util.*;
import java.util.function.Predicate;
import org.franca.core.franca.*;

/**
 * Defaults are set as strings in the deployment model, validate that the content can be converted
 * to the actual type of the field.
 */
public final class DefaultsValidatorPredicate implements ValidatorPredicate<FField> {

  private static final String ERROR_MESSAGE_FORMAT =
      "Invalid %s default value '%s' for %s.%s.%s.%s field.";
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

    FStructType francaStructType = (FStructType) francaField.eContainer();
    FTypeCollection typeCollection = DefinedBy.findDefiningTypeCollection(francaStructType);
    return String.format(
        ERROR_MESSAGE_FORMAT,
        typeName,
        stringValue,
        DefinedBy.getModelName(typeCollection),
        typeCollection.getName(),
        francaStructType.getName(),
        francaField.getName());
  }

  @SuppressWarnings("ResultOfMethodCallIgnored")
  private static boolean checkIntegerValue(final String stringValue) {
    try {
      Integer.parseInt(stringValue);
      return true;
    } catch (NumberFormatException e) {
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

    List<FEnumerator> enumerators = francaEnum.getEnumerators();
    return enumerators != null
        && !enumerators.isEmpty()
        && enumerators.stream().anyMatch(enumerator -> stringValue.equals(enumerator.getName()));
  }
}
