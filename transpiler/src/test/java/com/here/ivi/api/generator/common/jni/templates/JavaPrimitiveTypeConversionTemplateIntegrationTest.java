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

package com.here.ivi.api.generator.common.jni.templates;

import static org.junit.Assert.assertEquals;

import com.here.ivi.api.model.cppmodel.CppType;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class JavaPrimitiveTypeConversionTemplateIntegrationTest {

  @Test
  public void generation() {

    // arrange
    CppType cppType = new CppType("int");
    String baseName = new String("parameterName");

    // act
    String result = JavaPrimitiveTypeConversionTemplate.generate(cppType, baseName).toString();

    // assert
    String expected = "int n" + baseName + " = static_cast<int>(j" + baseName + ");\n";
    assertEquals(expected, result);
  }
}
