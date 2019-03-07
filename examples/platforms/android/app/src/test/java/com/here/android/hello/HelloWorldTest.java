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
package com.here.android.hello;

import static org.junit.Assert.assertEquals;

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
  constants = BuildConfig.class
)
public final class HelloWorldTest {
  private static final String HELLO_PREFIX = "Hello ";

  @Test
  public void helloWorldMethod_String() {
    // Arrange
    String input = "User";

    // Act
    String result = HelloWorld.helloWorldMethod(input);

    // Assert
    assertEquals(HELLO_PREFIX + input, result);
  }

  @Test
  public void helloWorldMethod_EmptyString() {
    // Arrange, act
    String result = HelloWorld.helloWorldMethod("");

    // Assert
    assertEquals(HELLO_PREFIX, result);
  }

  @Test
  public void helloWorldMethod_Null() {
    // Arrange, act
    String result = HelloWorld.helloWorldMethod(null);

    // Assert
    assertEquals(HELLO_PREFIX, result);
  }
}
