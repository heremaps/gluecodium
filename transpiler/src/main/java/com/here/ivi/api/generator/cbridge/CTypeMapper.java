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

package com.here.ivi.api.generator.cbridge;

import com.here.ivi.api.model.cmodel.CType;
import org.franca.core.franca.FBasicTypeId;
import org.franca.core.franca.FTypeRef;

public final class CTypeMapper {

  public static CppTypeInfo mapType(final FTypeRef type) {
    return mapPredefined(type);
  }

  public static CppTypeInfo mapPredefined(final FTypeRef type) {
    FBasicTypeId typeId = type.getPredefined();
    switch (typeId.getValue()) {
      case FBasicTypeId.UNDEFINED_VALUE:
        return new CppTypeInfo(CType.VOID);
      case FBasicTypeId.INT8_VALUE:
        return new CppTypeInfo(CType.INT8);
      case FBasicTypeId.UINT8_VALUE:
        return new CppTypeInfo(CType.UINT8);
      case FBasicTypeId.INT16_VALUE:
        return new CppTypeInfo(CType.INT16);
      case FBasicTypeId.UINT16_VALUE:
        return new CppTypeInfo(CType.UINT16);
      case FBasicTypeId.INT32_VALUE:
        return new CppTypeInfo(CType.INT32);
      case FBasicTypeId.UINT32_VALUE:
        return new CppTypeInfo(CType.UINT32);
      case FBasicTypeId.INT64_VALUE:
        return new CppTypeInfo(CType.INT64);
      case FBasicTypeId.UINT64_VALUE:
        return new CppTypeInfo(CType.UINT64);
      case FBasicTypeId.BOOLEAN_VALUE:
        return new CppTypeInfo(CType.BOOL);
      case FBasicTypeId.FLOAT_VALUE:
        return new CppTypeInfo(CType.FLOAT);
      case FBasicTypeId.DOUBLE_VALUE:
        return new CppTypeInfo(CType.DOUBLE);
      case FBasicTypeId.STRING_VALUE:
        return CppTypeInfo.STRING;
      case FBasicTypeId.BYTE_BUFFER_VALUE:
        return CppTypeInfo.BYTE_VECTOR;
    }
    return new CppTypeInfo(CType.VOID);
  }
}
