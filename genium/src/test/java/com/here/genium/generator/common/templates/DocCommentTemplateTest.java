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

package com.here.genium.generator.common.templates;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import com.here.genium.generator.common.TemplateEngine;
import com.here.genium.model.cpp.CppElementWithComment;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class DocCommentTemplateTest {
  private static final String TEMPLATE_NAME = "common/DocComment";
  private final CppElementWithComment cppElement = new CppElementWithComment("") {};

  @Test
  public void nullComment() {
    String result = TemplateEngine.render(TEMPLATE_NAME, cppElement);

    assertTrue(result.isEmpty());
  }

  @Test
  public void emptyComment() {
    cppElement.comment = "";

    String result = TemplateEngine.render(TEMPLATE_NAME, cppElement);

    assertTrue(result.isEmpty());
  }

  @Test
  public void someComment() {
    cppElement.comment = "nonsense";

    String result = TemplateEngine.render(TEMPLATE_NAME, cppElement);

    final String expectedResult = "/**\n * nonsense\n */\n";
    assertEquals(expectedResult, result);
  }

  @Test
  public void multiLineComment() {
    cppElement.comment = "complete\nnonsense";

    String result = TemplateEngine.render(TEMPLATE_NAME, cppElement);

    final String expectedResult = "/**\n * complete\n * nonsense\n */\n";
    assertEquals(expectedResult, result);
  }
}
