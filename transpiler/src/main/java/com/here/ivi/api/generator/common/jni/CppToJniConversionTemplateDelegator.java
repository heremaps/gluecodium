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

package com.here.ivi.api.generator.common.jni;

import com.here.ivi.api.generator.common.TemplateEngine;
import com.here.ivi.api.model.cppmodel.CppPrimitiveTypeRef;
import com.here.ivi.api.model.cppmodel.CppTypeDefRef;
import com.here.ivi.api.model.cppmodel.CppTypeRef;

public class CppToJniConversionTemplateDelegator {
  public static CharSequence generate(final String cppVariableName, final CppTypeRef cppType) {
    if (cppType instanceof CppTypeDefRef) {
      return generate(cppVariableName, ((CppTypeDefRef) cppType).actualType);
    }
    if (cppType instanceof CppPrimitiveTypeRef) {
      return cppVariableName;
    } else {
      return TemplateEngine.render("jni/CppToJniStructConversionCall", cppVariableName);
    }
  }
}
