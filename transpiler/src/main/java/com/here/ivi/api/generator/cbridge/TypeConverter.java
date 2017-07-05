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
import static java.util.stream.Collectors.toList;

import com.here.ivi.api.model.cmodel.CParameter;
import com.here.ivi.api.model.common.Includes;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.IntStream;

public class TypeConverter {
  public static class TypeConversion {

    public final String name;
    public final String expression;
    public final Set<Includes.Include> includes;

    TypeConversion(String name, String expression, Includes.Include... includes) {
      this.name = "cpp_" + name;
      this.expression = expression;
      this.includes = new HashSet<>(Arrays.asList(includes));
    }

    TypeConversion(String name, String expression, List<Includes.Include> includes) {
      this.name = "cpp_" + name;
      this.expression = expression;
      this.includes = new HashSet<>(includes);
    }

    public TypeConversion(String name) {
      this(name, "cpp_" + name);
    }
  }

  static TypeConversion reinterpretCast(CParameter param, String targetType) {
    return new TypeConverter.TypeConversion(
        param.name, String.format("reinterpret_cast<%1$s*>(%2$s)", targetType, param.name));
  }

  public static TypeConversion identity(CParameter param) {
    return new TypeConverter.TypeConversion(param.name, param.name, emptyList());
  }

  public static List<String> paramNames(String baseName, int numberOfParams) {
    return IntStream.range(0, numberOfParams)
        .boxed()
        .map(
            index -> {
              if (index == 0) {
                return baseName;
              } else {
                return baseName + '_' + index;
              }
            })
        .collect(toList());
  }

  public static TypeConversion createParamConversionRoutine(
      String paramName, CppTypeInfo baseApiType) {
    List<String> names = paramNames(paramName, baseApiType.cTypesNeededByConstructor.size());
    return new TypeConversion(
        paramName,
        String.format(baseApiType.constructFromCExpr, names.toArray()),
        baseApiType.baseTypeIncludes);
  }

  static TypeConversion createReturnValueConversionRoutine(CppTypeInfo baseApiType) {

    if ("void".equals(baseApiType.baseType)) {
      return null;
    } else {
      return new TypeConversion(
          "result",
          String.format(baseApiType.returnValueConstrExpr, "cpp_result"),
          baseApiType.returnConversionIncludes);
    }
  }
}
