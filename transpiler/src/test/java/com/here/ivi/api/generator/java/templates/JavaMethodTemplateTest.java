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

package com.here.ivi.api.generator.java.templates;

import static org.junit.Assert.assertEquals;

import com.here.ivi.api.generator.common.TemplateEngine;
import com.here.ivi.api.model.javamodel.JavaCustomType;
import com.here.ivi.api.model.javamodel.JavaMethod;
import com.here.ivi.api.model.javamodel.JavaParameter;
import com.here.ivi.api.model.javamodel.JavaPrimitiveType;
import com.here.ivi.api.model.javamodel.JavaReferenceType;
import com.here.ivi.api.model.javamodel.JavaVisibility;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
@SuppressWarnings({"MethodName"})
public final class JavaMethodTemplateTest {

  private static final String TEMPLATE_NAME = "java/MethodSignature";

  private static final String EXPECTED_METHOD_SIGNATURE = "void methodical();";

  private final JavaParameter javaParameter =
      new JavaParameter(new JavaReferenceType(JavaReferenceType.Type.STRING), "firstParam");
  private final JavaMethod javaMethod = new JavaMethod("methodical", JavaPrimitiveType.VOID);

  @Test
  public void generate_instanceMethod() {
    String result = TemplateEngine.render(TEMPLATE_NAME, javaMethod);

    assertEquals(EXPECTED_METHOD_SIGNATURE, result);
  }

  @Test
  public void generate_nativeMethod() {
    javaMethod.qualifiers.add(JavaMethod.MethodQualifier.NATIVE);

    String result = TemplateEngine.render(TEMPLATE_NAME, javaMethod);

    assertEquals("native " + EXPECTED_METHOD_SIGNATURE, result);
  }

  @Test
  public void generateMethodWithComment() {
    javaMethod.comment = "Simple method comment";

    String result = TemplateEngine.render(TEMPLATE_NAME, javaMethod);

    assertEquals("/**\n * Simple method comment\n */\n" + EXPECTED_METHOD_SIGNATURE, result);
  }

  @Test
  public void generateStaticMethod() {
    javaMethod.qualifiers.add(JavaMethod.MethodQualifier.STATIC);

    String result = TemplateEngine.render(TEMPLATE_NAME, javaMethod);

    assertEquals("static " + EXPECTED_METHOD_SIGNATURE, result);
  }

  @Test
  public void generatePublicMethod() {
    javaMethod.visibility = JavaVisibility.PUBLIC;

    String result = TemplateEngine.render(TEMPLATE_NAME, javaMethod);

    assertEquals("public " + EXPECTED_METHOD_SIGNATURE, result);
  }

  @Test
  public void generateMethodWithReturnType() {
    JavaMethod resultMethod = new JavaMethod("methodical", new JavaCustomType("ComplexType"));

    String result = TemplateEngine.render(TEMPLATE_NAME, resultMethod);

    assertEquals("ComplexType methodical();", result);
  }

  @Test
  public void generateMethodWithOneParameter() {
    javaMethod.parameters.add(javaParameter);

    String result = TemplateEngine.render(TEMPLATE_NAME, javaMethod);

    assertEquals("void methodical(final String firstParam);", result);
  }

  @Test
  public void generateMethodWithTwoParameters() {
    javaMethod.parameters.add(javaParameter);
    javaMethod.parameters.add(new JavaParameter(new JavaCustomType("InParamType2"), "secondParam"));

    String result = TemplateEngine.render(TEMPLATE_NAME, javaMethod);

    assertEquals(
        "void methodical(final String firstParam, final InParamType2 secondParam);", result);
  }
}
