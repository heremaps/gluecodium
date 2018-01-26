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
import java.util.*;
import org.franca.core.franca.*;

/** Validates that the Franca expression is a constant expression. */
public final class ExpressionValidatorPredicate
    implements ValidatorPredicate<FInitializerExpression> {

  @Override
  public Class<FInitializerExpression> getElementClass() {
    return FInitializerExpression.class;
  }

  @Override
  public String validate(
      final FrancaDeploymentModel deploymentModel, final FInitializerExpression francaExpression) {
    if (francaExpression instanceof FConstant) {
      return null;
    } else {
      return createErrorMessage(francaExpression);
    }
  }

  private static String createErrorMessage(final FInitializerExpression expression) {

    StringBuilder builder = new StringBuilder();
    builder.append("Initializer expression for ");
    FModelElement parentElement = (FModelElement) expression.eContainer();
    if (parentElement instanceof FEnumerator) {
      builder
          .append("enumerator '")
          .append(parentElement.getName())
          .append("' of enumeration '")
          .append(((FModelElement) parentElement.eContainer()).getName())
          .append("' ");
    } else {
      builder.append("constant '").append(parentElement.getName()).append("' ");
    }

    FTypeCollection parentTypeCollection = DefinedBy.findDefiningTypeCollection(parentElement);
    builder
        .append(" in '")
        .append(((FModel) parentTypeCollection.eContainer()).getName())
        .append('.')
        .append(parentTypeCollection.getName())
        .append("' is not a constant expression.");

    return builder.toString();
  }
}
