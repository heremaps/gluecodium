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
import org.franca.core.franca.*;

/**
 * Validate each field with "ExternalGetter" or "ExternalSetter" properties set against the
 * following conditions:
 *
 * <ul>
 *   <li>Should either have both "ExternalGetter" or "ExternalSetter" properties set, or none.
 *   <li>Should be in a struct which has "ExternalType" property set.
 * </ul>
 */
public class ExternalFieldsValidatorPredicate implements ValidatorPredicate<FField> {

  private static final String BOTH_PROPERTIES_MESSAGE =
      "External fields should have both 'ExternalGetter' or 'ExternalSetter' properties set: "
          + "field '%s' in struct '%s'.";
  private static final String NON_EXTERNAL_STRUCT_MESSAGE =
      "The struct containing external fields should have 'ExternalType' property set: "
          + "field '%s' in struct '%s'.";

  @Override
  public Class<FField> getElementClass() {
    return FField.class;
  }

  @Override
  public String validate(final FrancaDeploymentModel deploymentModel, final FField francaField) {

    boolean hasExternalGetter = deploymentModel.getExternalGetter(francaField) != null;
    boolean hasExternalSetter = deploymentModel.getExternalSetter(francaField) != null;
    FStructType francaStruct = (FStructType) francaField.eContainer();

    String messageFormat = null;
    if (hasExternalGetter != hasExternalSetter) {
      messageFormat = BOTH_PROPERTIES_MESSAGE;
    } else if (hasExternalGetter
        && deploymentModel.getExternalType((FStructType) francaField.eContainer()) == null) {
      messageFormat = NON_EXTERNAL_STRUCT_MESSAGE;
    }

    return messageFormat != null
        ? String.format(
            messageFormat, francaField.getName(), FrancaTypeHelper.getFullName(francaStruct))
        : null;
  }
}
