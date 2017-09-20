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

import java.util.LinkedList;
import java.util.List;
import java.util.stream.Stream;

public final class JavaEnum extends JavaTopLevelElement {

  public final List<JavaEnumItem> items = new LinkedList<>();

  public JavaEnum(final String name) {
    super(name);
  }

  @Override
  public Stream<JavaNamedEntity> stream() {
    return Stream.concat(super.stream(), items.stream());
  }
}
