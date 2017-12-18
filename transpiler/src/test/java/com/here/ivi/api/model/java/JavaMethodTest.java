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
import static org.junit.Assert.assertTrue;

import com.here.ivi.api.model.java.JavaMethod.MethodQualifier;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class JavaMethodTest {
  private static final String TEST_METHOD_NAME = "fancyMethod";
  private static final JavaType TEST_STRING_RETURN_TYPE =
      new JavaReferenceType(JavaReferenceType.Type.STRING);
  private static final JavaType TEST_VOID_RETURN_TYPE = JavaPrimitiveType.VOID;

  @Test
  public void newMethodWithVoidReturnType() {
    // Arrange, act
    JavaMethod javaMethod = new JavaMethod(TEST_METHOD_NAME, TEST_VOID_RETURN_TYPE);

    // Verify
    assertEquals(TEST_METHOD_NAME, javaMethod.name);
    assertEquals(TEST_VOID_RETURN_TYPE, javaMethod.returnType);
  }

  @Test
  public void newMethodWithCustomReturnType() {
    // Arrange, act
    JavaMethod javaMethod = new JavaMethod(TEST_METHOD_NAME, TEST_STRING_RETURN_TYPE);

    // Verify
    assertEquals(TEST_METHOD_NAME, javaMethod.name);
    assertEquals(TEST_STRING_RETURN_TYPE, javaMethod.returnType);
  }

  @Test
  public void specifierStatic() {
    // Arrange
    JavaMethod javaMethod = new JavaMethod(TEST_METHOD_NAME, TEST_VOID_RETURN_TYPE);

    // Act
    javaMethod.qualifiers.add(MethodQualifier.STATIC);

    // Verify
    assertTrue(javaMethod.qualifiers.contains(MethodQualifier.STATIC));
  }

  @Test
  public void visibilityPackage() {
    // Arrange
    JavaMethod javaMethod = new JavaMethod(TEST_METHOD_NAME, TEST_VOID_RETURN_TYPE);

    // Act
    javaMethod.visibility = JavaVisibility.PACKAGE;

    // Verify
    assertEquals(JavaVisibility.PACKAGE, javaMethod.visibility);
  }

  @Test
  public void visibilityPrivate() {
    // Arrange
    JavaMethod javaMethod = new JavaMethod(TEST_METHOD_NAME, TEST_VOID_RETURN_TYPE);

    // Act
    javaMethod.visibility = JavaVisibility.PRIVATE;

    // Verify
    assertEquals(JavaVisibility.PRIVATE, javaMethod.visibility);
  }

  @Test
  public void visibilityPublic() {
    // Arrange
    JavaMethod javaMethod = new JavaMethod(TEST_METHOD_NAME, TEST_VOID_RETURN_TYPE);

    // Act
    javaMethod.visibility = JavaVisibility.PUBLIC;

    // Verify
    assertEquals(JavaVisibility.PUBLIC, javaMethod.visibility);
  }
}
