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

package com.here.genium.generator.swift;

import static com.here.genium.model.swift.SwiftType.TypeCategory.*;

import com.here.genium.common.FrancaTypeHelper;
import com.here.genium.generator.cbridge.CArrayMapper;
import com.here.genium.generator.cbridge.CBridgeNameRules;
import com.here.genium.model.common.InstanceRules;
import com.here.genium.model.franca.FrancaDeploymentModel;
import com.here.genium.model.swift.*;
import org.eclipse.emf.ecore.EObject;
import org.franca.core.franca.*;

/**
 * Maps Franca type references to their Swift counterparts. These references are used as parameters,
 * in typedefs, array members etc.
 */
public class SwiftTypeMapper {

  public static final String OBJC_PARENT_CLASS = "NSObject";

  private final FrancaDeploymentModel deploymentModel;

  public SwiftTypeMapper(final FrancaDeploymentModel deploymentModel) {
    this.deploymentModel = deploymentModel;
  }

  public SwiftType mapType(final FTypeRef type) {
    FType derived = type.getDerived();

    SwiftType swiftType = derived != null ? mapDerived(derived) : mapPredefined(type);
    if (FrancaTypeHelper.isImplicitArray(type)) {
      swiftType = createArrayType(swiftType, type);
    }

    EObject parentElement = type.eContainer();
    if (parentElement instanceof FTypedElement
        && deploymentModel.isNullable((FTypedElement) parentElement)) {
      swiftType = swiftType.withOptional(true);
    }

    return swiftType;
  }

  public String getActualTypeKey(final FTypeRef francaTypeRef) {

    FType derivedType = francaTypeRef.getDerived();
    if (derivedType == null) {
      return mapPredefined(francaTypeRef).name;
    } else if (InstanceRules.isInstanceId(francaTypeRef)) {
      return mapDerived(derivedType).name;
    } else if (derivedType instanceof FTypeDef) {
      return getActualTypeKey(((FTypeDef) derivedType).getActualType());
    } else if (derivedType instanceof FArrayType) {
      String innerTypeKey = getActualTypeKey(((FArrayType) derivedType).getElementType());
      return "[" + innerTypeKey + "]";
    } else if (derivedType instanceof FMapType) {
      FMapType francaMapType = (FMapType) derivedType;
      String keyTypeKey = getActualTypeKey(francaMapType.getKeyType());
      String valueTypeKey = getActualTypeKey(francaMapType.getValueType());
      return "[" + keyTypeKey + ":" + valueTypeKey + "]";
    } else {
      return mapDerived(derivedType).name;
    }
  }

  public SwiftArray mapArrayType(final FArrayType arrayType) {
    SwiftType innerType = mapType(arrayType.getElementType());
    return createArrayType(innerType, arrayType);
  }

  private SwiftType mapDerived(final FType derived) {
    if (derived instanceof FStructType) {
      return getStructType((FStructType) derived);
    } else if (derived instanceof FEnumerationType) {
      return new SwiftEnum(SwiftNameRules.getEnumTypeName(derived, deploymentModel));
    } else if (derived instanceof FTypeDef) {
      return getTypedef((FTypeDef) derived);
    } else if (derived instanceof FArrayType) {
      return mapArrayType((FArrayType) derived);
    } else if (derived instanceof FMapType) {
      return mapMapType((FMapType) derived);
    }
    return SwiftType.VOID;
  }

  private SwiftType mapMapType(final FMapType francaMapType) {

    return new SwiftStruct(
        SwiftNameRules.getMapName(francaMapType, deploymentModel),
        CBridgeNameRules.getStructBaseName(francaMapType),
        null,
        DICTIONARY,
        false,
        SwiftNameRules.getTypeName(francaMapType, deploymentModel));
  }

  private SwiftType getTypedef(final FTypeDef francaTypeDef) {
    if (InstanceRules.isInstanceId(francaTypeDef)) {
      return getClassType(francaTypeDef);
    }
    SwiftType typedefType = mapType(francaTypeDef.getActualType());
    return typedefType.withAlias(SwiftNameRules.getTypeDefName(francaTypeDef, deploymentModel));
  }

  private SwiftType getStructType(final FStructType francaStructType) {

    String name = SwiftNameRules.getStructName(francaStructType, deploymentModel);
    return new SwiftStruct(
        name, CBridgeNameRules.getStructBaseName(francaStructType), null, STRUCT);
  }

  private SwiftType getClassType(final FTypeDef francaTypeDef) {

    String swiftName = SwiftNameRules.getClassName(francaTypeDef.getName());
    return new SwiftStruct(
        swiftName,
        CBridgeNameRules.getInstanceBaseName(francaTypeDef),
        null,
        CLASS,
        deploymentModel.isInterface((FInterface) francaTypeDef.eContainer()));
  }

  private static SwiftType mapPredefined(FTypeRef type) {
    FBasicTypeId typeId = type.getPredefined();
    switch (typeId.getValue()) {
      case FBasicTypeId.UNDEFINED_VALUE:
        return SwiftType.VOID;
      case FBasicTypeId.INT8_VALUE:
        return SwiftType.INT8;
      case FBasicTypeId.UINT8_VALUE:
        return SwiftType.UINT8;
      case FBasicTypeId.INT16_VALUE:
        return SwiftType.INT16;
      case FBasicTypeId.UINT16_VALUE:
        return SwiftType.UINT16;
      case FBasicTypeId.INT32_VALUE:
        return SwiftType.INT32;
      case FBasicTypeId.UINT32_VALUE:
        return SwiftType.UINT32;
      case FBasicTypeId.INT64_VALUE:
        return SwiftType.INT64;
      case FBasicTypeId.UINT64_VALUE:
        return SwiftType.UINT64;
      case FBasicTypeId.BOOLEAN_VALUE:
        return SwiftType.BOOL;
      case FBasicTypeId.STRING_VALUE:
        return SwiftType.STRING;
      case FBasicTypeId.FLOAT_VALUE:
        return SwiftType.FLOAT;
      case FBasicTypeId.DOUBLE_VALUE:
        return SwiftType.DOUBLE;
      case FBasicTypeId.BYTE_BUFFER_VALUE:
        return SwiftType.DATA;
    }
    return SwiftType.VOID;
  }

  private static SwiftArray createArrayType(
      final SwiftType underlyingType, final EObject francaElement) {
    return new SwiftArray(underlyingType, CArrayMapper.getArrayName(francaElement));
  }
}
