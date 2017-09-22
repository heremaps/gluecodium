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

package com.here.ivi.api.generator.cpp;

import com.here.ivi.api.model.cppmodel.CppValue;
import org.franca.core.franca.FBasicTypeId;
import org.franca.core.franca.FField;
import org.franca.core.franca.FTypeRef;

public class CppDefaultInitializer {

  public static CppValue map(FField francaField) {
    // arrays are initialized empty
    if (francaField.isArray()) {
      return null;
    }

    // use default value for type
    return map(francaField.getType());
  }

  public static CppValue map(FTypeRef it) {
    if (it.getDerived() != null) {
      return null;
    }

    switch (it.getPredefined().getValue()) {
      case FBasicTypeId.INT8_VALUE:
      case FBasicTypeId.INT16_VALUE:
      case FBasicTypeId.INT32_VALUE:
      case FBasicTypeId.INT64_VALUE:
      case FBasicTypeId.UINT8_VALUE:
      case FBasicTypeId.UINT16_VALUE:
      case FBasicTypeId.UINT32_VALUE:
      case FBasicTypeId.UINT64_VALUE:
        return new CppValue("0");
      case FBasicTypeId.STRING_VALUE:
        return null;
      case FBasicTypeId.BOOLEAN_VALUE:
        return new CppValue("false");
      case FBasicTypeId.FLOAT_VALUE:
        return CppValueMapper.NAN_FLOAT;
      case FBasicTypeId.DOUBLE_VALUE:
        return CppValueMapper.NAN_DOUBLE;
      case FBasicTypeId.BYTE_BUFFER_VALUE:
        return null;
    }

    return null;
  }
}
