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

package com.here.ivi.api.model.javamodel;

import java.util.stream.Stream;

public final class JavaArrayType extends JavaType {

  public static final JavaArrayType BYTE_ARRAY = new JavaArrayType(Type.BYTE_ARRAY);
  public static final JavaArrayType SHORT_ARRAY = new JavaArrayType(JavaArrayType.Type.SHORT_ARRAY);
  public static final JavaArrayType INT_ARRAY = new JavaArrayType(JavaArrayType.Type.INT_ARRAY);
  public static final JavaArrayType LONG_ARRAY = new JavaArrayType(JavaArrayType.Type.LONG_ARRAY);
  public static final JavaArrayType FLOAT_ARRAY = new JavaArrayType(JavaArrayType.Type.FLOAT_ARRAY);
  public static final JavaArrayType DOUBLE_ARRAY =
      new JavaArrayType(JavaArrayType.Type.DOUBLE_ARRAY);
  public static final JavaArrayType BOOL_ARRAY = new JavaArrayType(JavaArrayType.Type.BOOL_ARRAY);
  public static final JavaArrayType CHAR_ARRAY = new JavaArrayType(JavaArrayType.Type.CHAR_ARRAY);

  public enum Type {
    BOOL_ARRAY("boolean[]"),
    BYTE_ARRAY("byte[]"),
    CHAR_ARRAY("char[]"),
    SHORT_ARRAY("short[]"),
    INT_ARRAY("int[]"),
    LONG_ARRAY("long[]"),
    FLOAT_ARRAY("float[]"),
    DOUBLE_ARRAY("double[]");

    private final String value;

    Type(final String value) {
      this.value = value;
    }

    public String getValue() {
      return value;
    }
  }

  public final Type type;

  public JavaArrayType(final JavaArrayType.Type type) {
    super(type.getValue());
    this.type = type;
  }

  public String getName() {
    return type.getValue();
  }

  @Override
  public Stream<JavaElement> stream() {
    return Stream.empty();
  }

  @Override
  public String getLiteralName() {
    switch (type) {
      case BOOL_ARRAY:
        return "boolean_array";
      case BYTE_ARRAY:
        return "byte_array";
      case CHAR_ARRAY:
        return "char_array";
      case SHORT_ARRAY:
        return "short_array";
      case INT_ARRAY:
        return "int_array";
      case LONG_ARRAY:
        return "long_array";
      case FLOAT_ARRAY:
        return "float_array";
      case DOUBLE_ARRAY:
        return "double_array";
      default:
        return type.getValue();
    }
  }
}
