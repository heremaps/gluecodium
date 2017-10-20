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

package com.here.ivi.api.generator.cpp;

import com.here.ivi.api.TranspilerExecutionException;
import com.here.ivi.api.model.cppmodel.CppConstant;
import com.here.ivi.api.model.cppmodel.CppElement;
import com.here.ivi.api.model.cppmodel.CppStruct;
import com.here.ivi.api.model.cppmodel.CppTemplateTypeRef;
import com.here.ivi.api.model.cppmodel.CppTypeDefRef;
import com.here.ivi.api.model.cppmodel.CppTypeRef;
import com.here.ivi.api.model.cppmodel.CppUsing;
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
        throw new TranspilerExecutionException("Cycle detected in CPP elements dependencies.");
      }

      sortedElements.add(nextElement);

      // as dependency to "nextElement" is now fulfilled we must remove it from elements dependencies
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
    } else if (fullyQualifiedNames.contains(typeRef.name)) {
      dependencies.add(typeRef.name);
    }

    return dependencies;
  }

  private Set<String> getElementDependencies(CppElement cppElement) {

    if (cppElement instanceof CppConstant) {
      CppConstant cppConstant = (CppConstant) cppElement;
      return getTypeDependencies(cppConstant.type);
    }

    if (cppElement instanceof CppStruct) {
      CppStruct cppStruct = (CppStruct) cppElement;
      return getStructDependencies(cppStruct);
    }

    if (cppElement instanceof CppUsing) {
      CppUsing cppUsing = (CppUsing) cppElement;
      return getTypeDependencies(cppUsing.definition);
    }

    return Collections.emptySet();
  }

  private Set<String> getStructDependencies(CppStruct cppStruct) {

    return cppStruct
        .fields
        .stream()
        .flatMap(cppField -> getTypeDependencies(cppField.type).stream())
        .collect(Collectors.toSet());
  }

  private Map<String, Set<String>> buildDependencies() {

    return elements
        .stream()
        .collect(
            Collectors.toMap(
                element -> element.fullyQualifiedName, element -> getElementDependencies(element)));
  }
}
