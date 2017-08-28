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

package com.here.ivi.api.model.cppmodel;

import java.util.stream.Stream;

public class CppField extends CppElement {

  public final CppTypeRef type;
  public final CppValue initializer;

  public CppField(final CppTypeRef type, final String name) {
    this(type, name, null);
  }

  public CppField(final CppTypeRef type, final String name, final CppValue initializer) {
    super(name);
    this.type = type;
    this.initializer = initializer;
  }

  @Override
  public Stream<? extends CppElement> stream() {
    return Stream.of(type, initializer);
  }
}
