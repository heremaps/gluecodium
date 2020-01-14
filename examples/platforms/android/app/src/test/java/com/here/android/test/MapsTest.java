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

import android.os.Build;
import com.example.here.hello.BuildConfig;
import com.here.android.RobolectricApplication;
import java.util.*;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(
    sdk = Build.VERSION_CODES.M,
    application = RobolectricApplication.class,
    constants = BuildConfig.class)
public class MapsTest {

  private static final String LOWERCASE_VALUE_1 = "lowercase";
  private static final String LOWERCASE_VALUE_2 = "UPPERCASE";
  private static final String LOWERCASE_VALUE_3 = "numberZ12345";
  private static final String UPPERCASE_VALUE_1 = "LOWERCASE";
  private static final String UPPERCASE_VALUE_2 = "UPPERCASE";
  private static final String UPPERCASE_VALUE_3 = "NUMBERZ12345";

  @Test
  public void methodWithMaps_emptyMap() {
    Map<Integer, String> intStringMap = new HashMap<>();

    Map<Integer, String> resultsMap = Maps.methodWithMap(intStringMap);

    assertNotNull(resultsMap);
    assertEquals(0, resultsMap.size());
  }

  @Test
  public void methodWithMaps_nullMap() {
    Map<Integer, String> resultsMap = Maps.methodWithMap(null);

    assertNotNull(resultsMap);
    assertEquals(0, resultsMap.size());
  }

  @Test
  public void methodWithMaps_multipleItems() {
    Map<Integer, String> intStringMap = new HashMap<>();
    intStringMap.put(11, LOWERCASE_VALUE_1);
    intStringMap.put(42, LOWERCASE_VALUE_2);
    intStringMap.put(199, LOWERCASE_VALUE_3);

    Map<Integer, String> resultsMap = Maps.methodWithMap(intStringMap);

    assertNotNull(resultsMap);
    assertEquals(3, resultsMap.size());
    // method returns string values in uppercase
    assertEquals(UPPERCASE_VALUE_1, resultsMap.get(11));
    assertEquals(UPPERCASE_VALUE_2, resultsMap.get(42));
    assertEquals(UPPERCASE_VALUE_3, resultsMap.get(199));
  }

  @Test
  public void methodWithMapToArray_emptyMap() {
    Map<Short, List<String>> arrayMap = new HashMap<>();

    Map<Short, List<String>> resultsMap = Maps.methodWithMapOfArrays(arrayMap);

    assertNotNull(resultsMap);
    assertEquals(0, resultsMap.size());
  }

  @Test
  public void methodWithMapToArray_multipleItems() {
    Map<Short, List<String>> arrayMap = new HashMap<>();

    arrayMap.put((short) 11, Collections.singletonList(LOWERCASE_VALUE_1));
    arrayMap.put((short) 42, java.util.Arrays.asList(LOWERCASE_VALUE_2, LOWERCASE_VALUE_3));
    arrayMap.put((short) 199, Collections.emptyList());

    Map<Short, List<String>> resultsMap = Maps.methodWithMapOfArrays(arrayMap);

    assertNotNull(resultsMap);
    assertEquals(3, resultsMap.size());
    assertEquals(Collections.singletonList(UPPERCASE_VALUE_1), resultsMap.get((short) 11));
    assertEquals(
        java.util.Arrays.asList(UPPERCASE_VALUE_2, UPPERCASE_VALUE_3), resultsMap.get((short) 42));
    assertEquals(Collections.emptyList(), resultsMap.get((short) 199));
  }

  @Test
  public void methodWithMapToStruct_emptyMap() {
    Map<Short, Maps.SomeStruct> byteStructMap = new HashMap<>();

    Map<Short, Maps.SomeStruct> resultsMap = Maps.methodWithMapToStruct(byteStructMap);

    assertNotNull(resultsMap);
    assertEquals(0, resultsMap.size());
  }

  @Test
  public void methodWithMapToStruct_multipleItems() {
    Map<Short, Maps.SomeStruct> byteStructMap = new HashMap<>();
    Maps.SomeStruct someStruct1 = new Maps.SomeStruct();
    someStruct1.value = LOWERCASE_VALUE_1;
    byteStructMap.put((short) 11, someStruct1);
    Maps.SomeStruct someStruct2 = new Maps.SomeStruct();
    someStruct2.value = LOWERCASE_VALUE_2;
    byteStructMap.put((short) 42, someStruct2);
    Maps.SomeStruct someStruct3 = new Maps.SomeStruct();
    someStruct3.value = LOWERCASE_VALUE_3;
    byteStructMap.put((short) 199, someStruct3);

    Map<Short, Maps.SomeStruct> resultsMap = Maps.methodWithMapToStruct(byteStructMap);

    assertNotNull(resultsMap);
    assertEquals(3, resultsMap.size());
    // method returns string values in uppercase, inside structs
    assertEquals(UPPERCASE_VALUE_1, resultsMap.get((short) 11).value);
    assertEquals(UPPERCASE_VALUE_2, resultsMap.get((short) 42).value);
    assertEquals(UPPERCASE_VALUE_3, resultsMap.get((short) 199).value);
  }

  @Test
  public void methodWithNestedMap_emptyMap() {
    Map<Short, Map<Short, Maps.SomeStruct>> byteMapMap = new HashMap<>();

    Map<Short, Map<Short, Maps.SomeStruct>> resultsMap = Maps.methodWithNestedMap(byteMapMap);

    assertNotNull(resultsMap);
    assertEquals(0, resultsMap.size());
  }

  @Test
  public void methodWithNestedMap_multipleItems() {
    Map<Short, Maps.SomeStruct> byteStructMap = new HashMap<>();
    Maps.SomeStruct someStruct1 = new Maps.SomeStruct();
    someStruct1.value = LOWERCASE_VALUE_1;
    byteStructMap.put((short) 11, someStruct1);
    Maps.SomeStruct someStruct2 = new Maps.SomeStruct();
    someStruct2.value = LOWERCASE_VALUE_2;
    byteStructMap.put((short) 42, someStruct2);
    Maps.SomeStruct someStruct3 = new Maps.SomeStruct();
    someStruct3.value = LOWERCASE_VALUE_3;
    byteStructMap.put((short) 199, someStruct3);

    Map<Short, Map<Short, Maps.SomeStruct>> byteMapMap = new HashMap<>();
    byteMapMap.put((short) 7, byteStructMap);
    byteMapMap.put((short) 93, new HashMap<>());

    Map<Short, Map<Short, Maps.SomeStruct>> resultsMap = Maps.methodWithNestedMap(byteMapMap);

    assertNotNull(resultsMap);
    assertEquals(2, resultsMap.size());
    assertEquals(0, resultsMap.get((short) 93).size());

    Map<Short, Maps.SomeStruct> resultSubMap = resultsMap.get((short) 7);
    assertEquals(3, resultSubMap.size());
    // method returns string values in uppercase, inside structs
    assertEquals(UPPERCASE_VALUE_1, resultSubMap.get((short) 11).value);
    assertEquals(UPPERCASE_VALUE_2, resultSubMap.get((short) 42).value);
    assertEquals(UPPERCASE_VALUE_3, resultSubMap.get((short) 199).value);
  }

  @Test
  public void methodWithStructWithMap_emptyMap() {
    Maps.StructWithMap structWithMap = new Maps.StructWithMap();
    structWithMap.errorMapping = new HashMap<>();

    Maps.StructWithMap result = Maps.methodWithStructWithMap(structWithMap);

    assertNotNull(result);
    assertNotNull(result.errorMapping);
    assertEquals(0, result.errorMapping.size());
  }

  @Test
  public void methodWithStructWithMap_multipleItems() {
    Maps.StructWithMap structWithMap = new Maps.StructWithMap();
    structWithMap.errorMapping = new HashMap<>();
    structWithMap.errorMapping.put(11, LOWERCASE_VALUE_1);
    structWithMap.errorMapping.put(42, LOWERCASE_VALUE_2);
    structWithMap.errorMapping.put(199, LOWERCASE_VALUE_3);

    Maps.StructWithMap result = Maps.methodWithStructWithMap(structWithMap);

    assertNotNull(result);
    assertNotNull(result.errorMapping);
    assertEquals(3, result.errorMapping.size());
    // method returns string values in uppercase
    assertEquals(UPPERCASE_VALUE_1, result.errorMapping.get(11));
    assertEquals(UPPERCASE_VALUE_2, result.errorMapping.get(42));
    assertEquals(UPPERCASE_VALUE_3, result.errorMapping.get(199));
  }

  @Test
  public void methodWithEnumToStringMap_emptyMap() {
    Map<Maps.SomeEnum, String> enumStringMap = new HashMap<>();

    Map<Maps.SomeEnum, String> resultsMap = Maps.methodWithEnumToStringMap(enumStringMap);

    assertNotNull(resultsMap);
    assertEquals(0, resultsMap.size());
  }

  @Test
  public void methodWithEnumToStringMap_multipleItems() {
    Map<Maps.SomeEnum, String> enumStringMap = new HashMap<>();
    enumStringMap.put(Maps.SomeEnum.FOO_VALUE, LOWERCASE_VALUE_1);
    enumStringMap.put(Maps.SomeEnum.BAR_VALUE, LOWERCASE_VALUE_2);

    Map<Maps.SomeEnum, String> resultsMap = Maps.methodWithEnumToStringMap(enumStringMap);

    assertNotNull(resultsMap);
    assertEquals(2, resultsMap.size());
    // method returns string values in uppercase
    assertEquals(UPPERCASE_VALUE_1, resultsMap.get(Maps.SomeEnum.FOO_VALUE));
    assertEquals(UPPERCASE_VALUE_2, resultsMap.get(Maps.SomeEnum.BAR_VALUE));
  }

  @Test
  public void methodWithMapOfInstances() {
    Map<String, SimpleInterfaceOne> inputMap = new HashMap<>();
    inputMap.put("One", InterfacesFactory.createSimpleInterfaceOne());
    inputMap.put("Two", InterfacesFactory.createSimpleInterfaceOne());
    inputMap.get("One").setStringValue("Hello");
    inputMap.get("Two").setStringValue("Hello");

    Map<String, SimpleInterfaceOne> resultsMap = Maps.methodWithMapOfInstances(inputMap);

    assertNotNull(resultsMap);
    assertEquals(2, resultsMap.size());
    assertNotNull(resultsMap.get("One"));
    assertEquals("Hello One", resultsMap.get("One").getStringValue());
    assertNotNull(resultsMap.get("Two"));
    assertEquals("Hello Two", resultsMap.get("Two").getStringValue());
  }

  @Test
  public void structToStringMapRoundTrip() {
    Map<Maps.EquatableStruct, String> input = new HashMap<>();
    input.put(new Maps.EquatableStruct("foo"), "foo");
    input.put(new Maps.EquatableStruct("bar"), "bar");

    Map<Maps.EquatableStruct, String> result = Maps.structToStringRoundTrip(input);

    assertEquals(input, result);
  }

  @Test
  public void classToStringMapRoundTrip() {
    Map<EquatableClass, String> input = new HashMap<>();
    input.put(new EquatableClass("foo"), "foo");
    input.put(new EquatableClass("bar"), "bar");

    Map<EquatableClass, String> result = Maps.classToStringRoundTrip(input);

    assertEquals(input, result);
  }

  @Test
  public void pointerEquatableClassToStringMapRoundTrip() {
    Map<PointerEquatableClass, String> input = new HashMap<>();
    input.put(new PointerEquatableClass("foo"), "foo");
    input.put(new PointerEquatableClass("bar"), "bar");

    Map<PointerEquatableClass, String> result = Maps.pointerEquatableClassToStringRoundTrip(input);

    assertEquals(input, result);
  }
}
