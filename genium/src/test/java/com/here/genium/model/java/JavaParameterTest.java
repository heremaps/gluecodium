/*
 * Copyright (C) 2016-2018 HERE Europe B.V.
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

package com.here.genium.model.java;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;

import com.here.genium.model.java.JavaReferenceType.Type;
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
