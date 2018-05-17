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
import java.util.List;
import org.apache.commons.text.StringEscapeUtils;
import org.franca.core.franca.*;

public final class JavaValueMapper {

  public static JavaValue map(JavaType type, FInitializerExpression rhs) {
    if (rhs instanceof FCompoundInitializer) {
      return map(type, (FCompoundInitializer) rhs);
    }
    if (rhs instanceof FQualifiedElementRef) {
      return map(type, (FQualifiedElementRef) rhs);
    }

    return map(rhs);
  }

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
      return stringValue != null ? new JavaValue(stringValue) : null;
    }

    return null;
  }

  public static JavaValue mapDefaultValue(
      final JavaType javaType, final String deploymentDefaultValue) {

    if (JavaPrimitiveType.FLOAT.equals(javaType)) {
      return new JavaValue(deploymentDefaultValue + "f");
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

  @SuppressWarnings("PMD.UnusedFormalParameter")
  private static JavaValue map(JavaType type, FCompoundInitializer rhs) {
    // TODO APIGEN-484 handle this case
    return new JavaValue("TODO");
  }

  @SuppressWarnings("PMD.UnusedFormalParameter")
  private static JavaValue map(JavaType type, FQualifiedElementRef rhs) {
    // TODO APIGEN-484 handle this case
    return new JavaValue("TODO");
  }
}
