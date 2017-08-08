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

package com.here.ivi.api.generator.common.cpp.templates;

import static org.junit.Assert.assertEquals;

import com.here.ivi.api.generator.common.TemplateEngine;
import com.here.ivi.api.model.cppmodel.CppComplexTypeRef;
import com.here.ivi.api.model.cppmodel.CppParameter;
import com.here.ivi.api.model.cppmodel.CppPrimitiveTypeRef;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class CppMethodParameterTemplateTest {

  private static final String PARAMETER_NAME = "glory";
  private static final String TYPE_NAME = "Typical";

  @Test
  public void withPrimitiveType() {
    CppParameter cppParameter =
        new CppParameter(PARAMETER_NAME, new CppPrimitiveTypeRef(CppPrimitiveTypeRef.Type.INT8));

    String result = TemplateEngine.render("cpp/CppMethodParameter", cppParameter);

    assertEquals("const int8_t glory", result);
  }

  @Test
  public void withValueType() {
    CppParameter cppParameter =
        new CppParameter(PARAMETER_NAME, new CppComplexTypeRef.Builder(TYPE_NAME).build());

    String result = TemplateEngine.render("cpp/CppMethodParameter", cppParameter);

    assertEquals("const Typical& glory", result);
  }
}
