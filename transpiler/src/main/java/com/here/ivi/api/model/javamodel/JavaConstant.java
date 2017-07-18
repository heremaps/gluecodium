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

public class JavaConstant extends JavaElement {
  public final JavaType type;
  public final JavaValue value;

  public JavaConstant(final JavaType type, final String name, final JavaValue value) {
    super(name);
    this.type = type;
    if (value == null) {
      // TODO APIGEN-218 handle this case
      this.value = new JavaValue("TODO");
    } else {
      this.value = value;
    }
  }

  @Override
  public Stream<JavaNamedEntity> stream() {
    return Stream.of(type, value);
  }
}
