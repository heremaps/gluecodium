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

public final class JavaPrimitiveType implements JavaType {
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

  public JavaPrimitiveType(final Type type) {
    this.type = type;
  }

  public String getName() {
    return type.getValue();
  }

  @Override
  public boolean isValid() {
    return true;
  }

  @Override
  public Stream<JavaNamedEntity> stream() {
    return Stream.empty();
  }

  @Override
  public final Stream<JavaNamedEntity> streamRecursive() {
    return Stream.concat(
        Stream.of(this),
        stream().filter(Objects::nonNull).flatMap(JavaNamedEntity::streamRecursive));
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }

    JavaPrimitiveType that = (JavaPrimitiveType) o;

    return type == that.type;
  }

  @Override
  public int hashCode() {
    return type != null ? type.hashCode() : 0;
  }
}
