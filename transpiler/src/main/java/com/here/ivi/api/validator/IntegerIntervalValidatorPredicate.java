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
import org.franca.core.franca.*;

/** Validates that none of the Franca type collections or interfaces contain integer ranges. */
public final class IntegerIntervalValidatorPredicate
    implements ValidatorPredicate<FIntegerInterval> {

  private static final String INTEGER_INTERVAL_MESSAGE =
      "Integer ranges are not supported: element '%s' in type collection '%s.%s'.";

  @Override
  public Class<FIntegerInterval> getElementClass() {
    return FIntegerInterval.class;
  }

  @Override
  public String validate(
      final FrancaDeploymentModel deploymentModel, final FIntegerInterval francaIntegerInterval) {

    FModelElement parentElement = (FModelElement) francaIntegerInterval.eContainer();
    FTypeCollection francaTypeCollection = DefinedBy.findDefiningTypeCollection(parentElement);

    return String.format(
        INTEGER_INTERVAL_MESSAGE,
        parentElement.getName(),
        DefinedBy.getModelName(francaTypeCollection),
        francaTypeCollection.getName());
  }
}
