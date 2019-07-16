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
import java.util.Arrays;
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
public final class StaticTypedefTest {
  private static final String EXAMPLE_STRING = "exampleString";
  private static final String HELLO_PREFIX = "Hello ";
  private static final double VALUE_X = 10.0;
  private static final double VALUE_Y = 20.0;

  @Test
  public void returnIntTypedef() {
    int testValue = 10;

    int result = StaticTypedef.returnIntTypedef(testValue);

    assertEquals(testValue + 1, result);
  }

  @Test
  public void returnStringTypedef() {
    String testValue = EXAMPLE_STRING;

    String result = StaticTypedef.returnStringTypedef(testValue);

    assertEquals(HELLO_PREFIX + testValue, result);
  }

  @Test
  public void returnByteBufferTypedef() {
    byte[] testValue = "byteArray".getBytes();

    byte[] result = StaticTypedef.returnByteBufferTypedef(testValue);

    assertTrue(Arrays.equals("yarrAetyb".getBytes(), result));
  }

  @Test
  public void returnExampleStructTypedef() {
    StaticTypedef.ExampleStruct exampleStruct = new StaticTypedef.ExampleStruct();
    exampleStruct.exampleString = EXAMPLE_STRING;

    StaticTypedef.ExampleStruct result = StaticTypedef.returnExampleStructTypedef(exampleStruct);

    assertEquals(HELLO_PREFIX + EXAMPLE_STRING, result.exampleString);
  }

  @Test
  public void returnTypedefPointFromTypeCollection() {
    Point point = new Point(VALUE_X, VALUE_Y);

    Point result = StaticTypedef.returnTypedefPointFromTypeCollection(point);

    assertEquals(VALUE_X, result.x);
    assertEquals(VALUE_Y, result.y);
  }

  @Test
  public void returnNestedIntTypedef() {
    int testValue = 20;

    int result = StaticTypedef.returnNestedIntTypedef(testValue);

    assertEquals(testValue + 1, result);
  }

  @Test
  public void returnNestedStructTypedef() {
    StaticTypedef.ExampleStruct exampleStruct = new StaticTypedef.ExampleStruct();
    exampleStruct.exampleString = EXAMPLE_STRING;

    StaticTypedef.ExampleStruct result = StaticTypedef.returnNestedStructTypedef(exampleStruct);

    assertEquals(HELLO_PREFIX + EXAMPLE_STRING, result.exampleString);
  }
}
