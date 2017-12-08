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

package com.here.ivi.api.generator.java;

import com.here.ivi.api.model.javamodel.JavaCustomType;
import com.here.ivi.api.model.javamodel.JavaEnumItem;
import com.here.ivi.api.model.javamodel.JavaEnumType;
import com.here.ivi.api.model.javamodel.JavaReferenceType;
import com.here.ivi.api.model.javamodel.JavaTemplateType;
import com.here.ivi.api.model.javamodel.JavaType;
import com.here.ivi.api.model.javamodel.JavaValue;
import java.math.BigInteger;
import java.util.List;
import org.apache.commons.text.StringEscapeUtils;
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

  public static JavaValue createEnumInitializerValue(
      String enumTypeName, FEnumerationType enumType) {
    List<FEnumerator> enumerators = enumType.getEnumerators();
    String initializer;
    if (enumerators.isEmpty()) {
      initializer = "null";
    } else {
      initializer =
          enumTypeName + "." + JavaNameRules.getConstantName(enumerators.get(0).getName());
    }

    return new JavaValue(initializer);
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

  public static JavaValue mapDefaultValue(
      final JavaType javaType, final String deploymentDefaultValue) {

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
      return ((JavaEnumType) javaType).initializer;
    } else if (javaType instanceof JavaCustomType && !((JavaCustomType) javaType).isNullable) {
      return new JavaValue(javaType);
    }
    return null;
  }

  @SuppressWarnings("PMD.UnusedFormalParameter")
  private static JavaValue map(JavaType type, FCompoundInitializer rhs) {
    // TODO APIGEN-218 handle this case
    return new JavaValue("TODO");
  }

  @SuppressWarnings("PMD.UnusedFormalParameter")
  private static JavaValue map(JavaType type, FQualifiedElementRef rhs) {
    // TODO APIGEN-218 handle this case
    return new JavaValue("TODO");
  }
}
