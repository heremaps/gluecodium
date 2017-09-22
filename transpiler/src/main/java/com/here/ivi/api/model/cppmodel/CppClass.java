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

import com.here.ivi.api.generator.baseapi.TopologicalSort;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public final class CppClass extends CppElement {

  public final Set<CppMethod> methods = new LinkedHashSet<>();
  public final Set<CppUsing> usings = new LinkedHashSet<>();
  public final Set<CppField> fields = new LinkedHashSet<>();
  public final Set<CppInheritance> inheritances = new LinkedHashSet<>();
  public final Set<CppStruct> structs = new LinkedHashSet<>();
  public final Set<CppConstant> constants = new LinkedHashSet<>();
  public final Set<CppEnum> enums = new LinkedHashSet<>();

  public CppClass(final String name) {
    super(name);
  }

  public boolean hasInstanceMethods() {
    return methods
        .stream()
        .anyMatch(method -> !method.specifiers.contains(CppMethod.Specifier.STATIC));
  }

  public boolean hasSortedMembers() {
    return !enums.isEmpty() || !usings.isEmpty() || !structs.isEmpty();
  }

  /**
   * Returns topologically sorted list of enums, usings and structs
   *
   * @return sorted class members
   */
  public List<CppElement> getSortedMembers() {

    List<CppElement> unsortedMembers =
        Stream.concat(enums.stream(), Stream.concat(usings.stream(), structs.stream()))
            .collect(Collectors.toList());

    return new TopologicalSort(unsortedMembers).sort();
  }

  @Override
  public Stream<? extends CppElement> stream() {
    return Stream.concat(
            methods.stream(),
            Stream.concat(
                structs.stream(),
                Stream.concat(
                    usings.stream(),
                    Stream.concat(
                        fields.stream(),
                        Stream.concat(
                            constants.stream(),
                            Stream.concat(enums.stream(), inheritances.stream()))))))
        .map(CppElement.class::cast);
  }
}
