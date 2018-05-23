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

package com.here.genium.generator.java;

import com.here.genium.generator.common.StringValueMapper;
import com.here.genium.model.java.JavaCustomType;
import com.here.genium.model.java.JavaEnumItem;
import com.here.genium.model.java.JavaEnumType;
import com.here.genium.model.java.JavaPrimitiveType;
import com.here.genium.model.java.JavaReferenceType;
import com.here.genium.model.java.JavaTemplateType;
import com.here.genium.model.java.JavaType;
import com.here.genium.model.java.JavaValue;
import java.math.BigInteger;
import java.util.LinkedList;
import java.util.List;
import org.apache.commons.text.StringEscapeUtils;
import org.franca.core.franca.*;

public final class JavaValueMapper {

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

    if (JavaPrimitiveType.FLOAT.equals(javaType)) {
      return new JavaValue(deploymentDefaultValue + "f");
    }
    if (JavaPrimitiveType.LONG.equals(javaType)) {
      return new JavaValue(deploymentDefaultValue + "L");
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
    if (javaType instanceof JavaTemplateType) {
      return new JavaValue(((JavaTemplateType) javaType).implementationType);
    } else if (javaType instanceof JavaEnumType) {
      return new JavaValue(javaType.name + ".values()[0]");
    } else if (javaType instanceof JavaCustomType && !((JavaCustomType) javaType).isInterface) {
      return new JavaValue(javaType);
    }
    return null;
  }

  private static boolean fitsIntoInteger(final BigInteger bigInteger) {
    long longValue = bigInteger.longValue();
    return longValue <= Integer.MAX_VALUE && longValue >= Integer.MIN_VALUE;
  }
}
