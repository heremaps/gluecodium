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

import java.util.Objects;
import java.util.stream.Stream;

public class JavaPrimitiveType implements JavaType {

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
  private final boolean hasFinalModifier;

  public JavaPrimitiveType(Type type) {
    this(type, false);
  }

  public JavaPrimitiveType(Type type, boolean hasFinalModifier) {
    this.type = type;
    this.hasFinalModifier = hasFinalModifier;
  }

  public boolean equals(Object other) {
    if (!(other instanceof JavaPrimitiveType)) {
      return false;
    }
    JavaPrimitiveType otherType = (JavaPrimitiveType) other;
    return type.equals(otherType.type) && hasFinalModifier == otherType.hasFinalModifier;
  }

  public int hashCode() {
    int hashCode = 31 + this.type.hashCode();
    return 31 * hashCode + (hasFinalModifier == true ? 1 : 0);
  }

  public String getName() {
    return type.getValue();
  }

  @Override
  public boolean isFinal() {
    return hasFinalModifier;
  }

  @Override
  public boolean isValid() {
    return true;
  }

  public Stream<JavaNamedEntity> stream() {
    return Stream.empty();
  }

  public final Stream<JavaNamedEntity> streamRecursive() {
    return Stream.concat(
        Stream.of(this),
        stream().filter(Objects::nonNull).flatMap(JavaNamedEntity::streamRecursive));
  }
}
