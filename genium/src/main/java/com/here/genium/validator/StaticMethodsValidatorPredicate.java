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
import org.franca.core.franca.FMethod;

/** Validate that static methods are not contained in Franca interfaces with IsInterface "true". */
public final class StaticMethodsValidatorPredicate implements ValidatorPredicate<FMethod> {

  private static final String STATIC_METHOD_MESSAGE =
      "Static methods in interfaces are not allowed: method '%s' in interface '%s'.";

  @Override
  public Class<FMethod> getElementClass() {
    return FMethod.class;
  }

  @Override
  public String validate(final FrancaDeploymentModel deploymentModel, final FMethod francaMethod) {

    if (!deploymentModel.isStatic(francaMethod)) {
      return null;
    }

    FInterface francaInterface = (FInterface) francaMethod.eContainer();
    if (!deploymentModel.isInterface(francaInterface)) {
      return null;
    }

    return String.format(
        STATIC_METHOD_MESSAGE,
        francaMethod.getName(),
        FrancaTypeHelper.getFullName(francaInterface));
  }
}
