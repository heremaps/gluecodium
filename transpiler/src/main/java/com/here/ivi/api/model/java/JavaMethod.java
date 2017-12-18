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

import java.util.*;
import java.util.stream.Stream;

public final class JavaMethod extends JavaElement {

  public enum MethodQualifier {
    STATIC("static"),
    NATIVE("native");

    private final String value;

    MethodQualifier(final String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return value;
    }
  }

  public final JavaType returnType;
  public final Set<MethodQualifier> qualifiers = EnumSet.noneOf(MethodQualifier.class);
  public final List<JavaParameter> parameters = new LinkedList<>();
  public final JavaCustomType exception;

  public JavaMethod(final String name) {
    this(name, JavaPrimitiveType.VOID, null);
  }

  public JavaMethod(final String name, final JavaType returnType) {
    this(name, returnType, null);
  }

  public JavaMethod(final String name, final JavaType returnType, final JavaCustomType exception) {
    super(name);
    this.returnType = returnType;
    this.exception = exception;
  }

  public JavaMethod(final JavaMethod other) {
    this(other.name, other.returnType, other.exception);
    this.qualifiers.addAll(other.qualifiers);
    this.parameters.addAll(other.parameters);
  }

  @Override
  public Stream<JavaElement> stream() {
    return Stream.concat(Stream.of(returnType, exception), parameters.stream());
  }
}
