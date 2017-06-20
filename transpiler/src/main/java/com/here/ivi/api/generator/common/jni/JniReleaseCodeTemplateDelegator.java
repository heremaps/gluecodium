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
import com.here.ivi.api.generator.common.jni.templates.JniStringReleaseTemplate;
import com.here.ivi.api.model.javamodel.JavaCustomType;
import com.here.ivi.api.model.javamodel.JavaParameter;
import com.here.ivi.api.model.javamodel.JavaPrimitiveType;
import com.here.ivi.api.model.javamodel.JavaReferenceType;

public class JniReleaseCodeTemplateDelegator {

  public CharSequence generate(JavaParameter javaParameter) {

    if (javaParameter.type instanceof JavaPrimitiveType) {
      return ""; //primitive types don't need any releasing
    }
    if (javaParameter.type instanceof JavaCustomType) {
      throw new TranspilerExecutionException(
          "Releasing jni type is not yet supported: " + javaParameter.type);
    }
    if (javaParameter.type instanceof JavaReferenceType) {
      return generate((JavaReferenceType) javaParameter.type, javaParameter.name);
    }
    throw new IllegalArgumentException(
        "Conversion from Java type to Cpp type is not supported: " + javaParameter.type);
  }

  private CharSequence generate(JavaReferenceType javaType, String baseName) {
    switch (javaType.type) {
      case STRING:
        return JniStringReleaseTemplate.generate(baseName);
    }
    throw new IllegalArgumentException(
        "Conversion from Java type to Cpp type is not supported: " + javaType.getName());
  }
}
