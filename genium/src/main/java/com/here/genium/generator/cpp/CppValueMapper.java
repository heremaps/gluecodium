/*
 * Copyright (C) 2016-2018 HERE Europe B.V.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
 * License-Filename: LICENSE
 */

package com.here.genium.generator.cpp;

import com.here.genium.model.cpp.*;
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
