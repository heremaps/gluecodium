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

package com.here.ivi.api.generator.common.jni;

import com.here.ivi.api.TranspilerExecutionException;
import com.here.ivi.api.generator.common.TemplateEngine;
import com.here.ivi.api.model.javamodel.JavaCustomType;
import com.here.ivi.api.model.javamodel.JavaPrimitiveType;
import com.here.ivi.api.model.javamodel.JavaPrimitiveType.Type;
import com.here.ivi.api.model.javamodel.JavaReferenceType;
import com.here.ivi.api.model.javamodel.JavaType;

public class JniToCppTypeConversionTemplateDelegator {

  public static CharSequence generate(JavaType javaType, String variableName) {

    if (javaType instanceof JavaPrimitiveType) {
      return generate((JavaPrimitiveType) javaType, variableName);
    }
    if (javaType instanceof JavaCustomType) {
      return generate((JavaCustomType) javaType, variableName);
    }
    if (javaType instanceof JavaReferenceType) {
      return generate((JavaReferenceType) javaType, variableName);
    }
    throw new TranspilerExecutionException(
        "conversion from java type to cpp type is not yet supported: " + javaType);
  }

  private static CharSequence generate(JavaPrimitiveType javaType, String variableName) {
    //void type is not allowed as method parameter
    if (JavaPrimitiveType.TYPES.contains(javaType.type) && javaType.type != Type.VOID) {
      //just return java value
      return variableName;
    }
    throw new IllegalArgumentException(
        "Conversion from Java type to cpp type is not possible: " + javaType.getName());
  }

  private static CharSequence generate(JavaCustomType javaType) {
    throw new TranspilerExecutionException(
        "conversion from JavaCustomType to cpp type is not yet supported: " + javaType.getName());
  }

  private static CharSequence generate(JavaReferenceType javaType, String variableName) {
    switch (javaType.type) {
      case STRING:
        return TemplateEngine.render("jni/JniToCppStringConversion", variableName);
      case BYTE_ARRAY:
        return TemplateEngine.render("jni/JniToCppByteBufferConversion", variableName);
    }
    throw new IllegalArgumentException(
        "conversion from java type to cpp type is not supported: " + javaType.getName());
  }
}
