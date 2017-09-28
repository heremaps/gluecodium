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
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class CppTaggedUnionTemplateTest {

  private static final String TEMPLATE_NAME = "cpp/CppTaggedUnion";

  private static final String EXPECTED_UNION_RESULT_FORMAT =
      "struct Soviet {\n"
          + "    enum VariantType {\n%s    };\n"
          + "    const VariantType type;\n"
          + "    union {\n%s    };\n\n%s"
          + "    Soviet(const Soviet& other)\n        : type(other.type)\n    {\n"
          + "        switch (other.type) {\n%s        };\n"
          + "    };\n\n"
          + "    ~Soviet()\n    {\n"
          + "        switch (type) {\n%s        };\n"
          + "    };\n};\n";

  private final CppTaggedUnion cppTaggedUnion = new CppTaggedUnion("Soviet");
  private final CppComplexTypeRef cppComplexTypeRef =
      new CppComplexTypeRef.Builder("::very::Typical").build();

  @Test
  public void unionEmpty() {
    String result = TemplateEngine.render(TEMPLATE_NAME, cppTaggedUnion);

    final String expectedResult = String.format(EXPECTED_UNION_RESULT_FORMAT, "", "", "", "", "");
    assertEquals(expectedResult, result);
  }

  @Test
  public void unionWithField() {
    CppField cppField = new CppField(cppComplexTypeRef, "flowers");
    cppField.comment = "nonsense";
    cppTaggedUnion.fields.add(cppField);

    String result = TemplateEngine.render(TEMPLATE_NAME, cppTaggedUnion);

    final String expectedEnumResult = "        FLOWERS\n";
    final String expectedConstructorResult =
        "    Soviet(const ::very::Typical& flowers)\n"
            + "        : type(FLOWERS)\n"
            + "        , flowers(flowers) {};\n\n";
    final String expectedFieldResult =
        "    /**\n     * nonsense\n     */\n        ::very::Typical flowers;\n";
    final String expectedCopyConstructorResult =
        "        case FLOWERS:\n"
            + "            new (&flowers) ::very::Typical(other.flowers);\n            break;\n";
    final String expectedDestructorResult =
        "        case FLOWERS:\n" + "            flowers.~Typical();\n            break;\n";
    final String expectedResult =
        String.format(
            EXPECTED_UNION_RESULT_FORMAT,
            expectedEnumResult,
            expectedFieldResult,
            expectedConstructorResult,
            expectedCopyConstructorResult,
            expectedDestructorResult);
    assertEquals(expectedResult, result);
  }

  @Test
  public void unionWithTwoFields() {
    CppField cppField = new CppField(cppComplexTypeRef, "flowers");
    CppField anotherCppField =
        new CppField(new CppComplexTypeRef.Builder("Also").build(), "canola");
    cppTaggedUnion.fields.add(cppField);
    cppTaggedUnion.fields.add(anotherCppField);

    String result = TemplateEngine.render(TEMPLATE_NAME, cppTaggedUnion);

    final String expectedEnumResult = "        FLOWERS,\n        CANOLA\n";
    final String expectedConstructorResult1 =
        "    Soviet(const ::very::Typical& flowers)\n"
            + "        : type(FLOWERS)\n"
            + "        , flowers(flowers) {};\n\n";
    final String expectedFieldResult1 = "        ::very::Typical flowers;\n";
    final String expectedCopyConstructorResult1 =
        "        case FLOWERS:\n"
            + "            new (&flowers) ::very::Typical(other.flowers);\n            break;\n";
    final String expectedDestructorResult1 =
        "        case FLOWERS:\n" + "            flowers.~Typical();\n            break;\n";
    final String expectedConstructorResult2 =
        "    Soviet(const Also& canola)\n"
            + "        : type(CANOLA)\n        , canola(canola) {};\n\n";
    final String expectedFieldResult2 = "        Also canola;\n";
    final String expectedCopyConstructorResult2 =
        "        case CANOLA:\n"
            + "            new (&canola) Also(other.canola);\n            break;\n";
    final String expectedDestructorResult2 =
        "        case CANOLA:\n" + "            canola.~Also();\n            break;\n";
    final String expectedResult =
        String.format(
            EXPECTED_UNION_RESULT_FORMAT,
            expectedEnumResult,
            expectedFieldResult1 + expectedFieldResult2,
            expectedConstructorResult1 + expectedConstructorResult2,
            expectedCopyConstructorResult1 + expectedCopyConstructorResult2,
            expectedDestructorResult1 + expectedDestructorResult2);
    assertEquals(expectedResult, result);
  }

  @Test
  public void unionWithFieldWithPrimitiveType() {
    CppField cppField = new CppField(CppPrimitiveTypeRef.UINT32, "indestructible");
    cppTaggedUnion.fields.add(cppField);

    String result = TemplateEngine.render(TEMPLATE_NAME, cppTaggedUnion);

    final String expectedEnumResult = "        INDESTRUCTIBLE\n";
    final String expectedConstructorResult =
        "    Soviet(const uint32_t& indestructible)\n"
            + "        : type(INDESTRUCTIBLE)\n"
            + "        , indestructible(indestructible) {};\n\n";
    final String expectedFieldResult = "        uint32_t indestructible;\n";
    final String expectedCopyConstructorResult =
        "        case INDESTRUCTIBLE:\n"
            + "            new (&indestructible) uint32_t(other.indestructible);\n"
            + "            break;\n";
    final String expectedDestructorResult =
        "        case INDESTRUCTIBLE:\n" + "            break;\n";
    final String expectedResult =
        String.format(
            EXPECTED_UNION_RESULT_FORMAT,
            expectedEnumResult,
            expectedFieldResult,
            expectedConstructorResult,
            expectedCopyConstructorResult,
            expectedDestructorResult);
    assertEquals(expectedResult, result);
  }

  @Test
  public void unionWithFieldWithTypeDefType() {
    CppTypeRef cppTypeRef = new CppTypeDefRef("ErrorCode", cppComplexTypeRef);
    CppField cppField = new CppField(cppTypeRef, "definite");
    cppTaggedUnion.fields.add(cppField);

    String result = TemplateEngine.render(TEMPLATE_NAME, cppTaggedUnion);

    final String expectedEnumResult = "        DEFINITE\n";
    final String expectedConstructorResult =
        "    Soviet(const ErrorCode& definite)\n"
            + "        : type(DEFINITE)\n"
            + "        , definite(definite) {};\n\n";
    final String expectedFieldResult = "        ErrorCode definite;\n";
    final String expectedCopyConstructorResult =
        "        case DEFINITE:\n"
            + "            new (&definite) ErrorCode(other.definite);\n"
            + "            break;\n";
    final String expectedDestructorResult =
        "        case DEFINITE:\n" + "            definite.~Typical();\n            break;\n";
    final String expectedResult =
        String.format(
            EXPECTED_UNION_RESULT_FORMAT,
            expectedEnumResult,
            expectedFieldResult,
            expectedConstructorResult,
            expectedCopyConstructorResult,
            expectedDestructorResult);
    assertEquals(expectedResult, result);
  }

  @Test
  public void unionWithFieldWithTemplateType() {
    CppTypeRef cppTypeRef =
        CppTemplateTypeRef.create(
            CppTemplateTypeRef.TemplateClass.BASIC_STRING, CppPrimitiveTypeRef.FLOAT);
    CppField cppField = new CppField(cppTypeRef, "nonsense");
    cppTaggedUnion.fields.add(cppField);

    String result = TemplateEngine.render(TEMPLATE_NAME, cppTaggedUnion);

    final String expectedEnumResult = "        NONSENSE\n";
    final String expectedConstructorResult =
        "    Soviet(const ::std::basic_string< float >& nonsense)\n"
            + "        : type(NONSENSE)\n"
            + "        , nonsense(nonsense) {};\n\n";
    final String expectedFieldResult = "        ::std::basic_string< float > nonsense;\n";
    final String expectedCopyConstructorResult =
        "        case NONSENSE:\n"
            + "            new (&nonsense) ::std::basic_string< float >(other.nonsense);\n"
            + "            break;\n";
    final String expectedDestructorResult =
        "        case NONSENSE:\n"
            + "            nonsense.~basic_string< float >();\n            break;\n";
    final String expectedResult =
        String.format(
            EXPECTED_UNION_RESULT_FORMAT,
            expectedEnumResult,
            expectedFieldResult,
            expectedConstructorResult,
            expectedCopyConstructorResult,
            expectedDestructorResult);
    assertEquals(expectedResult, result);
  }
}
