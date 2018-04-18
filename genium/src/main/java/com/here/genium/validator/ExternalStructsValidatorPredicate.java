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
import org.franca.core.franca.FStructType;

/**
 * Validate each struct with "ExternalName" property set against the following conditions:
 *
 * <ul>
 *   <li>Should have "ExternalType" property set.
 * </ul>
 */
public class ExternalStructsValidatorPredicate implements ValidatorPredicate<FStructType> {

  private static final String NON_EXTERNAL_STRUCT_MESSAGE =
      "The struct with 'ExternalName' should have 'ExternalType' property set: struct '%s'.";

  @Override
  public Class<FStructType> getElementClass() {
    return FStructType.class;
  }

  @Override
  public String validate(
      final FrancaDeploymentModel deploymentModel, final FStructType francaStruct) {

    boolean hasExternalName = deploymentModel.getExternalName(francaStruct) != null;
    boolean hasExternalType = deploymentModel.getExternalType(francaStruct) != null;

    return hasExternalName && !hasExternalType
        ? String.format(NON_EXTERNAL_STRUCT_MESSAGE, FrancaTypeHelper.getFullName(francaStruct))
        : null;
  }
}
