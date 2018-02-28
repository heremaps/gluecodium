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

package com.here.ivi.api.generator.java;

import static org.junit.Assert.assertEquals;

import com.here.ivi.api.model.java.JavaClass;
import com.here.ivi.api.model.java.JavaExceptionClass;
import com.here.ivi.api.model.java.JavaPackage;
import com.here.ivi.api.platform.android.AndroidGeneratorSuite;
import java.util.Arrays;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.ExpectedException;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class JavaNameRulesTest {
  @Rule public final ExpectedException expectedException = ExpectedException.none();

  @Test
  public void getFileName() {
    // Arrange
    JavaClass javaClass = new JavaClass("MyClass");

    // Act
    String javaFile = JavaNameRules.getFileName(javaClass);

    // Assert
    assertEquals(AndroidGeneratorSuite.GENERATOR_NAME + "/com/example/MyClass.java", javaFile);
  }

  @Test
  public void getFileNameThrowsForNullClass() {
    // Arrange, act, assert
    expectedException.expect(NullPointerException.class);
    JavaNameRules.getFileName(null);
  }

  @Test
  public void getFileNameForExceptionClass() {
    // Arrange
    JavaPackage javaPackage = new JavaPackage(Arrays.asList("com", "example", "generator"));
    JavaExceptionClass javaExceptionClass =
        new JavaExceptionClass("ExceptionalException", null, javaPackage);

    // Act
    String javaFile = JavaNameRules.getFileName(javaExceptionClass);

    // Assert
    assertEquals(
        AndroidGeneratorSuite.GENERATOR_NAME + "/com/example/generator/ExceptionalException.java",
        javaFile);
  }
}
