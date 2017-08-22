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

// TODO: Split this class, it mixes two java concepts, namely extending a base class (which can
// happen only once) and implementing interfaces (multiple are possible)
public class JavaInheritance extends JavaElement {
  private final JavaType type;

  public JavaInheritance(final JavaType type) {
    super(type.name);
    this.type = type;
  }

  public JavaType getType() {
    return type;
  }

  @Override
  public Stream<JavaNamedEntity> stream() {
    return Stream.of(type);
  }
}
