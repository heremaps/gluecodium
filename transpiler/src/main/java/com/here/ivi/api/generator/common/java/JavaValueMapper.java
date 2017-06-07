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

package com.here.ivi.api.generator.common.java;

import com.here.ivi.api.model.javamodel.JavaType;
import com.here.ivi.api.model.javamodel.JavaValue;
import java.math.BigInteger;
import org.franca.core.franca.*;

public class JavaValueMapper {
  public static JavaValue map(JavaType type, FInitializerExpression rhs) {
    if (rhs instanceof FCompoundInitializer) {
      return map(type, (FCompoundInitializer) rhs);
    }
    if (rhs instanceof FQualifiedElementRef) {
      return map(type, (FQualifiedElementRef) rhs);
    }

    return map(rhs);
  }

  public static JavaValue map(FInitializerExpression rhs) {
    if (rhs instanceof FBooleanConstant) {
      return map((FBooleanConstant) rhs);
    } else if (rhs instanceof FIntegerConstant) {
      return map((FIntegerConstant) rhs);
    } else if (rhs instanceof FStringConstant) {
      return map((FStringConstant) rhs);
    } else if (rhs instanceof FFloatConstant) {
      return map((FFloatConstant) rhs);
    } else if (rhs instanceof FDoubleConstant) {
      return map((FDoubleConstant) rhs);
    } else if (rhs instanceof FUnaryOperation) {
      return map((FUnaryOperation) rhs);
    }

    return null;
  }

  private static JavaValue map(FUnaryOperation rhs) {
    JavaValue base = map(rhs.getOperand());
    return new JavaValue(rhs.getOp().getLiteral() + base.name);
  }

  public static JavaValue map(FBooleanConstant bc) {
    final String value = bc.isVal() ? "true" : "false";
    return new JavaValue(value);
  }

  public static JavaValue map(FStringConstant sc) {
    final String value = sc.getVal();
    return new JavaValue('"' + value + '"');
  }

  public static JavaValue map(FIntegerConstant ic) {
    final BigInteger value = ic.getVal();
    return new JavaValue(String.valueOf(value));
  }

  public static JavaValue map(FFloatConstant fc) {
    final Float value = fc.getVal();
    return new JavaValue(String.valueOf(value) + 'f');
  }

  public static JavaValue map(FDoubleConstant dc) {
    final Double value = dc.getVal();
    return new JavaValue(String.valueOf(value));
  }
}
