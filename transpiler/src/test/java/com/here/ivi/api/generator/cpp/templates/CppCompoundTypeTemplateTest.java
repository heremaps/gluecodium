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
import com.here.ivi.api.model.cpp.CppStruct;
import com.here.ivi.api.model.cpp.CppTaggedUnion;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class CppCompoundTypeTemplateTest {

  private static final String TEMPLATE_NAME = "cpp/CppCompoundType";

  private static final String EXPECTED_STRUCT_RESULT = "struct Structural {\n};\n";
  private static final String EXPECTED_UNION_RESULT =
      "struct Soviet {\n"
          + "    enum VariantType {\n    };\n"
          + "    const VariantType type;\n"
          + "    union {\n    };\n\n"
          + "    Soviet(const Soviet& other)\n        : type(other.type)\n    {\n"
          + "        switch (other.type) {\n        };\n"
          + "    };\n\n"
          + "    ~Soviet()\n    {\n"
          + "        switch (type) {\n        };\n"
          + "    };\n};\n";

  @Test
  public void structWithoutComment() {
    CppStruct cppStruct = new CppStruct("Structural", "Structural", null);

    String result = TemplateEngine.render(TEMPLATE_NAME, cppStruct);

    assertEquals(EXPECTED_STRUCT_RESULT, result);
  }

  @Test
  public void structWithComment() {
    CppStruct cppStruct = new CppStruct("Structural", "Structural", "nonsense");

    String result = TemplateEngine.render(TEMPLATE_NAME, cppStruct);

    final String expectedResult = "/**\n * nonsense\n */\n" + EXPECTED_STRUCT_RESULT;
    assertEquals(expectedResult, result);
  }

  @Test
  public void unionWithoutComment() {
    CppTaggedUnion cppTaggedUnion = new CppTaggedUnion("Soviet", "Soviet", null);

    String result = TemplateEngine.render(TEMPLATE_NAME, cppTaggedUnion);

    assertEquals(EXPECTED_UNION_RESULT, result);
  }

  @Test
  public void unionWithComment() {
    CppTaggedUnion cppTaggedUnion = new CppTaggedUnion("Soviet", "Soviet", "nonsense");

    String result = TemplateEngine.render(TEMPLATE_NAME, cppTaggedUnion);

    final String expectedResult = "/**\n * nonsense\n */\n" + EXPECTED_UNION_RESULT;
    assertEquals(expectedResult, result);
  }
}
