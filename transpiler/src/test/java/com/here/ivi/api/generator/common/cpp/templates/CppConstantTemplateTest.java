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

import com.here.ivi.api.model.cppmodel.CppComplexTypeRef;
import com.here.ivi.api.model.cppmodel.CppConstant;
import com.here.ivi.api.model.cppmodel.CppValue;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class CppConstantTemplateTest {

  private static final String CONSTANT_NAME = "permanent";
  private static final String TYPE_NAME = "Typical";
  private static final String VALUE_NAME = "valuable";
  private static final String EXPECTED_RESULT = "static const Typical permanent = valuable;";

  private CppConstant cppConstant =
      new CppConstant(
          CONSTANT_NAME,
          new CppComplexTypeRef.Builder(TYPE_NAME).build(),
          new CppValue(VALUE_NAME));

  @Test
  public void nullComment() {
    String result = CppConstantTemplate.generate(cppConstant);

    assertEquals(EXPECTED_RESULT, result);
  }

  @Test
  public void emptyComment() {
    cppConstant.comment = "";

    String result = CppConstantTemplate.generate(cppConstant);

    assertEquals(EXPECTED_RESULT, result);
  }

  @Test
  public void someComment() {
    cppConstant.comment = "nonsense";

    String result = CppConstantTemplate.generate(cppConstant);

    assertEquals("/**\n* nonsense\n*/\n" + EXPECTED_RESULT, result);
  }
}
