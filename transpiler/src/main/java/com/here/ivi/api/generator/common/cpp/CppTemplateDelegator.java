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

import com.here.ivi.api.generator.common.cpp.templates.CppClassTemplate;
import com.here.ivi.api.generator.common.cpp.templates.CppConstantTemplate;
import com.here.ivi.api.generator.common.cpp.templates.CppEnumTemplate;
import com.here.ivi.api.generator.common.cpp.templates.CppIncludeTemplate;
import com.here.ivi.api.generator.common.cpp.templates.CppNamespaceTemplate;
import com.here.ivi.api.generator.common.cpp.templates.CppPureStructTemplate;
import com.here.ivi.api.generator.common.cpp.templates.CppTypeDefTemplate;
import com.here.ivi.api.model.common.Include;
import com.here.ivi.api.model.cppmodel.CppClass;
import com.here.ivi.api.model.cppmodel.CppConstant;
import com.here.ivi.api.model.cppmodel.CppEnum;
import com.here.ivi.api.model.cppmodel.CppNamespace;
import com.here.ivi.api.model.cppmodel.CppStruct;
import com.here.ivi.api.model.cppmodel.CppTypeDef;

public class CppTemplateDelegator {
  public CharSequence generate(CppNamespace ns) {
    return CppNamespaceTemplate.generate(this, ns);
  }

  public CharSequence generate(CppConstant constant) {
    return CppConstantTemplate.generate(constant);
  }

  public CharSequence generate(CppEnum cppEnum) {
    return CppEnumTemplate.generate(cppEnum);
  }

  public CharSequence generate(CppStruct struct) {
    return CppPureStructTemplate.generate(struct);
  }

  public CharSequence generate(CppTypeDef typeDef) {
    return CppTypeDefTemplate.generate(typeDef);
  }

  public CharSequence generate(CppClass cppClass) {
    return CppClassTemplate.generate(cppClass);
  }

  public CharSequence generate(Include include) {
    return CppIncludeTemplate.generate(include);
  }
}
