/*
 * Copyright (c) 2016-2018 HERE Europe B.V.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
 * License-Filename: LICENSE
 */

package com.here.ivi.api.generator.jni;

import static org.junit.Assert.assertEquals;

import com.here.ivi.api.model.java.JavaParameter;
import com.here.ivi.api.model.java.JavaPrimitiveType;
import com.here.ivi.api.model.java.JavaType;
import com.here.ivi.api.model.jni.JniContainer;
import com.here.ivi.api.platform.android.AndroidGeneratorSuite;
import java.util.Arrays;
import java.util.List;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.ExpectedException;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class JniNameRulesTest {
  @Rule public final ExpectedException expectedException = ExpectedException.none();

  private static final List<String> PACKAGES = Arrays.asList("com", "example", "android");

  private JniContainer createJniContainer() {
    String className = "MyClass";
    return JniContainer.builder(PACKAGES, PACKAGES)
        .javaName(className)
        .javaInterfaceName(className)
        .cppName(className)
        .isFrancaInterface(true)
        .build();
  }

  @Test
  public void getHeaderFileName() {
    JniContainer jniContainer = createJniContainer();

    String headerFileName = JniNameRules.getHeaderFileName(jniContainer);

    assertEquals(
        AndroidGeneratorSuite.GENERATOR_NAME + "/jni/com_example_android_MyClass.h",
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
        AndroidGeneratorSuite.GENERATOR_NAME + "/jni/com_example_android_MyClass.cpp",
        headerFileName);
  }

  @Test
  public void getImplementationFileNameThrowsForNullClass() {
    // Arrange, act, assert
    expectedException.expect(NullPointerException.class);
    JniNameRules.getImplementationFileName(null);
  }

  @Test
  public void getParameterNameFromJavaNativeParameter() {
    // Arrange
    JavaType javaType = JavaPrimitiveType.INT;
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
    JavaType javaType = JavaPrimitiveType.INT;
    JavaParameter javaParameter = new JavaParameter(javaType, "");

    // Act, assert
    assertEquals("", JniNameRules.getNativeParameterName(javaParameter.name));
  }
}
