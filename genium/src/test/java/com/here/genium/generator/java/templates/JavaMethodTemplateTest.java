/*
 * Copyright (C) 2016-2018 HERE Europe B.V.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
 * License-Filename: LICENSE
 */

package com.here.genium.generator.java.templates;

import static org.junit.Assert.assertEquals;

import com.here.genium.generator.common.TemplateEngine;
import com.here.genium.model.java.*;
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
  private final JavaMethod javaMethod = JavaMethod.builder("methodical").build();

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
    JavaMethod resultMethod =
        JavaMethod.builder("methodical").returnType(new JavaCustomType("ComplexType")).build();

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

  @Test
  public void generateMethodWithException() {
    JavaMethod exceptionalJavaMethod =
        JavaMethod.builder("methodical")
            .exception(new JavaCustomType("ExceptionalException", JavaPackage.DEFAULT))
            .build();

    String result = TemplateEngine.render(TEMPLATE_NAME, exceptionalJavaMethod);

    assertEquals("void methodical() throws ExceptionalException;", result);
  }
}
