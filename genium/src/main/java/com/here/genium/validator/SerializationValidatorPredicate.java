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
 * Validate each field in "Serializable" structs against the following conditions:
 *
 * <ul>
 *   <li>Should not contain Instance type fields.
 *   <li>All Struct type fields should be of some "Serializable" Struct type.
 * </ul>
 */
public class SerializationValidatorPredicate implements ValidatorPredicate<FField> {

  private static final String INSTANCE_MESSAGE =
      "Instance fields are not supported for serializable structs: " + "field '%s' in struct '%s'.";
  private static final String NON_SERIALIZABLE_MESSAGE =
      "Fields of non-serializable struct types are not supported for serializable structs: "
          + "field '%s' in struct '%s'.";

  @Override
  public Class<FField> getElementClass() {
    return FField.class;
  }

  @Override
  public String validate(final FrancaDeploymentModel deploymentModel, final FField francaField) {

    FStructType francaStruct = (FStructType) francaField.eContainer();
    if (!deploymentModel.isSerializable(francaStruct)) {
      return null;
    }

    String messageFormat = null;
    FTypeRef underlyingType = getUnderlyingType(francaField.getType());
    FType derivedType = underlyingType.getDerived();
    if (derivedType == null) {
      if (underlyingType.getPredefined() == FBasicTypeId.UNDEFINED) {
        messageFormat = INSTANCE_MESSAGE;
      }
    } else if (derivedType instanceof FStructType
        && !deploymentModel.isSerializable((FStructType) derivedType)) {
      messageFormat = NON_SERIALIZABLE_MESSAGE;
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
