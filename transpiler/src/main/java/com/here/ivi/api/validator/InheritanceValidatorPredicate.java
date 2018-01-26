/*
 * Copyright (C) 2018 HERE Global B.V. and its affiliate(s). All rights reserved.
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
import org.franca.core.franca.FInterface;

/**
 * Validate that interfaces with IsInterface set to "true" do not inherit from any interface with
 * IsInterface set to "false".
 */
public final class InheritanceValidatorPredicate implements ValidatorPredicate<FInterface> {

  private static final String INVALID_INHERITANCE_MESSAGE =
      "Interface '%s.%s' is not allowed to inherit from class '%s.%s'.";

  @Override
  public Class<FInterface> getElementClass() {
    return FInterface.class;
  }

  @Override
  public String validate(
      final FrancaDeploymentModel deploymentModel, final FInterface francaInterface) {

    if (!deploymentModel.isInterface(francaInterface)) {
      return null;
    }

    FInterface parentInterface = francaInterface.getBase();
    if (parentInterface != null && !deploymentModel.isInterface(parentInterface)) {
      return String.format(
          INVALID_INHERITANCE_MESSAGE,
          DefinedBy.getModelName(francaInterface),
          francaInterface.getName(),
          DefinedBy.getModelName(parentInterface),
          parentInterface.getName());
    }

    return null;
  }
}
