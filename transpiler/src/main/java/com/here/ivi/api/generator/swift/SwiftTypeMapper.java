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

import static com.here.ivi.api.model.swift.SwiftType.TypeCategory.BUILTIN_BYTEBUFFER;
import static com.here.ivi.api.model.swift.SwiftType.TypeCategory.BUILTIN_STRING;
import static com.here.ivi.api.model.swift.SwiftType.TypeCategory.STRUCT;

import com.here.ivi.api.generator.cbridge.CBridgeNameRules;
import com.here.ivi.api.model.franca.FrancaElement;
import com.here.ivi.api.model.swift.SwiftStruct;
import com.here.ivi.api.model.swift.SwiftType;
import org.franca.core.franca.*;

public class SwiftTypeMapper {

  public static SwiftType mapType(FrancaElement rootModel, final FTypeRef type) {
    FType derived = type.getDerived();

    if (derived != null) {
      if (derived instanceof FStructType || derived instanceof FTypeDef) {
        CBridgeNameRules bridgeRules = new CBridgeNameRules();
        SwiftStruct mappedType = new SwiftStruct(derived.getName());
        mappedType.cPrefix = bridgeRules.getStructBaseName(derived);
        mappedType.cType = bridgeRules.getStructRefType(derived);
        return mappedType;
      }
      return SwiftType.VOID;
    }

    return mapPredefined(type);
  }

  public static SwiftType mapOutputType(FrancaElement rootModel, final FTypeRef type) {
    SwiftType mapped = mapType(rootModel, type);
    if (mapped.category == BUILTIN_BYTEBUFFER
        || mapped.category == STRUCT
        || mapped.category == BUILTIN_STRING) {
      mapped.optional = true;
    }
    return mapped;
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
    return SwiftType.VOID;
  }
}
