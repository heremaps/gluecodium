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
import com.here.ivi.api.model.cppmodel.CppInheritance;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class CppInheritanceTemplateTest {

  private static final String TEMPLATE_NAME = "cpp/CppInheritance";

  private final CppClass cppClass = new CppClass("Classy");
  private final CppInheritance cppInheritance =
      new CppInheritance(
          new CppComplexTypeRef.Builder("Typical").build(), CppInheritance.Type.Public);

  @Test
  public void noInheritances() {
    String result = TemplateEngine.render(TEMPLATE_NAME, cppClass);

    assertEquals("", result);
  }

  @Test
  public void oneInheritance() {
    cppClass.inheritances.add(cppInheritance);

    String result = TemplateEngine.render(TEMPLATE_NAME, cppClass);

    assertEquals(": public Typical", result);
  }

  @Test
  public void twoInheritances() {
    CppInheritance anotherCppInheritance =
        new CppInheritance(
            new CppComplexTypeRef.Builder("Nonsense").build(), CppInheritance.Type.Private);
    cppClass.inheritances.add(cppInheritance);
    cppClass.inheritances.add(anotherCppInheritance);

    String result = TemplateEngine.render(TEMPLATE_NAME, cppClass);

    assertEquals(": public Typical, private Nonsense", result);
  }
}
