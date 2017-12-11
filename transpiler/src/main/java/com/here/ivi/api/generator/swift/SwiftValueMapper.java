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

import com.here.ivi.api.model.swift.SwiftType;
import com.here.ivi.api.model.swift.SwiftValue;
import org.apache.commons.text.StringEscapeUtils;
import org.franca.core.franca.FExpression;
import org.franca.core.franca.FIntegerConstant;

public final class SwiftValueMapper {

  public static SwiftValue mapExpression(final FExpression expression) {
    if (expression instanceof FIntegerConstant) {
      return new SwiftValue(String.valueOf(((FIntegerConstant) expression).getVal()));
    } else {
      //TODO: APIGEN-494: Update Swift layer iOS generator for HelloWorld-ComplexConstants
      return null;
    }
  }

  public static SwiftValue mapDefaultValue(
      final SwiftType swiftType, final String deploymentDefaultValue) {

    switch (swiftType.category) {
      case BUILTIN_STRING:
        return new SwiftValue("\"" + StringEscapeUtils.escapeJava(deploymentDefaultValue) + "\"");
      case ENUM:
        String enumItemName = SwiftNameRules.getEnumItemName(deploymentDefaultValue);
        return new SwiftValue(swiftType.name + "." + enumItemName);
      default:
        return new SwiftValue(deploymentDefaultValue);
    }
  }
}
