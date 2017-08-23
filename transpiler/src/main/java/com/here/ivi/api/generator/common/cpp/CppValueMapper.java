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

package com.here.ivi.api.generator.common.cpp;

import com.here.ivi.api.TranspilerExecutionException;
import com.here.ivi.api.model.common.LazyInternalInclude;
import com.here.ivi.api.model.cppmodel.CppTypeRef;
import com.here.ivi.api.model.cppmodel.CppValue;
import com.here.ivi.api.model.franca.DefinedBy;
import com.here.ivi.api.model.rules.BuiltInValueRules;
import com.here.ivi.api.model.rules.DefaultValuesRules;
import java.math.BigInteger;
import java.util.Optional;
import org.franca.core.franca.FBooleanConstant;
import org.franca.core.franca.FCompoundInitializer;
import org.franca.core.franca.FDoubleConstant;
import org.franca.core.franca.FFieldInitializer;
import org.franca.core.franca.FFloatConstant;
import org.franca.core.franca.FInitializerExpression;
import org.franca.core.franca.FIntegerConstant;
import org.franca.core.franca.FQualifiedElementRef;
import org.franca.core.franca.FStringConstant;
import org.franca.core.franca.FUnaryOperation;

public class CppValueMapper {
  public static final CppValue NAN_FLOAT =
      new CppValue("std::numeric_limits< float >::quiet_NaN( )", CppLibraryIncludes.LIMITS);
  public static final CppValue NAN_DOUBLE =
      new CppValue("std::numeric_limits< double >::quiet_NaN( )", CppLibraryIncludes.LIMITS);
  private static final CppValue MAX_FLOAT =
      new CppValue("std::numeric_limits< float >::max( )", CppLibraryIncludes.LIMITS);

  public static CppValue map(CppTypeRef type, FInitializerExpression rhs) {
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

  private static CppValue map(FUnaryOperation rhs) {
    CppValue base = map(rhs.getOperand());
    // luckily all the operators look the same as in cpp, still 90% do not make much sense
    return new CppValue(rhs.getOp().getLiteral() + base.name);
  }

  public static CppValue map(FBooleanConstant bc) {
    final String value = bc.isVal() ? "true" : "false";
    return new CppValue(value);
  }

  public static CppValue map(FStringConstant sc) {
    final String value = sc.getVal();
    return new CppValue('"' + value + '"');
  }

  public static CppValue map(FIntegerConstant ic) {
    final BigInteger value = ic.getVal();
    return new CppValue(String.valueOf(value));
  }

  public static CppValue map(FFloatConstant fc) {
    final Float value = fc.getVal();
    return new CppValue(String.valueOf(value) + 'f');
  }

  public static CppValue map(FDoubleConstant dc) {
    final Double value = dc.getVal();
    return new CppValue(String.valueOf(value));
  }

  public static CppValue map(CppTypeRef type, FCompoundInitializer compoundInitializer) {

    // TODO having a multi-line string in here is not-so-nice, this should be some CppType
    StringBuilder builder = new StringBuilder();
    builder.append("[]() {\n  ").append(type.name).append(" tmp;\n");

    for (FFieldInitializer initializer : compoundInitializer.getElements()) {
      builder
          .append("  ")
          .append(initializer.getElement().getName())
          .append(" = ")
          .append(CppValueMapper.map(type, initializer.getValue()).name)
          .append(';');
    }

    builder.append("  return tmp;\n}()");

    return new CppValue(builder.toString(), type.includes);
  }

  // TODO handle namespaces here as well
  public static CppValue map(CppTypeRef type, FQualifiedElementRef qer) {

    if (qer.getElement() == null) {
      // TODO improve error output as seen in TypeMapper
      throw new TranspilerExecutionException(
          String.format("Failed resolving value reference %s.", qer));
    }

    // check for built-in types (atm all values are from <limits>)
    Optional<BuiltInValueRules.BuiltInValues> constant = BuiltInValueRules.resolveReference(qer);
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

    DefinedBy referenceDefiner = DefinedBy.createFromFModelElement(qer.getElement());

    String name = qer.getElement().getName();

    if (DefaultValuesRules.isEnumerator(qer)) {
      //as we don't generate plain enums but enum class, we need to add the enumeration name as well
      name = type.name + "::" + CppNameRules.getEnumEntryName(name);
    }

    if (DefaultValuesRules.isConstant(qer)) {
      name = CppNameRules.getConstantName(name);
    }

    // TODO add ns resolution for referenced name
    // just use the name of the type and include the defining type
    return new CppValue(name, new LazyInternalInclude(referenceDefiner));
  }
}
