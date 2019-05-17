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

import static junit.framework.Assert.assertEquals;
import static junit.framework.Assert.assertNotNull;

import android.os.Build;

import com.example.here.hello.BuildConfig;
import com.here.android.RobolectricApplication;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
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
public class HelloWorldArraysTest {

  private static final String STRING_LIST_ITEM_1 = "Item1";
  private static final String STRING_LIST_ITEM_2 = "Item2";
  private static final String STRING_LIST_ITEM_3 = "Item3";
  private static final double DOUBLE_VALUE_1 = 42.0;
  private static final double DOUBLE_VALUE_2 = 43.0;
  private static final long LONG_VALUE_1 = 44L;
  private static final long LONG_VALUE_2 = 45L;

  @Test
  public void methodWithArray_multipleItems() {
    List<String> stringList =
        Arrays.asList(STRING_LIST_ITEM_1, STRING_LIST_ITEM_2, STRING_LIST_ITEM_3);

    List<String> resultsList = HelloWorldArrays.methodWithArray(stringList);

    assertNotNull(resultsList);
    assertEquals(3, resultsList.size());
    // method returns list in reverse order
    assertEquals(STRING_LIST_ITEM_3, resultsList.get(0));
    assertEquals(STRING_LIST_ITEM_2, resultsList.get(1));
    assertEquals(STRING_LIST_ITEM_1, resultsList.get(2));
  }

  @Test
  public void methodWithArray_singleItem() {
    List<String> stringList = Collections.singletonList(STRING_LIST_ITEM_1);

    List<String> resultsList = HelloWorldArrays.methodWithArray(stringList);

    assertNotNull(resultsList);
    assertEquals(1, resultsList.size());
    assertEquals(STRING_LIST_ITEM_1, resultsList.get(0));
  }

  @Test
  public void methodWithArray_emptyList() {
    List<String> resultsList = HelloWorldArrays.methodWithArray(new ArrayList<>());

    assertNotNull(resultsList);
    assertEquals(0, resultsList.size());
  }

  @Test
  public void methodWithArray_nullList() {
    List<String> resultsList = HelloWorldArrays.methodWithArray(null);

    assertNotNull(resultsList);
    assertEquals(0, resultsList.size());
  }

  @Test
  public void methodWithStructArray() {
    HelloWorldArrays.ExampleStruct exampleStruct1 =
        new HelloWorldArrays.ExampleStruct(DOUBLE_VALUE_1);
    HelloWorldArrays.ExampleStruct exampleStruct2 =
        new HelloWorldArrays.ExampleStruct(DOUBLE_VALUE_2);
    List<HelloWorldArrays.ExampleStruct> exampleStructList =
        Arrays.asList(exampleStruct1, exampleStruct2);

    List<HelloWorldArrays.ExampleStruct> resultsList =
        HelloWorldArrays.methodWithStructArray(exampleStructList);

    assertEquals(2, resultsList.size());
    // method returns list in reverse order
    assertEquals(DOUBLE_VALUE_2, resultsList.get(0).value);
    assertEquals(DOUBLE_VALUE_1, resultsList.get(1).value);
  }

  @Test
  public void methodWithInlineArray() {
    List<Long> longList = Arrays.asList(LONG_VALUE_1, LONG_VALUE_2);

    List<Long> resultsList = HelloWorldArrays.methodWithArrayInline(longList);

    assertEquals(2, resultsList.size());
    // method returns list in reverse order
    assertEquals(LONG_VALUE_2, resultsList.get(0).longValue());
    assertEquals(LONG_VALUE_1, resultsList.get(1).longValue());
  }
}
