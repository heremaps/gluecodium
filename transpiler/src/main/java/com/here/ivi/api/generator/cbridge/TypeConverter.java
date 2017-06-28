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

import com.here.ivi.api.model.cmodel.CParameter;
import com.here.ivi.api.model.cmodel.CPointerType;
import com.here.ivi.api.model.cmodel.CType;
import com.here.ivi.api.model.common.Includes;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

public class TypeConverter {
  public static class TypeConversion {
    public final String name;
    public final String expression;
    public final Set<Includes.Include> includes;

    TypeConversion(String name, String expression, Includes.Include... includes) {
      this.name = name;
      this.expression = String.format(expression, name);
      this.includes = new HashSet<>(Arrays.asList(includes));
    }

    TypeConversion(String name) {
      this.name = name;
      this.expression = name;
      this.includes = new HashSet<>();
    }
  }

  public static TypeConversion createParamConversionRoutine(CParameter param) {
    if (CPointerType.CONST_CHAR_PTR.equals(param.type)) {
      return new TypeConversion(
          param.name, "std::string(%s)", new Includes.SystemInclude("string"));
    } else {
      return new TypeConversion(param.name);
    }
  }

  public static TypeConversion createReturnValueConversionRoutine(CType returnType) {
    if (CPointerType.CONST_CHAR_PTR.equals(returnType)) {
      return new TypeConversion(
          "result", "strdup(%s.c_str())", new Includes.SystemInclude("string.h"));
    } else if (CType.VOID.equals(returnType)) {
      return null;
    } else {
      return new TypeConversion("result");
    }
  }
}
