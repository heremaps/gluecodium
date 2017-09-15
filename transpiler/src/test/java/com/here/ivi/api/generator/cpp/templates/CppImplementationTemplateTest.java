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

package com.here.ivi.api.generator.cpp.templates;

import static org.junit.Assert.assertEquals;

import com.here.ivi.api.generator.common.TemplateEngine;
import com.here.ivi.api.model.cppmodel.*;
import java.util.Arrays;
import java.util.Collections;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class CppImplementationTemplateTest {

  private static final String TEMPLATE_NAME = "cpp/CppImplementation";

  private static final String EXPECTED_NAMESPACE_BODY_FORMAT = "\nnamespace outerSpace {\n%s\n}\n";

  private final CppMethod cppMethod = new CppMethod.Builder("methodical").build();
  private final CppClass cppClass = new CppClass("Classy");

  private final CppFile cppFile = new CppFile(Collections.singletonList("outerSpace"));

  @Before
  public void setUp() {
    cppClass.methods.add(cppMethod);
    cppFile.members.add(cppClass);
  }

  @Test
  public void emptyNamespace() {
    cppFile.members.clear();

    String result = TemplateEngine.render(TEMPLATE_NAME, cppFile);

    final String expectedResult = String.format(EXPECTED_NAMESPACE_BODY_FORMAT, "");
    assertEquals(expectedResult, result);
  }

  @Test
  public void nestedNamespaces() {
    this.cppFile.members.clear();

    CppFile cppFile = new CppFile(Arrays.asList("outer", "inner"));

    String result = TemplateEngine.render(TEMPLATE_NAME, cppFile);

    final String expectedResult = "\nnamespace outer {\n\nnamespace inner {\n\n}\n}\n";
    assertEquals(expectedResult, result);
  }

  @Test
  public void namespaceWithOneClass() {
    String result = TemplateEngine.render(TEMPLATE_NAME, cppFile);

    final String expectedResult =
        String.format(EXPECTED_NAMESPACE_BODY_FORMAT, "\nClassy::~Classy() = default;\n");
    assertEquals(expectedResult, result);
  }

  @Test
  public void namespaceWithOneStaticClass() {
    cppMethod.specifiers.add(CppMethod.Specifier.STATIC);

    String result = TemplateEngine.render(TEMPLATE_NAME, cppFile);

    final String expectedResult = String.format(EXPECTED_NAMESPACE_BODY_FORMAT, "");
    assertEquals(expectedResult, result);
  }

  @Test
  public void namespaceWithTwoClasses() {
    CppClass anotherCppClass = new CppClass("Classified");
    anotherCppClass.methods.add(cppMethod);
    cppFile.members.add(anotherCppClass);

    String result = TemplateEngine.render(TEMPLATE_NAME, cppFile);

    final String expectedResult =
        String.format(
            EXPECTED_NAMESPACE_BODY_FORMAT,
            "\nClassy::~Classy() = default;\n\nClassified::~Classified() = default;\n");
    assertEquals(expectedResult, result);
  }
}
