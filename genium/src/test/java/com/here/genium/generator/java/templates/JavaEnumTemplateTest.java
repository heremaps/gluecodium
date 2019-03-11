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
import com.here.genium.model.java.JavaEnum;
import com.here.genium.model.java.JavaEnumItem;
import com.here.genium.model.java.JavaPackage;
import com.here.genium.model.java.JavaValue;
import com.here.genium.model.java.JavaVisibility;
import java.util.Arrays;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
@SuppressWarnings({"MethodName"})
public final class JavaEnumTemplateTest {
  private static final String TEST_COPYRIGHT_HEADER =
      TemplateEngine.render("java/CopyrightHeader", null) + "\n";

  @Test
  public void generate_empty() {
    // Arrange
    JavaEnum javaEnum = new JavaEnum("MyEnum");

    String expected =
        "enum MyEnum {\n"
            + "\n"
            + "\n"
            + "    public final int value;\n"
            + "\n"
            + "    MyEnum(final int value) {\n"
            + "        this.value = value;\n"
            + "    }\n"
            + "}";

    // Act
    String generated = TemplateEngine.render("java/Enum", javaEnum);

    // Assert
    assertEquals(expected, generated);
  }

  @Test
  public void generate_withValues() {
    // Arrange
    JavaEnum javaEnum = new JavaEnum("MyEnum");
    javaEnum.visibility = JavaVisibility.PUBLIC;
    javaEnum.comment = "A test enum";
    javaEnum.items.add(new JavaEnumItem("FooName", new JavaValue("42")));
    javaEnum.items.add(new JavaEnumItem("BarName", new JavaValue("314")));

    String expected =
        "/**\n"
            + " * A test enum\n"
            + " */\n"
            + "public enum MyEnum {\n"
            + "    FooName(42),\n"
            + "    BarName(314);\n"
            + "\n"
            + "    public final int value;\n"
            + "\n"
            + "    MyEnum(final int value) {\n"
            + "        this.value = value;\n"
            + "    }\n"
            + "}";

    // Act
    String generated = TemplateEngine.render("java/Enum", javaEnum);

    // Assert
    assertEquals(expected, generated);
  }

  @Test
  public void generate_topLevel() {
    // Arrange
    JavaEnum javaEnum = new JavaEnum("MyEnum");
    javaEnum.javaPackage = new JavaPackage(Arrays.asList("com", "example", "enums"));
    javaEnum.comment = "A test enum";
    javaEnum.items.add(new JavaEnumItem("FooName", new JavaValue("42")));
    javaEnum.items.add(new JavaEnumItem("BarName", new JavaValue("314")));

    String expected =
        "package com.example.enums;\n"
            + "\n"
            + "/**\n"
            + " * A test enum\n"
            + " */\n"
            + "enum MyEnum {\n"
            + "    FooName(42),\n"
            + "    BarName(314);\n"
            + "\n"
            + "    public final int value;\n"
            + "\n"
            + "    MyEnum(final int value) {\n"
            + "        this.value = value;\n"
            + "    }\n"
            + "}";

    // Act
    String generated = TemplateEngine.render("java/EnumHeader", javaEnum);

    // Assert
    assertEquals(TEST_COPYRIGHT_HEADER + expected, generated);
  }
}
