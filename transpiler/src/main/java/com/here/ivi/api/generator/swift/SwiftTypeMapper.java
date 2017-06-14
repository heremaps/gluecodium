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
import org.franca.core.franca.FArgument;
import org.franca.core.franca.FBasicTypeId;
import org.franca.core.franca.FMethod;
import org.franca.core.franca.FTypeRef;

public class SwiftTypeMapper {
  public static SwiftType mappedType(FArgument argument) {
    return mapPredefined(argument.getType());
  }

  public static SwiftType mapPredefined(FTypeRef type) {
    switch (type.getPredefined().getValue()) {
      case FBasicTypeId.STRING_VALUE:
        return new SwiftType("String");
      default:
        return new SwiftType(type.getPredefined().getName());
    }
  }

  public static SwiftType mappedReturnValue(FMethod method) {
    // TODO Wrap multiple return values and/or error code with subsequent version of Hello World milestone
    return method
        .getOutArgs()
        .stream()
        .findFirst()
        .map(SwiftTypeMapper::mappedType)
        .orElse(new SwiftType("void"));
  }
}
