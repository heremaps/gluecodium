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

import java.util.stream.Stream;

public final class JavaField extends JavaElement {
  public final JavaType type;
  //TODO: initial and customTypeInitial are mutually exclusive. Either combine or add checks.
  // Also, the custom type can' have an initial value at the moment...
  public final JavaValue initial;
  public final JavaType customTypeInitial;

  // TODO: Fix constructors, we have to be able to express:
  // int foo;
  // int foo = 3;
  // Bar bar;
  // Bar bar = new Bar();
  // Bar bar = new Bar(3); // ...

  public JavaField(final JavaType type, final String name) {
    this(type, name, null);
  }

  public JavaField(final JavaType type, final String name, final JavaValue initial) {
    super(name);
    this.type = type;
    this.initial = initial;
    this.customTypeInitial = null;
  }

  public JavaField(final JavaCustomType type, final String name) {
    super(name);
    this.type = type;
    this.initial = null;
    customTypeInitial = type;
  }

  @Override
  public Stream<JavaElement> stream() {
    return Stream.of(type, initial);
  }
}
