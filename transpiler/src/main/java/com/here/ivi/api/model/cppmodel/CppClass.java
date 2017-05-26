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
  public Set<CppMethod> methods = new LinkedHashSet<>();
  public Set<CppUsing> usings = new LinkedHashSet<>();
  public Set<CppField> fields = new LinkedHashSet<>();
  public Set<CppInheritance> inheritances = new LinkedHashSet<>();
  public Set<CppStruct> structs = new LinkedHashSet<>();
  public Set<CppConstant> constants = new LinkedHashSet<>();
  public Set<CppEnumClass> enums = new LinkedHashSet<>();

  // TODO APIGEN-126: remove this constructor when builder is done
  public CppClass(String name) {
    super(name);
  }

  private CppClass(Builder builder) {
    this.name = builder.name;
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

  public static class Builder {

    private final String name;

    private String comment;
    private Set<CppMethod> methods = new LinkedHashSet<>();
    private Set<CppUsing> usings = new LinkedHashSet<>();
    private Set<CppField> fields = new LinkedHashSet<>();
    private Set<CppInheritance> inheritances = new LinkedHashSet<>();
    private Set<CppStruct> structs = new LinkedHashSet<>();
    private Set<CppConstant> constants = new LinkedHashSet<>();
    private Set<CppEnumClass> enums = new LinkedHashSet<>();

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
