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

import com.here.ivi.api.model.cppmodel.CppEnum;
import com.here.ivi.api.model.cppmodel.CppEnumItem;
import com.here.ivi.api.model.cppmodel.CppValue;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class CppEnumTemplateTest {

  private static final String COMMENT_STRING = "nonsense";
  private static final String ENUM_NAME = "Innumerable";
  private static final String ENUM_ITEM_NAME = "Very";
  private static final String EXPECTED_ENUM_RESULT_FORMAT = "enum " + ENUM_NAME + " {\n%s};\n";
  private static final String EXPECTED_COMMENT_RESULT = "/**\n* nonsense\n*/\n";
  private static final String EXPECTED_ITEM_RESULT_FORMAT = "    %s" + ENUM_ITEM_NAME + "%s\n";

  private CppEnum cppEnum = new CppEnum(ENUM_NAME);
  private CppEnumItem cppEnumItem = new CppEnumItem();

  @Before
  public void setUp() {
    cppEnumItem.name = ENUM_ITEM_NAME;
  }

  @Test
  public void enumWithoutComment() {
    String result = CppEnumTemplate.generate(cppEnum);

    final String expectedResult = String.format(EXPECTED_ENUM_RESULT_FORMAT, "\n");
    assertEquals(expectedResult, result);
  }

  @Test
  public void enumWithComment() {
    cppEnum.comment = COMMENT_STRING;

    String result = CppEnumTemplate.generate(cppEnum);

    final String expectedResult =
        EXPECTED_COMMENT_RESULT + String.format(EXPECTED_ENUM_RESULT_FORMAT, "\n");
    assertEquals(expectedResult, result);
  }

  @Test
  public void enumWithClass() {
    String result = CppEnumTemplate.generate(new CppEnum(ENUM_NAME, true));

    final String expectedResult = "enum class " + ENUM_NAME + " {\n\n};\n";
    assertEquals(expectedResult, result);
  }

  @Test
  public void enumWithItem() {
    cppEnum.items.add(cppEnumItem);

    String result = CppEnumTemplate.generate(cppEnum);

    final String expectedItemResult = String.format(EXPECTED_ITEM_RESULT_FORMAT, "", "");
    final String expectedResult = String.format(EXPECTED_ENUM_RESULT_FORMAT, expectedItemResult);
    assertEquals(expectedResult, result);
  }

  @Test
  public void enumWithItemWithComment() {
    cppEnumItem.comment = COMMENT_STRING;
    cppEnum.items.add(cppEnumItem);

    String result = CppEnumTemplate.generate(cppEnum);

    final String expectedItemResult =
        String.format(EXPECTED_ITEM_RESULT_FORMAT, EXPECTED_COMMENT_RESULT + "    ", "");
    final String expectedResult = String.format(EXPECTED_ENUM_RESULT_FORMAT, expectedItemResult);
    assertEquals(expectedResult, result);
  }

  @Test
  public void enumWithItemWithValue() {
    cppEnumItem.value = new CppValue("valuable");
    cppEnum.items.add(cppEnumItem);

    String result = CppEnumTemplate.generate(cppEnum);

    final String expectedItemResult = String.format(EXPECTED_ITEM_RESULT_FORMAT, "", " = valuable");
    final String expectedResult = String.format(EXPECTED_ENUM_RESULT_FORMAT, expectedItemResult);
    assertEquals(expectedResult, result);
  }

  @Test
  public void enumWithTwoItems() {
    CppEnumItem anotherCppEnumItem = new CppEnumItem();
    anotherCppEnumItem.name = "Less";
    cppEnum.items.add(cppEnumItem);
    cppEnum.items.add(anotherCppEnumItem);

    String result = CppEnumTemplate.generate(cppEnum);

    final String expectedItemResult = String.format(EXPECTED_ITEM_RESULT_FORMAT, "", ",");
    final String expectedAnotherItemResult = "    Less\n";
    final String expectedResult =
        String.format(EXPECTED_ENUM_RESULT_FORMAT, expectedItemResult + expectedAnotherItemResult);
    assertEquals(expectedResult, result);
  }
}
