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

package com.here.ivi.api.model.jni;

import com.here.ivi.api.generator.jni.JniTypeNameMapper;
import com.here.ivi.api.model.cppmodel.CppTypeRef;
import com.here.ivi.api.model.javamodel.JavaPrimitiveType;
import com.here.ivi.api.model.javamodel.JavaType;

public final class JniType implements JniElement {

  public final String name;
  public final String cppName;
  public final String javaName;
  public final boolean isInstance;

  public final boolean isComplex;

  public static JniType createType(final JavaType javaType, final CppTypeRef cppType) {
    return createType(javaType, cppType, false);
  }

  public static JniType createType(
      final JavaType javaType, final CppTypeRef cppType, boolean isInstance) {
    if (javaType instanceof JavaPrimitiveType
        && ((JavaPrimitiveType) javaType).type == JavaPrimitiveType.Type.VOID) {
      return null;
    }
    return new JniType(javaType, cppType, isInstance);
  }

  private JniType(final JavaType javaType, final CppTypeRef cppType, boolean isInstance) {

    this.name = JniTypeNameMapper.map(javaType);
    this.cppName = cppType.name;
    this.javaName = javaType.name;
    this.isComplex = !(javaType instanceof JavaPrimitiveType);
    this.isInstance = isInstance;
  }
}
