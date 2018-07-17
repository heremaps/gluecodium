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

import com.here.genium.generator.common.templates.TemplateEngine;
import com.here.genium.model.cpp.CppComplexTypeRef;
import com.here.genium.model.cpp.CppUsing;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class CppUsingTemplateTest {

  private static final String TEMPLATE_NAME = "cpp/CppUsing";

  private static final String TYPE_NAME = "Typical";
  private static final String TYPEDEF_NAME = "Definite";
  private static final String EXPECTED_TYPEDEF_RESULT =
      "using " + TYPEDEF_NAME + " = " + TYPE_NAME + ";\n";

  private final CppComplexTypeRef cppTypeRef = new CppComplexTypeRef.Builder(TYPE_NAME).build();

  @Test
  public void usingWithoutComment() {
    CppUsing cppUsing = CppUsing.builder(TYPEDEF_NAME, cppTypeRef).build();

    String result = TemplateEngine.render(TEMPLATE_NAME, cppUsing);

    assertEquals(EXPECTED_TYPEDEF_RESULT, result);
  }

  @Test
  public void usingWithComment() {
    CppUsing cppUsing = CppUsing.builder(TYPEDEF_NAME, cppTypeRef).comment("nonsense").build();

    String result = TemplateEngine.render(TEMPLATE_NAME, cppUsing);

    final String expectedResult = "/**\n * nonsense\n */\n" + EXPECTED_TYPEDEF_RESULT;
    assertEquals(expectedResult, result);
  }
}
