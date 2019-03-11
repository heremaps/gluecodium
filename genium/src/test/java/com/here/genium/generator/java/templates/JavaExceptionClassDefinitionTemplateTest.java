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
import com.here.genium.model.java.*;
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
            javaImport);
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
