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

import java.util.EnumSet;
import java.util.stream.Stream;

public final class JavaPrimitiveType extends JavaType {

  public static final EnumSet<Type> TYPES = EnumSet.allOf(Type.class);

  public static final JavaPrimitiveType VOID = new JavaPrimitiveType(Type.VOID);
  public static final JavaPrimitiveType BYTE = new JavaPrimitiveType(Type.BYTE);
  public static final JavaPrimitiveType SHORT = new JavaPrimitiveType(Type.SHORT);
  public static final JavaPrimitiveType INT = new JavaPrimitiveType(Type.INT);
  public static final JavaPrimitiveType LONG = new JavaPrimitiveType(Type.LONG);
  public static final JavaPrimitiveType FLOAT = new JavaPrimitiveType(Type.FLOAT);
  public static final JavaPrimitiveType DOUBLE = new JavaPrimitiveType(Type.DOUBLE);
  public static final JavaPrimitiveType BOOL = new JavaPrimitiveType(Type.BOOL);
  public static final JavaPrimitiveType CHAR = new JavaPrimitiveType(Type.CHAR);

  public enum Type {
    VOID("void"),
    BYTE("byte"),
    SHORT("short"),
    INT("int"),
    LONG("long"),
    FLOAT("float"),
    DOUBLE("double"),
    BOOL("boolean"),
    CHAR("char");

    private final String value;

    Type(final String value) {
      this.value = value;
    }

    public String getValue() {
      return value;
    }
  }

  public final Type type;

  private JavaPrimitiveType(final Type type) {
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
}
