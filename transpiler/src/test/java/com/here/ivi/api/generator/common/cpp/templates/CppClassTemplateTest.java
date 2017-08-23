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
import com.here.ivi.api.model.cppmodel.CppEnum;
import com.here.ivi.api.model.cppmodel.CppField;
import com.here.ivi.api.model.cppmodel.CppInheritance;
import com.here.ivi.api.model.cppmodel.CppMethod;
import com.here.ivi.api.model.cppmodel.CppPrimitiveTypeRef;
import com.here.ivi.api.model.cppmodel.CppStruct;
import com.here.ivi.api.model.cppmodel.CppUsing;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class CppClassTemplateTest {

  private static final String TEMPLATE_NAME = "cpp/CppClass";

  private static final String PUBLIC_PREFIX = "\npublic:\n";
  private static final String PRIVATE_PREFIX = "\nprivate:\n";
  private static final String EXPECTED_CLASS_BODY_FORMAT = "class Classy%s {%s\n};\n";
  private static final String EXPECTED_STRUCT_BODY_FORMAT = "struct %s {\n};\n";
  private static final String EXPECTED_ENUM_BODY_FORMAT = "enum %s {\n\n};\n";

  private final CppPrimitiveTypeRef cppPrimitiveTypeRef =
      new CppPrimitiveTypeRef(CppPrimitiveTypeRef.Type.INT32);
  private final CppComplexTypeRef cppComplexTypeRef =
      new CppComplexTypeRef.Builder("Party").build();
  private final CppInheritance cppInheritance =
      new CppInheritance(cppPrimitiveTypeRef, CppInheritance.Type.Protected);
  private final CppStruct cppStruct = new CppStruct("Structural");
  private final CppEnum cppEnum = new CppEnum("Innumerable");
  private final CppUsing cppUsing = new CppUsing("Useful", cppPrimitiveTypeRef);
  private final CppMethod cppMethod = new CppMethod.Builder("methodical").build();
  private final CppField cppField = new CppField(cppPrimitiveTypeRef, "flowers");

  private final CppClass cppClass = new CppClass.Builder("Classy").build();

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
    cppClass.structs.add(cppStruct);

    String result = TemplateEngine.render(TEMPLATE_NAME, cppClass);

    final String expectedStructs =
        PUBLIC_PREFIX + String.format(EXPECTED_STRUCT_BODY_FORMAT, "Structural");
    final String expectedResult = String.format(EXPECTED_CLASS_BODY_FORMAT, "", expectedStructs);
    assertEquals(expectedResult, result);
  }

  @Test
  public void classWithTwoStructs() {
    cppClass.structs.add(cppStruct);
    cppClass.structs.add(new CppStruct("SomeStruct"));

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
    cppClass.enums.add(cppEnum);

    String result = TemplateEngine.render(TEMPLATE_NAME, cppClass);

    final String expectedEnums =
        PUBLIC_PREFIX + String.format(EXPECTED_ENUM_BODY_FORMAT, "Innumerable");
    final String expectedResult = String.format(EXPECTED_CLASS_BODY_FORMAT, "", expectedEnums);
    assertEquals(expectedResult, result);
  }

  @Test
  public void classWithTwoEnums() {
    cppClass.enums.add(cppEnum);
    cppClass.enums.add(new CppEnum("SomeEnum", true));

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
    cppClass.usings.add(cppUsing);

    String result = TemplateEngine.render(TEMPLATE_NAME, cppClass);

    final String expectedUsings = PUBLIC_PREFIX + "using Useful = int32_t;\n";
    final String expectedResult = String.format(EXPECTED_CLASS_BODY_FORMAT, "", expectedUsings);
    assertEquals(expectedResult, result);
  }

  @Test
  public void classWithTwoUsings() {
    cppClass.usings.add(cppUsing);
    cppClass.usings.add(new CppUsing("Useless", cppComplexTypeRef));

    String result = TemplateEngine.render(TEMPLATE_NAME, cppClass);

    final String expectedUsings =
        PUBLIC_PREFIX + "using Useful = int32_t;\nusing Useless = Party;\n";
    final String expectedResult = String.format(EXPECTED_CLASS_BODY_FORMAT, "", expectedUsings);
    assertEquals(expectedResult, result);
  }

  @Test
  public void classWithOneMethod() {
    cppClass.methods.add(cppMethod);

    String result = TemplateEngine.render(TEMPLATE_NAME, cppClass);

    final String expectedMethods = PUBLIC_PREFIX + "void methodical(  );\n";
    final String expectedResult = String.format(EXPECTED_CLASS_BODY_FORMAT, "", expectedMethods);
    assertEquals(expectedResult, result);
  }

  @Test
  public void classWithTwoMethods() {
    cppClass.methods.add(cppMethod);
    cppClass.methods.add(new CppMethod.Builder("haphazard").build());

    String result = TemplateEngine.render(TEMPLATE_NAME, cppClass);

    final String expectedMethods = PUBLIC_PREFIX + "void methodical(  );\nvoid haphazard(  );\n";
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
