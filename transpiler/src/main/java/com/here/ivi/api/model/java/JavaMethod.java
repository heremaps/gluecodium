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
import lombok.Singular;

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
  public final String returnComment;
  public final Set<MethodQualifier> qualifiers;
  public final List<JavaParameter> parameters;
  public final JavaCustomType exception;

  @lombok.Builder(builderClassName = "Builder", toBuilder = true)
  private JavaMethod(
      final String name,
      final JavaVisibility visibility,
      final JavaType returnType,
      final String returnComment,
      final JavaCustomType exception,
      @Singular Set<MethodQualifier> qualifiers,
      @Singular List<JavaParameter> parameters) {
    super(name);
    this.visibility = visibility;
    this.returnType = returnType != null ? returnType : JavaPrimitiveType.VOID;
    this.returnComment = returnComment;
    this.exception = exception;
    this.qualifiers =
        qualifiers != null && !qualifiers.isEmpty()
            ? qualifiers
            : EnumSet.noneOf(MethodQualifier.class);
    this.parameters = parameters != null ? new LinkedList<>(parameters) : new LinkedList<>();
  }

  public static Builder builder(final String name) {
    return new Builder().name(name);
  }

  @Override
  public Stream<JavaElement> stream() {
    return Stream.concat(Stream.of(returnType, exception), parameters.stream());
  }
}
