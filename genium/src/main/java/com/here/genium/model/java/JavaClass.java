/*
 * Copyright (C) 2016-2018 HERE Europe B.V.
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

import java.util.*;
import java.util.function.Function;
import java.util.stream.Stream;

public final class JavaClass extends JavaTopLevelElement {

  public final Set<JavaField> fields = new LinkedHashSet<>();
  public final Set<JavaField> parentFields = new LinkedHashSet<>();
  public final JavaType extendedClass;
  public final boolean isImplClass;
  public final boolean needsDisposer;
  public final boolean isParcelable;
  public final boolean isEquatable;

  public JavaClass(final String name) {
    this(name, null, false, false, false, false);
  }

  @lombok.Builder(builderClassName = "Builder")
  private JavaClass(
      final String name,
      final JavaType extendedClass,
      final boolean isImplClass,
      final boolean needsDisposer,
      final boolean isParcelable,
      final boolean isEquatable) {
    super(name);
    this.extendedClass = extendedClass;
    this.isImplClass = isImplClass;
    this.needsDisposer = needsDisposer;
    this.isParcelable = isParcelable;
    this.isEquatable = isEquatable;
  }

  @SuppressWarnings("unused")
  public boolean needsBuilder() {
    return parentFields.size() + fields.size() > 2;
  }

  @SuppressWarnings("unused")
  public Collection<JavaField> getAllVisibleFields() {
    List<JavaField> result = new LinkedList<>();
    result.addAll(parentFields);
    result.addAll(fields);
    return result;
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

  public static Builder builder(final String name) {
    return new Builder().name(name);
  }
}
