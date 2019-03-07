/*
 * Copyright (C) 2016-2019 HERE Europe B.V.
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

package com.here.genium.generator.jni;

import com.here.genium.model.java.*;
import com.here.genium.model.java.JavaPrimitiveType.Type;

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
      return map((JavaReferenceType) javaType);
    } else if (javaType instanceof JavaArrayType) {
      return map((JavaArrayType) javaType);
    } else if (javaType instanceof JavaPrimitiveType) {
      JavaPrimitiveType javaPrimitiveType = (JavaPrimitiveType) javaType;
      if (JavaPrimitiveType.TYPES.contains(javaPrimitiveType.type)) {
        return javaPrimitiveType.type != Type.VOID
            ? "j" + javaPrimitiveType.type.getValue()
            : "void";
      }
    }
    throw new IllegalArgumentException(
        "mapping from Java type to jni type name is not possible: " + javaType.name);
  }

  private static String map(final JavaReferenceType refType) {
    switch (refType.type) {
      case CLASS:
        return "jclass";
      case STRING:
        return "jstring";
      case THROWABLE:
        return "jthrowable";
      case OBJECT:
      case BOOL:
      case BYTE:
      case CHAR:
      case SHORT:
      case INT:
      case LONG:
      case FLOAT:
      case DOUBLE:
        return "jobject";
      default:
        throw new IllegalArgumentException(
            "mapping from Java type to jni type name is not possible: " + refType.name);
    }
  }

  private static String map(final JavaArrayType refType) {
    switch (refType.type) {
      case BOOL:
        return "jbooleanArray";
      case BYTE:
        return "jbyteArray";
      case CHAR:
        return "jcharArray";
      case SHORT:
        return "jshortArray";
      case INT:
        return "jintArray";
      case LONG:
        return "jlongArray";
      case FLOAT:
        return "jfloatArray";
      case DOUBLE:
        return "jdoubleArray";
      default:
        throw new IllegalArgumentException(
            "mapping from Java type to jni type name is not possible: " + refType.name);
    }
  }
}
