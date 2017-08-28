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
import com.here.ivi.api.model.cppmodel.CppField;
import com.here.ivi.api.model.cppmodel.CppStruct;
import com.here.ivi.api.model.cppmodel.CppValue;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class CppStructTemplateTest {

  private static final String TEMPLATE_NAME = "cpp/CppStruct";

  private static final String EXPECTED_STRUCT_RESULT_FORMAT = "struct Structural {\n%s};\n";
  private static final String EXPECTED_FIELD_RESULT_FORMAT = "    %sTypical flowers%s;\n";

  private final CppStruct cppStruct = new CppStruct("Structural");
  private final CppComplexTypeRef cppComplexTypeRef =
      new CppComplexTypeRef.Builder("Typical").build();
  private final CppField cppField = new CppField(cppComplexTypeRef, "flowers");

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
    CppField cppField = new CppField(cppComplexTypeRef, "flowers", new CppValue("valuable"));
    cppStruct.fields.add(cppField);

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
}
