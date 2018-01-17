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

package com.here.ivi.api.model.cpp;

import java.util.EnumSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;
import java.util.stream.Stream;
import lombok.EqualsAndHashCode;
import lombok.Singular;

@EqualsAndHashCode(callSuper = true)
@SuppressWarnings("PMD.MissingStaticMethodInNonInstantiatableClass")
public final class CppMethod extends CppElementWithComment {

  public final CppTypeRef returnType;
  public final String returnComment;
  public final Set<Specifier> specifiers;
  public final Set<Qualifier> qualifiers;
  public final List<CppParameter> parameters;

  public enum Specifier {
    EXPLICIT("explicit"),
    INLINE("inline"),
    STATIC("static"),
    VIRTUAL("virtual");

    private final String text;

    Specifier(final String text) {
      this.text = text;
    }

    @Override
    public String toString() {
      return text;
    }
  }

  public enum Qualifier {
    CONST("const"),
    OVERRIDE("override"),
    PURE_VIRTUAL("= 0");

    private final String text;

    Qualifier(final String text) {
      this.text = text;
    }

    @Override
    public String toString() {
      return text;
    }
  }

  @SuppressWarnings("ParameterNumber")
  @lombok.Builder(builderClassName = "Builder")
  private CppMethod(
      final String name,
      final String comment,
      final CppTypeRef returnType,
      final String returnComment,
      final String fullyQualifiedName,
      @Singular final Set<Specifier> specifiers,
      @Singular final Set<Qualifier> qualifiers,
      @Singular final List<CppParameter> parameters) {
    super(name, fullyQualifiedName == null ? name : fullyQualifiedName, comment);
    this.returnType = returnType != null ? returnType : CppPrimitiveTypeRef.VOID;
    this.returnComment = returnComment;
    this.specifiers =
        !specifiers.isEmpty() ? EnumSet.copyOf(specifiers) : EnumSet.noneOf(Specifier.class);
    this.qualifiers =
        !qualifiers.isEmpty() ? EnumSet.copyOf(qualifiers) : EnumSet.noneOf(Qualifier.class);
    this.parameters = new LinkedList<>(parameters);
  }

  @SuppressWarnings("unused")
  public static class Builder {
    private String name;

    Builder() {
      this(null);
    }

    public Builder(final String name) {
      this.name = name;
    }
  }

  @Override
  public Stream<? extends CppElement> stream() {
    return Stream.concat(Stream.of(returnType), parameters.stream());
  }
}
