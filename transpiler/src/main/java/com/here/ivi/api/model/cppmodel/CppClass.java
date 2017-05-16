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

import java.util.LinkedHashSet;
import java.util.Set;
import java.util.stream.Stream;

public class CppClass extends CppElement {
  public Set<CppMethod> methods = new LinkedHashSet<>(); // preserve insertion order
  public Set<CppUsing> usings = new LinkedHashSet<>();
  public Set<CppField> fields = new LinkedHashSet<>();
  public Set<CppInheritance> inheritances = new LinkedHashSet<>();
  public Set<CppStruct> structs = new LinkedHashSet<>();
  public Set<CppConstant> constants = new LinkedHashSet<>();
  public Set<CppEnumClass> enums = new LinkedHashSet<>();

  public CppClass(String name) {
    super(name);
  }

  @Override
  public Stream<CppElement> stream() {
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
