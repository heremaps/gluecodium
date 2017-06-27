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

import com.here.ivi.api.generator.common.CppElementFactory;
import com.here.ivi.api.generator.common.cpp.CppModelMapper;
import com.here.ivi.api.generator.common.cpp.CppNameRules;
import com.here.ivi.api.model.FrancaElement;
import com.here.ivi.api.model.Interface;
import com.here.ivi.api.model.cppmodel.CppClass;
import com.here.ivi.api.model.cppmodel.CppNamespace;
import com.here.ivi.api.model.cppmodel.CppUsing;
import org.franca.core.franca.FMethod;
import org.franca.core.franca.FType;
import org.franca.core.franca.FTypeDef;

/**
 * This generator will create the stub interfaces that will then be used by the other generators.
 */
public class StubMapper implements CppModelMapper {

  public CppNamespace mapFrancaModelToCppModel(FrancaElement<?> francaElement) {

    if (!(francaElement instanceof Interface<?>)) {
      return null;
    }

    Interface<?> iface = (Interface<?>) francaElement;

    String stubClassName = CppNameRules.getClassName(iface.getFrancaInterface().getName());
    CppClass.Builder stubClassBuilder =
        new CppClass.Builder(stubClassName)
            .comment(StubCommentParser.parse(iface.getFrancaInterface()).getMainBodyText());

    // TODO APIGEN-126: use a builder for CppClass for fill the fields: methods, inheritances, ..

    for (FType type : iface.getFrancaInterface().getTypes()) {
      if (type instanceof FTypeDef) {
        FTypeDef typeDefinition = (FTypeDef) type;
        CppUsing cppUsing = CppElementFactory.create(iface, typeDefinition);
        if (cppUsing != null) {
          stubClassBuilder.using(cppUsing);
        }
      }
    }

    CppClass stubClass = stubClassBuilder.build();

    for (FMethod method : iface.getFrancaInterface().getMethods()) {
      StubMethodMapper.mapMethodElements(stubClass, method, iface);
    }

    CppNamespace namespace = new CppNamespace(iface.getPackage());
    namespace.members.add(stubClass);

    return namespace;
  }
}
