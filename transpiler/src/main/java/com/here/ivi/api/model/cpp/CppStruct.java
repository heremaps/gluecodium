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

import java.util.Collection;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;
import java.util.stream.Stream;

public final class CppStruct extends CppElementWithComment {

  public final List<CppField> fields = new LinkedList<>();
  public final Set<CppInheritance> inheritances = new LinkedHashSet<>();

  public CppStruct(final String name) {
    this(name, name, null);
  }

  public CppStruct(final String name, final String fullyQualifiedName, final String comment) {
    super(name, fullyQualifiedName, comment);
  }

  @Override
  public Stream<? extends CppElement> stream() {
    return Stream.of(fields, inheritances).flatMap(Collection::stream);
  }
}
