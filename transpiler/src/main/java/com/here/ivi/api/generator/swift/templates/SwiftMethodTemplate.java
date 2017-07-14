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

package com.here.ivi.api.generator.swift.templates;

import com.here.ivi.api.generator.common.TemplateEngine;
import com.here.ivi.api.model.swift.SwiftMethod;
import com.here.ivi.api.model.swift.SwiftParameter;
import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;

public class SwiftMethodTemplate {
  private static final String FOUR_SPACES = "    ";

  public static String generate(final SwiftMethod swiftMethod) {

    Function<Void, String> templateToUse =
        (Void) -> {
          switch (swiftMethod.returnType.name) {
            case "Data":
              return "swift/SwiftMethodReturnData";
            case "String":
              return "swift/SwiftMethodReturnString";
            default:
              return "swift/SwiftMethodReturn";
          }
        };

    List<String> param_calls =
        swiftMethod
            .parameters
            .stream()
            .map(
                param -> {
                  if (param.type.name.equals("Data")) {
                    return (param.variableName + "_ptr, Int64(" + param.variableName + ".count)");
                  } else {
                    return param.variableName;
                  }
                })
            .collect(Collectors.toList());

    HashMap<String, Object> returnData = new HashMap<>();
    returnData.put("method", swiftMethod);
    returnData.put("paramsForBase", param_calls);
    String generatedCode = TemplateEngine.render(templateToUse.apply(null), returnData);
    String methodReturnType =
        swiftMethod.returnType.name.equals("Data") ? "Data?" : swiftMethod.returnType.name;

    for (SwiftParameter param : swiftMethod.parameters) {
      if (param.type.name.equals("Data")) {
        HashMap<String, Object> dataWrapObject = new HashMap<>();
        dataWrapObject.put("param_name", param.variableName);
        dataWrapObject.put("return_type", methodReturnType);
        dataWrapObject.put("wrapped_code", indentEachLine(generatedCode, FOUR_SPACES));
        generatedCode = TemplateEngine.render("swift/SwiftMethodWrapData", dataWrapObject);
      }
    }

    HashMap<String, Object> templateObject = new HashMap<>();
    templateObject.put("parameters", swiftMethod.parameters);
    templateObject.put("method_name", swiftMethod.name);
    templateObject.put("is_static", swiftMethod.isStatic);
    templateObject.put("return_type", methodReturnType);
    templateObject.put("innerCode", indentEachLine(generatedCode, FOUR_SPACES));
    return TemplateEngine.render("swift/SwiftMethod", templateObject);
  }

  private static String indentEachLine(final String output, final String indentation) {
    return output.replaceAll("(?m)^", indentation);
  }
}
