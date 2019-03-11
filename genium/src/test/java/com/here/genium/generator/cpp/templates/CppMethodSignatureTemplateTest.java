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

package com.here.genium.generator.cpp.templates;

import static org.junit.Assert.assertEquals;

import com.here.genium.generator.common.TemplateEngine;
import com.here.genium.model.cpp.CppComplexTypeRef;
import com.here.genium.model.cpp.CppMethod;
import com.here.genium.model.cpp.CppParameter;
import com.here.genium.model.cpp.CppPrimitiveTypeRef;
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
    CppMethod cppMethodWithComment =
        new CppMethod.Builder(METHOD_NAME).comment(METHOD_COMMENT).build();

    String result = TemplateEngine.render(TEMPLATE_NAME, cppMethodWithComment);

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
    CppMethod resultMethod = new CppMethod.Builder(METHOD_NAME).returnType(cppCustomType).build();

    String result = TemplateEngine.render(TEMPLATE_NAME, resultMethod);

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
