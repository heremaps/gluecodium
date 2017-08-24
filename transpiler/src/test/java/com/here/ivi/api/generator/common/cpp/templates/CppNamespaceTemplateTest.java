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

package com.here.ivi.api.generator.common.cpp.templates;

import static org.junit.Assert.assertEquals;

import com.here.ivi.api.generator.common.TemplateEngine;
import com.here.ivi.api.model.cppmodel.CppClass;
import com.here.ivi.api.model.cppmodel.CppComplexTypeRef;
import com.here.ivi.api.model.cppmodel.CppConstant;
import com.here.ivi.api.model.cppmodel.CppEnum;
import com.here.ivi.api.model.cppmodel.CppNamespace;
import com.here.ivi.api.model.cppmodel.CppPrimitiveTypeRef;
import com.here.ivi.api.model.cppmodel.CppStruct;
import com.here.ivi.api.model.cppmodel.CppUsing;
import com.here.ivi.api.model.cppmodel.CppValue;
import java.util.Arrays;
import java.util.Collections;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class CppNamespaceTemplateTest {

  private static final String TEMPLATE_NAME = "cpp/CppNamespace";

  private static final String EXPECTED_NAMESPACE_BODY_FORMAT =
      "#pragma once\n%s\nnamespace outerSpace {\n%s\n}\n";

  private final CppPrimitiveTypeRef cppPrimitiveTypeRef =
      new CppPrimitiveTypeRef(CppPrimitiveTypeRef.Type.INT32);
  private final CppComplexTypeRef cppComplexTypeRef =
      new CppComplexTypeRef.Builder("Party").build();
  private final CppConstant cppConstant =
      new CppConstant("permanent", cppComplexTypeRef, new CppValue("Over9000"));
  private final CppUsing cppUsing = new CppUsing("Definite", cppComplexTypeRef);
  private final CppEnum cppEnum = new CppEnum("Innumerable");
  private final CppStruct cppStruct = new CppStruct("Structural");
  private final CppClass cppClass = new CppClass.Builder("Classy").build();

  private final CppNamespace cppNamespace =
      new CppNamespace(Collections.singletonList("outerSpace"));

  @Test
  public void emptyNamespace() {
    String result = TemplateEngine.render(TEMPLATE_NAME, cppNamespace);

    final String expectedResult = String.format(EXPECTED_NAMESPACE_BODY_FORMAT, "", "");
    assertEquals(expectedResult, result);
  }

  @Test
  public void nestedNamespaces() {
    CppNamespace cppNamespace = new CppNamespace(Arrays.asList("outer", "inner"));

    String result = TemplateEngine.render(TEMPLATE_NAME, cppNamespace);

    final String expectedResult =
        "#pragma once\n\nnamespace outer {\n\nnamespace inner {\n\n}\n}\n";
    assertEquals(expectedResult, result);
  }

  @Test
  public void namespaceWithOneConstant() {
    cppNamespace.members.add(cppConstant);

    String result = TemplateEngine.render(TEMPLATE_NAME, cppNamespace);

    final String expectedResult =
        String.format(
            EXPECTED_NAMESPACE_BODY_FORMAT, "", "\nstatic const Party permanent = Over9000;\n");
    assertEquals(expectedResult, result);
  }

  @Test
  public void namespaceWithTwoConstants() {
    cppNamespace.members.add(cppConstant);
    cppNamespace.members.add(new CppConstant("transient", cppPrimitiveTypeRef, new CppValue("42")));

    String result = TemplateEngine.render(TEMPLATE_NAME, cppNamespace);

    final String expectedResult =
        String.format(
            EXPECTED_NAMESPACE_BODY_FORMAT,
            "\n#include <cstdint>\n",
            "\nstatic const Party permanent = Over9000;\nstatic const int32_t transient = 42;\n");
    assertEquals(expectedResult, result);
  }

  @Test
  public void namespaceWithOneUsing() {
    cppNamespace.members.add(cppUsing);

    String result = TemplateEngine.render(TEMPLATE_NAME, cppNamespace);

    final String expectedResult =
        String.format(EXPECTED_NAMESPACE_BODY_FORMAT, "", "\nusing Definite = Party;\n");
    assertEquals(expectedResult, result);
  }

  @Test
  public void namespaceWithTwoUsings() {
    cppNamespace.members.add(cppUsing);
    cppNamespace.members.add(new CppUsing("Indefinite", cppPrimitiveTypeRef));

    String result = TemplateEngine.render(TEMPLATE_NAME, cppNamespace);

    final String expectedResult =
        String.format(
            EXPECTED_NAMESPACE_BODY_FORMAT,
            "\n#include <cstdint>\n",
            "\nusing Definite = Party;\nusing Indefinite = int32_t;\n");
    assertEquals(expectedResult, result);
  }

  @Test
  public void namespaceWithOneEnum() {
    cppNamespace.members.add(cppEnum);

    String result = TemplateEngine.render(TEMPLATE_NAME, cppNamespace);

    final String expectedResult =
        String.format(EXPECTED_NAMESPACE_BODY_FORMAT, "", "\nenum Innumerable {\n\n};\n");
    assertEquals(expectedResult, result);
  }

  @Test
  public void namespaceWithTwoEnums() {
    cppNamespace.members.add(cppEnum);
    cppNamespace.members.add(new CppEnum("SomeEnum"));

    String result = TemplateEngine.render(TEMPLATE_NAME, cppNamespace);

    final String expectedResult =
        String.format(
            EXPECTED_NAMESPACE_BODY_FORMAT,
            "",
            "\nenum Innumerable {\n\n};\nenum SomeEnum {\n\n};\n");
    assertEquals(expectedResult, result);
  }

  @Test
  public void namespaceWithOneStruct() {
    cppNamespace.members.add(cppStruct);

    String result = TemplateEngine.render(TEMPLATE_NAME, cppNamespace);

    final String expectedResult =
        String.format(EXPECTED_NAMESPACE_BODY_FORMAT, "", "\nstruct Structural {\n};\n");
    assertEquals(expectedResult, result);
  }

  @Test
  public void namespaceWithTwoStructs() {
    cppNamespace.members.add(cppStruct);
    cppNamespace.members.add(new CppStruct("SomeStruct"));

    String result = TemplateEngine.render(TEMPLATE_NAME, cppNamespace);

    final String expectedResult =
        String.format(
            EXPECTED_NAMESPACE_BODY_FORMAT,
            "",
            "\nstruct Structural {\n};\nstruct SomeStruct {\n};\n");
    assertEquals(expectedResult, result);
  }

  @Test
  public void namespaceWithOneClass() {
    cppNamespace.members.add(cppClass);

    String result = TemplateEngine.render(TEMPLATE_NAME, cppNamespace);

    final String expectedResult =
        String.format(EXPECTED_NAMESPACE_BODY_FORMAT, "", "\nclass Classy {\n};\n");
    assertEquals(expectedResult, result);
  }

  @Test
  public void namespaceWithTwoClasses() {
    cppNamespace.members.add(cppClass);
    cppNamespace.members.add(new CppClass.Builder("Classified").build());

    String result = TemplateEngine.render(TEMPLATE_NAME, cppNamespace);

    final String expectedResult =
        String.format(
            EXPECTED_NAMESPACE_BODY_FORMAT, "", "\nclass Classy {\n};\nclass Classified {\n};\n");
    assertEquals(expectedResult, result);
  }
}
