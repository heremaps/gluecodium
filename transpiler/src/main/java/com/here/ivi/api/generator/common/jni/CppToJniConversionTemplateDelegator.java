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

import com.here.ivi.api.generator.common.TemplateEngine;
import com.here.ivi.api.generator.common.jni.templates.CppToJniStringConversionTemplate;
import com.here.ivi.api.model.javamodel.JavaPrimitiveType;
import com.here.ivi.api.model.javamodel.JavaReferenceType;
import com.here.ivi.api.model.javamodel.JavaType;

public class CppToJniConversionTemplateDelegator {

  public static CharSequence generate(final String cppVariableName, final JavaType targetType) {

    if (targetType instanceof JavaPrimitiveType) {
      return generate(cppVariableName, (JavaPrimitiveType) targetType);
    }
    if (targetType instanceof JavaReferenceType) {
      return generate(cppVariableName, (JavaReferenceType) targetType);
    }
    //unsupported types
    throw new IllegalArgumentException("unsupported conversion to type" + targetType.getName());
  }

  private static CharSequence generate(
      final String cppVariableName, final JavaReferenceType targetType) {
    switch (targetType.type) {
      case STRING:
        return CppToJniStringConversionTemplate.generate(cppVariableName);
      case BYTE_ARRAY:
        return TemplateEngine.render("jni/CppToJniByteBufferConversion", cppVariableName);
    }
    throw new IllegalArgumentException(
        "conversion to reference type is impossible: " + targetType.type);
  }

  private static CharSequence generate(
      final String cppVariableName, final JavaPrimitiveType targetType) {

    if (JavaPrimitiveType.TYPES.contains(targetType.type)
        && targetType.type != JavaPrimitiveType.Type.VOID) {
      //no conversion of primitive types
      return cppVariableName;
    }
    throw new IllegalArgumentException(
        "conversion to primitive type is not supported: " + targetType.type);
  }
}
