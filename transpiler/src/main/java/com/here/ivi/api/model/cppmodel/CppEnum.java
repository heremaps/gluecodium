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

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Stream;

public class CppEnum extends CppElement {

  public final boolean isScoped;
  public List<CppEnumItem> items = new ArrayList<>();

  public CppEnum(final String name) {
    super(name);
    this.isScoped = false;
  }

  public CppEnum(final String name, final boolean isScoped) {
    super(name);
    this.isScoped = isScoped;
  }

  @Override
  public Stream<? extends CppElement> stream() {
    return items.stream();
  }
}
