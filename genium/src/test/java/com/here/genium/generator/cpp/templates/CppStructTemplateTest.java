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
import com.here.genium.model.cpp.*;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class CppStructTemplateTest {

  private static final String TEMPLATE_NAME = "cpp/CppStruct";

  private static final String EXPECTED_STRUCT_RESULT_FORMAT = "struct Structural {\n%s};\n";
  private static final String EXPECTED_STRUCT_INHERITANCES_RESULT_FORMAT =
      "struct Structural%s {\n};\n";
  private static final String EXPECTED_FIELD_RESULT_FORMAT = "    %sTypical flowers%s;\n";

  private final CppStruct cppStruct = new CppStruct("Structural");
  private final CppPrimitiveTypeRef cppPrimitiveTypeRef = CppPrimitiveTypeRef.INT32;
  private final CppComplexTypeRef cppComplexTypeRef =
      new CppComplexTypeRef.Builder("Typical").build();
  private final CppField cppField = new CppField("flowers", cppComplexTypeRef);
  private final CppInheritance cppInheritance =
      new CppInheritance(cppPrimitiveTypeRef, CppInheritance.Type.Protected);

  @Test
  public void structEmpty() {
    String result = TemplateEngine.render(TEMPLATE_NAME, cppStruct);

    final String expectedResult = String.format(EXPECTED_STRUCT_RESULT_FORMAT, "");
    assertEquals(expectedResult, result);
  }

  @Test
  public void structWithField() {
    cppStruct.fields.add(cppField);

    String result = TemplateEngine.render(TEMPLATE_NAME, cppStruct);

    final String expectedFieldResult = String.format(EXPECTED_FIELD_RESULT_FORMAT, "", "");
    final String expectedResult = String.format(EXPECTED_STRUCT_RESULT_FORMAT, expectedFieldResult);
    assertEquals(expectedResult, result);
  }

  @Test
  public void structWithFieldWithComment() {
    cppField.comment = "nonsense";
    cppStruct.fields.add(cppField);

    String result = TemplateEngine.render(TEMPLATE_NAME, cppStruct);

    final String expectedFieldResult =
        String.format(EXPECTED_FIELD_RESULT_FORMAT, "/**\n     * nonsense\n     */\n    ", "");
    final String expectedResult = String.format(EXPECTED_STRUCT_RESULT_FORMAT, expectedFieldResult);
    assertEquals(expectedResult, result);
  }

  @Test
  public void structWithFieldWithInitializer() {
    CppField resultField =
        CppField.builder("flowers", cppComplexTypeRef)
            .initializer(new CppValue("valuable"))
            .build();
    cppStruct.fields.add(resultField);

    String result = TemplateEngine.render(TEMPLATE_NAME, cppStruct);

    final String expectedFieldResult =
        String.format(EXPECTED_FIELD_RESULT_FORMAT, "", " = valuable");
    final String expectedResult = String.format(EXPECTED_STRUCT_RESULT_FORMAT, expectedFieldResult);
    assertEquals(expectedResult, result);
  }

  @Test
  public void structWithTwoFields() {
    CppField anotherCppField =
        new CppField("canola", new CppComplexTypeRef.Builder("Also").build());
    cppStruct.fields.add(cppField);
    cppStruct.fields.add(anotherCppField);

    String result = TemplateEngine.render(TEMPLATE_NAME, cppStruct);

    final String expectedFieldResult = String.format(EXPECTED_FIELD_RESULT_FORMAT, "", "");
    final String expectedAnotherFieldResult = "    Also canola;\n";
    final String expectedResult =
        String.format(
            EXPECTED_STRUCT_RESULT_FORMAT, expectedFieldResult + expectedAnotherFieldResult);
    assertEquals(expectedResult, result);
  }

  @Test
  public void classWithOneInheritance() {
    cppStruct.inheritances.add(cppInheritance);

    String result = TemplateEngine.render(TEMPLATE_NAME, cppStruct);

    final String expectedInheritances = ": protected int32_t";
    final String expectedResult =
        String.format(EXPECTED_STRUCT_INHERITANCES_RESULT_FORMAT, expectedInheritances);
    assertEquals(expectedResult, result);
  }

  @Test
  public void classWithTwoInheritances() {
    cppStruct.inheritances.add(cppInheritance);
    cppStruct.inheritances.add(new CppInheritance(cppComplexTypeRef, CppInheritance.Type.Private));

    String result = TemplateEngine.render(TEMPLATE_NAME, cppStruct);

    final String expectedInheritances = ": protected int32_t, private Typical";
    final String expectedResult =
        String.format(EXPECTED_STRUCT_INHERITANCES_RESULT_FORMAT, expectedInheritances);
    assertEquals(expectedResult, result);
  }
}
