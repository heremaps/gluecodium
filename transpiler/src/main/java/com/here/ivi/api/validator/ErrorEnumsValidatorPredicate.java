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
import org.franca.core.franca.FMethod;

/**
 * Validate that methods don't use inline error enums since these are not usable with
 * std::error_code.
 */
public final class ErrorEnumsValidatorPredicate implements ValidatorPredicate<FMethod> {

  private static final String ENUMS_METHOD_MESSAGE =
      "Inline error enums in methods are not allowed: method '%s' in interface '%s.%s'.";

  @Override
  public Class<FMethod> getElementClass() {
    return FMethod.class;
  }

  @Override
  public String validate(final FrancaDeploymentModel deploymentModel, final FMethod francaMethod) {

    if (francaMethod.getErrors() != null) {
      FInterface francaInterface = (FInterface) francaMethod.eContainer();
      return String.format(
          ENUMS_METHOD_MESSAGE,
          francaMethod.getName(),
          DefinedBy.getModelName(francaInterface),
          francaInterface.getName());
    }

    return null;
  }
}
