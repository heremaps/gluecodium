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
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.ExpectedException;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(
  sdk = Build.VERSION_CODES.M,
  application = RobolectricApplication.class,
  constants = BuildConfig.class
)
public class HelloWorldTypeDefTest {

  @Rule public final ExpectedException expectedException = ExpectedException.none();

  private final HelloWorldTypedefs.SomeStruct inputStruct = new HelloWorldTypedefs.SomeStruct();

  @Test
  public void methodWithTypeDef() {
    // Arrange
    inputStruct.text = "foo";

    // Act
    HelloWorldTypedefs.SomeStruct outputStruct = HelloWorldTypedefs.methodWithTypeDef(inputStruct);

    // Assert
    assertEquals("FOO", outputStruct.text);
  }

  @Test
  public void methodWithTypeDef_stringWithSpace() {
    // Arrange
    inputStruct.text = "foo bar";

    // Act
    HelloWorldTypedefs.SomeStruct outputStruct = HelloWorldTypedefs.methodWithTypeDef(inputStruct);

    // Assert
    assertEquals("FOO BAR", outputStruct.text);
  }

  @Test
  public void methodWithTypeDef_stringWithNumber() {
    // Arrange
    inputStruct.text = "1a";

    // Act
    HelloWorldTypedefs.SomeStruct outputStruct = HelloWorldTypedefs.methodWithTypeDef(inputStruct);

    // Assert
    assertEquals("1A", outputStruct.text);
  }

  @Test
  public void methodWithTypeDef_emptyString() {
    // Arrange
    inputStruct.text = "";

    // Act
    HelloWorldTypedefs.SomeStruct outputStruct = HelloWorldTypedefs.methodWithTypeDef(inputStruct);

    // Assert
    assertEquals("", outputStruct.text);
  }

  @Test
  public void methodWithTypeDef_nullString() {
    // Arrange
    expectedException.expect(NullPointerException.class);
    inputStruct.text = null;

    // Act
    HelloWorldTypedefs.SomeStruct outputStruct = HelloWorldTypedefs.methodWithTypeDef(inputStruct);
  }
}
