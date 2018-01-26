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

import com.here.ivi.api.common.FrancaTypeHelper;
import com.here.ivi.api.model.common.InstanceRules;
import com.here.ivi.api.model.franca.DefinedBy;
import com.here.ivi.api.model.franca.FrancaDeploymentModel;
import org.franca.core.franca.FBasicTypeId;
import org.franca.core.franca.FEnumerationType;
import org.franca.core.franca.FMapType;
import org.franca.core.franca.FType;
import org.franca.core.franca.FTypeCollection;
import org.franca.core.franca.FTypeDef;
import org.franca.core.franca.FTypeRef;

public class MapKeyValidator implements ValidatorPredicate<FMapType> {

  @Override
  public Class<FMapType> getElementClass() {
    return FMapType.class;
  }

  @Override
  public String validate(FrancaDeploymentModel deploymentModel, FMapType francaMapType) {

    FTypeRef keyTypeRef = francaMapType.getKeyType();

    if (keyTypeRef.getDerived() instanceof FTypeDef) {

      // remove outer type definitions (if there are any)
      FTypeDef keyTypeDef = resolveTypeDefChain((FTypeDef) keyTypeRef.getDerived());
      if (InstanceRules.isInstanceId(keyTypeDef)) {
        return generateErrorMessage(francaMapType);
      }
      keyTypeRef = keyTypeDef.getActualType();
    }

    if (FrancaTypeHelper.isImplicitArray(keyTypeRef)) {
      return generateErrorMessage(francaMapType);
    }

    if (keyTypeRef.getDerived() != null) {
      return keyTypeRef.getDerived() instanceof FEnumerationType
          ? null
          : generateErrorMessage(francaMapType);
    } else if (keyTypeRef.getPredefined() != FBasicTypeId.UNDEFINED) {
      return keyTypeRef.getPredefined() != FBasicTypeId.BYTE_BUFFER
          ? null
          : generateErrorMessage(francaMapType);
    }
    return generateErrorMessage(francaMapType);
  }

  /**
   * if typeDef is part of a type def chain, all outer typedefs will be removed and innermost
   * typeDef is returned, returns input otherwise
   */
  private static FTypeDef resolveTypeDefChain(FTypeDef typeDef) {
    FType actualType = typeDef.getActualType().getDerived();
    if (actualType instanceof FTypeDef) {
      return resolveTypeDefChain((FTypeDef) actualType);
    } else {
      return typeDef;
    }
  }

  private static String generateErrorMessage(final FMapType francaMap) {
    FTypeCollection francaTypeCollection = DefinedBy.findDefiningTypeCollection(francaMap);
    return String.format(
        "Complex keys are not allowed: map '%s' in type collection '%s.%s'.",
        francaMap.getName(),
        DefinedBy.getModelName(francaTypeCollection),
        francaTypeCollection.getName());
  }
}
