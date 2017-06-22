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

import com.here.ivi.api.model.cmodel.CArrayType;
import com.here.ivi.api.model.cmodel.CPointerType;
import com.here.ivi.api.model.cmodel.CType;
import org.franca.core.franca.FArgument;
import org.franca.core.franca.FBasicTypeId;
import org.franca.core.franca.FMethod;
import org.franca.core.franca.FTypeRef;

public final class CTypeMapper {

  public static final CType mappedType(final FArgument argument) {
    return mapPredefined(argument.getType());
  }

  public static CType mapPredefined(final FTypeRef type) {
    FBasicTypeId typeId = type.getPredefined();
    switch (typeId.getValue()) {
      case FBasicTypeId.UNDEFINED_VALUE:
        return CType.VOID;
      case FBasicTypeId.INT8_VALUE:
        return CType.INT8;
      case FBasicTypeId.UINT8_VALUE:
        return CType.UINT8;
      case FBasicTypeId.INT16_VALUE:
        return CType.INT16;
      case FBasicTypeId.UINT16_VALUE:
        return CType.UINT16;
      case FBasicTypeId.INT32_VALUE:
        return CType.INT32;
      case FBasicTypeId.UINT32_VALUE:
        return CType.UINT32;
      case FBasicTypeId.INT64_VALUE:
        return CType.INT64;
      case FBasicTypeId.UINT64_VALUE:
        return CType.UINT64;
      case FBasicTypeId.BOOLEAN_VALUE:
        return CType.BOOL;
      case FBasicTypeId.STRING_VALUE:
        return CPointerType.CONST_CHAR_PTR;
      case FBasicTypeId.FLOAT_VALUE:
        return CType.FLOAT;
      case FBasicTypeId.DOUBLE_VALUE:
        return CType.DOUBLE;
      case FBasicTypeId.BYTE_BUFFER_VALUE:
        return new CArrayType(CType.UINT8);
    }
    return CType.VOID;
  }

  public static CType mappedReturnValue(FMethod method) {
    // TODO Wrap multiple return values and/or error code with subsequent version of Hello World milestone
    return method.getOutArgs().stream().findFirst().map(CTypeMapper::mappedType).orElse(CType.VOID);
  }
}
