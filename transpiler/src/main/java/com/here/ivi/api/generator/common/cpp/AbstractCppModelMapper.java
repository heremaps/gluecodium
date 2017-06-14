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

import com.here.ivi.api.model.FrancaElement;
import com.here.ivi.api.model.cppmodel.CppNamespace;
import java.util.ArrayList;
import java.util.List;

public abstract class AbstractCppModelMapper {

  public abstract CppNamespace mapFrancaModelToCppModel(FrancaElement<?> francaModel);

  protected static List<CppNamespace> packageToCppNamespace(List<String> packages) {

    List<CppNamespace> namespaces = new ArrayList<>();
    CppNamespace parentNs = null;
    for (String p : packages) {
      CppNamespace newNs = new CppNamespace(p);
      if (parentNs != null) {
        parentNs.members.add(newNs);
      }
      namespaces.add(newNs);
      parentNs = newNs;
    }

    return namespaces;
  }
}
