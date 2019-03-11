/*
 * Copyright (C) 2016-2018 HERE Europe B.V.
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
import com.here.genium.model.franca.DefinedBy;
import com.here.genium.model.franca.FrancaDeploymentModel;
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
        .append(FrancaTypeHelper.getFullName(parentTypeCollection))
        .append("' is not a constant expression.");

    return builder.toString();
  }
}
