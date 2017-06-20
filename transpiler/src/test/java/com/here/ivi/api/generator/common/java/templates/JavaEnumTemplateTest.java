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

package com.here.ivi.api.generator.common.java.templates;

import static org.junit.Assert.assertEquals;

import com.here.ivi.api.model.javamodel.JavaEnum;
import com.here.ivi.api.model.javamodel.JavaEnumItem;
import com.here.ivi.api.model.javamodel.JavaPackage;
import com.here.ivi.api.model.javamodel.JavaValue;
import java.util.Arrays;
import org.eclipse.xtext.junit4.XtextRunner;
import org.junit.Test;
import org.junit.runner.RunWith;

@RunWith(XtextRunner.class)
public final class JavaEnumTemplateTest {
  @Test
  public void simpleEnumGeneration() {
    // Arrange
    JavaEnum javaEnum = new JavaEnum("MyEnum");
    javaEnum.comment = "A test enum";
    javaEnum.items =
        Arrays.asList(
            new JavaEnumItem("FooName", new JavaValue("FooValue")),
            new JavaEnumItem("BarName", new JavaValue("BarValue")));

    // Act
    String generated = JavaEnumTemplate.generate(javaEnum).toString();

    // Assert
    String expected =
        "/**\n"
            + " * A test enum\n"
            + " */\n"
            + "enum MyEnum {\n"
            + "    FooName = FooValue,\n"
            + "    BarName = BarValue\n"
            + "};\n";

    assertEquals(expected, generated);
  }

  @Test
  public void topLevelEnumGeneration() {
    // Arrange
    JavaEnum javaEnum = new JavaEnum("MyEnum");
    javaEnum.isTopLevel = true;
    javaEnum.javaPackage = new JavaPackage(Arrays.asList("com", "here", "enums", "example"));

    javaEnum.comment = "A test enum";
    javaEnum.items =
        Arrays.asList(
            new JavaEnumItem("FooName", new JavaValue("FooValue")),
            new JavaEnumItem("BarName", new JavaValue("BarValue")));

    // Act
    String generated = JavaEnumTemplate.generate(javaEnum).toString();

    // Assert
    String expected =
        "package com.here.enums.example;\n"
            + "\n"
            + "/**\n"
            + " * A test enum\n"
            + " */\n"
            + "enum MyEnum {\n"
            + "    FooName = FooValue,\n"
            + "    BarName = BarValue\n"
            + "};\n";

    assertEquals(expected, generated);
  }
}
