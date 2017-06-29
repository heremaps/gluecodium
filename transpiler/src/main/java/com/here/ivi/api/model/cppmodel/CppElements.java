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

package com.here.ivi.api.model.cppmodel;

import com.here.ivi.api.model.common.Includes;
import java.util.*;
import java.util.stream.Collectors;

public class CppElements {

  public static final String CONST_QUALIFIER = "const";
  public static final String REF_QUALIFIER = "&";
  public static final String POINTER = "*";

  public enum Visibility {
    Default,
    Public,
    Protected,
    Private
  }

  public enum TypeInfo {
    InterfaceInstance,
    Invalid,
    Complex,
    Enumeration
  }

  public static Set<Includes.Include> collectIncludes(CppNamespace root) {
    return root.streamRecursive()
        .filter(p -> p instanceof CppElementWithIncludes)
        .map(CppElementWithIncludes.class::cast)
        .map(t -> t.includes)
        .flatMap(Set::stream)
        .collect(Collectors.toSet());
  }

  public static Set<Includes.Include> collectIncludes(CppClass cppClass) {
    Set<Includes.Include> result = new HashSet<>();

    for (CppMethod method : cppClass.methods) {
      for (CppParameter inParam : method.getInParameters()) {
        result.addAll(inParam.type.includes);
        if (inParam.value != null) {
          result.addAll(inParam.value.includes);
        }
      }
      for (CppParameter outParam : method.getOutParameters()) {
        result.addAll(outParam.type.includes);
        if (outParam.value != null) {
          result.addAll(outParam.value.includes);
        }
      }
      result.addAll(method.getReturnType().includes);
    }

    for (CppField field : cppClass.fields) {
      result.addAll(field.type.includes);
      result.addAll(field.initializer.includes);
    }

    for (CppUsing using : cppClass.usings) {
      result.addAll(using.definition.includes);
    }

    for (CppInheritance inheritance : cppClass.inheritances) {
      result.addAll(inheritance.parent.includes);
    }

    return result;
  }
}
