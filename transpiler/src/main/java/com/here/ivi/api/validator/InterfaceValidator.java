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

import com.google.common.annotations.VisibleForTesting;
import com.here.ivi.api.common.CollectionsHelper;
import com.here.ivi.api.model.franca.DefinedBy;
import com.here.ivi.api.model.franca.FrancaDeploymentModel;
import java.util.Collection;
import java.util.List;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FMethod;
import org.franca.core.franca.FTypeCollection;

/**
 * Validate each Franca interface against the following conditions:
 *
 * <ul>
 *   <li>The interface should not contain static methods when IsInterface is set to "true".
 *   <li>The interface with IsInterface set to "true" should not inherit from an interface with
 *       IsInterface set to "false".
 *   <li>No interface method should use inline error enums since these are not usable with
 *       hf::ErrorCode.
 *   <li>No interface method should have multiple "out" parameters.
 * </ul>
 */
public final class InterfaceValidator {

  private static final Logger LOGGER = Logger.getLogger(InterfaceValidator.class.getName());

  private static final String STATIC_METHOD_MESSAGE =
      "Static methods in interfaces are not allowed: method '%s' in interface '%s.%s'.";
  private static final String ENUMS_METHOD_MESSAGE =
      "Inline error enums in methods are not allowed: method '%s' in interface '%s.%s'.";
  private static final String INVALID_INHERITANCE_MESSAGE =
      "Interface '%s.%s' is not allowed to inherit from class '%s.%s'.";
  private static final String OUTARGS_METHOD_MESSAGE =
      "Multiple output arguments in methods are not allowed: method '%s' in interface '%s.%s'.";

  public static boolean validate(
      final FrancaDeploymentModel deploymentModel, final List<FTypeCollection> typeCollections) {

    Collection<FInterface> interfaces =
        CollectionsHelper.getStreamOfType(typeCollections, FInterface.class)
            .collect(Collectors.toList());
    return checkInlineEnums(interfaces)
        && checkOutputArguments(interfaces)
        && checkStaticMethods(interfaces, deploymentModel)
        && checkInheritance(interfaces, deploymentModel);
  }

  @VisibleForTesting
  static boolean checkInlineEnums(final Collection<FInterface> interfaces) {
    return interfaces.stream().noneMatch(InterfaceValidator::containsInlineErrorEnums);
  }

  @VisibleForTesting
  static boolean checkStaticMethods(
      final Collection<FInterface> interfaces, final FrancaDeploymentModel deploymentModel) {
    return interfaces
        .stream()
        .filter(deploymentModel::isInterface)
        .noneMatch(francaInterface -> containsStaticMethods(francaInterface, deploymentModel));
  }

  @VisibleForTesting
  static boolean checkInheritance(
      final Collection<FInterface> interfaces, final FrancaDeploymentModel deploymentModel) {
    return interfaces
        .stream()
        .filter(deploymentModel::isInterface)
        .noneMatch(francaInterface -> inheritsFromClass(francaInterface, deploymentModel));
  }

  @VisibleForTesting
  static boolean checkOutputArguments(final Collection<FInterface> interfaces) {
    return interfaces.stream().noneMatch(InterfaceValidator::containsMultipleOutputArguments);
  }

  private static String formatErrorMessage(
      final String formatString, final FInterface francaInterface, final FMethod francaMethod) {
    return String.format(
        formatString,
        francaMethod.getName(),
        DefinedBy.getModelName(francaInterface),
        francaInterface.getName());
  }

  private static boolean containsStaticMethods(
      final FInterface francaInterface, final FrancaDeploymentModel deploymentModel) {

    Collection<String> errorMessages =
        francaInterface
            .getMethods()
            .stream()
            .filter(deploymentModel::isStatic)
            .map(method -> formatErrorMessage(STATIC_METHOD_MESSAGE, francaInterface, method))
            .collect(Collectors.toList());
    errorMessages.forEach(LOGGER::severe);

    return !errorMessages.isEmpty();
  }

  private static boolean containsInlineErrorEnums(final FInterface francaInterface) {

    Collection<String> errorMessages =
        francaInterface
            .getMethods()
            .stream()
            .filter(method -> method.getErrors() != null)
            .map(method -> formatErrorMessage(ENUMS_METHOD_MESSAGE, francaInterface, method))
            .collect(Collectors.toList());
    errorMessages.forEach(LOGGER::severe);

    return !errorMessages.isEmpty();
  }

  private static boolean inheritsFromClass(
      final FInterface francaInterface, final FrancaDeploymentModel deploymentModel) {

    FInterface parentInterface = francaInterface.getBase();
    boolean inheritsFromClass =
        parentInterface != null && !deploymentModel.isInterface(parentInterface);

    if (inheritsFromClass) {
      LOGGER.severe(
          String.format(
              INVALID_INHERITANCE_MESSAGE,
              DefinedBy.getModelName(francaInterface),
              francaInterface.getName(),
              DefinedBy.getModelName(parentInterface),
              parentInterface.getName()));
    }

    return inheritsFromClass;
  }

  private static boolean containsMultipleOutputArguments(final FInterface francaInterface) {

    Collection<String> errorMessages =
        francaInterface
            .getMethods()
            .stream()
            .filter(method -> method.getOutArgs() != null && method.getOutArgs().size() > 1)
            .map(method -> formatErrorMessage(OUTARGS_METHOD_MESSAGE, francaInterface, method))
            .collect(Collectors.toList());
    errorMessages.forEach(LOGGER::severe);

    return !errorMessages.isEmpty();
  }
}
