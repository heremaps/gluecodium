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
import com.here.genium.model.cpp.CppEnum;
import com.here.genium.model.cpp.CppEnumItem;
import com.here.genium.model.cpp.CppValue;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class CppEnumTemplateTest {

  public static final String TEMPLATE_NAME = "cpp/CppEnum";

  private static final String COMMENT_STRING = "nonsense";
  private static final String ENUM_NAME = "Innumerable";
  private static final String ENUM_ITEM_NAME = "Very";
  private static final String EXPECTED_ENUM_RESULT_FORMAT = "enum " + ENUM_NAME + " {\n%s};\n";
  private static final String EXPECTED_ENUM_COMMENT_RESULT = "/**\n * nonsense\n */\n";
  private static final String EXPECTED_ITEM_COMMENT_RESULT = "/**\n     * nonsense\n     */\n";
  private static final String EXPECTED_ITEM_RESULT_FORMAT = "    %s" + ENUM_ITEM_NAME + "%s\n";

  private final CppEnum cppEnum = CppEnum.create(ENUM_NAME);
  private final CppEnumItem cppEnumItem = new CppEnumItem(ENUM_ITEM_NAME);

  @Test
  public void enumWithoutComment() {
    String result = TemplateEngine.render(TEMPLATE_NAME, cppEnum);

    final String expectedResult = String.format(EXPECTED_ENUM_RESULT_FORMAT, "\n");
    assertEquals(expectedResult, result);
  }

  @Test
  public void enumWithComment() {
    cppEnum.comment = COMMENT_STRING;

    String result = TemplateEngine.render(TEMPLATE_NAME, cppEnum);

    final String expectedResult =
        EXPECTED_ENUM_COMMENT_RESULT + String.format(EXPECTED_ENUM_RESULT_FORMAT, "\n");
    assertEquals(expectedResult, result);
  }

  @Test
  public void enumWithClass() {
    String result = TemplateEngine.render(TEMPLATE_NAME, CppEnum.createScoped(ENUM_NAME));

    final String expectedResult = "enum class " + ENUM_NAME + " {\n\n};\n";
    assertEquals(expectedResult, result);
  }

  @Test
  public void enumWithItem() {
    cppEnum.items.add(cppEnumItem);

    String result = TemplateEngine.render(TEMPLATE_NAME, cppEnum);

    final String expectedItemResult = String.format(EXPECTED_ITEM_RESULT_FORMAT, "", "");
    final String expectedResult = String.format(EXPECTED_ENUM_RESULT_FORMAT, expectedItemResult);
    assertEquals(expectedResult, result);
  }

  @Test
  public void enumWithItemWithComment() {
    cppEnumItem.comment = COMMENT_STRING;
    cppEnum.items.add(cppEnumItem);

    String result = TemplateEngine.render(TEMPLATE_NAME, cppEnum);

    final String expectedItemResult =
        String.format(EXPECTED_ITEM_RESULT_FORMAT, EXPECTED_ITEM_COMMENT_RESULT + "    ", "");
    final String expectedResult = String.format(EXPECTED_ENUM_RESULT_FORMAT, expectedItemResult);
    assertEquals(expectedResult, result);
  }

  @Test
  public void enumWithItemWithValue() {
    cppEnum.items.add(new CppEnumItem(ENUM_ITEM_NAME, new CppValue("valuable")));

    String result = TemplateEngine.render(TEMPLATE_NAME, cppEnum);

    final String expectedItemResult = String.format(EXPECTED_ITEM_RESULT_FORMAT, "", " = valuable");
    final String expectedResult = String.format(EXPECTED_ENUM_RESULT_FORMAT, expectedItemResult);
    assertEquals(expectedResult, result);
  }

  @Test
  public void enumWithTwoItems() {
    cppEnum.items.add(cppEnumItem);
    cppEnum.items.add(new CppEnumItem("Less"));

    String result = TemplateEngine.render(TEMPLATE_NAME, cppEnum);

    final String expectedItemResult = String.format(EXPECTED_ITEM_RESULT_FORMAT, "", ",");
    final String expectedAnotherItemResult = "    Less\n";
    final String expectedResult =
        String.format(EXPECTED_ENUM_RESULT_FORMAT, expectedItemResult + expectedAnotherItemResult);
    assertEquals(expectedResult, result);
  }
}
