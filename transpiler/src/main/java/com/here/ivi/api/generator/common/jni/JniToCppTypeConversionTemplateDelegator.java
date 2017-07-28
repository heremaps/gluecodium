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
import java.util.HashMap;
import java.util.Map;

public class JniToCppTypeConversionTemplateDelegator {

  public static final String CPP_VARIABLE_NAME = "cppVariableName";
  public static final String JNI_VARIABLE_NAME = "jniVariableName";

  public static CharSequence generate(
      final JavaType javaType, final String jniVariableName, final String cppVariableName) {

    Map<String, String> variableNames = new HashMap<>();
    variableNames.put(JNI_VARIABLE_NAME, jniVariableName);
    variableNames.put(CPP_VARIABLE_NAME, cppVariableName);

    if (javaType instanceof JavaPrimitiveType
        && JavaPrimitiveType.TYPES.contains(((JavaPrimitiveType) javaType).type)
        && ((JavaPrimitiveType) javaType).type != Type.VOID) {
      return TemplateEngine.render("jni/JniToCppPrimitiveTypeConversion", variableNames);
    }
    if (javaType instanceof JavaCustomType || javaType instanceof JavaReferenceType) {
      return TemplateEngine.render("jni/JniToCppNonPrimitiveTypeConversion", variableNames);
    }
    throw new TranspilerExecutionException(
        "conversion from java type to cpp type is not yet supported: " + javaType);
  }
}
