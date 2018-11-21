/*
 * Copyright (C) 2016-2018 HERE Europe B.V.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
 * License-Filename: LICENSE
 */

package com.here.genium.model.cpp;

import java.util.EnumSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;
import java.util.stream.Stream;
import lombok.EqualsAndHashCode;
import lombok.Singular;

@EqualsAndHashCode(callSuper = true)
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
