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

import com.here.ivi.api.generator.common.TemplateEngine;
import com.here.ivi.api.model.javamodel.JavaConstant;
import com.here.ivi.api.model.javamodel.JavaCustomType;
import com.here.ivi.api.model.javamodel.JavaReferenceType;
import com.here.ivi.api.model.javamodel.JavaReferenceType.Type;
import com.here.ivi.api.model.javamodel.JavaValue;
import com.here.ivi.api.model.javamodel.JavaVisibility;
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
