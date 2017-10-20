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

import com.here.ivi.api.generator.cbridge.CBridgeNameRules;
import com.here.ivi.api.model.swift.SwiftContainerType;
import com.here.ivi.api.model.swift.SwiftEnum;
import com.here.ivi.api.model.swift.SwiftType;
import com.here.ivi.api.model.swift.SwiftValue;
import org.franca.core.franca.*;

/**
 * Maps Franca type references to their Swift counterparts. These references are used as parameters,
 * in typedefs, array members etc.
 */
public class SwiftTypeMapper {

  public static SwiftType mapType(final FTypeRef type) {
    FType derived = type.getDerived();

    if (derived != null) {
      if (derived instanceof FStructType) {
        return getStructType(derived);
      } else if (derived instanceof FEnumerationType) {
        return SwiftEnum.builder(SwiftNameRules.getEnumTypeName(derived)).build();
      } else if (derived instanceof FTypeDef) {
        return getTypedef((FTypeDef) derived);
      }
      return VOID;
    }

    return mapPredefined(type);
  }

  private static SwiftType getTypedef(FTypeDef francaTypeDef) {
    SwiftType typedefType = mapTypeDef(francaTypeDef);
    if (francaTypeDef.getActualType() != null) {
      return typedefType.createAlias(francaTypeDef.getName());
    } else {
      return typedefType;
    }
  }

  public static SwiftValue mapType(FExpression expression) {
    if (expression instanceof FIntegerConstant) {
      return new SwiftValue(String.valueOf(((FIntegerConstant) expression).getVal()));
    } else {
      //TODO: APIGEN-494: Update Swift layer iOS generator for HelloWorld-ComplexConstants
      return null;
    }
  }

  private static SwiftType getStructType(FType derived) {
    SwiftType.TypeCategory category = (derived instanceof FTypeDef) ? CLASS : STRUCT;
    SwiftContainerType mappedType = new SwiftContainerType(derived.getName(), category);
    mappedType.cPrefix = CBridgeNameRules.getStructBaseName(derived);
    mappedType.cType = CBridgeNameRules.getStructRefType(derived);
    mappedType.privateImplementation =
        (derived instanceof FTypeDef) ? "_" + derived.getName() : null;
    if (mappedType.category == CLASS) {
      mappedType.optional = true;
    }
    return mappedType;
  }

  private static SwiftType mapTypeDef(final FTypeDef derived) {
    if (isInstanceId(derived)) {
      return getStructType(derived);
    }
    return mapType(derived.getActualType());
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
