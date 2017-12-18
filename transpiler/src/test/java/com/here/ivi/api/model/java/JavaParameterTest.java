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

package com.here.ivi.api.model.java;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;

import com.here.ivi.api.model.java.JavaReferenceType.Type;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class JavaParameterTest {
  private static final String TEST_PARAMETER_NAME = "myParam";
  private static final JavaType TEST_STRING_TYPE = new JavaReferenceType(Type.STRING);
  private static final JavaValue TEST_DEFAULT_VALUE = new JavaValue("SomeString");

  @Test
  public void newJavaParameter() {
    // Arrange, act
    JavaParameter javaParameter = new JavaParameter(TEST_STRING_TYPE, TEST_PARAMETER_NAME);

    // Assert
    assertNotNull(javaParameter.type);
    assertEquals(TEST_STRING_TYPE, javaParameter.type);
    assertEquals(TEST_PARAMETER_NAME, javaParameter.name);
    assertNull(javaParameter.defaultValue);
  }

  @Test
  public void newJavaParameterWithDefaultValue() {
    // Arrange, act
    JavaParameter javaParameter =
        new JavaParameter(TEST_STRING_TYPE, TEST_PARAMETER_NAME, TEST_DEFAULT_VALUE);

    // Assert
    assertNotNull(javaParameter.type);
    assertEquals(TEST_STRING_TYPE, javaParameter.type);
    assertEquals(TEST_PARAMETER_NAME, javaParameter.name);
    assertNotNull(javaParameter.defaultValue);
    assertEquals(TEST_DEFAULT_VALUE, javaParameter.defaultValue);
  }
}
