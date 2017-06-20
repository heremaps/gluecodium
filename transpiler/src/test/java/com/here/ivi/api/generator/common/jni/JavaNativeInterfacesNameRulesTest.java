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
import com.here.ivi.api.model.javamodel.*;
import com.here.ivi.api.model.javamodel.JavaPrimitiveType.Type;
import java.util.Arrays;
import java.util.Collections;
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

  @Test
  public void getJNIParameterNameFromJavaParameter() {
    JavaType javaType = new JavaPrimitiveType(Type.INT);
    JavaParameter javaParameter = new JavaParameter(javaType, "parameterName");

    assertEquals(
        "jparameterName", JavaNativeInterfacesNameRules.getParameterName(javaParameter.name));
  }

  @Test
  public void getJNIParameterNameFromNullJavaParameter() {
    assertEquals("", JavaNativeInterfacesNameRules.getParameterName(null));
  }

  @Test
  public void getJNIParameterNameFromEmptyJavaParameter() {
    JavaType javaType = new JavaPrimitiveType(Type.INT);
    JavaParameter javaParameter = new JavaParameter(javaType, "");

    assertEquals("", JavaNativeInterfacesNameRules.getParameterName(javaParameter.name));
  }

  @Test
  public void getParameterNameFromJavaNativeParameter() {
    JavaType javaType = new JavaPrimitiveType(Type.INT);
    JavaParameter javaParameter = new JavaParameter(javaType, "parameterName");

    assertEquals(
        "nparameterName", JavaNativeInterfacesNameRules.getNativeParameterName(javaParameter.name));
  }

  @Test
  public void getParameterNameFromNullJavaNativeParameter() {
    assertEquals("", JavaNativeInterfacesNameRules.getNativeParameterName(null));
  }

  @Test
  public void getParameterNameFromEmptyJavaNativeParameter() {
    JavaType javaType = new JavaPrimitiveType(Type.INT);
    JavaParameter javaParameter = new JavaParameter(javaType, "");

    assertEquals("", JavaNativeInterfacesNameRules.getNativeParameterName(javaParameter.name));
  }

  @Test
  public void getJNIPackageNameFromJavaPackage() {
    JavaPackage javaPackage = new JavaPackage(Arrays.asList("com", "here", "test"));

    assertEquals("com_here_test", JavaNativeInterfacesNameRules.getPackageName(javaPackage));
  }

  @Test
  public void getJNIPackageNameFromNullJavaPackage() {
    assertEquals("", JavaNativeInterfacesNameRules.getPackageName(null));
  }

  @Test
  public void getJNIPackageNameFromEmptyJavaPackage() {
    JavaPackage javaPackage = new JavaPackage(Collections.emptyList());

    assertEquals("", JavaNativeInterfacesNameRules.getPackageName(javaPackage));
  }
}
