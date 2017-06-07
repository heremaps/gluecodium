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

package com.here.ivi.api.generator.common.jni;

import static org.junit.Assert.assertEquals;

import com.here.ivi.api.generator.android.AndroidGeneratorSuite;
import com.here.ivi.api.model.javamodel.JavaClass;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.ExpectedException;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class JavaNativeInterfacesNameRulesTest {
  @Rule public final ExpectedException expectedException = ExpectedException.none();

  @Test
  public void getHeaderFileName() {
    // Arrange
    JavaClass javaClass = new JavaClass("MyClass");

    // Act
    String headerFileName = JavaNativeInterfacesNameRules.getHeaderFileName(javaClass);

    // Assert
    assertEquals(
        AndroidGeneratorSuite.GENERATOR_NAMESPACE + "/jni/com_here_ivi_MyClass.h", headerFileName);
  }

  @Test
  public void getHeaderFileNameThrowsForNullClass() {
    // Arrange, act, assert
    expectedException.expect(NullPointerException.class);
    JavaNativeInterfacesNameRules.getHeaderFileName(null);
  }

  @Test
  public void getImplementationFileName() {
    // Arrange
    JavaClass javaClass = new JavaClass("MyClass");

    // Act
    String headerFileName = JavaNativeInterfacesNameRules.getImplementationFileName(javaClass);

    // Assert
    assertEquals(
        AndroidGeneratorSuite.GENERATOR_NAMESPACE + "/jni/com_here_ivi_MyClass.cpp",
        headerFileName);
  }

  @Test
  public void getImplementationFileNameThrowsForNullClass() {
    // Arrange, act, assert
    expectedException.expect(NullPointerException.class);
    JavaNativeInterfacesNameRules.getImplementationFileName(null);
  }
}
