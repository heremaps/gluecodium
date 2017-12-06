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

package com.here.ivi.api.validator.common;

import com.google.common.annotations.VisibleForTesting;
import com.here.ivi.api.common.CollectionsHelper;
import com.here.ivi.api.model.franca.DefinedBy;
import com.here.ivi.api.model.franca.FrancaDeploymentModel;
import java.util.*;
import java.util.function.Predicate;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import org.franca.core.franca.*;

public final class DefaultsValidator {

  private static final Logger LOGGER = Logger.getLogger(DefaultsValidator.class.getName());

  private static final String ERROR_MESSAGE_FORMAT =
      "Invalid %s default value '%s' for %s.%s.%s.%s field.";
  private static final Set<String> BOOLEAN_VALUES = new HashSet<>(Arrays.asList("true", "false"));

  public static boolean validate(
      final List<FTypeCollection> typeCollections, final FrancaDeploymentModel deploymentModel) {

    Stream<FType> francaTypes =
        typeCollections.stream().flatMap(typeCollection -> typeCollection.getTypes().stream());
    List<FField> francaFields =
        CollectionsHelper.getStreamOfType(francaTypes, FStructType.class)
            .flatMap(struct -> struct.getElements().stream())
            .collect(Collectors.toList());

    boolean result = true;
    for (final FField francaField : francaFields) {
      if (!checkFieldDefaultValue(francaField, deploymentModel)) {
        result = false;
      }
    }

    return result;
  }

  @VisibleForTesting
  static boolean checkFieldDefaultValue(
      final FField francaField, final FrancaDeploymentModel deploymentModel) {

    Predicate<String> predicate = null;
    String typeName = null;

    FTypeRef fieldType = francaField.getType();
    FType francaComplexType = fieldType.getDerived();
    if (francaComplexType instanceof FEnumerationType) {
      predicate =
          value -> DefaultsValidator.checkEnumValue((FEnumerationType) francaComplexType, value);
      typeName = "Enumeration";
    } else {
      switch (fieldType.getPredefined()) {
        case BOOLEAN:
          predicate = DefaultsValidator::checkBooleanValue;
          typeName = "Boolean";
          break;
        case FLOAT:
        case DOUBLE:
          predicate = DefaultsValidator::checkFloatValue;
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
          predicate = DefaultsValidator::checkIntegerValue;
          typeName = "Integer";
          break;
      }
    }

    if (predicate != null) {
      String stringValue = deploymentModel.getDefaultValue(francaField);
      if (stringValue != null && !predicate.test(stringValue)) {
        LOGGER.severe(formatErrorMessage(francaField, typeName, stringValue));
        return false;
      }
    }

    return true;
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

  private static boolean checkIntegerValue(final String stringValue) {
    try {
      //noinspection ResultOfMethodCallIgnored
      Integer.parseInt(stringValue);
      return true;
    } catch (NumberFormatException e) {
      return false;
    }
  }

  private static boolean checkFloatValue(final String stringValue) {
    try {
      //noinspection ResultOfMethodCallIgnored
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
