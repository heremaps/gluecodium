/*
 * Copyright (C) 2016-2019 HERE Europe B.V.
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
import com.here.genium.model.franca.FrancaDeploymentModel;
import org.franca.core.franca.*;

/** Validates Franca unions are not used. */
public final class UnionsValidatorPredicate implements ValidatorPredicate<FUnionType> {

  private static final String UNION_MESSAGE =
      "Unions are not supported: union '%s' in type collection '%s'.";

  @Override
  public Class<FUnionType> getElementClass() {
    return FUnionType.class;
  }

  @Override
  public String validate(
      final FrancaDeploymentModel deploymentModel, final FUnionType francaUnion) {

    return String.format(
        UNION_MESSAGE,
        francaUnion.getName(),
        FrancaTypeHelper.getFullName((FTypeCollection) francaUnion.eContainer()));
  }
}
