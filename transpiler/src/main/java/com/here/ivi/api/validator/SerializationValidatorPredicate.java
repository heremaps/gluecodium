/*
 * Copyright (C) 2018 HERE Global B.V. and its affiliate(s). All rights reserved.
 *
 * This software, including documentation, is protected by copyright controlled by
 * HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
 * adapting or translating, any or all of this material requires the prior written
 * consent of HERE Global B.V. This material also contains confidential information,
 * which may not be disclosed to others without prior written consent of HERE Global B.V.
 *
 */

package com.here.ivi.api.validator;

import com.here.ivi.api.model.franca.DefinedBy;
import com.here.ivi.api.model.franca.FrancaDeploymentModel;
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
      "Instance fields are not supported for serializable structs: "
          + "field '%s' in struct '%s.%s.%s'.";
  private static final String NON_SERIALIZABLE_MESSAGE =
      "Fields of non-serializable struct types are not supported for serializable structs: "
          + "field '%s' in struct '%s.%s.%s'.";

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

    if (messageFormat != null) {
      FTypeCollection francaTypeCollection = (FTypeCollection) francaStruct.eContainer();
      return String.format(
          messageFormat,
          francaField.getName(),
          DefinedBy.getModelName(francaTypeCollection),
          francaTypeCollection.getName(),
          francaStruct.getName());
    }

    return null;
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
