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
import com.here.ivi.api.generator.common.jni.templates.JniToCppStringConversionTemplate;
import com.here.ivi.api.model.javamodel.JavaCustomType;
import com.here.ivi.api.model.javamodel.JavaPrimitiveType;
import com.here.ivi.api.model.javamodel.JavaPrimitiveType.Type;
import com.here.ivi.api.model.javamodel.JavaReferenceType;
import com.here.ivi.api.model.javamodel.JavaType;

public class JniToCppTypeConversionTemplateDelegator {

  public static CharSequence generate(JavaType javaType, String baseName) {

    if (javaType instanceof JavaPrimitiveType) {
      return generate((JavaPrimitiveType) javaType, baseName);
    }
    if (javaType instanceof JavaCustomType) {
      return generate((JavaCustomType) javaType, baseName);
    }
    if (javaType instanceof JavaReferenceType) {
      return generate((JavaReferenceType) javaType, baseName);
    }
    throw new TranspilerExecutionException(
        "conversion from java type to cpp type is not yet supported: " + javaType);
  }

  private static CharSequence generate(JavaPrimitiveType javaType, String baseName) {
    //void type is not allowed as method parameter
    if (JavaPrimitiveType.TYPES.contains(javaType.type) && javaType.type != Type.VOID) {
      //just return java value
      return JniNameRules.getParameterName(baseName);
    }
    throw new IllegalArgumentException(
        "Conversion from Java type to cpp type is not possible: " + javaType.getName());
  }

  private static CharSequence generate(JavaCustomType javaType) {
    throw new TranspilerExecutionException(
        "conversion from JavaCustomType to cpp type is not yet supported: " + javaType.getName());
  }

  private static CharSequence generate(JavaReferenceType javaType, String baseName) {
    switch (javaType.type) {
      case STRING:
        return JniToCppStringConversionTemplate.generate(baseName);
      case BYTE_ARRAY:
        //for compatibility reasons (JniNameRules haven't been converted to mustache yet)
        //it is required to call JniNameRules.getParameter(..) here
        return TemplateEngine.render(
            "jni/JniToCppByteBufferConversion", JniNameRules.getParameterName(baseName));
    }
    throw new IllegalArgumentException(
        "conversion from java type to cpp type is not supported: " + javaType.getName());
  }
}
