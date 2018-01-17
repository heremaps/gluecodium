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
import com.here.ivi.api.model.cpp.CppClass;
import com.here.ivi.api.model.cpp.CppComplexTypeRef;
import com.here.ivi.api.model.cpp.CppEnum;
import com.here.ivi.api.model.cpp.CppField;
import com.here.ivi.api.model.cpp.CppInheritance;
import com.here.ivi.api.model.cpp.CppMethod;
import com.here.ivi.api.model.cpp.CppPrimitiveTypeRef;
import com.here.ivi.api.model.cpp.CppStruct;
import com.here.ivi.api.model.cpp.CppUsing;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class CppClassTemplateTest {

  private static final String TEMPLATE_NAME = "cpp/CppClass";

  private static final String PUBLIC_PREFIX = "\npublic:\n";
  private static final String PRIVATE_PREFIX = "\nprivate:\n";
  private static final String EXPECTED_DESTRUCTOR = "\npublic:\n" + "    virtual ~Classy() = 0;\n";
  private static final String EXPECTED_CLASS_BODY_FORMAT =
      "class Classy%s {" + EXPECTED_DESTRUCTOR + "%s\n};\n";
  private static final String EXPECTED_STRUCT_BODY_FORMAT = "struct %s {\n};\n";
  private static final String EXPECTED_ENUM_BODY_FORMAT = "enum %s {\n\n};\n";

  private final CppPrimitiveTypeRef cppPrimitiveTypeRef = CppPrimitiveTypeRef.INT32;
  private final CppComplexTypeRef cppComplexTypeRef =
      new CppComplexTypeRef.Builder("Party").build();
  private final CppInheritance cppInheritance =
      new CppInheritance(cppPrimitiveTypeRef, CppInheritance.Type.Protected);
  private final CppStruct cppStruct = new CppStruct("Structural");
  private final CppEnum cppEnum = CppEnum.create("Innumerable");
  private final CppUsing cppUsing = CppUsing.builder("Useful", cppPrimitiveTypeRef).build();
  private final CppMethod cppMethod =
      new CppMethod.Builder("methodical").specifier(CppMethod.Specifier.STATIC).build();
  private final CppField cppField = new CppField(cppPrimitiveTypeRef, "flowers");

  private final CppClass cppClass = new CppClass("Classy");

  @Test
  public void emptyClass() {
    String result = TemplateEngine.render(TEMPLATE_NAME, cppClass);

    final String expectedResult = String.format(EXPECTED_CLASS_BODY_FORMAT, "", "");
    assertEquals(expectedResult, result);
  }

  @Test
  public void classWithComment() {
    cppClass.comment = "nonsense";

    String result = TemplateEngine.render(TEMPLATE_NAME, cppClass);

    final String expectedResult =
        "/**\n * nonsense\n */\n" + String.format(EXPECTED_CLASS_BODY_FORMAT, "", "");
    assertEquals(expectedResult, result);
  }

  @Test
  public void classWithOneInheritance() {
    cppClass.inheritances.add(cppInheritance);

    String result = TemplateEngine.render(TEMPLATE_NAME, cppClass);

    final String expectedInheritances = ": protected int32_t";
    final String expectedResult =
        String.format(EXPECTED_CLASS_BODY_FORMAT, expectedInheritances, "");
    assertEquals(expectedResult, result);
  }

  @Test
  public void classWithTwoInheritances() {
    cppClass.inheritances.add(cppInheritance);
    cppClass.inheritances.add(new CppInheritance(cppComplexTypeRef, CppInheritance.Type.Private));

    String result = TemplateEngine.render(TEMPLATE_NAME, cppClass);

    final String expectedInheritances = ": protected int32_t, private Party";
    final String expectedResult =
        String.format(EXPECTED_CLASS_BODY_FORMAT, expectedInheritances, "");
    assertEquals(expectedResult, result);
  }

  @Test
  public void classWithOneStruct() {
    cppClass.members.add(cppStruct);

    String result = TemplateEngine.render(TEMPLATE_NAME, cppClass);

    final String expectedStructs =
        PUBLIC_PREFIX + String.format(EXPECTED_STRUCT_BODY_FORMAT, "Structural");
    final String expectedResult = String.format(EXPECTED_CLASS_BODY_FORMAT, "", expectedStructs);
    assertEquals(expectedResult, result);
  }

  @Test
  public void classWithTwoStructs() {
    cppClass.members.add(cppStruct);
    cppClass.members.add(new CppStruct("SomeStruct"));

    String result = TemplateEngine.render(TEMPLATE_NAME, cppClass);

    final String expectedStructs =
        PUBLIC_PREFIX
            + String.format(EXPECTED_STRUCT_BODY_FORMAT, "Structural")
            + String.format(EXPECTED_STRUCT_BODY_FORMAT, "SomeStruct");
    final String expectedResult = String.format(EXPECTED_CLASS_BODY_FORMAT, "", expectedStructs);
    assertEquals(expectedResult, result);
  }

  @Test
  public void classWithOneEnum() {
    cppClass.members.add(cppEnum);

    String result = TemplateEngine.render(TEMPLATE_NAME, cppClass);

    final String expectedEnums =
        PUBLIC_PREFIX + String.format(EXPECTED_ENUM_BODY_FORMAT, "Innumerable");
    final String expectedResult = String.format(EXPECTED_CLASS_BODY_FORMAT, "", expectedEnums);
    assertEquals(expectedResult, result);
  }

  @Test
  public void classWithTwoEnums() {
    cppClass.members.add(cppEnum);
    cppClass.members.add(CppEnum.createScoped("SomeEnum"));

    String result = TemplateEngine.render(TEMPLATE_NAME, cppClass);

    final String expectedEnums =
        PUBLIC_PREFIX
            + String.format(EXPECTED_ENUM_BODY_FORMAT, "Innumerable")
            + String.format(EXPECTED_ENUM_BODY_FORMAT, "class " + "SomeEnum");
    final String expectedResult = String.format(EXPECTED_CLASS_BODY_FORMAT, "", expectedEnums);
    assertEquals(expectedResult, result);
  }

  @Test
  public void classWithOneUsing() {
    cppClass.members.add(cppUsing);

    String result = TemplateEngine.render(TEMPLATE_NAME, cppClass);

    final String expectedUsings = PUBLIC_PREFIX + "using Useful = int32_t;\n";
    final String expectedResult = String.format(EXPECTED_CLASS_BODY_FORMAT, "", expectedUsings);
    assertEquals(expectedResult, result);
  }

  @Test
  public void classWithTwoUsings() {
    cppClass.members.add(cppUsing);
    cppClass.members.add(CppUsing.builder("Useless", cppComplexTypeRef).build());

    String result = TemplateEngine.render(TEMPLATE_NAME, cppClass);

    final String expectedUsings =
        PUBLIC_PREFIX + "using Useful = int32_t;\nusing Useless = Party;\n";
    final String expectedResult = String.format(EXPECTED_CLASS_BODY_FORMAT, "", expectedUsings);
    assertEquals(expectedResult, result);
  }

  @Test
  public void classWithOneInstanceMethod() {
    cppMethod.specifiers.clear();
    cppClass.methods.add(cppMethod);

    String result = TemplateEngine.render(TEMPLATE_NAME, cppClass);

    final String expectedMethods = PUBLIC_PREFIX + "void methodical(  );\n";
    final String expectedResult = String.format(EXPECTED_CLASS_BODY_FORMAT, "", expectedMethods);
    assertEquals(expectedResult, result);
  }

  @Test
  public void classWithOneStaticMethod() {
    cppClass.methods.add(cppMethod);

    String result = TemplateEngine.render(TEMPLATE_NAME, cppClass);

    final String expectedMethods = PUBLIC_PREFIX + "static void methodical(  );\n";
    final String expectedResult = String.format(EXPECTED_CLASS_BODY_FORMAT, "", expectedMethods);
    assertEquals(expectedResult, result);
  }

  @Test
  public void classWithTwoStaticMethods() {
    cppClass.methods.add(cppMethod);
    cppClass.methods.add(
        new CppMethod.Builder("haphazard").specifier(CppMethod.Specifier.STATIC).build());

    String result = TemplateEngine.render(TEMPLATE_NAME, cppClass);

    final String expectedMethods =
        PUBLIC_PREFIX + "static void methodical(  );\nstatic void haphazard(  );\n";
    final String expectedResult = String.format(EXPECTED_CLASS_BODY_FORMAT, "", expectedMethods);
    assertEquals(expectedResult, result);
  }

  @Test
  public void classWithOneField() {
    cppClass.fields.add(cppField);

    String result = TemplateEngine.render(TEMPLATE_NAME, cppClass);

    final String expectedFields = PRIVATE_PREFIX + "int32_t flowers;\n";
    final String expectedResult = String.format(EXPECTED_CLASS_BODY_FORMAT, "", expectedFields);
    assertEquals(expectedResult, result);
  }

  @Test
  public void classWithTwoFields() {
    cppClass.fields.add(cppField);
    cppClass.fields.add(new CppField(cppComplexTypeRef, "canola"));

    String result = TemplateEngine.render(TEMPLATE_NAME, cppClass);

    final String expectedFields = PRIVATE_PREFIX + "int32_t flowers;\nParty canola;\n";
    final String expectedResult = String.format(EXPECTED_CLASS_BODY_FORMAT, "", expectedFields);
    assertEquals(expectedResult, result);
  }
}
