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

package com.here.genium.generator.java.templates;

import static org.junit.Assert.assertEquals;

import com.here.genium.generator.common.TemplateEngine;
import com.here.genium.model.java.JavaConstant;
import com.here.genium.model.java.JavaCustomType;
import com.here.genium.model.java.JavaReferenceType;
import com.here.genium.model.java.JavaReferenceType.Type;
import com.here.genium.model.java.JavaValue;
import com.here.genium.model.java.JavaVisibility;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class JavaConstantTemplateTest {

  private static final String TEMPLATE_NAME = "java/Constant";

  @Test
  public void generateStringConstant() {
    // Arrange
    JavaConstant javaConstant =
        new JavaConstant(
            new JavaReferenceType(Type.STRING), "STRING_CONSTANT", new JavaValue("\"myString\""));
    javaConstant.comment = "Constant string comment";
    String expected =
        "/**\n"
            + " * Constant string comment\n"
            + " */\n"
            + "static final String STRING_CONSTANT = \"myString\";";

    // Act
    String generated = TemplateEngine.render(TEMPLATE_NAME, javaConstant);

    // Assert
    assertEquals(expected, generated);
  }

  @Test
  public void generateCustomTypeConstant() {
    // Arrange
    JavaConstant javaConstant =
        new JavaConstant(
            new JavaCustomType("ConstantType"),
            "EXAMPLE_CONSTANT",
            new JavaValue("new ConstantType()"));
    javaConstant.visibility = JavaVisibility.PUBLIC;
    javaConstant.comment = "Constant javadoc comment";
    String expected =
        "/**\n"
            + " * Constant javadoc comment\n"
            + " */\n"
            + "public static final ConstantType EXAMPLE_CONSTANT = new ConstantType();";

    // Act
    String generated = TemplateEngine.render(TEMPLATE_NAME, javaConstant);

    // Assert
    assertEquals(expected, generated);
  }
}
