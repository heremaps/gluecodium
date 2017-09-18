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

package com.here.ivi.api.generator.cpp.templates;

import static org.junit.Assert.assertEquals;

import com.here.ivi.api.generator.common.TemplateEngine;
import com.here.ivi.api.model.cppmodel.CppComplexTypeRef;
import com.here.ivi.api.model.cppmodel.CppMethod;
import com.here.ivi.api.model.cppmodel.CppParameter;
import com.here.ivi.api.model.cppmodel.CppPrimitiveTypeRef;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class CppMethodSignatureTemplateTest {

  private static final String TEMPLATE_NAME = "cpp/CppMethodSignature";

  private static final String METHOD_NAME = "methodical";
  private static final String METHOD_COMMENT = "nonsense";
  private static final String PARAMETER_NAME = "glory";
  private static final String TYPE_NAME = "Typical";

  private final CppMethod cppMethod = new CppMethod.Builder(METHOD_NAME).build();
  private final CppComplexTypeRef cppCustomType = new CppComplexTypeRef.Builder(TYPE_NAME).build();
  private final CppParameter cppParameter = new CppParameter(PARAMETER_NAME, cppCustomType);

  @Test
  public void generateWithoutComment() {
    String result = TemplateEngine.render(TEMPLATE_NAME, cppMethod);

    assertEquals("void methodical(  )", result);
  }

  @Test
  public void generateWithComment() {
    cppMethod.comment = METHOD_COMMENT;

    String result = TemplateEngine.render(TEMPLATE_NAME, cppMethod);

    assertEquals("/**\n * nonsense\n */\nvoid methodical(  )", result);
  }

  @Test
  public void generateWithOneSpecifier() {
    cppMethod.specifiers.add(CppMethod.Specifier.STATIC);

    String result = TemplateEngine.render(TEMPLATE_NAME, cppMethod);

    assertEquals("static void methodical(  )", result);
  }

  @Test
  public void generateWithTwoSpecifiers() {
    cppMethod.specifiers.add(CppMethod.Specifier.VIRTUAL);
    cppMethod.specifiers.add(CppMethod.Specifier.STATIC);

    String result = TemplateEngine.render(TEMPLATE_NAME, cppMethod);

    assertEquals("static virtual void methodical(  )", result);
  }

  @Test
  public void generateWithReturnType() {
    CppMethod cppMethod = new CppMethod.Builder(METHOD_NAME).returnType(cppCustomType).build();

    String result = TemplateEngine.render(TEMPLATE_NAME, cppMethod);

    assertEquals("Typical methodical(  )", result);
  }

  @Test
  public void generateWithOneQualifier() {
    cppMethod.qualifiers.add(CppMethod.Qualifier.CONST);

    String result = TemplateEngine.render(TEMPLATE_NAME, cppMethod);

    assertEquals("void methodical(  ) const", result);
  }

  @Test
  public void generateWithTwoQualifiers() {
    cppMethod.qualifiers.add(CppMethod.Qualifier.PURE_VIRTUAL);
    cppMethod.qualifiers.add(CppMethod.Qualifier.CONST);

    String result = TemplateEngine.render(TEMPLATE_NAME, cppMethod);

    assertEquals("void methodical(  ) const = 0", result);
  }

  @Test
  public void generateWithOneInParameter() {
    cppMethod.parameters.add(cppParameter);

    String result = TemplateEngine.render(TEMPLATE_NAME, cppMethod);

    assertEquals("void methodical( const Typical& glory )", result);
  }

  @Test
  public void generateWithTwoInParameters() {
    cppMethod.parameters.add(new CppParameter("age", CppPrimitiveTypeRef.INT8));
    cppMethod.parameters.add(cppParameter);

    String result = TemplateEngine.render(TEMPLATE_NAME, cppMethod);

    assertEquals("void methodical( const int8_t age, const Typical& glory )", result);
  }
}
