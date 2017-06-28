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

package com.here.ivi.api.generator.cbridge.templates;

import static org.junit.Assert.assertEquals;

import com.here.ivi.api.model.common.Includes;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public class CBridgeIncludeTemplateTest {

  @Test
  public void systemInclude() {
    Includes.Include include = new Includes.SystemInclude("header.h");
    String expected = "#include <header.h>";

    String generated = CBridgeIncludeTemplate.generate(include).toString();

    assertEquals(expected, generated);
  }

  @Test
  public void projectInclude() {
    Includes.Include include = new Includes.InternalPublicInclude("header.h");
    String expected = "#include \"header.h\"";

    String generated = CBridgeIncludeTemplate.generate(include).toString();

    assertEquals(expected, generated);
  }

  private static class TestIncludeClass implements Includes.Include {
    @Override
    public String toString() {
      return "TEST_INCLUDE";
    }
  }

  @Test
  public void unknownTypeInclude() {
    Includes.Include include = new TestIncludeClass();
    String className = "class " + include.getClass().getName();
    String expected = "// Unknown or unresolved include TEST_INCLUDE of " + className;

    String generated = CBridgeIncludeTemplate.generate(include).toString();

    assertEquals(expected, generated);
  }
}
