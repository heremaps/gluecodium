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
import com.here.ivi.api.model.javamodel.JavaCustomType;
import com.here.ivi.api.model.javamodel.JavaField;
import com.here.ivi.api.model.javamodel.JavaPrimitiveType;
import com.here.ivi.api.model.javamodel.JavaReferenceType;
import com.here.ivi.api.model.javamodel.JavaValue;
import com.here.ivi.api.model.javamodel.JavaVisibility;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class JavaFieldTemplateTest {
  @Test
  public void generate_simple() {
    // Arrange
    JavaField javaField =
        new JavaField(new JavaPrimitiveType(JavaPrimitiveType.Type.INT), "intField");

    // Act
    String generated = TemplateEngine.render("java/Field", javaField);

    // Assert
    assertEquals("int intField;", generated);
  }

  @Test
  public void generate_fieldWithInitialValueAndVisibility() {
    // Arrange
    JavaField javaField =
        new JavaField(
            new JavaPrimitiveType(JavaPrimitiveType.Type.INT), "intField", new JavaValue("1"));
    javaField.visibility = JavaVisibility.PRIVATE;

    // Act
    String generated = TemplateEngine.render("java/Field", javaField);

    // Assert
    assertEquals("private int intField = 1;", generated);
  }

  @Test
  public void generate_stringFieldWithComment() {
    // Arrange
    JavaField javaField =
        new JavaField(new JavaReferenceType(JavaReferenceType.Type.STRING), "stringField");
    javaField.visibility = JavaVisibility.PUBLIC;
    javaField.comment = "Field comment";
    String expected = "/**\n" + " * Field comment\n" + " */\n" + "public String stringField;";

    // Act
    String generated = TemplateEngine.render("java/Field", javaField);

    // Assert
    assertEquals(expected, generated);
  }

  @Test
  public void generate_customTypeWithInitializer() {
    // Arrange
    JavaField javaField = new JavaField(new JavaCustomType("CustomType"), "customField");
    String expected = "CustomType customField = new CustomType();";

    // Act
    String generated = TemplateEngine.render("java/Field", javaField);

    // Assert
    assertEquals(expected, generated);
  }
}
