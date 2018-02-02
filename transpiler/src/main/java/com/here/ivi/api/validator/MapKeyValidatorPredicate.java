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
import org.franca.core.franca.FBasicTypeId;
import org.franca.core.franca.FEnumerationType;
import org.franca.core.franca.FMapType;
import org.franca.core.franca.FType;
import org.franca.core.franca.FTypeCollection;
import org.franca.core.franca.FTypeDef;
import org.franca.core.franca.FTypeRef;

/** Validates that the Map types have either Primitive or Enum keys. */
public final class MapKeyValidatorPredicate implements ValidatorPredicate<FMapType> {

  private static final String INVALID_KEY_TYPE_MESSAGE =
      "Complex keys are not allowed: map '%s' in type collection '%s.%s'.";

  @Override
  public Class<FMapType> getElementClass() {
    return FMapType.class;
  }

  @Override
  public String validate(
      final FrancaDeploymentModel deploymentModel, final FMapType francaMapType) {

    if (isComplexType(francaMapType.getKeyType())) {
      FTypeCollection francaTypeCollection = DefinedBy.findDefiningTypeCollection(francaMapType);
      return String.format(
          INVALID_KEY_TYPE_MESSAGE,
          francaMapType.getName(),
          DefinedBy.getModelName(francaTypeCollection),
          francaTypeCollection.getName());
    } else {
      return null;
    }
  }

  private static boolean isComplexType(final FTypeRef francaTypeRef) {

    FType derivedType = francaTypeRef.getDerived();
    if (derivedType instanceof FTypeDef) {
      return isComplexType(((FTypeDef) derivedType).getActualType());
    }

    if (derivedType != null) {
      return !(derivedType instanceof FEnumerationType);
    } else {
      // ByteBuffers are not allowed as keys. "Undefined" means either an Instance or a broken type
      // reference, neither of those are allowed too.
      return francaTypeRef.getPredefined() == FBasicTypeId.BYTE_BUFFER
          || francaTypeRef.getPredefined() == FBasicTypeId.UNDEFINED;
    }
  }
}
