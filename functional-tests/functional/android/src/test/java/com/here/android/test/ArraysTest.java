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
import static junit.framework.Assert.assertNotNull;
import static junit.framework.Assert.assertTrue;

import android.os.Build;
import com.here.android.RobolectricApplication;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = Build.VERSION_CODES.M, application = RobolectricApplication.class)
public class ArraysTest {
  private static final String STRING_LIST_ITEM_1 = "Item1";
  private static final String STRING_LIST_ITEM_2 = "Item2";
  private static final String STRING_LIST_ITEM_3 = "Item3";
  private static final float FLOAT_VALUE_1 = 42.0f;
  private static final float FLOAT_VALUE_2 = 43.0f;
  private static final double DOUBLE_VALUE_1 = 42.0;
  private static final double DOUBLE_VALUE_2 = 43.0;
  private static final double DOUBLE_VALUE_3 = 44.0;
  private static final double DOUBLE_VALUE_4 = 45.0;
  private static final long LONG_VALUE_1 = 44L;
  private static final long LONG_VALUE_2 = 45L;
  private static final long LONG_VALUE_3 = 46L;
  private static final long LONG_VALUE_4 = 47L;
  private static final Byte BYTE_ITEM_1 = (byte) 4;
  private static final Byte BYTE_ITEM_2 = (byte) 5;
  private static final Short SHORT_ITEM_1 = (short) 4;
  private static final Short SHORT_ITEM_2 = (short) 5;
  private static final Short SHORT_ITEM_3 = (short) 6;
  private static final Short SHORT_ITEM_4 = (short) 7;
  private static final Integer INT_ITEM_1 = 6;
  private static final Integer INT_ITEM_2 = 7;

  @Test
  public void reverseStringArray() {
    List<String> stringList = java.util.Arrays.asList(STRING_LIST_ITEM_1, STRING_LIST_ITEM_2);

    List<String> resultsList = Arrays.reverseStringArray(stringList);

    assertNotNull(resultsList);
    assertEquals(2, resultsList.size());
    assertEquals(STRING_LIST_ITEM_2, resultsList.get(0));
    assertEquals(STRING_LIST_ITEM_1, resultsList.get(1));
  }

  @Test
  public void reverseStringArray_useLinkedList() {
    List<String> stringList = new LinkedList<>();
    stringList.add(STRING_LIST_ITEM_1);
    stringList.add(STRING_LIST_ITEM_2);

    List<String> resultsList = Arrays.reverseStringArray(stringList);

    assertNotNull(resultsList);
    assertEquals(2, resultsList.size());
    assertEquals(STRING_LIST_ITEM_2, resultsList.get(0));
    assertEquals(STRING_LIST_ITEM_1, resultsList.get(1));
  }

  @Test
  public void reverseStringArray_useNull() {
    List<String> resultsList = Arrays.reverseStringArray(null);

    assertNotNull(resultsList);
    assertEquals(0, resultsList.size());
  }

  @Test
  public void methodWithInlineArray() {
    List<Short> shortList = java.util.Arrays.asList(SHORT_ITEM_1, SHORT_ITEM_2);

    List<Short> resultsList = Arrays.reverseArrayInline(shortList);

    assertNotNull(resultsList);
    assertEquals(2, resultsList.size());
    assertEquals(SHORT_ITEM_2, resultsList.get(0));
    assertEquals(SHORT_ITEM_1, resultsList.get(1));
  }

  @Test
  public void reverseInt8Array() {
    List<Byte> byteList = java.util.Arrays.asList(BYTE_ITEM_1, BYTE_ITEM_2);

    List<Byte> resultsList = Arrays.reverseInt8Array(byteList);

    assertNotNull(resultsList);
    assertEquals(2, resultsList.size());
    assertEquals(BYTE_ITEM_2, resultsList.get(0));
    assertEquals(BYTE_ITEM_1, resultsList.get(1));
  }

  @Test
  public void reverseInt16Array() {
    List<Short> shortList = java.util.Arrays.asList(SHORT_ITEM_1, SHORT_ITEM_2);

    List<Short> resultsList = Arrays.reverseInt16Array(shortList);

    assertNotNull(resultsList);
    assertEquals(2, resultsList.size());
    assertEquals(SHORT_ITEM_2, resultsList.get(0));
    assertEquals(SHORT_ITEM_1, resultsList.get(1));
  }

  @Test
  public void reverseInt32Array() {
    List<Integer> intList = java.util.Arrays.asList(INT_ITEM_1, INT_ITEM_2);

    List<Integer> resultsList = Arrays.reverseInt32Array(intList);

    assertNotNull(resultsList);
    assertEquals(2, resultsList.size());
    assertEquals(INT_ITEM_2, resultsList.get(0));
    assertEquals(INT_ITEM_1, resultsList.get(1));
  }

  @Test
  public void reverseInt64Array() {
    List<Long> longList = java.util.Arrays.asList(LONG_VALUE_1, LONG_VALUE_2);

    List<Long> resultsList = Arrays.reverseInt64Array(longList);

    assertNotNull(resultsList);
    assertEquals(2, resultsList.size());
    assertEquals(LONG_VALUE_2, resultsList.get(0).longValue());
    assertEquals(LONG_VALUE_1, resultsList.get(1).longValue());
  }

  @Test
  public void reverseUint8Array() {
    List<Short> shortList = java.util.Arrays.asList(SHORT_ITEM_1, SHORT_ITEM_2);

    List<Short> resultsList = Arrays.reverseUint8Array(shortList);

    assertNotNull(resultsList);
    assertEquals(2, resultsList.size());
    assertEquals(SHORT_ITEM_2, resultsList.get(0));
    assertEquals(SHORT_ITEM_1, resultsList.get(1));
  }

  @Test
  public void reverseUint16Array() {
    List<Integer> longList = java.util.Arrays.asList(INT_ITEM_1, INT_ITEM_2);

    List<Integer> resultsList = Arrays.reverseUint16Array(longList);

    assertNotNull(resultsList);
    assertEquals(2, resultsList.size());
    assertEquals(INT_ITEM_2, resultsList.get(0));
    assertEquals(INT_ITEM_1, resultsList.get(1));
  }

  @Test
  public void reverseUint32Array() {
    List<Long> longList = java.util.Arrays.asList(LONG_VALUE_1, LONG_VALUE_2);

    List<Long> resultsList = Arrays.reverseUint32Array(longList);

    assertNotNull(resultsList);
    assertEquals(2, resultsList.size());
    assertEquals(LONG_VALUE_2, resultsList.get(0).longValue());
    assertEquals(LONG_VALUE_1, resultsList.get(1).longValue());
  }

  @Test
  public void reverseUint64Array() {
    List<Long> longList = java.util.Arrays.asList(LONG_VALUE_1, LONG_VALUE_2);

    List<Long> resultsList = Arrays.reverseUint64Array(longList);

    assertNotNull(resultsList);
    assertEquals(2, resultsList.size());
    assertEquals(LONG_VALUE_2, resultsList.get(0).longValue());
    assertEquals(LONG_VALUE_1, resultsList.get(1).longValue());
  }

  @Test
  public void reverseFloatArray() {
    List<Float> floatList = java.util.Arrays.asList(FLOAT_VALUE_1, FLOAT_VALUE_2);

    List<Float> resultsList = Arrays.reverseFloatArray(floatList);

    assertNotNull(resultsList);
    assertEquals(2, resultsList.size());
    assertEquals(FLOAT_VALUE_2, resultsList.get(0));
    assertEquals(FLOAT_VALUE_1, resultsList.get(1));
  }

  @Test
  public void reverseDoubleArray() {
    List<Double> doubleList = java.util.Arrays.asList(DOUBLE_VALUE_1, DOUBLE_VALUE_2);

    List<Double> resultsList = Arrays.reverseDoubleArray(doubleList);

    assertNotNull(resultsList);
    assertEquals(2, resultsList.size());
    assertEquals(DOUBLE_VALUE_2, resultsList.get(0));
    assertEquals(DOUBLE_VALUE_1, resultsList.get(1));
  }

  @Test
  public void methodWithBooleanArray() {
    List<Boolean> booleanList = java.util.Arrays.asList(true, true, false);

    List<Boolean> resultsList = Arrays.reverseBoolArray(booleanList);

    assertNotNull(resultsList);
    assertEquals(3, resultsList.size());
    assertEquals(false, resultsList.get(0).booleanValue());
    assertEquals(true, resultsList.get(1).booleanValue());
    assertEquals(true, resultsList.get(2).booleanValue());
  }

  @Test
  public void reverseStructArray() {
    Arrays.BasicStruct struct1 = new Arrays.BasicStruct();
    Arrays.BasicStruct struct2 = new Arrays.BasicStruct();
    struct1.value = DOUBLE_VALUE_1;
    struct2.value = DOUBLE_VALUE_2;
    List<Arrays.BasicStruct> structList = java.util.Arrays.asList(struct1, struct2);

    List<Arrays.BasicStruct> resultsList = Arrays.reverseStructArray(structList);

    assertNotNull(resultsList);
    assertEquals(2, resultsList.size());
    assertEquals(DOUBLE_VALUE_2, resultsList.get(0).value);
    assertEquals(DOUBLE_VALUE_1, resultsList.get(1).value);
  }

  @Test
  public void reverseMapsArray() {
    Map<Short, String> map0 = Collections.emptyMap();
    Map<Short, String> map1 = new HashMap<>();
    map1.put((short) 42, STRING_LIST_ITEM_1);

    List<Map<Short, String>> input = java.util.Arrays.asList(map0, map1);

    List<Map<Short, String>> result = Arrays.reverseMapsArray(input);
    assertNotNull(result);
    assertEquals(2, result.size());
    assertEquals(map1, result.get(0));
    assertEquals(map0, result.get(1));
  }

  @Test
  public void reverseArrayMapsArray() {
    Map<Short, List<String>> map0 = Collections.emptyMap();
    Map<Short, List<String>> map1 = new HashMap<>();
    map1.put((short) 42, Collections.singletonList(STRING_LIST_ITEM_1));

    List<Map<Short, List<String>>> input = java.util.Arrays.asList(map0, map1);

    List<Map<Short, List<String>>> result = Arrays.reverseArrayMapsArray(input);
    assertNotNull(result);
    assertEquals(2, result.size());
    assertEquals(map1, result.get(0));
    assertEquals(map0, result.get(1));
  }

  @Test
  public void methodWithExplicitInstanceArray() {
    SimpleInstantiableOne instance1 = InstancesFactory.createSimpleInstantiableOne();
    SimpleInstantiableOne instance2 = InstancesFactory.createSimpleInstantiableOne();
    instance1.setStringValue(STRING_LIST_ITEM_1);
    instance2.setStringValue(STRING_LIST_ITEM_2);
    List<SimpleInstantiableOne> instancesArray = java.util.Arrays.asList(instance1, instance2);

    List<SimpleInstantiableOne> resultsList = Arrays.reverseExplicitInstancesArray(instancesArray);

    assertNotNull(resultsList);
    assertEquals(2, resultsList.size());
    assertEquals(STRING_LIST_ITEM_2, resultsList.get(0).getStringValue());
    assertEquals(STRING_LIST_ITEM_1, resultsList.get(1).getStringValue());
  }

  @Test
  public void methodWithImplicitInstanceArray() {
    SimpleInstantiableOne instance1 = InstancesFactory.createSimpleInstantiableOne();
    SimpleInstantiableOne instance2 = InstancesFactory.createSimpleInstantiableOne();
    instance1.setStringValue(STRING_LIST_ITEM_1);
    instance2.setStringValue(STRING_LIST_ITEM_2);
    List<SimpleInstantiableOne> instancesArray = java.util.Arrays.asList(instance1, instance2);

    List<SimpleInstantiableOne> resultsList = Arrays.reverseImplicitInstancesArray(instancesArray);

    assertNotNull(resultsList);
    assertEquals(2, resultsList.size());
    assertEquals(STRING_LIST_ITEM_2, resultsList.get(0).getStringValue());
    assertEquals(STRING_LIST_ITEM_1, resultsList.get(1).getStringValue());
  }

  @Test
  public void reverseNestedPrimitiveArray() {
    List<List<Double>> nestedDoubleList =
        java.util.Arrays.asList(
            java.util.Arrays.asList(DOUBLE_VALUE_1, DOUBLE_VALUE_2),
            java.util.Arrays.asList(DOUBLE_VALUE_3, DOUBLE_VALUE_4));

    List<List<Double>> resultsList = Arrays.reverseNestedPrimitiveArray(nestedDoubleList);

    assertNotNull(resultsList);
    assertEquals(2, resultsList.size());
    List<Double> firstResult = resultsList.get(0);
    List<Double> secondResult = resultsList.get(1);
    assertEquals(2, firstResult.size());
    assertEquals(2, secondResult.size());
    assertEquals(DOUBLE_VALUE_4, firstResult.get(0));
    assertEquals(DOUBLE_VALUE_3, firstResult.get(1));
    assertEquals(DOUBLE_VALUE_2, secondResult.get(0));
    assertEquals(DOUBLE_VALUE_1, secondResult.get(1));
  }

  @Test
  public void reverseNestedStructArray() {
    Arrays.BasicStruct struct1 = new Arrays.BasicStruct();
    Arrays.BasicStruct struct2 = new Arrays.BasicStruct();
    Arrays.BasicStruct struct3 = new Arrays.BasicStruct();
    Arrays.BasicStruct struct4 = new Arrays.BasicStruct();
    struct1.value = DOUBLE_VALUE_1;
    struct2.value = DOUBLE_VALUE_2;
    struct3.value = DOUBLE_VALUE_3;
    struct4.value = DOUBLE_VALUE_4;
    List<List<Arrays.BasicStruct>> nestedStructList =
        java.util.Arrays.asList(
            java.util.Arrays.asList(struct1, struct2), java.util.Arrays.asList(struct3, struct4));

    List<List<Arrays.BasicStruct>> resultsList = Arrays.reverseNestedStructArray(nestedStructList);

    assertNotNull(resultsList);
    assertEquals(2, resultsList.size());
    List<Arrays.BasicStruct> firstResult = resultsList.get(0);
    List<Arrays.BasicStruct> secondResult = resultsList.get(1);
    assertEquals(2, firstResult.size());
    assertEquals(2, secondResult.size());
    assertEquals(DOUBLE_VALUE_4, firstResult.get(0).value);
    assertEquals(DOUBLE_VALUE_3, firstResult.get(1).value);
    assertEquals(DOUBLE_VALUE_2, secondResult.get(0).value);
    assertEquals(DOUBLE_VALUE_1, secondResult.get(1).value);
  }

  @Test
  public void reverseNestedArraysInline() {
    List<List<Long>> nestedLongList =
        java.util.Arrays.asList(
            java.util.Arrays.asList(LONG_VALUE_1, LONG_VALUE_2),
            java.util.Arrays.asList(LONG_VALUE_3, LONG_VALUE_4));

    List<List<Long>> resultsList = Arrays.reverseNestedArraysInline(nestedLongList);

    assertNotNull(resultsList);
    assertEquals(2, resultsList.size());
    List<Long> firstResult = resultsList.get(0);
    List<Long> secondResult = resultsList.get(1);
    assertEquals(2, firstResult.size());
    assertEquals(2, secondResult.size());
    assertEquals(LONG_VALUE_4, firstResult.get(0).longValue());
    assertEquals(LONG_VALUE_3, firstResult.get(1).longValue());
    assertEquals(LONG_VALUE_2, secondResult.get(0).longValue());
    assertEquals(LONG_VALUE_1, secondResult.get(1).longValue());
  }

  @Test
  public void mergeArraysOfStructsWithArrays() {
    SimpleInstantiableOne instance = InstancesFactory.createSimpleInstantiableOne();
    SimpleInstantiableOne otherInstance = InstancesFactory.createSimpleInstantiableOne();
    instance.setStringValue(STRING_LIST_ITEM_1);
    otherInstance.setStringValue(STRING_LIST_ITEM_2);
    List<SimpleInstantiableOne> instancesArray1 = java.util.Arrays.asList(instance, otherInstance);
    SimpleInstantiableOne instance2 = InstancesFactory.createSimpleInstantiableOne();
    instance2.setStringValue(STRING_LIST_ITEM_3);
    List<SimpleInstantiableOne> instancesArray2 = Collections.singletonList(instance2);
    Arrays.FancyStruct struct1 =
        new Arrays.FancyStruct(
            java.util.Arrays.asList("struct", "1"),
            java.util.Arrays.asList(SHORT_ITEM_1, SHORT_ITEM_2),
            instancesArray1);
    Arrays.FancyStruct struct2 =
        new Arrays.FancyStruct(
            java.util.Arrays.asList("struct", "2"),
            java.util.Arrays.asList(SHORT_ITEM_3, SHORT_ITEM_3),
            instancesArray2);
    Arrays.FancyStruct struct3 =
        new Arrays.FancyStruct(
            java.util.Arrays.asList("struct", "3"),
            java.util.Arrays.asList(SHORT_ITEM_4, SHORT_ITEM_4),
            null);
    List<Arrays.FancyStruct> fancyStructList1 = java.util.Arrays.asList(struct1, struct2);
    List<Arrays.FancyStruct> fancyStructList2 = Collections.singletonList(struct3);

    List<Arrays.FancyStruct> resultsList =
        Arrays.mergeArraysOfStructsWithArrays(fancyStructList1, fancyStructList2);

    assertEquals(3, resultsList.size());
    assertEquals("struct", resultsList.get(0).messages.get(0));
    assertEquals("3", resultsList.get(0).messages.get(1));
    assertTrue(resultsList.get(0).instances.isEmpty());
    assertTrue(resultsList.get(1).messages.get(1).contains("2"));
    assertEquals(1, resultsList.get(1).instances.size());
    assertEquals(STRING_LIST_ITEM_3, resultsList.get(1).instances.get(0).getStringValue());
    assertTrue(resultsList.get(2).messages.get(1).contains("1"));
    assertEquals(2, resultsList.get(2).instances.size());
    assertEquals(STRING_LIST_ITEM_1, resultsList.get(2).instances.get(0).getStringValue());
    assertEquals(STRING_LIST_ITEM_2, resultsList.get(2).instances.get(1).getStringValue());
  }

  @Test
  public void reverseArrayOfAliases_emptyList() {
    List<String> stringList = new LinkedList<>();

    List<String> resultsList = Arrays.reverseArrayOfAliases(stringList);

    assertNotNull(resultsList);
    assertEquals(0, resultsList.size());
  }

  @Test
  public void reverseArrayOfAliases_reversesArray() {
    List<String> stringList = java.util.Arrays.asList(STRING_LIST_ITEM_1, STRING_LIST_ITEM_2);

    List<String> resultsList = Arrays.reverseArrayOfAliases(stringList);

    assertNotNull(resultsList);
    assertEquals(2, resultsList.size());
    assertEquals(STRING_LIST_ITEM_2, resultsList.get(0));
    assertEquals(STRING_LIST_ITEM_1, resultsList.get(1));
  }
}
