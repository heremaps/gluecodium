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
import java.util.TreeSet;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public abstract class JavaTopLevelElement extends JavaElement {

  public JavaPackage javaPackage = JavaPackage.DEFAULT;
  public Set<JavaMethod> methods = new LinkedHashSet<>();
  public final Set<JavaInterface> parentInterfaces = new LinkedHashSet<>();

  public Set<JavaConstant> constants = new LinkedHashSet<>();
  public Set<JavaEnum> enums = new LinkedHashSet<>();
  public Set<JavaClass> innerClasses = new LinkedHashSet<>();
  public Set<Qualifier> qualifiers = new LinkedHashSet<>();

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
  public Stream<JavaNamedEntity> stream() {
    return Stream.concat(
            methods.stream(),
            Stream.concat(
                constants.stream(), Stream.concat(parentInterfaces.stream(), enums.stream())))
        .map(JavaElement.class::cast);
  }

  public Set<JavaImport> getImports() {
    Set<JavaImport> imports =
        streamRecursive()
            .filter(javaNamedEntity -> javaNamedEntity instanceof JavaElementWithImports)
            .map(JavaElementWithImports.class::cast)
            .map(element -> element.imports)
            .flatMap(Set::stream)
            .collect(Collectors.toCollection(TreeSet::new));
    imports.addAll(
        parentInterfaces
            .stream()
            .map(anInterface -> new JavaImport(anInterface.name, anInterface.javaPackage))
            .collect(Collectors.toList()));
    return imports;
  }
}
