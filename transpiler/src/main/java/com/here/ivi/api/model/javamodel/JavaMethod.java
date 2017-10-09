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

  public JavaMethod(final String name) {
    this(name, JavaPrimitiveType.VOID);
  }

  public JavaMethod(final String name, final JavaType returnType) {
    super(name);
    this.returnType = returnType;
  }

  public JavaMethod(final JavaMethod other) {
    this(other.name, other.returnType);
    this.qualifiers.addAll(other.qualifiers);
    this.parameters.addAll(other.parameters);
  }

  @Override
  public Stream<JavaElement> stream() {
    return Stream.concat(Stream.of(returnType), parameters.stream());
  }
}
