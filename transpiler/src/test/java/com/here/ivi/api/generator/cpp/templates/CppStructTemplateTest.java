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
import com.here.ivi.api.model.cpp.*;
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
  private final CppField cppField = new CppField(cppComplexTypeRef, "flowers");
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
    CppField resultField = new CppField(cppComplexTypeRef, "flowers", new CppValue("valuable"));
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
        new CppField(new CppComplexTypeRef.Builder("Also").build(), "canola");
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
