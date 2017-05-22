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
import com.here.ivi.api.generator.common.cpp.templates.CppConstantTemplate;
import com.here.ivi.api.model.DefinedBy;
import com.here.ivi.api.model.Includes;
import com.here.ivi.api.model.cppmodel.CppType;
import com.here.ivi.api.model.cppmodel.CppValue;
import com.here.ivi.api.model.rules.BuiltInValueRules;
import com.here.ivi.api.model.rules.DefaultValuesRules;
import java.math.BigInteger;
import java.util.Optional;
import org.franca.core.franca.*;

public class CppValueMapper {
  public static final CppValue NAN_FLOAT =
      new CppValue("std::numeric_limits< float >::quiet_NaN( )", CppLibraryIncludes.LIMITS);
  public static final CppValue NAN_DOUBLE =
      new CppValue("std::numeric_limits< double >::quiet_NaN( )", CppLibraryIncludes.LIMITS);
  private static final CppValue MAX_FLOAT =
      new CppValue("std::numeric_limits< float >::max( )", CppLibraryIncludes.LIMITS);

  public static CppValue map(CppType type, FInitializerExpression rhs, CppNameRules nameRules) {
    if (rhs instanceof FCompoundInitializer) {
      return map(type, (FCompoundInitializer) rhs, nameRules);
    }
    if (rhs instanceof FQualifiedElementRef) {
      return map(type, (FQualifiedElementRef) rhs, nameRules);
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

    return new CppValue();
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

  public static CppValue map(CppType type, FCompoundInitializer ci, CppNameRules nameRules) {
    // TODO having a template in here is not-so-nice, this should be some CppType
    return new CppValue(
        CppConstantTemplate.generate(type, ci, nameRules).toString(), type.includes);
  }

  // TODO handle namespaces here as well
  public static CppValue map(CppType type, FQualifiedElementRef qer, CppNameRules nameRules) {

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
      name = type.name + "::" + nameRules.getEnumEntryName(name);
    }

    if (DefaultValuesRules.isConstant(qer)) {
      name = nameRules.getConstantName(name);
    }

    // struct default values are just invalid
    if (DefaultValuesRules.isStructDefaultValueConstant(qer)) {
      return new CppValue(null, new Includes.LazyInternalInclude(referenceDefiner, nameRules));
    }

    // TODO add ns resolution for referenced name
    // just use the name of the type and include the defining type
    return new CppValue(name, new Includes.LazyInternalInclude(referenceDefiner, nameRules));
  }
}
