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

import com.here.ivi.api.generator.common.FrancaTreeWalker;
import com.here.ivi.api.generator.common.cpp.CppModelMapper;
import com.here.ivi.api.model.cppmodel.CppNamespace;
import com.here.ivi.api.model.franca.FrancaElement;
import com.here.ivi.api.model.franca.Interface;
import java.util.Collections;

/** This mapper will create the stub interfaces that will then be used by the other generators. */
public class StubMapper implements CppModelMapper {

  public CppNamespace mapFrancaModelToCppModel(FrancaElement<?> francaElement) {

    if (!(francaElement instanceof Interface<?>)) {
      return null;
    }

    Interface<?> anInterface = (Interface<?>) francaElement;

    // TODO: APIGEN-261 get rid of CppModelMapper classes, do it with the walker
    StubModelBuilder builder = new StubModelBuilder(anInterface);
    FrancaTreeWalker treeWalker = new FrancaTreeWalker(Collections.singletonList(builder));

    treeWalker.walk(anInterface);

    CppNamespace namespace = new CppNamespace(builder.getNamespaceMembers());
    namespace.members.addAll(builder.getResults());

    return namespace;
  }
}
