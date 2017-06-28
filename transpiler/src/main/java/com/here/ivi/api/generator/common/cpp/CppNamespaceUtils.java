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

package com.here.ivi.api.generator.common.cpp;

import com.here.ivi.api.model.franca.DefinedBy;
import com.here.ivi.api.model.franca.FrancaElement;
import java.util.List;
import org.franca.core.franca.FType;

public class CppNamespaceUtils {
  /**
   * Creates a cpp typename including namespace prefix to access the type 'element' defined from the
   * 'rootModel' Assumes the referenced type is in a TypeCollection namespace or part of an
   * Interface
   */
  public static String getCppTypename(FrancaElement<?> rootModel, FType element) {
    List<String> names =
        builtDisjointNamespace(
            CppNameRules.getNamespace(DefinedBy.createFromFrancaElement(rootModel)),
            CppNameRules.getNamespace(element));

    names.add(CppNameRules.getCppTypename(element.getName()));

    return String.join("::", names);
  }

  /**
   * Creates a cpp typename including namespace prefix to access the type with 'name' defined in
   * 'typeDefiner' from the 'rootModel'
   */
  public static String getCppTypename(
      FrancaElement<?> rootModel, DefinedBy typeDefiner, String name) {
    List<String> names =
        builtDisjointNamespace(
            CppNameRules.getNamespace(DefinedBy.createFromFrancaElement(rootModel)),
            CppNameRules.getNamespace(typeDefiner));
    names.add(name);
    return String.join("::", names);
  }

  /**
   * Creates the namespace needed to reference a type in the target namespace from the base
   * namespace: e.g.
   *
   * <ul>
   *   <li>for b: navigation.guidance, t: navigation.routing - the result will be routing
   *   <li>for b: com.here.test, t: navigation.routing - the result will be navigation.routing
   * </ul>
   */
  private static List<String> builtDisjointNamespace(List<String> base, List<String> target) {
    int i = 0;
    // find largest common part...
    for (; i < base.size() && i < target.size(); i++) {
      if (!base.get(i).equals(target.get(i))) {
        break;
      }
    }

    // ... and strip it off
    return target.subList(i, target.size());
  }
}
