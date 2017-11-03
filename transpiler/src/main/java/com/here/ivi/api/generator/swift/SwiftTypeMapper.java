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

import static com.here.ivi.api.model.rules.InstanceRules.isInstanceId;
import static com.here.ivi.api.model.swift.SwiftType.TypeCategory.*;
import static com.here.ivi.api.model.swift.SwiftType.VOID;

import com.here.ivi.api.common.FrancaTypeHelper;
import com.here.ivi.api.generator.cbridge.CBridgeNameRules;
import com.here.ivi.api.model.franca.FrancaDeploymentModel;
import com.here.ivi.api.model.swift.*;
import org.franca.core.franca.*;

/**
 * Maps Franca type references to their Swift counterparts. These references are used as parameters,
 * in typedefs, array members etc.
 */
public class SwiftTypeMapper {

  public static SwiftType mapType(final FTypeRef type) {
    return mapTypeWithDeploymentModel(type, null);
  }

  public static SwiftType mapTypeWithDeploymentModel(
      final FTypeRef type, final FrancaDeploymentModel deploymentModel) {
    FType derived = type.getDerived();
    SwiftType swiftType = VOID;
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
      return getClassOrStructType(derived, deploymentModel);
    } else if (derived instanceof FEnumerationType) {
      return SwiftEnum.builder(SwiftNameRules.getEnumTypeName(derived)).build();
    } else if (derived instanceof FTypeDef) {
      return getTypedef((FTypeDef) derived, deploymentModel);
    } else if (derived instanceof FArrayType) {
      SwiftType innerType = mapType(((FArrayType) derived).getElementType());
      return SwiftArrayMapper.create(innerType, derived);
    }
    return VOID;
  }

  private static SwiftType getTypedef(
      FTypeDef francaTypeDef, final FrancaDeploymentModel deploymentModel) {

    SwiftType typedefType = mapTypeDef(francaTypeDef, deploymentModel);
    return typedefType.createAlias(francaTypeDef.getName());
  }

  private static SwiftType mapTypeDef(
      final FTypeDef derived, final FrancaDeploymentModel deploymentModel) {
    if (isInstanceId(derived)) {
      return getClassOrStructType(derived, deploymentModel);
    }
    return mapTypeWithDeploymentModel(derived.getActualType(), deploymentModel);
  }

  public static SwiftValue mapType(FExpression expression) {
    if (expression instanceof FIntegerConstant) {
      return new SwiftValue(String.valueOf(((FIntegerConstant) expression).getVal()));
    } else {
      //TODO: APIGEN-494: Update Swift layer iOS generator for HelloWorld-ComplexConstants
      return null;
    }
  }

  public static SwiftType getClassOrStructType(
      FType derived, final FrancaDeploymentModel deploymentModel) {
    SwiftType.TypeCategory category = (derived instanceof FTypeDef) ? CLASS : STRUCT;
    String swiftName = SwiftNameRules.getClassName(derived.getName());
    SwiftContainerType mappedType = new SwiftContainerType(swiftName, category);
    mappedType.cPrefix = CBridgeNameRules.getStructBaseName(derived);
    mappedType.cType = CBridgeNameRules.getStructRefType(derived);
    if (mappedType.category == CLASS) {
      mappedType.optional = true;
      mappedType.implementingClass = swiftName;
      if (deploymentModel != null
          && deploymentModel.isInterface((FInterface) derived.eContainer())) {
        mappedType.implementingClass = "_" + swiftName;
      }
    }

    //TODO: APIGEN-891 Hack for reference structs inside classes. It need to be fixed properly.
    mappedType.setNamespaceIfNeeded(FrancaTypeHelper.getNamespace(derived));
    return mappedType;
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
