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

package com.here.genium.generator.cpp;

import com.here.genium.cli.GeniumExecutionException;
import com.here.genium.model.cpp.*;
import java.util.Collections;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

public final class TopologicalSort {

  private final List<CppElement> elements;

  private final Set<String> fullyQualifiedNames;

  public TopologicalSort(List<CppElement> elements) {

    this.elements = elements;
    this.fullyQualifiedNames =
        elements.stream().map(e -> e.fullyQualifiedName).collect(Collectors.toSet());
  }

  /**
   * Do a topological sort based on Kahn's algorithm
   * https://en.wikipedia.org/wiki/Topological_sorting on the given structs and assign priorities to
   * structs so the most-basic structs are defined first to avoid compilation errors on C++.
   */
  public List<CppElement> sort() {

    List<CppElement> sortedElements = new LinkedList<>();

    // structs dependencies map
    Map<String, Set<String>> dependencies = buildDependencies();

    while (sortedElements.size() < elements.size()) {

      // find the first element with no dependency needed which is not in the sorted elements
      CppElement nextElement =
          elements
              .stream()
              .filter(
                  cppElement ->
                      dependencies.get(cppElement.fullyQualifiedName).isEmpty()
                          && !sortedElements.contains(cppElement))
              .findFirst()
              .orElse(null);

      if (nextElement == null) {
        throw new GeniumExecutionException("Cycle detected in CPP elements dependencies.");
      }

      sortedElements.add(nextElement);

      // as dependency to "nextElement" is now fulfilled we must remove it from elements
      // dependencies
      for (String name : fullyQualifiedNames) {
        dependencies.get(name).remove(nextElement.fullyQualifiedName);
      }
    }

    return sortedElements;
  }

  private Set<String> getTypeDependencies(CppTypeRef typeRef) {

    Set<String> dependencies = new HashSet<>();

    if (typeRef instanceof CppTemplateTypeRef) {
      CppTemplateTypeRef templateTypeRef = (CppTemplateTypeRef) typeRef;
      templateTypeRef.templateParameters.forEach(
          parameter -> dependencies.addAll(getTypeDependencies(parameter)));
    } else if (typeRef instanceof CppTypeDefRef) {
      CppTypeDefRef typeDefRef = (CppTypeDefRef) typeRef;
      dependencies.addAll(getTypeDependencies(typeDefRef.actualType));
    }

    if (fullyQualifiedNames.contains(typeRef.name)) {
      dependencies.add(typeRef.name);
    }

    return dependencies;
  }

  private Set<String> getElementDependencies(CppElement cppElement) {

    if (cppElement instanceof CppTypedElement) {
      CppTypedElement cppTypedElement = (CppTypedElement) cppElement;
      Set<String> dependencies = getTypeDependencies(cppTypedElement.type);
      if (fullyQualifiedNames.contains(cppTypedElement.type.name)) {
        dependencies.add(cppTypedElement.type.name);
      }
      return dependencies;
    }

    if (cppElement instanceof CppStruct) {
      return cppElement
          .stream()
          .flatMap(cppField -> getElementDependencies(cppField).stream())
          .collect(Collectors.toSet());
    }

    if (cppElement instanceof CppUsing) {
      CppUsing cppUsing = (CppUsing) cppElement;
      return getTypeDependencies(cppUsing.definition);
    }

    if (cppElement instanceof CppInheritance) {
      Set<String> dependencies = new HashSet<>();
      String name = ((CppInheritance) cppElement).parent.fullyQualifiedName;
      if (fullyQualifiedNames.contains(name)) {
        dependencies.add(name);
      }
      return dependencies;
    }

    return Collections.emptySet();
  }

  private Map<String, Set<String>> buildDependencies() {

    return elements
        .stream()
        .collect(
            Collectors.toMap(element -> element.fullyQualifiedName, this::getElementDependencies));
  }
}
