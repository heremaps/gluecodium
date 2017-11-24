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

import com.here.ivi.api.generator.cpp.TopologicalSort;
import java.util.*;
import java.util.stream.Stream;

public final class CppClass extends CppElement {

  public final List<CppElement> members = new LinkedList<>();
  public final Set<CppMethod> methods = new LinkedHashSet<>();
  public final Set<CppField> fields = new LinkedHashSet<>();
  public final Set<CppInheritance> inheritances = new LinkedHashSet<>();

  public CppClass(final String name) {
    super(name);
  }

  @SuppressWarnings("unused")
  public boolean hasSortedMembers() {
    return !members.isEmpty();
  }

  /**
   * Returns topologically sorted list of members
   *
   * @return sorted class members
   */
  @SuppressWarnings("unused")
  public List<CppElement> getSortedMembers() {
    return new TopologicalSort(members).sort();
  }

  @Override
  public Stream<? extends CppElement> stream() {
    return Stream.of(methods, members, inheritances).flatMap(Collection::stream);
  }
}
