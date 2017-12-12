/*
 * Copyright (C) 2017 HERE Global B.V. and its affiliate(s). All rights reserved.
 *
 * This software, including documentation, is protected by copyright controlled by
 * HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
 * adapting or translating, any or all of this material requires the prior written
 * consent of HERE Global B.V. This material also contains confidential information,
 * which may not be disclosed to others without prior written consent of HERE Global B.V.
 *
 */

package com.here.ivi.api.generator.swift;

import static com.here.ivi.api.model.swift.SwiftType.TypeCategory.*;
import static com.here.ivi.api.model.swift.SwiftType.VOID;

import com.here.ivi.api.common.FrancaTypeHelper;
import com.here.ivi.api.generator.cbridge.CBridgeNameRules;
import com.here.ivi.api.model.franca.FrancaDeploymentModel;
import com.here.ivi.api.model.rules.InstanceRules;
import com.here.ivi.api.model.swift.*;
import org.franca.core.franca.*;

/**
 * Maps Franca type references to their Swift counterparts. These references are used as parameters,
 * in typedefs, array members etc.
 */
public class SwiftTypeMapper {

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

    return swiftType;
  }

  private static SwiftType mapDerived(FType derived, final FrancaDeploymentModel deploymentModel) {
    if (derived instanceof FStructType) {
      return getStructType((FStructType) derived, deploymentModel);
    } else if (derived instanceof FEnumerationType) {
      return SwiftEnum.builder(SwiftNameRules.getEnumTypeName(derived, deploymentModel)).build();
    } else if (derived instanceof FTypeDef) {
      return getTypedef((FTypeDef) derived, deploymentModel);
    } else if (derived instanceof FArrayType) {
      SwiftType innerType = mapType(((FArrayType) derived).getElementType(), deploymentModel);
      return SwiftArrayMapper.create(innerType, derived);
    }
    return VOID;
  }

  private static SwiftType getTypedef(
      final FTypeDef francaTypeDef, final FrancaDeploymentModel deploymentModel) {
    if (InstanceRules.isInstanceId(francaTypeDef)) {
      return getClassType(francaTypeDef, deploymentModel);
    }
    SwiftType typedefType = mapType(francaTypeDef.getActualType(), deploymentModel);
    return typedefType.createAlias(SwiftNameRules.getTypeDefName(francaTypeDef, deploymentModel));
  }

  private static SwiftType getStructType(
      final FStructType francaStructType, final FrancaDeploymentModel deploymentModel) {

    String name = SwiftNameRules.getStructName(francaStructType, deploymentModel);
    return SwiftContainerType.builder(name)
        .category(STRUCT)
        .cPrefix(CBridgeNameRules.getStructBaseName(francaStructType))
        .cType(CBridgeNameRules.getStructRefType(francaStructType))
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

    return SwiftContainerType.builder(swiftName)
        .category(CLASS)
        .implementingClass(implementingClass)
        .optional(true)
        .cPrefix(CBridgeNameRules.getInstanceBaseName(francaTypeDef))
        .cType(CBridgeNameRules.getInstanceRefType(francaTypeDef))
        .build();
  }

  private static SwiftType mapPredefined(FTypeRef type) {
    FBasicTypeId typeId = type.getPredefined();
    switch (typeId.getValue()) {
      case FBasicTypeId.UNDEFINED_VALUE:
        return VOID;
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
        return new SwiftType("Bool");
      case FBasicTypeId.STRING_VALUE:
        return SwiftType.STRING;
      case FBasicTypeId.FLOAT_VALUE:
        return new SwiftType("Float");
      case FBasicTypeId.DOUBLE_VALUE:
        return new SwiftType("Double");
      case FBasicTypeId.BYTE_BUFFER_VALUE:
        return SwiftType.DATA;
    }
    return VOID;
  }
}
