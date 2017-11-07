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
import com.here.ivi.api.model.common.Include;
import com.here.ivi.api.model.cppmodel.CppClass;
import com.here.ivi.api.model.cppmodel.CppComplexTypeRef;
import com.here.ivi.api.model.cppmodel.CppConstant;
import com.here.ivi.api.model.cppmodel.CppEnum;
import com.here.ivi.api.model.cppmodel.CppFile;
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
public final class CppHeaderTemplateTest {

  private static final String TEMPLATE_NAME = "cpp/CppHeader";

  private static final String EXPECTED_NAMESPACE_BODY_FORMAT =
      "\n#pragma once\n\nnamespace outerSpace {\n%s\n}\n";
  private static final String EXPECTED_NAMESPACE_INCLUDE_FORMAT =
      "\n#pragma once\n%s\nnamespace outerSpace {\n\n}\n";

  private final CppPrimitiveTypeRef cppPrimitiveTypeRef = CppPrimitiveTypeRef.INT32;
  private final CppComplexTypeRef cppComplexTypeRef =
      new CppComplexTypeRef.Builder("Party").build();
  private final CppConstant cppConstant =
      new CppConstant("permanent", cppComplexTypeRef, new CppValue("Over9000"));
  private final CppUsing cppUsing = new CppUsing("Definite", cppComplexTypeRef);
  private final CppEnum cppEnum = CppEnum.create("Innumerable");
  private final CppStruct cppStruct = new CppStruct("Structural");
  private final CppClass cppClass = new CppClass("Classy");
  private final Include systemInclude = Include.createSystemInclude("lasertag");

  private final CppFile cppFile = new CppFile(Collections.singletonList("outerSpace"));

  @Test
  public void emptyNamespace() {
    String result = TemplateEngine.render(TEMPLATE_NAME, cppFile);

    final String expectedResult = String.format(EXPECTED_NAMESPACE_BODY_FORMAT, "");
    assertEquals(expectedResult, result);
  }

  @Test
  public void nestedNamespaces() {
    CppFile resultFile = new CppFile(Arrays.asList("outer", "inner"));

    String result = TemplateEngine.render(TEMPLATE_NAME, resultFile);

    final String expectedResult =
        "\n#pragma once\n\nnamespace outer {\n\nnamespace inner {\n\n}\n}\n";
    assertEquals(expectedResult, result);
  }

  @Test
  public void namespaceWithOneConstant() {
    cppFile.members.add(cppConstant);

    String result = TemplateEngine.render(TEMPLATE_NAME, cppFile);

    final String expectedResult =
        String.format(
            EXPECTED_NAMESPACE_BODY_FORMAT, "\nstatic const Party permanent = Over9000;\n");
    assertEquals(expectedResult, result);
  }

  @Test
  public void namespaceWithTwoConstants() {
    cppFile.members.add(cppConstant);
    cppFile.members.add(new CppConstant("transient", cppPrimitiveTypeRef, new CppValue("42")));

    String result = TemplateEngine.render(TEMPLATE_NAME, cppFile);

    final String expectedResult =
        String.format(
            EXPECTED_NAMESPACE_BODY_FORMAT,
            "\nstatic const Party permanent = Over9000;\nstatic const int32_t transient = 42;\n");
    assertEquals(expectedResult, result);
  }

  @Test
  public void namespaceWithOneUsing() {
    cppFile.members.add(cppUsing);

    String result = TemplateEngine.render(TEMPLATE_NAME, cppFile);

    final String expectedResult =
        String.format(EXPECTED_NAMESPACE_BODY_FORMAT, "\nusing Definite = Party;\n");
    assertEquals(expectedResult, result);
  }

  @Test
  public void namespaceWithTwoUsings() {
    cppFile.members.add(cppUsing);
    cppFile.members.add(new CppUsing("Indefinite", cppPrimitiveTypeRef));

    String result = TemplateEngine.render(TEMPLATE_NAME, cppFile);

    final String expectedResult =
        String.format(
            EXPECTED_NAMESPACE_BODY_FORMAT,
            "\nusing Definite = Party;\nusing Indefinite = int32_t;\n");
    assertEquals(expectedResult, result);
  }

  @Test
  public void namespaceWithOneEnum() {
    cppFile.members.add(cppEnum);

    String result = TemplateEngine.render(TEMPLATE_NAME, cppFile);

    final String expectedResult =
        String.format(EXPECTED_NAMESPACE_BODY_FORMAT, "\nenum Innumerable {\n\n};\n");
    assertEquals(expectedResult, result);
  }

  @Test
  public void namespaceWithTwoEnums() {
    cppFile.members.add(cppEnum);
    cppFile.members.add(CppEnum.create("SomeEnum"));

    String result = TemplateEngine.render(TEMPLATE_NAME, cppFile);

    final String expectedResult =
        String.format(
            EXPECTED_NAMESPACE_BODY_FORMAT, "\nenum Innumerable {\n\n};\nenum SomeEnum {\n\n};\n");
    assertEquals(expectedResult, result);
  }

  @Test
  public void namespaceWithOneStruct() {
    cppFile.members.add(cppStruct);

    String result = TemplateEngine.render(TEMPLATE_NAME, cppFile);

    final String expectedResult =
        String.format(EXPECTED_NAMESPACE_BODY_FORMAT, "\nstruct Structural {\n};\n");
    assertEquals(expectedResult, result);
  }

  @Test
  public void namespaceWithTwoStructs() {
    cppFile.members.add(cppStruct);
    cppFile.members.add(new CppStruct("SomeStruct"));

    String result = TemplateEngine.render(TEMPLATE_NAME, cppFile);

    final String expectedResult =
        String.format(
            EXPECTED_NAMESPACE_BODY_FORMAT, "\nstruct Structural {\n};\nstruct SomeStruct {\n};\n");
    assertEquals(expectedResult, result);
  }

  @Test
  public void namespaceWithOneClass() {
    cppFile.members.add(cppClass);

    String result = TemplateEngine.render(TEMPLATE_NAME, cppFile);

    String expectedBodyCode =
        "\nclass Classy {\n" + "public:\n" + "    virtual ~Classy() = 0;\n" + "\n" + "};\n";
    final String expectedResult = String.format(EXPECTED_NAMESPACE_BODY_FORMAT, expectedBodyCode);
    assertEquals(expectedResult, result);
  }

  @Test
  public void namespaceWithTwoClasses() {
    cppFile.members.add(cppClass);
    cppFile.members.add(new CppClass("Classified"));

    String result = TemplateEngine.render(TEMPLATE_NAME, cppFile);

    String expectedBodyCode =
        "\nclass Classy {\n"
            + "public:\n"
            + "    virtual ~Classy() = 0;\n"
            + "\n"
            + "};\n"
            + "class Classified {\n"
            + "public:\n"
            + "    virtual ~Classified() = 0;\n"
            + "\n"
            + "};\n";
    final String expectedResult = String.format(EXPECTED_NAMESPACE_BODY_FORMAT, expectedBodyCode);
    assertEquals(expectedResult, result);
  }

  @Test
  public void namespaceWithOneInclude() {
    cppFile.includes.add(systemInclude);

    String result = TemplateEngine.render(TEMPLATE_NAME, cppFile);

    final String expectedResult =
        String.format(EXPECTED_NAMESPACE_INCLUDE_FORMAT, "\n#include <lasertag>\n");
    assertEquals(expectedResult, result);
  }

  @Test
  public void namespaceWithTwoIncludes() {
    cppFile.includes.add(systemInclude);
    cppFile.includes.add(Include.createInternalInclude("foo.bar"));

    String result = TemplateEngine.render(TEMPLATE_NAME, cppFile);

    final String expectedResult =
        String.format(
            EXPECTED_NAMESPACE_INCLUDE_FORMAT, "\n#include \"foo.bar\"\n#include <lasertag>\n");
    assertEquals(expectedResult, result);
  }
}
