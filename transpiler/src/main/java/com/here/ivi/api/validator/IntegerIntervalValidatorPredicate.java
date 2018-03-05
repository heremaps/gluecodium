/*
 * Copyright (c) 2016-2018 HERE Europe B.V.
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
