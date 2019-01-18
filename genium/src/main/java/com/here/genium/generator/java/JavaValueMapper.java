/*
 * Copyright (C) 2016-2019 HERE Europe B.V.
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

package com.here.genium.generator.java;

import com.here.genium.generator.common.StringValueMapper;
import com.here.genium.model.java.JavaCustomType;
import com.here.genium.model.java.JavaEnumItem;
import com.here.genium.model.java.JavaEnumType;
import com.here.genium.model.java.JavaPrimitiveType;
import com.here.genium.model.java.JavaReferenceType;
import com.here.genium.model.java.JavaReferenceType.Type;
import com.here.genium.model.java.JavaTemplateType;
import com.here.genium.model.java.JavaType;
import com.here.genium.model.java.JavaValue;
import java.math.BigInteger;
import java.util.LinkedList;
import java.util.List;
import org.apache.commons.text.StringEscapeUtils;
import org.franca.core.franca.*;

public final class JavaValueMapper {

  private static final JavaValue FLOAT_NAN = new JavaValue("Float.NaN");
  private static final JavaValue FLOAT_INFINITY = new JavaValue("Float.POSITIVE_INFINITY");
  private static final JavaValue FLOAT_NEGATIVE_INFINITY = new JavaValue("Float.NEGATIVE_INFINITY");
  private static final JavaValue DOUBLE_NAN = new JavaValue("Double.NaN");
  private static final JavaValue DOUBLE_INFINITY = new JavaValue("Double.POSITIVE_INFINITY");
  private static final JavaValue DOUBLE_NEGATIVE_INFINITY =
      new JavaValue("Double.NEGATIVE_INFINITY");

  public static void completePartialEnumeratorValues(List<JavaEnumItem> javaEnumItems) {

    int lastValue = 0;
    for (JavaEnumItem e : javaEnumItems) {
      if (e.value == null) {
        e.value = new JavaValue(String.valueOf(lastValue));
      } else {
        lastValue = Integer.parseInt(e.value.name);
      }
      lastValue++;
    }
  }

  public static JavaValue map(final FInitializerExpression francaExpression) {

    if (francaExpression instanceof FConstant || francaExpression instanceof FUnaryOperation) {
      String stringValue = StringValueMapper.map(francaExpression);
      if (stringValue == null) {
        return null;
      }

      String suffix = "";
      if (francaExpression instanceof FFloatConstant) {
        suffix = "f";
      } else if (francaExpression instanceof FIntegerConstant
          && !fitsIntoInteger(((FIntegerConstant) francaExpression).getVal())) {
        suffix = "L";
      }

      return new JavaValue(stringValue + suffix);
    } else if (francaExpression instanceof FQualifiedElementRef) {
      return map((FQualifiedElementRef) francaExpression);
    }

    return null;
  }

  private static JavaValue map(final FQualifiedElementRef francaElementRef) {

    FEvaluableElement value = francaElementRef.getElement();
    if (!(value instanceof FEnumerator)) {
      return null;
    }

    LinkedList<String> names = new LinkedList<>();
    names.add(JavaNameRules.getConstantName(value.getName()));
    FEnumerationType enumerationType = (FEnumerationType) value.eContainer();
    names.addFirst(JavaNameRules.getClassName(enumerationType.getName()));
    FTypeCollection typeCollection = (FTypeCollection) enumerationType.eContainer();
    if (typeCollection instanceof FInterface) {
      names.addFirst(JavaNameRules.getClassName(typeCollection.getName()));
    }

    return new JavaValue(String.join(".", names));
  }

  public static JavaValue mapDefaultValue(
      final JavaType javaType, final String deploymentDefaultValue) {

    if (javaType instanceof JavaPrimitiveType) {
      return mapPrimitiveTypeDefaultValue((JavaPrimitiveType) javaType, deploymentDefaultValue);
    }
    if (javaType instanceof JavaReferenceType
        && ((JavaReferenceType) javaType).type == JavaReferenceType.Type.STRING) {
      return new JavaValue("\"" + StringEscapeUtils.escapeJava(deploymentDefaultValue) + "\"");
    }
    if (javaType instanceof JavaEnumType) {
      String enumeratorName = JavaNameRules.getConstantName(deploymentDefaultValue);
      return new JavaValue(javaType.name + "." + enumeratorName);
    }

    return new JavaValue(deploymentDefaultValue);
  }

  public static JavaValue mapDefaultValue(final JavaType javaType) {

    if (javaType == null) {
      return null;
    }
    if (javaType instanceof JavaTemplateType) {
      return new JavaValue(((JavaTemplateType) javaType).implementationType);
    }
    if (javaType instanceof JavaEnumType) {
      return new JavaValue(javaType.name + ".values()[0]");
    }
    if (javaType instanceof JavaCustomType && !((JavaCustomType) javaType).isInterface) {
      return new JavaValue(javaType);
    }
    if (javaType instanceof JavaReferenceType
        && ((JavaReferenceType) javaType).type == Type.STRING) {
      return new JavaValue("\"\"");
    }
    if (JavaPrimitiveType.BOOL.equals(javaType)) {
      return new JavaValue("false");
    }
    if (javaType instanceof JavaPrimitiveType) {
      return new JavaValue(decorateLiteralValue((JavaPrimitiveType) javaType, "0"));
    }

    return new JavaValue("(" + javaType.name + ")null");
  }

  private static boolean fitsIntoInteger(final BigInteger bigInteger) {
    long longValue = bigInteger.longValue();
    return longValue <= Integer.MAX_VALUE && longValue >= Integer.MIN_VALUE;
  }

  private static String decorateLiteralValue(
      final JavaPrimitiveType javaType, final String defaultValue) {

    StringBuilder literal = new StringBuilder();

    if (JavaPrimitiveType.BYTE.equals(javaType)) {
      literal.append("(byte)");
    } else if (JavaPrimitiveType.SHORT.equals(javaType)) {
      literal.append("(short)");
    }

    literal.append(defaultValue);

    if (JavaPrimitiveType.FLOAT.equals(javaType)) {
      literal.append('f');
    } else if (JavaPrimitiveType.LONG.equals(javaType)) {
      literal.append('L');
    }

    return literal.toString();
  }

  private static JavaValue mapPrimitiveTypeDefaultValue(
      final JavaPrimitiveType javaType, final String deploymentDefaultValue) {

    if (JavaPrimitiveType.FLOAT.equals(javaType)) {
      Float parsedFloat = Float.parseFloat(deploymentDefaultValue);
      if (parsedFloat.isNaN()) {
        return FLOAT_NAN;
      } else if (parsedFloat.isInfinite()) {
        return parsedFloat > 0 ? FLOAT_INFINITY : FLOAT_NEGATIVE_INFINITY;
      }
    } else if (JavaPrimitiveType.DOUBLE.equals(javaType)) {
      Double parsedDouble = Double.parseDouble(deploymentDefaultValue);
      if (parsedDouble.isNaN()) {
        return DOUBLE_NAN;
      } else if (parsedDouble.isInfinite()) {
        return parsedDouble > 0 ? DOUBLE_INFINITY : DOUBLE_NEGATIVE_INFINITY;
      }
    }

    return new JavaValue(decorateLiteralValue(javaType, deploymentDefaultValue));
  }
}
