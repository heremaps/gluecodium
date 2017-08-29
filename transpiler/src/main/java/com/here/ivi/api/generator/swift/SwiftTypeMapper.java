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

import com.here.ivi.api.model.franca.FrancaElement;
import com.here.ivi.api.model.swift.SwiftStruct;
import com.here.ivi.api.model.swift.SwiftType;
import org.franca.core.franca.*;

public class SwiftTypeMapper {

  public static SwiftType mapType(FrancaElement<?> rootModel, final FTypeRef type) {
    FType derived = type.getDerived();

    if (derived != null) {
      if (derived instanceof FStructType) {
        return new SwiftStruct(derived.getName());
      }
      return SwiftType.VOID;
    }

    return mapPredefined(type);
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
        return new SwiftType("String");
      case FBasicTypeId.FLOAT_VALUE:
        return new SwiftType("Float");
      case FBasicTypeId.DOUBLE_VALUE:
        return new SwiftType("Double");
      case FBasicTypeId.BYTE_BUFFER_VALUE:
        return new SwiftType("Data");
    }
    return SwiftType.VOID;
  }
}
