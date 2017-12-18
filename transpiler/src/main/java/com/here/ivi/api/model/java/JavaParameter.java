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

import java.util.stream.Stream;

public final class JavaParameter extends JavaElement {

  public final JavaType type;
  public final JavaValue defaultValue;
  public final boolean isOutput;

  public JavaParameter(final JavaType type, final String name) {
    this(type, name, null, false);
  }

  public JavaParameter(final JavaType type, final String name, final JavaValue defaultValue) {
    this(type, name, defaultValue, false);
  }

  public JavaParameter(final JavaType type, final String name, final boolean isOutput) {
    this(type, name, null, isOutput);
  }

  private JavaParameter(
      final JavaType type,
      final String name,
      final JavaValue defaultValue,
      final boolean isOutput) {
    super(name);
    this.type = type;
    this.defaultValue = defaultValue;
    this.isOutput = isOutput;
  }

  @Override
  public Stream<JavaElement> stream() {
    return Stream.of(type, defaultValue);
  }
}
