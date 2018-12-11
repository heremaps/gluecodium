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

package com.here.genium.generator.swift;

import static com.here.genium.model.swift.SwiftType.TypeCategory.*;

import com.here.genium.common.FrancaTypeHelper;
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

  public static SwiftType mapType(final FTypeRef type, FrancaDeploymentModel deploymentModel) {
    FType derived = type.getDerived();

    SwiftType swiftType;
    if (derived != null) {
      swiftType = mapDerived(derived, deploymentModel);
    } else {
      swiftType = mapPredefined(type);
    }
    if (FrancaTypeHelper.isImplicitArray(type)) {
      swiftType = SwiftArrayMapper.create(swiftType, type);
    }

    EObject parentElement = type.eContainer();
    if (parentElement instanceof FTypedElement
        && deploymentModel.isNotNull((FTypedElement) parentElement)) {
      swiftType = swiftType.asNonOptional();
    }

    return swiftType;
  }

  private static SwiftType mapDerived(
      final FType derived, final FrancaDeploymentModel deploymentModel) {
    if (derived instanceof FStructType) {
      return getStructType((FStructType) derived, deploymentModel);
    } else if (derived instanceof FEnumerationType) {
      return SwiftEnum.builder(SwiftNameRules.getEnumTypeName(derived, deploymentModel)).build();
    } else if (derived instanceof FTypeDef) {
      return getTypedef((FTypeDef) derived, deploymentModel);
    } else if (derived instanceof FArrayType) {
      SwiftType innerType = mapType(((FArrayType) derived).getElementType(), deploymentModel);
      return SwiftArrayMapper.create(innerType, derived);
    } else if (derived instanceof FMapType) {
      return mapMapType((FMapType) derived, deploymentModel);
    }
    return SwiftType.VOID;
  }

  private static SwiftType mapMapType(
      final FMapType francaMapType, final FrancaDeploymentModel deploymentModel) {

    return SwiftStruct.builder(SwiftNameRules.getMapName(francaMapType, deploymentModel))
        .publicName(SwiftNameRules.getTypeName(francaMapType, deploymentModel))
        .cPrefix(CBridgeNameRules.getStructBaseName(francaMapType))
        .category(SwiftType.TypeCategory.DICTIONARY)
        .build();
  }

  private static SwiftType getTypedef(
      final FTypeDef francaTypeDef, final FrancaDeploymentModel deploymentModel) {
    if (InstanceRules.isInstanceId(francaTypeDef)) {
      return getClassType(francaTypeDef, deploymentModel);
    }
    SwiftType typedefType = mapType(francaTypeDef.getActualType(), deploymentModel);
    return typedefType.withAlias(SwiftNameRules.getTypeDefName(francaTypeDef, deploymentModel));
  }

  private static SwiftType getStructType(
      final FStructType francaStructType, final FrancaDeploymentModel deploymentModel) {

    String name = SwiftNameRules.getStructName(francaStructType, deploymentModel);
    return SwiftStruct.builder(name)
        .category(STRUCT)
        .cPrefix(CBridgeNameRules.getStructBaseName(francaStructType))
        .build();
  }

  private static SwiftType getClassType(
      final FTypeDef francaTypeDef, final FrancaDeploymentModel deploymentModel) {

    String swiftName = SwiftNameRules.getClassName(francaTypeDef.getName());
    String implementingClass = swiftName;
    if (deploymentModel != null
        && deploymentModel.isInterface((FInterface) francaTypeDef.eContainer())) {
      implementingClass = "_" + swiftName;
    }

    return SwiftStruct.builder(swiftName)
        .category(CLASS)
        .implementingClass(implementingClass)
        .optional(true)
        .cPrefix(CBridgeNameRules.getInstanceBaseName(francaTypeDef))
        .build();
  }

  private static SwiftType mapPredefined(FTypeRef type) {
    FBasicTypeId typeId = type.getPredefined();
    switch (typeId.getValue()) {
      case FBasicTypeId.UNDEFINED_VALUE:
        return SwiftType.VOID;
      case FBasicTypeId.INT8_VALUE:
        return new SwiftType("Int8");
      case FBasicTypeId.UINT8_VALUE:
        return new SwiftType("UInt8");
      case FBasicTypeId.INT16_VALUE:
        return new SwiftType("Int16");
      case FBasicTypeId.UINT16_VALUE:
        return new SwiftType("UInt16");
      case FBasicTypeId.INT32_VALUE:
        return new SwiftType("Int32");
      case FBasicTypeId.UINT32_VALUE:
        return new SwiftType("UInt32");
      case FBasicTypeId.INT64_VALUE:
        return new SwiftType("Int64");
      case FBasicTypeId.UINT64_VALUE:
        return new SwiftType("UInt64");
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
}
