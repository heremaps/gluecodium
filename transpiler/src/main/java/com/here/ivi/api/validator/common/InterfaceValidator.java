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

import com.here.ivi.api.common.CollectionsHelper;
import com.here.ivi.api.model.franca.FrancaDeploymentModel;
import java.util.List;
import java.util.logging.Logger;
import org.eclipse.emf.common.util.EList;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FMethod;
import org.franca.core.franca.FTypeCollection;

public class InterfaceValidator {

  private static final Logger LOGGER = Logger.getLogger(InterfaceValidator.class.getName());

  public static boolean validate(
      final List<FTypeCollection> typeCollections, final FrancaDeploymentModel deploymentModel) {

    return CollectionsHelper.getStreamOfType(typeCollections, FInterface.class)
        .filter(deploymentModel::isInterface)
        .noneMatch(fInterface -> containsStaticMethods(fInterface, deploymentModel));
  }

  private static boolean containsStaticMethods(
      final FInterface fInterface, final FrancaDeploymentModel deploymentModel) {
    boolean result = false;

    EList<FMethod> methods = fInterface.getMethods();
    for (FMethod method : methods) {
      if (deploymentModel.isStatic(method)) {
        LOGGER.severe(
            "Static methods in interfaces are not allowed: method '"
                + method.getName()
                + "' in '"
                + fInterface.getName()
                + "'");
        result = true;
      }
    }

    return result;
  }
}
