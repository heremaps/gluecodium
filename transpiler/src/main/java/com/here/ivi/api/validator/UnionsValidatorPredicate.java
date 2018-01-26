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

/** Validates that all of the Franca type collections or interfaces contain Unions. */
public final class UnionsValidatorPredicate implements ValidatorPredicate<FUnionType> {

  private static final String UNION_MESSAGE =
      "Unions are not supported: union '%s' in type collection '%s.%s'.";

  @Override
  public Class<FUnionType> getElementClass() {
    return FUnionType.class;
  }

  @Override
  public String validate(
      final FrancaDeploymentModel deploymentModel, final FUnionType francaUnion) {

    FTypeCollection francaTypeCollection = (FTypeCollection) francaUnion.eContainer();

    return String.format(
        UNION_MESSAGE,
        francaUnion.getName(),
        DefinedBy.getModelName(francaTypeCollection),
        francaTypeCollection.getName());
  }
}
