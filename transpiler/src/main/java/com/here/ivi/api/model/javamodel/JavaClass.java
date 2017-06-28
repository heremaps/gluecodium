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

import java.util.LinkedHashSet;
import java.util.Set;
import java.util.stream.Stream;

public class JavaClass extends JavaElement {
  public enum ClassQualifier {
    STATIC("static"),
    FINAL("final");

    private final String value;

    ClassQualifier(final String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return value;
    }
  }

  public JavaPackage javaPackage = JavaPackage.DEFAULT;
  public Set<JavaMethod> methods = new LinkedHashSet<>();
  public Set<JavaField> fields = new LinkedHashSet<>();
  public JavaInheritance inheritance = null;
  public Set<JavaConstant> constants = new LinkedHashSet<>();
  public Set<JavaEnum> enums = new LinkedHashSet<>();
  public Set<JavaClass> innerClasses = new LinkedHashSet<>();
  public Set<ClassQualifier> qualifiers = new LinkedHashSet<>();

  public JavaClass(String name) {
    super(name);
  }

  @Override
  public Stream<JavaNamedEntity> stream() {
    return Stream.concat(
            methods.stream(),
            Stream.concat(
                fields.stream(),
                Stream.concat(
                    constants.stream(),
                    inheritance == null
                        ? enums.stream()
                        : Stream.concat(enums.stream(), inheritance.stream()))))
        .map(JavaElement.class::cast);
  }
}
