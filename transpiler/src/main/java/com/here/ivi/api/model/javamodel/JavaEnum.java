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
import java.util.List;
import java.util.stream.Stream;

public final class JavaEnum extends JavaElement {
  public boolean isTopLevel = false;
  public JavaPackage javaPackage = new JavaPackage("com.here.android");
  public List<JavaEnumItem> items = new ArrayList<>();

  public JavaEnum(final String name) {
    super(name);
  }

  public boolean isValid() {
    boolean ret = true;
    for (JavaEnumItem item : items) {
      if (!item.isValid()) {
        ret = false;
        break;
      }
    }
    return !items.isEmpty() && name != null && !name.isEmpty() && ret;
  }

  @Override
  public Stream<JavaNamedEntity> stream() {
    return items.stream().map(JavaElement.class::cast);
  }
}
