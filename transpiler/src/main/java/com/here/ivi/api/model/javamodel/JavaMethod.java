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

import java.util.ArrayList;
import java.util.EnumSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Stream;

public final class JavaMethod extends JavaElement {
  public enum Qualifier {
    STATIC("static"),
    NATIVE("native");

    private final String value;

    Qualifier(final String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return value;
    }
  }

  public String deprecatedComment = null;
  public JavaElements.Visibility visibility = JavaElements.Visibility.PRIVATE;
  public final JavaType returnType;
  public Set<Qualifier> qualifiers = EnumSet.noneOf(Qualifier.class);
  public List<JavaParameter> inParameters = new ArrayList<>();
  public List<JavaParameter> outParameters = new ArrayList<>();

  public JavaMethod(final String name) {
    this(name, JavaType.NULL);
  }

  public JavaMethod(final String name, final JavaType returnType) {
    super(name);
    this.returnType = returnType;
  }

  public boolean isNative() {
    return qualifiers != null && qualifiers.contains(Qualifier.NATIVE);
  }

  @Override
  public Stream<JavaElement> stream() {
    return Stream.concat(
        Stream.of(returnType), Stream.concat(inParameters.stream(), outParameters.stream()));
  }
}
