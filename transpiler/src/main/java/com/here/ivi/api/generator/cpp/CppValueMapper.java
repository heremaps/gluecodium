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

import com.google.common.annotations.VisibleForTesting;
import com.here.ivi.api.model.common.BuiltInValueRules;
import com.here.ivi.api.model.cpp.*;
import java.math.BigInteger;
import java.util.Optional;
import org.apache.commons.text.StringEscapeUtils;
import org.franca.core.franca.*;

public class CppValueMapper {

  public static final CppValue NAN_FLOAT =
      new CppValue("std::numeric_limits< float >::quiet_NaN( )", CppLibraryIncludes.LIMITS);
  public static final CppValue NAN_DOUBLE =
      new CppValue("std::numeric_limits< double >::quiet_NaN( )", CppLibraryIncludes.LIMITS);
  private static final CppValue MAX_FLOAT =
      new CppValue("std::numeric_limits< float >::max( )", CppLibraryIncludes.LIMITS);

  private final CppIncludeResolver includeResolver;

  public CppValueMapper(final CppIncludeResolver includeResolver) {
    this.includeResolver = includeResolver;
  }

  public CppValue map(CppTypeRef type, FInitializerExpression rhs) {
    if (rhs instanceof FCompoundInitializer) {
      return map(type, (FCompoundInitializer) rhs);
    }
    if (rhs instanceof FQualifiedElementRef) {
      return map(type, (FQualifiedElementRef) rhs);
    }

    return map(rhs);
  }

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

  private CppValue map(CppTypeRef type, FCompoundInitializer compoundInitializer) {

    // TODO: APIGEN-478 revert this to unsupported state when implementing BaseConstants
    StringBuilder builder = new StringBuilder();
    builder.append("[]() {\n  ").append(type.name).append(" tmp;\n");

    for (FFieldInitializer initializer : compoundInitializer.getElements()) {
      builder
          .append("  ")
          .append(initializer.getElement().getName())
          .append(" = ")
          .append(map(type, initializer.getValue()).name)
          .append(';');
    }

    builder.append("  return tmp;\n}()");

    return new CppValue(builder.toString(), type.includes);
  }

  // TODO: APIGEN-478 handle namespaces here as well
  @VisibleForTesting
  CppValue map(final CppTypeRef cppTypeRef, final FQualifiedElementRef francaQualifiedElementRef) {

    // check for built-in types (atm all values are from <limits>)
    Optional<BuiltInValueRules.BuiltInValues> constant =
        BuiltInValueRules.resolveReference(francaQualifiedElementRef);
    if (constant.isPresent()) {
      switch (constant.get()) {
        case FloatMax:
          return MAX_FLOAT;
        case FloatNan:
          return NAN_FLOAT;
        case DoubleNan:
          return NAN_DOUBLE;
      }
    }

    String name = francaQualifiedElementRef.getElement().getName();

    if (francaQualifiedElementRef.getElement() instanceof FEnumerator) {
      //as we don't generate plain enums but enum class, we need to add the enumeration name as well
      name = cppTypeRef.name + "::" + CppNameRules.getEnumEntryName(name);
    }

    if (francaQualifiedElementRef.getElement() instanceof FConstantDef) {
      name = CppNameRules.getConstantName(name);
    }

    // TODO: APIGEN-478 add ns resolution for referenced name
    // just use the name of the type and include the defining type
    return new CppValue(
        name, includeResolver.resolveInclude(francaQualifiedElementRef.getElement()));
  }
}
