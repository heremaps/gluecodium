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

import static java.util.Collections.emptyList;

import com.here.ivi.api.model.cmodel.CParameter;
import com.here.ivi.api.model.cmodel.CType;
import com.here.ivi.api.model.common.Include;
import java.util.Arrays;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

public class TypeConverter {
  public static class TypeConversion {

    public final String name;
    public final String expression;
    public final Set<Include> includes;

    public TypeConversion(String name, String expression, Include... includes) {
      this.name = "cpp_" + name;
      this.expression = expression;
      this.includes = new LinkedHashSet<>(Arrays.asList(includes));
    }

    TypeConversion(String name, String expression, List<Include> includes) {
      this.name = "cpp_" + name;
      this.expression = expression;
      this.includes = new LinkedHashSet<>(includes);
    }

    public TypeConversion(String name) {
      this(name, "cpp_" + name);
    }
  }

  public static TypeConversion identity(CParameter param) {
    return new TypeConverter.TypeConversion(param.name, param.name, emptyList());
  }

  public static TypeConversion createParamConversionRoutine(
      String paramName, List<CParameter> cParams, CppTypeInfo baseApiType) {
    return new TypeConversion(
        paramName,
        String.format(
            baseApiType.constructFromCExpr, cParams.stream().map(param -> param.name).toArray()),
        baseApiType.conversionToCppIncludes);
  }

  public static TypeConversion createReturnValueConversionRoutine(
      String conversionName, CppTypeInfo baseApiType) {

    if (baseApiType.functionReturnType.equals(CType.VOID)) {
      return null;
    } else {
      return new TypeConversion(
          conversionName,
          String.format(baseApiType.returnValueConstrExpr, "cpp_result"),
          baseApiType.conversionFromCppIncludes);
    }
  }
}
