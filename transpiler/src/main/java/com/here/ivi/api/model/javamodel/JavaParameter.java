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

public class JavaParameter extends JavaElement {
  public enum Mode {
    Input // TODO: Think about modifiers like 'final'
  }

  public JavaType type;
  public JavaValue value;
  public Mode mode;

  public boolean equals(Object other) {
    if (other == null) {
      return false;
    }
    if (other == this) {
      return true;
    }
    if (!(other instanceof JavaParameter)) {
      return false;
    }

    JavaParameter otherParameter = (JavaParameter) other;
    return super.equals(other) && type.equals(otherParameter.type);
  }

  @Override
  public Stream<JavaElement> stream() {
    return Stream.of(type, value);
  }
}
