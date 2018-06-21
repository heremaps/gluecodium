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
import org.jetbrains.annotations.NotNull;

/**
 * Validate each field in structs marked with specific Boolean deployment property against the
 * following conditions:
 *
 * <ul>
 *   <li>Should not contain Instance type fields.
 *   <li>All Struct type fields should be of a Struct type marked with the same deployment property.
 * </ul>
 */
public abstract class FieldValidatorPredicate implements ValidatorPredicate<FField> {

  @SuppressWarnings("BooleanMethodIsAlwaysInverted")
  protected abstract boolean hasDeploymentProperty(
      FrancaDeploymentModel deploymentModel, FStructType francaStruct);

  @NotNull
  protected abstract String getInstanceErrorMessageFormat();

  @NotNull
  protected abstract String getMismatchErrorMessageFormat();

  @Override
  public Class<FField> getElementClass() {
    return FField.class;
  }

  @Override
  public String validate(final FrancaDeploymentModel deploymentModel, final FField francaField) {

    FStructType francaStruct = (FStructType) francaField.eContainer();
    if (!hasDeploymentProperty(deploymentModel, francaStruct)) {
      return null;
    }

    String messageFormat = null;
    FTypeRef underlyingType = getUnderlyingType(francaField.getType());
    FType derivedType = underlyingType.getDerived();
    if (derivedType == null) {
      if (underlyingType.getPredefined() == FBasicTypeId.UNDEFINED) {
        messageFormat = getInstanceErrorMessageFormat();
      }
    } else if (derivedType instanceof FStructType
        && !hasDeploymentProperty(deploymentModel, (FStructType) derivedType)) {
      messageFormat = getMismatchErrorMessageFormat();
    }

    if (messageFormat == null) {
      return null;
    }

    return String.format(
        messageFormat, francaField.getName(), FrancaTypeHelper.getFullName(francaStruct));
  }

  private static FTypeRef getUnderlyingType(final FTypeRef declaredType) {

    FType derivedType = declaredType.getDerived();
    if (derivedType instanceof FTypeDef) {
      return getUnderlyingType(((FTypeDef) derivedType).getActualType());
    }
    if (derivedType instanceof FArrayType) {
      return getUnderlyingType(((FArrayType) derivedType).getElementType());
    }
    if (derivedType instanceof FMapType) {
      // No validation against Map keys, since only primitive and enum keys are supported.
      return getUnderlyingType(((FMapType) derivedType).getValueType());
    }

    return declaredType;
  }
}
