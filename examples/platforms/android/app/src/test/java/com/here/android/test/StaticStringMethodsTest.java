/*
 * Copyright (C) 2016-2019 HERE Europe B.V.
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
package com.here.android.test;

import static junit.framework.Assert.assertEquals;
import static junit.framework.Assert.assertTrue;

import android.os.Build;
import com.example.here.hello.BuildConfig;
import com.here.android.RobolectricApplication;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(
    sdk = Build.VERSION_CODES.M,
    application = RobolectricApplication.class,
    constants = BuildConfig.class)
public final class StaticStringMethodsTest {
  @Test
  public void returnInputString() {
    // Arrange
    String inputString = "Foo";

    // Act
    String returnedString = StaticStringMethods.returnInputString(inputString);

    // Assert
    assertEquals(inputString, returnedString);
  }

  @Test
  public void concatenateStrings() {
    // Arrange
    String inputString1 = "Hello";
    String inputString2 = "World";

    // Act
    String returnedString = StaticStringMethods.concatenateStrings(inputString1, inputString2);

    // Assert
    assertEquals(inputString1 + inputString2, returnedString);
  }

  @Test
  public void returnHelloString() {
    // Arrange, act
    String returnedString = StaticStringMethods.returnHelloString();

    // Assert
    assertEquals("hello", returnedString);
  }

  @Test
  public void returnEmpty() {
    // Arrange, act
    String returnedString = StaticStringMethods.returnEmpty();

    // Assert
    assertTrue(returnedString.isEmpty());
  }

  @Test
  public void stringRef() {
    String result = CppRefReturnType.stringRef();

    assertEquals("nonsense", result);
  }

  @Test
  public void stringProperty() {
    String result = CppRefReturnType.getStringProperty();

    assertEquals("nonsense", result);
  }
}
