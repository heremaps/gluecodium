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

import com.here.ivi.api.model.cpp.*;
import java.math.BigInteger;
import org.apache.commons.text.StringEscapeUtils;
import org.franca.core.franca.*;

public final class CppValueMapper {

  public static CppValue map(FInitializerExpression rhs) {
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

  public static CppValue mapDeploymentDefaultValue(
      final CppTypeRef cppTypeRef, final String deploymentDefaultValue) {

    if (cppTypeRef == CppTypeMapper.STRING_TYPE) {
      return new CppValue("\"" + StringEscapeUtils.escapeJava(deploymentDefaultValue) + "\"");
    } else if (cppTypeRef.refersToEnumType()) {
      String enumEntryName = CppNameRules.getEnumEntryName(deploymentDefaultValue);
      return new CppValue(cppTypeRef.name + "::" + enumEntryName);
    } else {
      return new CppValue(deploymentDefaultValue);
    }
  }

  private static CppValue map(FUnaryOperation rhs) {
    CppValue base = map(rhs.getOperand());
    // luckily all the operators look the same as in cpp, still 90% do not make much sense
    return new CppValue(rhs.getOp().getLiteral() + base.name);
  }

  private static CppValue map(FBooleanConstant bc) {
    final String value = bc.isVal() ? "true" : "false";
    return new CppValue(value);
  }

  private static CppValue map(FStringConstant sc) {
    final String value = sc.getVal();
    return new CppValue('"' + value + '"');
  }

  private static CppValue map(FIntegerConstant ic) {
    final BigInteger value = ic.getVal();
    return new CppValue(String.valueOf(value));
  }

  private static CppValue map(FFloatConstant fc) {
    final Float value = fc.getVal();
    return new CppValue(String.valueOf(value) + 'f');
  }

  private static CppValue map(FDoubleConstant dc) {
    final Double value = dc.getVal();
    return new CppValue(String.valueOf(value));
  }
}
