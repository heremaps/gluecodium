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
        return new CType("int8_t");
      case FBasicTypeId.UINT8_VALUE:
        return new CType("uint8_t");
      case FBasicTypeId.INT16_VALUE:
        return new CType("int16_t");
      case FBasicTypeId.UINT16_VALUE:
        return new CType("uint16_t");
      case FBasicTypeId.INT32_VALUE:
        return new CType("int32_t");
      case FBasicTypeId.UINT32_VALUE:
        return new CType("uint32_t");
      case FBasicTypeId.INT64_VALUE:
        return new CType("int64_t");
      case FBasicTypeId.UINT64_VALUE:
        return new CType("uint64_t");
      case FBasicTypeId.BOOLEAN_VALUE:
        return new CType("bool");
      case FBasicTypeId.STRING_VALUE:
        CType stringType = new CPointerType("char");
        stringType.isConst = true;
        return stringType;
      case FBasicTypeId.FLOAT_VALUE:
        return new CType("float");
      case FBasicTypeId.DOUBLE_VALUE:
        return new CType("double");
      case FBasicTypeId.BYTE_BUFFER_VALUE:
        return new CArrayType("uint8_t");
    }
    return CType.VOID;
  }

  public static CType mappedReturnValue(FMethod method) {
    // TODO Wrap multiple return values and/or error code with subsequent version of Hello World milestone
    return method.getOutArgs().stream().findFirst().map(CTypeMapper::mappedType).orElse(CType.VOID);
  }
}
