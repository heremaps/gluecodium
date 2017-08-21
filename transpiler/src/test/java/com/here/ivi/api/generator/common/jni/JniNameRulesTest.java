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
import com.here.ivi.api.model.javamodel.JavaParameter;
import com.here.ivi.api.model.javamodel.JavaPrimitiveType;
import com.here.ivi.api.model.javamodel.JavaPrimitiveType.Type;
import com.here.ivi.api.model.javamodel.JavaType;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.ExpectedException;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class JniNameRulesTest {
  @Rule public final ExpectedException expectedException = ExpectedException.none();

  private static final List<String> PACKAGES = Arrays.asList("com", "here", "android");

  private JniContainer createJniContainer() {
    String className = "MyClass";
    return JniContainer.createInterfaceContainer(PACKAGES, PACKAGES, className, className);
  }

  @Test
  public void getHeaderFileName() {
    JniContainer jniContainer = createJniContainer();

    String headerFileName = JniNameRules.getHeaderFileName(jniContainer);

    assertEquals(
        AndroidGeneratorSuite.GENERATOR_NAMESPACE + "/jni/com_here_android_MyClass.h",
        headerFileName);
  }

  @Test
  public void getHeaderFileNameThrowsForNullClass() {
    // Arrange, act, assert
    expectedException.expect(NullPointerException.class);
    JniNameRules.getHeaderFileName(null);
  }

  @Test
  public void getImplementationFileName() {
    JniContainer jniContainer = createJniContainer();

    String headerFileName = JniNameRules.getImplementationFileName(jniContainer);

    // Assert
    assertEquals(
        AndroidGeneratorSuite.GENERATOR_NAMESPACE + "/jni/com_here_android_MyClass.cpp",
        headerFileName);
  }

  @Test
  public void getImplementationFileNameThrowsForNullClass() {
    // Arrange, act, assert
    expectedException.expect(NullPointerException.class);
    JniNameRules.getImplementationFileName(null);
  }

  @Test
  public void getJNIParameterNameFromJavaParameter() {
    // Arrange
    JavaType javaType = new JavaPrimitiveType(Type.INT);
    JavaParameter javaParameter = new JavaParameter(javaType, "parameterName");

    // Act, assert
    assertEquals("jparameterName", JniNameRules.getParameterName(javaParameter.name));
  }

  @Test
  public void getJNIParameterNameFromNullJavaParameter() {
    // Arrange, act, assert
    assertEquals("", JniNameRules.getParameterName(null));
  }

  @Test
  public void getJNIParameterNameFromEmptyJavaParameter() {
    // Arrange
    JavaType javaType = new JavaPrimitiveType(Type.INT);
    JavaParameter javaParameter = new JavaParameter(javaType, "");

    // Act, assert
    assertEquals("", JniNameRules.getParameterName(javaParameter.name));
  }

  @Test
  public void getParameterNameFromJavaNativeParameter() {
    // Arrange
    JavaType javaType = new JavaPrimitiveType(Type.INT);
    JavaParameter javaParameter = new JavaParameter(javaType, "parameterName");

    // Act, assert
    assertEquals("nparameterName", JniNameRules.getNativeParameterName(javaParameter.name));
  }

  @Test
  public void getParameterNameFromNullJavaNativeParameter() {
    // Arrange, act, assert
    assertEquals("", JniNameRules.getNativeParameterName(null));
  }

  @Test
  public void getParameterNameFromEmptyJavaNativeParameter() {
    // Arrange
    JavaType javaType = new JavaPrimitiveType(Type.INT);
    JavaParameter javaParameter = new JavaParameter(javaType, "");

    // Act, assert
    assertEquals("", JniNameRules.getNativeParameterName(javaParameter.name));
  }

  @Test
  public void getJNIPackageNameFromJavaPackage() {
    // Arrange
    List<String> javaPackageNames = Arrays.asList("com", "here", "test");

    // Act, assert
    assertEquals("com_here_test", JniNameRules.getPackageName(javaPackageNames));
  }

  @Test
  public void getJNIPackageNameFromNullJavaPackage() {
    assertEquals("", JniNameRules.getPackageName(null));
  }

  @Test
  public void getJNIPackageNameFromEmptyJavaPackage() {
    // Arrange
    List<String> javaPackageNames = Collections.emptyList();

    // Act, assert
    assertEquals("", JniNameRules.getPackageName(javaPackageNames));
  }
}
