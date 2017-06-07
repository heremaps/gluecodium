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
import com.here.ivi.api.model.javamodel.JavaPrimitiveType;
import com.here.ivi.api.model.javamodel.JavaType;

public class JavaJniTypeConverter {

  public static final Includes.SystemInclude JNI_INCLUDE = new Includes.SystemInclude("jni.h");

  public static CppType convertToJniType(JavaType javaType) {

    if (javaType instanceof JavaPrimitiveType) {
      JavaPrimitiveType primitiveType = (JavaPrimitiveType) javaType;
      switch (primitiveType.type) {
        case BOOL:
        case BYTE:
        case CHAR:
        case DOUBLE:
        case FLOAT:
        case INT:
        case LONG:
        case SHORT:
          return new CppType("j" + primitiveType.type.getValue(), JNI_INCLUDE);
          // void types can't be converted
        default:
          throw new IllegalArgumentException(
              "conversion from java type to jni type is not possible: "
                  + primitiveType.type.getValue());
      }
    } else if (javaType.getName().equals("String")) {
      return new CppType("jstring", JNI_INCLUDE);
    }
    return new CppType("jobject", JNI_INCLUDE);
  }
}
