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

package com.here.ivi.api.generator.java.templates;

import static org.junit.Assert.assertEquals;

import com.here.ivi.api.generator.common.TemplateEngine;
import com.here.ivi.api.model.javamodel.JavaEnum;
import com.here.ivi.api.model.javamodel.JavaEnumItem;
import com.here.ivi.api.model.javamodel.JavaPackage;
import com.here.ivi.api.model.javamodel.JavaValue;
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
    javaEnum.comment = "A test enum";
    javaEnum.items.add(new JavaEnumItem("FooName", new JavaValue("42")));
    javaEnum.items.add(new JavaEnumItem("BarName", new JavaValue("314")));

    String expected =
        "/**\n"
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
    String generated = TemplateEngine.render("java/Enum", javaEnum);

    // Assert
    assertEquals(expected, generated);
  }

  @Test
  public void generate_topLevel() {
    // Arrange
    JavaEnum javaEnum = new JavaEnum("MyEnum");
    javaEnum.javaPackage = new JavaPackage(Arrays.asList("com", "here", "enums", "example"));
    javaEnum.comment = "A test enum";
    javaEnum.items.add(new JavaEnumItem("FooName", new JavaValue("42")));
    javaEnum.items.add(new JavaEnumItem("BarName", new JavaValue("314")));

    String expected =
        "package com.here.enums.example;\n"
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
