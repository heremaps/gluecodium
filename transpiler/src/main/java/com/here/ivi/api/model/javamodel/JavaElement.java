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

import java.util.Objects;
import java.util.stream.Stream;

public class JavaElement implements JavaNamedEntity {
  public String name;
  public String comment = "";
  public JavaVisibility visibility = JavaVisibility.PACKAGE;

  public JavaElement(final String name) {
    this.name = name;
  }

  @Override
  public String getName() {
    return name;
  }

  @Override
  public String toString() {
    return getClass().getSimpleName() + "." + name;
  }

  public Stream<JavaNamedEntity> stream() {
    return Stream.empty();
  }

  public final Stream<JavaNamedEntity> streamRecursive() {
    return Stream.concat(
        Stream.of(this),
        stream().filter(Objects::nonNull).flatMap(JavaNamedEntity::streamRecursive));
  }
}
