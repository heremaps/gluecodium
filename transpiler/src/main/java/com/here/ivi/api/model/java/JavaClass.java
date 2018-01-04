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

package com.here.ivi.api.model.java;

import java.util.LinkedHashSet;
import java.util.Objects;
import java.util.Set;
import java.util.function.Function;
import java.util.stream.Stream;

public final class JavaClass extends JavaTopLevelElement {

  public static final JavaType NATIVE_BASE = new JavaCustomType("NativeBase", JavaPackage.DEFAULT);

  public final Set<JavaField> fields = new LinkedHashSet<>();
  public JavaType extendedClass;
  public final boolean isImplClass;

  public JavaClass(final String name) {
    this(name, false);
  }

  public JavaClass(final String name, final boolean isImplClass) {
    super(name);
    this.isImplClass = isImplClass;
  }

  @SuppressWarnings("unused")
  public boolean extendsNativeBase() {
    return NATIVE_BASE.equals(extendedClass);
  }

  @Override
  public Stream<JavaElement> stream() {
    Stream<? extends JavaElement> extendedClassStream =
        extendedClass != null ? extendedClass.stream() : Stream.empty();
    return Stream.of(super.stream(), fields.stream(), extendedClassStream)
        .flatMap(Function.identity());
  }

  @Override
  public Set<JavaImport> getImports() {

    Set<JavaImport> imports = super.getImports();

    if (extendedClass != null) {
      imports.addAll(extendedClass.imports);
      // No need to import things from the same package. This also filters out a self-import.
      imports.removeIf(anImport -> Objects.equals(anImport.javaPackage, this.javaPackage));
    }

    return imports;
  }
}
