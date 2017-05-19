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

import com.here.ivi.api.generator.common.cpp.templates.*;
import com.here.ivi.api.model.Includes;
import com.here.ivi.api.model.cppmodel.*;

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

  public CharSequence generate(CppEnumClass cppEnum) {
    return CppEnumClassTemplate.generate(cppEnum);
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

  public CharSequence generate(Includes.Include include) {
    return CppIncludeTemplate.generate(include);
  }
}
