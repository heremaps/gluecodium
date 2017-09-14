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

public final class JavaClass extends JavaElement {

  public static final JavaClass NATIVE_BASE = new JavaClass("NativeBase");

  public enum Qualifier {
    STATIC("static"),
    FINAL("final");

    private final String value;

    Qualifier(final String value) {
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

  public JavaClass extendedClass;
  // TODO(APIGEN-122, APIGEN-589): Implement interface inheritance later:
  public Set<JavaInterface> implementedInterfaces = new LinkedHashSet<>();

  public Set<JavaConstant> constants = new LinkedHashSet<>();
  public Set<JavaEnum> enums = new LinkedHashSet<>();
  public Set<JavaClass> innerClasses = new LinkedHashSet<>();
  public Set<Qualifier> qualifiers = new LinkedHashSet<>();

  public JavaClass(final String name) {
    super(name);
  }

  public boolean extendsNativeBase() {
    return NATIVE_BASE.equals(extendedClass);
  }

  @Override
  public Stream<JavaNamedEntity> stream() {
    return Stream.concat(
            methods.stream(),
            Stream.concat(
                fields.stream(),
                Stream.concat(
                    constants.stream(),
                    extendedClass == null
                        ? enums.stream()
                        : Stream.concat(enums.stream(), extendedClass.stream()))))
        .map(JavaElement.class::cast);
  }

  public Set<JavaImport> getImports() {
    Set<JavaImport> imports = JavaElements.collectImports(this);
    if (extendedClass != null) {
      imports.add(new JavaImport(extendedClass.name, extendedClass.javaPackage));
    }
    return imports;
  }
}
