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

package com.here.ivi.api.model.cpp;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Stream;

public final class CppEnum extends CppElementWithComment {

  public final boolean isScoped;
  public final List<CppEnumItem> items = new ArrayList<>();

  public static CppEnum create(final String name) {
    return new CppEnum(name, name, false);
  }

  public static CppEnum createScoped(final String name) {
    return createScoped(name, name);
  }

  public static CppEnum createScoped(final String name, final String fullyQualifiedName) {
    return new CppEnum(name, fullyQualifiedName, true);
  }

  private CppEnum(final String name, final String fullyQualifiedName, final boolean isScoped) {
    super(name, fullyQualifiedName);
    this.isScoped = isScoped;
  }

  @Override
  public Stream<? extends CppElement> stream() {
    return items.stream();
  }
}
