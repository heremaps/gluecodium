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

import java.util.Collection;
import java.util.LinkedHashSet;
import java.util.Objects;
import java.util.Set;
import java.util.TreeSet;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public abstract class JavaTopLevelElement extends JavaElement {

  public JavaPackage javaPackage = JavaPackage.DEFAULT;
  public final Set<JavaMethod> methods = new LinkedHashSet<>();
  public final Set<JavaInterface> parentInterfaces = new LinkedHashSet<>();

  public final Set<JavaConstant> constants = new LinkedHashSet<>();
  public final Set<JavaEnum> enums = new LinkedHashSet<>();
  public final Set<JavaClass> innerClasses = new LinkedHashSet<>();
  public final Set<Qualifier> qualifiers = new LinkedHashSet<>();

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

  protected JavaTopLevelElement(String name) {
    super(name);
  }

  @Override
  public Stream<JavaElement> stream() {
    return Stream.of(methods, constants, parentInterfaces, enums).flatMap(Collection::stream);
  }

  public Set<JavaImport> getImports() {
    Set<JavaImport> imports =
        streamRecursive()
            .filter(javaElement -> javaElement instanceof JavaElementWithImports)
            .map(JavaElementWithImports.class::cast)
            .map(element -> element.imports)
            .flatMap(Set::stream)
            .collect(Collectors.toCollection(TreeSet::new));
    imports.addAll(
        parentInterfaces
            .stream()
            .map(anInterface -> new JavaImport(anInterface.name, anInterface.javaPackage))
            .collect(Collectors.toList()));

    // No need to import things from the same package. This also filters out a self-import.
    imports.removeIf(anImport -> Objects.equals(anImport.javaPackage, this.javaPackage));

    return imports;
  }
}
