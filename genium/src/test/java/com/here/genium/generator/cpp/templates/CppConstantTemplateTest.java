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
import com.here.genium.model.cpp.CppConstant;
import com.here.genium.model.cpp.CppValue;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class CppConstantTemplateTest {

  private static final String TEMPLATE_NAME = "cpp/CppConstant";

  private static final String CONSTANT_NAME = "permanent";
  private static final String TYPE_NAME = "Typical";
  private static final String VALUE_NAME = "valuable";
  private static final String EXPECTED_RESULT = "static const Typical permanent = valuable;\n";

  private final CppConstant cppConstant =
      new CppConstant(
          CONSTANT_NAME,
          new CppComplexTypeRef.Builder(TYPE_NAME).build(),
          new CppValue(VALUE_NAME));

  @Test
  public void nullComment() {
    String result = TemplateEngine.render(TEMPLATE_NAME, cppConstant);

    assertEquals(EXPECTED_RESULT, result);
  }

  @Test
  public void emptyComment() {
    cppConstant.comment = "";

    String result = TemplateEngine.render(TEMPLATE_NAME, cppConstant);

    assertEquals(EXPECTED_RESULT, result);
  }

  @Test
  public void someComment() {
    cppConstant.comment = "nonsense";

    String result = TemplateEngine.render(TEMPLATE_NAME, cppConstant);

    assertEquals("/**\n * nonsense\n */\n" + EXPECTED_RESULT, result);
  }
}
