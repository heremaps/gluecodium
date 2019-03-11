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
import com.here.genium.model.franca.FrancaDeploymentModel;
import org.franca.core.franca.FInterface;

/**
 * Validate that interfaces with IsInterface set to "true" do not inherit from any interface with
 * IsInterface set to "false".
 */
public final class InheritanceValidatorPredicate implements ValidatorPredicate<FInterface> {

  private static final String INVALID_INHERITANCE_MESSAGE =
      "Interface '%s' is not allowed to inherit from class '%s'.";

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
    if (parentInterface == null || deploymentModel.isInterface(parentInterface)) {
      return null;
    }

    return String.format(
        INVALID_INHERITANCE_MESSAGE,
        FrancaTypeHelper.getFullName(francaInterface),
        FrancaTypeHelper.getFullName(parentInterface));
  }
}
