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
 * Validate against the inheritance restrictions for interfaces:
 *
 * <ul>
 *   <li>An interface with "IsInterface" set to "true" should not inherit from an interface with
 *       "IsInterface" set to "false".
 *   <li>An interface with "ObjcInterface" set to "true" should inherit from an interface with
 *       "ObjcInterface" set to "false" only if the child interface has "IsInterface" set to "false"
 *       and the parent interface has "IsInterface" set to "true".
 * </ul>
 */
public final class InheritanceValidatorPredicate implements ValidatorPredicate<FInterface> {

  private static final String INVALID_INTERFACE_INHERITANCE_MESSAGE =
      "Interface '%s' is not allowed to inherit from class '%s'.";
  private static final String INVALID_OBJC_CLASS_INHERITANCE_MESSAGE =
      "ObjC-compatible class '%s' is not allowed to inherit from non-compatible class '%s'.";
  private static final String INVALID_OBJC_PROTOCOL_INHERITANCE_MESSAGE =
      "ObjC-compatible protocol '%s' is not allowed to inherit from non-compatible protocol '%s'.";

  @Override
  public Class<FInterface> getElementClass() {
    return FInterface.class;
  }

  @Override
  public String validate(
      final FrancaDeploymentModel deploymentModel, final FInterface francaInterface) {

    // If there is no parent interface, no restrictions are applied.
    FInterface parentInterface = francaInterface.getBase();
    if (parentInterface == null) {
      return null;
    }

    boolean childIsInterface = deploymentModel.isInterface(francaInterface);
    boolean parentIsInterface = deploymentModel.isInterface(parentInterface);
    String errorMessageFormat = null;
    if (childIsInterface && !parentIsInterface) {
      // An interface/protocol cannot inherit from a class.
      errorMessageFormat = INVALID_INTERFACE_INHERITANCE_MESSAGE;
    } else if (deploymentModel.isObjcInterface(francaInterface)
        && !deploymentModel.isObjcInterface(parentInterface)) {

      if (childIsInterface) {
        // An @objc protocol cannot inherit from non-@objc protocol.
        errorMessageFormat = INVALID_OBJC_PROTOCOL_INHERITANCE_MESSAGE;
      } else if (!parentIsInterface) {
        // An @objc class cannot inherit from non-@objc class.
        errorMessageFormat = INVALID_OBJC_CLASS_INHERITANCE_MESSAGE;
      }
    }

    if (errorMessageFormat != null) {
      return String.format(
          errorMessageFormat,
          FrancaTypeHelper.getFullName(francaInterface),
          FrancaTypeHelper.getFullName(parentInterface));
    } else {
      return null;
    }
  }
}
