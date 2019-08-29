/*
 * Copyright (C) 2016-2019 HERE Europe B.V.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
 * License-Filename: LICENSE
 */

package com.here.genium.model.java;

import java.util.Collection;
import java.util.LinkedHashSet;
import java.util.Objects;
import java.util.Set;
import java.util.TreeSet;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public abstract class JavaTopLevelElement extends JavaElement {

  public JavaPackage javaPackage = JavaPackage.Companion.getDEFAULT();
  public final Set<JavaMethod> methods = new LinkedHashSet<>();
  public final Set<JavaType> parentInterfaces = new LinkedHashSet<>();

  public final Set<JavaConstant> constants = new LinkedHashSet<>();
  public final Set<JavaEnum> enums = new LinkedHashSet<>();
  public final Set<JavaExceptionClass> exceptions = new LinkedHashSet<>();

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
    return Stream.of(methods, constants, parentInterfaces, enums, innerClasses, exceptions)
        .flatMap(Collection::stream);
  }

  public Set<JavaImport> getImports() {
    Set<JavaImport> imports =
        streamRecursive()
            .filter(JavaElementWithImports.class::isInstance)
            .map(JavaElementWithImports.class::cast)
            .map(element -> element.getImports())
            .flatMap(Set::stream)
            .collect(Collectors.toCollection(TreeSet::new));
    imports.addAll(
        parentInterfaces
            .stream()
            .flatMap(javaType -> javaType.getImports().stream())
            .collect(Collectors.toList()));
    imports.addAll(
        methods
            .stream()
            .filter(javaMethod -> javaMethod.getException() != null)
            .flatMap(javaMethod -> javaMethod.getException().getImports().stream())
            .collect(Collectors.toList()));

    // No need to import things from the same package. This also filters out a self-import.
    imports.removeIf(anImport -> Objects.equals(anImport.getJavaPackage(), this.javaPackage));

    return imports;
  }
}
