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

import com.here.genium.model.franca.FrancaDeploymentModel;
import org.franca.core.franca.FStructType;
import org.jetbrains.annotations.NotNull;

/**
 * Validate each field in "Equatable" structs against the following conditions:
 *
 * <ul>
 *   <li>Should not contain Instance type fields.
 *   <li>All Struct type fields should be of some "Equatable" Struct type.
 * </ul>
 */
public class EquatableValidatorPredicate extends FieldValidatorPredicate {

  private static final String INSTANCE_MESSAGE =
      "Instance fields are not supported for equatable structs: " + "field '%s' in struct '%s'.";
  private static final String NON_EQUATABLE_MESSAGE =
      "Fields of non-equatable struct types are not supported for equatable structs: "
          + "field '%s' in struct '%s'.";

  @Override
  protected boolean hasDeploymentProperty(
      final FrancaDeploymentModel deploymentModel, final FStructType francaStruct) {
    return deploymentModel.isEquatable(francaStruct);
  }

  @NotNull
  @Override
  protected String getInstanceErrorMessageFormat() {
    return INSTANCE_MESSAGE;
  }

  @NotNull
  @Override
  protected String getMismatchErrorMessageFormat() {
    return NON_EQUATABLE_MESSAGE;
  }
}
