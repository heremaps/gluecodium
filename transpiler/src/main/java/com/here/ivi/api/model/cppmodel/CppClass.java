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

  // TODO APIGEN-126: use a builder for CppClass for all these fields and make them private final
  public final Set<CppMethod> methods;
  public final Set<CppUsing> usings;
  public final Set<CppField> fields;
  public final Set<CppInheritance> inheritances;
  public final Set<CppStruct> structs;
  public final Set<CppConstant> constants;
  public final Set<CppEnum> enums;

  private CppClass(Builder builder) {
    super(builder.name);
    this.comment = builder.comment;
    this.methods = builder.methods;
    this.usings = builder.usings;
    this.fields = builder.fields;
    this.inheritances = builder.inheritances;
    this.structs = builder.structs;
    this.constants = builder.constants;
    this.enums = builder.enums;
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

  @SuppressWarnings("PMD.AvoidFieldNameMatchingMethodName")
  public static class Builder {

    private final String name;
    private String comment;

    private final Set<CppMethod> methods = new LinkedHashSet<>();
    private final Set<CppUsing> usings = new LinkedHashSet<>();
    private final Set<CppField> fields = new LinkedHashSet<>();
    private final Set<CppInheritance> inheritances = new LinkedHashSet<>();
    private final Set<CppStruct> structs = new LinkedHashSet<>();
    private final Set<CppConstant> constants = new LinkedHashSet<>();
    private final Set<CppEnum> enums = new LinkedHashSet<>();

    public Builder(String name) {
      this.name = name;
    }

    public Builder comment(String comment) {
      this.comment = comment;
      return this;
    }

    public Builder using(CppUsing using) {
      usings.add(using);
      return this;
    }

    public CppClass build() {
      return new CppClass(this);
    }
  }
}
