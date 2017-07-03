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

import com.here.ivi.api.model.javamodel.JavaCustomType;
import com.here.ivi.api.model.javamodel.JavaPrimitiveType;
import com.here.ivi.api.model.javamodel.JavaPrimitiveType.Type;
import com.here.ivi.api.model.javamodel.JavaReferenceType;
import com.here.ivi.api.model.javamodel.JavaType;

public final class JniTypeNameMapper {

  /**
   * Maps from Java types to JNI type names.
   *
   * <p>See https://docs.oracle.com/javase/7/docs/technotes/guides/jni/spec/types.html#wp428
   *
   * @param javaType Java type to convert
   * @return Equivalent JNI type name
   */
  public static String map(final JavaType javaType) {
    if (javaType instanceof JavaCustomType) {
      return "jobject";
    } else if (javaType instanceof JavaReferenceType) {
      JavaReferenceType javaReferenceType = (JavaReferenceType) javaType;
      if (JavaReferenceType.TYPES.contains(javaReferenceType.type)) {
        return map((JavaReferenceType) javaType);
      }
    } else if (javaType instanceof JavaPrimitiveType) {
      JavaPrimitiveType javaPrimitiveType = (JavaPrimitiveType) javaType;
      if (JavaPrimitiveType.TYPES.contains(javaPrimitiveType.type)) {
        if (javaPrimitiveType.type == Type.VOID) {
          return "void";
        }

        return "j" + javaPrimitiveType.type.getValue();
      }
    }
    throw new IllegalArgumentException(
        "mapping from Java type to jni type name is not possible: " + javaType.getName());
  }

  private static String map(final JavaReferenceType refType) {
    if (JavaReferenceType.TYPES.contains(refType.type)) {
      switch (refType.type) {
        case OBJECT:
          return "jobject";
        case CLASS:
          return "jclass";
        case STRING:
          return "jstring";
        case OBJECT_ARRAY:
          return "jobjectArray";
        case BOOLEAN_ARRAY:
          return "jbooleanArray";
        case BYTE_ARRAY:
          return "jbyteArray";
        case CHAR_ARRAY:
          return "jcharArray";
        case SHORT_ARRAY:
          return "jshortArray";
        case INT_ARRAY:
          return "jintArray";
        case LONG_ARRAY:
          return "jlongArray";
        case FLOAT_ARRAY:
          return "jfloatArray";
        case DOUBLE_ARRAY:
          return "jdoubleArray";
        case THROWABLE:
          return "jthrowable";
      }
    }
    throw new IllegalArgumentException(
        "mapping from Java type to jni type name is not possible: " + refType.getName());
  }
}
