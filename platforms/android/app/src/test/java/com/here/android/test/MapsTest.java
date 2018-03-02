/*
 * Copyright (C) 2018 HERE Global B.V. and its affiliate(s). All rights reserved.
 *
 * This software, including documentation, is protected by copyright controlled by
 * HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
 * adapting or translating, any or all of this material requires the prior written
 * consent of HERE Global B.V. This material also contains confidential information,
 * which may not be disclosed to others without prior written consent of HERE Global B.V.
 *
 */
package com.here.android.test;

import static junit.framework.Assert.assertEquals;
import static junit.framework.Assert.assertNotNull;

import android.os.Build;
import android.support.compat.BuildConfig;
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
  constants = BuildConfig.class
)
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
    Map<String, List<Long>> arrayMap = new HashMap<>();

    Map<String, List<Long>> resultsMap = MapsArrays.methodWithStringToArrayMap(arrayMap);

    assertNotNull(resultsMap);
    assertEquals(0, resultsMap.size());
  }

  @Test
  public void methodWithMapToArray_multipleItems() {
    Map<String, List<Long>> arrayMap = new HashMap<>();

    arrayMap.put("one", new ArrayList<>(java.util.Arrays.asList(2L, 3L, 4L, 5L)));
    arrayMap.put("two", new ArrayList<>(java.util.Arrays.asList(0L, 120L)));
    arrayMap.put("three", Collections.emptyList());

    Map<String, List<Long>> resultsMap = MapsArrays.methodWithStringToArrayMap(arrayMap);

    assertNotNull(resultsMap);
    assertEquals(3, resultsMap.size());
    assertEquals(new ArrayList<>(java.util.Arrays.asList(3L, 4L, 5L, 6L)), resultsMap.get("one"));
    assertEquals(new ArrayList<>(java.util.Arrays.asList(1L, 121L)), resultsMap.get("two"));
    assertEquals(Collections.emptyList(), resultsMap.get("three"));
  }

  @Test
  public void methodWithMapToStruct_emptyMap() {
    Map<Long, Maps.SomeStruct> byteStructMap = new HashMap<>();

    Map<Long, Maps.SomeStruct> resultsMap = Maps.methodWithMapToStruct(byteStructMap);

    assertNotNull(resultsMap);
    assertEquals(0, resultsMap.size());
  }

  @Test
  public void methodWithMapToStruct_multipleItems() {
    Map<Long, Maps.SomeStruct> byteStructMap = new HashMap<>();
    Maps.SomeStruct someStruct1 = new Maps.SomeStruct();
    someStruct1.value = LOWERCASE_VALUE_1;
    byteStructMap.put(11L, someStruct1);
    Maps.SomeStruct someStruct2 = new Maps.SomeStruct();
    someStruct2.value = LOWERCASE_VALUE_2;
    byteStructMap.put(42L, someStruct2);
    Maps.SomeStruct someStruct3 = new Maps.SomeStruct();
    someStruct3.value = LOWERCASE_VALUE_3;
    byteStructMap.put(199L, someStruct3);

    Map<Long, Maps.SomeStruct> resultsMap = Maps.methodWithMapToStruct(byteStructMap);

    assertNotNull(resultsMap);
    assertEquals(3, resultsMap.size());
    // method returns string values in uppercase, inside structs
    assertEquals(UPPERCASE_VALUE_1, resultsMap.get(11L).value);
    assertEquals(UPPERCASE_VALUE_2, resultsMap.get(42L).value);
    assertEquals(UPPERCASE_VALUE_3, resultsMap.get(199L).value);
  }

  @Test
  public void methodWithNestedMap_emptyMap() {
    Map<Long, Map<Long, Maps.SomeStruct>> byteMapMap = new HashMap<>();

    Map<Long, Map<Long, Maps.SomeStruct>> resultsMap = Maps.methodWithNestedMap(byteMapMap);

    assertNotNull(resultsMap);
    assertEquals(0, resultsMap.size());
  }

  @Test
  public void methodWithNestedMap_multipleItems() {
    Map<Long, Maps.SomeStruct> byteStructMap = new HashMap<>();
    Maps.SomeStruct someStruct1 = new Maps.SomeStruct();
    someStruct1.value = LOWERCASE_VALUE_1;
    byteStructMap.put(11L, someStruct1);
    Maps.SomeStruct someStruct2 = new Maps.SomeStruct();
    someStruct2.value = LOWERCASE_VALUE_2;
    byteStructMap.put(42L, someStruct2);
    Maps.SomeStruct someStruct3 = new Maps.SomeStruct();
    someStruct3.value = LOWERCASE_VALUE_3;
    byteStructMap.put(199L, someStruct3);

    Map<Long, Map<Long, Maps.SomeStruct>> byteMapMap = new HashMap<>();
    byteMapMap.put(7L, byteStructMap);
    byteMapMap.put(93L, new HashMap<>());

    Map<Long, Map<Long, Maps.SomeStruct>> resultsMap = Maps.methodWithNestedMap(byteMapMap);

    assertNotNull(resultsMap);
    assertEquals(2, resultsMap.size());
    assertEquals(0, resultsMap.get(93L).size());

    Map<Long, Maps.SomeStruct> resultSubMap = resultsMap.get(7L);
    assertEquals(3, resultSubMap.size());
    // method returns string values in uppercase, inside structs
    assertEquals(UPPERCASE_VALUE_1, resultSubMap.get(11L).value);
    assertEquals(UPPERCASE_VALUE_2, resultSubMap.get(42L).value);
    assertEquals(UPPERCASE_VALUE_3, resultSubMap.get(199L).value);
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
}
