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

package com.here.ivi.api.generator.converter.java;

import com.here.ivi.api.model.Includes;
import com.here.ivi.api.model.cppmodel.CppType;
import com.here.ivi.api.model.javamodel.JavaCustomType;
import com.here.ivi.api.model.javamodel.JavaPrimitiveType;
import com.here.ivi.api.model.javamodel.JavaPrimitiveType.Type;
import com.here.ivi.api.model.javamodel.JavaReferenceType;
import com.here.ivi.api.model.javamodel.JavaType;

public final class JavaJniTypeConverter {
  private static final Includes.SystemInclude JNI_INCLUDE = new Includes.SystemInclude("jni.h");

  /**
   * Converts from Java types to JNI types.
   *
   * <p>See https://docs.oracle.com/javase/7/docs/technotes/guides/jni/spec/types.html#wp428
   *
   * @param javaType Java type to convert
   * @return Equivalent JNI type
   */
  public static CppType map(final JavaType javaType) {
    if (javaType instanceof JavaCustomType) {
      return new CppType("jobject", JNI_INCLUDE);
    } else if (javaType instanceof JavaReferenceType) {
      JavaReferenceType javaReferenceType = (JavaReferenceType) javaType;
      if (JavaReferenceType.TYPES.contains(javaReferenceType.type)) {
        switch (javaReferenceType.type) {
          case OBJECT:
            return new CppType("jobject", JNI_INCLUDE);
          case CLASS:
            return new CppType("jclass", JNI_INCLUDE);
          case STRING:
            return new CppType("jstring", JNI_INCLUDE);
          case OBJECT_ARRAY:
            return new CppType("jobjectArray", JNI_INCLUDE);
          case BOOLEAN_ARRAY:
            return new CppType("jbooleanArray", JNI_INCLUDE);
          case BYTE_ARRAY:
            return new CppType("jbyteArray", JNI_INCLUDE);
          case CHAR_ARRAY:
            return new CppType("jcharArray", JNI_INCLUDE);
          case SHORT_ARRAY:
            return new CppType("jshortArray", JNI_INCLUDE);
          case INT_ARRAY:
            return new CppType("jintArray", JNI_INCLUDE);
          case LONG_ARRAY:
            return new CppType("jlongArray", JNI_INCLUDE);
          case FLOAT_ARRAY:
            return new CppType("jfloatArray", JNI_INCLUDE);
          case DOUBLE_ARRAY:
            return new CppType("jdoubleArray", JNI_INCLUDE);
          case THROWABLE:
            return new CppType("jthrowable", JNI_INCLUDE);
        }
      }
    } else if (javaType instanceof JavaPrimitiveType) {
      JavaPrimitiveType javaPrimitiveType = (JavaPrimitiveType) javaType;
      if (JavaPrimitiveType.TYPES.contains(javaPrimitiveType.type)) {
        if (javaPrimitiveType.type == Type.VOID) {
          return CppType.VOID;
        }

        return new CppType("j" + javaPrimitiveType.type.getValue(), JNI_INCLUDE);
      }
    }

    throw new IllegalArgumentException(
        "Conversion from Java type to JNI type is not possible: " + javaType.getName());
  }
}
