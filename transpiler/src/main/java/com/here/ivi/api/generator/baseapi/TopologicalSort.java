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

package com.here.ivi.api.generator.baseapi;

import com.here.ivi.api.model.cppmodel.CppStruct;
import com.here.ivi.api.model.cppmodel.CppTemplateTypeRef;
import com.here.ivi.api.model.cppmodel.CppTypeDefRef;
import com.here.ivi.api.model.cppmodel.CppTypeRef;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

public final class TopologicalSort {
  /**
   * Do a topological sort based on Kahn's algorithm
   * https://en.wikipedia.org/wiki/Topological_sorting on the given structs and assign priorities to
   * structs so the most-basic structs are defined first to avoid compilation errors on C++.
   *
   * @param structs List of CppStruct
   */
  public static List<CppStruct> sort(List<CppStruct> structs) {

    List<CppStruct> sortedStructs = new LinkedList<>();

    // for fast look up of a struct by name
    Map<String, CppStruct> nameToStructMap = new HashMap<>();
    structs.forEach(struct -> nameToStructMap.put(struct.fullyQualifiedName, struct));

    // structs dependencies map
    Map<String, Set<String>> dependencies = buildDependencies(structs, nameToStructMap);

    // start structs are those who have dependencies fulfilled
    Set<String> startStructs = new LinkedHashSet<>();
    structs.forEach(
        struct -> {
          String structName = struct.fullyQualifiedName;
          if (dependencies.get(structName).isEmpty()) {
            startStructs.add(structName);
          }
        });

    while (!startStructs.isEmpty()) {
      String structName = startStructs.iterator().next();
      startStructs.remove(structName);

      sortedStructs.add(nameToStructMap.get(structName));

      // as dependency to struct name is now fulfilled we must remove it from structs dependencies
      for (String name : nameToStructMap.keySet()) {
        Set<String> structDependencies = dependencies.get(name);

        // if the struct has only struct name as a dependency it must be added to the start structs
        if (structDependencies.remove(structName) && structDependencies.isEmpty()) {
          startStructs.add(name);
        }
      }
    }

    return sortedStructs;
  }

  private static Set<String> getTypeDependencies(
      CppTypeRef typeRef, Set<String> fullyQualifiedNames) {

    Set<String> dependencies = new HashSet<>();

    if (typeRef instanceof CppTemplateTypeRef) {
      CppTemplateTypeRef templateTypeRef = (CppTemplateTypeRef) typeRef;
      for (CppTypeRef parameter : templateTypeRef.templateParameters) {
        dependencies.addAll(getTypeDependencies(parameter, fullyQualifiedNames));
      }
    } else if (typeRef instanceof CppTypeDefRef) {
      CppTypeDefRef typeDefRef = (CppTypeDefRef) typeRef;
      dependencies.addAll(getTypeDependencies(typeDefRef.actualType, fullyQualifiedNames));
    } else if (fullyQualifiedNames.contains(typeRef.name)) {
      dependencies.add(typeRef.name);
    }

    return dependencies;
  }

  private static Map<String, Set<String>> buildDependencies(
      List<CppStruct> structs, Map<String, CppStruct> nameToStructMap) {

    Map<String, Set<String>> dependencies = new HashMap<>();

    structs.forEach(struct -> dependencies.put(struct.fullyQualifiedName, new HashSet<>()));

    structs.forEach(
        struct -> {
          Set<String> structDependencies = dependencies.get(struct.fullyQualifiedName);

          struct.fields.forEach(
              field ->
                  structDependencies.addAll(
                      getTypeDependencies(field.type, nameToStructMap.keySet())));
        });

    return dependencies;
  }
}
