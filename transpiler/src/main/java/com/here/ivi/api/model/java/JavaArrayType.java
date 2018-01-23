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

package com.here.ivi.api.model.java;

import static com.here.ivi.api.model.java.JavaPrimitiveType.Type;

import java.util.stream.Stream;

public final class JavaArrayType extends JavaType {

  public static final JavaArrayType BYTE_ARRAY = new JavaArrayType(Type.BYTE);
  public static final JavaArrayType SHORT_ARRAY = new JavaArrayType(Type.SHORT);
  public static final JavaArrayType INT_ARRAY = new JavaArrayType(Type.INT);
  public static final JavaArrayType LONG_ARRAY = new JavaArrayType(Type.LONG);
  public static final JavaArrayType FLOAT_ARRAY = new JavaArrayType(Type.FLOAT);
  public static final JavaArrayType DOUBLE_ARRAY = new JavaArrayType(Type.DOUBLE);
  public static final JavaArrayType BOOL_ARRAY = new JavaArrayType(Type.BOOL);
  public static final JavaArrayType CHAR_ARRAY = new JavaArrayType(Type.CHAR);

  public final Type type;

  public JavaArrayType(final Type type) {
    super(type.getValue() + "[]");
    this.type = type;
  }

  @Override
  public Stream<JavaElement> stream() {
    return Stream.empty();
  }

  @Override
  public String getLiteralName() {
    return type.getValue() + "_array";
  }
}
