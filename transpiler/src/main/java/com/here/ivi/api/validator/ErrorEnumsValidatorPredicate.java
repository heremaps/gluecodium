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
