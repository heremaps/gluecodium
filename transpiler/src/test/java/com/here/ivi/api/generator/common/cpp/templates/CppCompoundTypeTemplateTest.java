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
import com.here.ivi.api.model.cppmodel.CppStruct;
import com.here.ivi.api.model.cppmodel.CppTaggedUnion;
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

  private final CppStruct cppStruct = new CppStruct("Structural");
  private final CppTaggedUnion cppTaggedUnion = new CppTaggedUnion("Soviet");

  @Test
  public void structWithoutComment() {
    String result = TemplateEngine.render(TEMPLATE_NAME, cppStruct);

    assertEquals(EXPECTED_STRUCT_RESULT, result);
  }

  @Test
  public void structWithComment() {
    cppStruct.comment = "nonsense";

    String result = TemplateEngine.render(TEMPLATE_NAME, cppStruct);

    final String expectedResult = "/**\n * nonsense\n */\n" + EXPECTED_STRUCT_RESULT;
    assertEquals(expectedResult, result);
  }

  @Test
  public void unionWithoutComment() {
    String result = TemplateEngine.render(TEMPLATE_NAME, cppTaggedUnion);

    assertEquals(EXPECTED_UNION_RESULT, result);
  }

  @Test
  public void unionWithComment() {
    cppTaggedUnion.comment = "nonsense";

    String result = TemplateEngine.render(TEMPLATE_NAME, cppTaggedUnion);

    final String expectedResult = "/**\n * nonsense\n */\n" + EXPECTED_UNION_RESULT;
    assertEquals(expectedResult, result);
  }
}
