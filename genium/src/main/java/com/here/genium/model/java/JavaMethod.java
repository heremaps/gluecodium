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

package com.here.genium.model.java;

import java.util.*;
import java.util.stream.Collectors;
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

  @SuppressWarnings("ParameterNumber")
  @lombok.Builder(builderClassName = "Builder")
  private JavaMethod(
      final String name,
      final String comment,
      final JavaVisibility visibility,
      final JavaType returnType,
      final String returnComment,
      final JavaCustomType exception,
      @Singular Set<MethodQualifier> qualifiers,
      @Singular List<JavaParameter> parameters) {
    super(name);
    this.comment = comment;
    this.visibility = visibility;
    this.returnType = returnType != null ? returnType : JavaPrimitiveType.VOID;
    this.returnComment = returnComment;
    this.exception = exception;
    this.qualifiers =
        qualifiers != null && !qualifiers.isEmpty()
            ? EnumSet.copyOf(qualifiers)
            : EnumSet.noneOf(MethodQualifier.class);
    this.parameters = parameters != null ? new LinkedList<>(parameters) : new LinkedList<>();
  }

  public static Builder builder(final String name) {
    return new Builder().name(name);
  }

  @Override
  public Stream<JavaElement> stream() {
    return Stream.concat(
        Stream.of(returnType, exception), Stream.concat(parameters.stream(), super.stream()));
  }

  public JavaMethod shallowCopy() {
    JavaMethod result =
        new JavaMethod(
            name,
            comment,
            visibility,
            returnType,
            returnComment,
            exception,
            qualifiers,
            parameters);
    result.annotations.addAll(annotations);
    return result;
  }

  @SuppressWarnings("unused")
  public List<JavaType> getAllAnnotations() {
    return Stream.concat(returnType.annotations.stream(), annotations.stream())
        .collect(Collectors.toList());
  }
}
