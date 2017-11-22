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
import com.here.ivi.api.model.javamodel.*;
import java.util.Arrays;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class JavaExceptionClassDefinitionTemplateTest {
  private static final String TEMPLATE_NAME = "java/ExceptionDefinition";
  private static final String TEST_COPYRIGHT_HEADER =
      TemplateEngine.render("java/CopyrightHeader", null) + "\n";

  @Test
  public void generate() {
    JavaPackage javaPackage = new JavaPackage(Arrays.asList("com", "example", "android"));
    JavaImport javaImport = new JavaImport("Errors", javaPackage);
    JavaEnumType errorEnum =
        new JavaEnumType(
            "ErrorEnum",
            Arrays.asList("Errors", "ErrorEnum"),
            javaPackage.packageNames,
            javaImport,
            null);
    JavaExceptionClass javaExceptionClass =
        new JavaExceptionClass("ExceptionalException", errorEnum, javaPackage);

    String generated = TemplateEngine.render(TEMPLATE_NAME, javaExceptionClass);

    String expected =
        TEST_COPYRIGHT_HEADER
            + "package com.example.android;\n"
            + "\n"
            + "\n"
            + "public class ExceptionalException extends Exception {\n"
            + "    public ExceptionalException(final ErrorEnum error) {\n"
            + "        super(Integer.toString(error.value));\n"
            + "        this.error = error;\n"
            + "    }\n"
            + "    public final ErrorEnum error;\n"
            + "}\n";
    assertEquals(expected, generated);
  }
}
