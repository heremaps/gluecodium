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

import com.here.ivi.api.model.cppmodel.CppComplexTypeRef;
import com.here.ivi.api.model.cppmodel.CppField;
import com.here.ivi.api.model.cppmodel.CppStruct;
import com.here.ivi.api.model.cppmodel.CppValue;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class CppPureStructTemplateTest {

  private static final String COMMENT_STRING = "nonsense";
  private static final String STRUCT_NAME = "Structural";
  private static final String FIELD_NAME = "flowers";
  private static final String TYPE_NAME = "Typical";
  private static final String EXPECTED_STRUCT_RESULT_FORMAT =
      "struct " + STRUCT_NAME + " {\n%s};\n";
  private static final String EXPECTED_COMMENT_RESULT = "/**\n* nonsense\n*/\n";
  private static final String EXPECTED_FIELD_RESULT_FORMAT =
      "    %s" + TYPE_NAME + " " + FIELD_NAME + "%s;\n";

  private CppStruct cppStruct = new CppStruct(STRUCT_NAME);
  private CppField cppField = new CppField();

  @Before
  public void setUp() {
    cppField.name = FIELD_NAME;
    cppField.type = new CppComplexTypeRef(TYPE_NAME);
  }

  @Test
  public void structWithoutComment() {
    String result = CppPureStructTemplate.generate(cppStruct);

    final String expectedResult = String.format(EXPECTED_STRUCT_RESULT_FORMAT, "");
    assertEquals(expectedResult, result);
  }

  @Test
  public void structWithComment() {
    cppStruct.comment = COMMENT_STRING;

    String result = CppPureStructTemplate.generate(cppStruct);

    final String expectedResult =
        EXPECTED_COMMENT_RESULT + String.format(EXPECTED_STRUCT_RESULT_FORMAT, "");
    assertEquals(expectedResult, result);
  }

  @Test
  public void structWithField() {
    cppStruct.fields.add(cppField);

    String result = CppPureStructTemplate.generate(cppStruct);

    final String expectedFieldResult = String.format(EXPECTED_FIELD_RESULT_FORMAT, "", "");
    final String expectedResult = String.format(EXPECTED_STRUCT_RESULT_FORMAT, expectedFieldResult);
    assertEquals(expectedResult, result);
  }

  @Test
  public void structWithFieldWithComment() {
    cppField.comment = COMMENT_STRING;
    cppStruct.fields.add(cppField);

    String result = CppPureStructTemplate.generate(cppStruct);

    final String expectedFieldResult =
        String.format(EXPECTED_FIELD_RESULT_FORMAT, EXPECTED_COMMENT_RESULT + "    ", "");
    final String expectedResult = String.format(EXPECTED_STRUCT_RESULT_FORMAT, expectedFieldResult);
    assertEquals(expectedResult, result);
  }

  @Test
  public void structWithFieldWithInitializer() {
    cppField.initializer = new CppValue("valuable");
    cppStruct.fields.add(cppField);

    String result = CppPureStructTemplate.generate(cppStruct);

    final String expectedFieldResult =
        String.format(EXPECTED_FIELD_RESULT_FORMAT, "", " = valuable");
    final String expectedResult = String.format(EXPECTED_STRUCT_RESULT_FORMAT, expectedFieldResult);
    assertEquals(expectedResult, result);
  }

  @Test
  public void structWithTwoFields() {
    CppField anotherCppField = new CppField();
    anotherCppField.name = "canola";
    anotherCppField.type = new CppComplexTypeRef("Also");
    cppStruct.fields.add(cppField);
    cppStruct.fields.add(anotherCppField);

    String result = CppPureStructTemplate.generate(cppStruct);

    final String expectedFieldResult = String.format(EXPECTED_FIELD_RESULT_FORMAT, "", "");
    final String expectedAnotherFieldResult = "    Also canola;\n";
    final String expectedResult =
        String.format(
            EXPECTED_STRUCT_RESULT_FORMAT, expectedFieldResult + expectedAnotherFieldResult);
    assertEquals(expectedResult, result);
  }
}
