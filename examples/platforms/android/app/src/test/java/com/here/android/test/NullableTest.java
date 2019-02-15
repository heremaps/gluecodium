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
import static junit.framework.Assert.assertNull;

import android.os.Build;
import android.support.compat.BuildConfig;
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
@Config(
  sdk = Build.VERSION_CODES.M,
  application = RobolectricApplication.class,
  constants = BuildConfig.class
)
public class NullableTest {

  private final NullableInterface nullableInterface = new NullableInterface();

  private static class NullableListenerImpl implements NullableListener {
    private List<String> stringList;

    @Override
    public Double methodWithDouble(final Double value) {
      return value;
    }

    @Override
    public List<String> getArrayAttribute() {
      return stringList;
    }

    @Override
    public void setArrayAttribute(final List<String> value) {
      stringList = value;
    }
  }

  @Test
  public void nullableStructConstructor() {
    NullableInterface.NullableStruct struct = new NullableInterface.NullableStruct();

    assertNull(struct.stringField);
    assertNull(struct.boolField);
    assertNull(struct.doubleField);
    assertNull(struct.structField);
    assertNull(struct.enumField);
    assertNull(struct.arrayField);
    assertNull(struct.inlineArrayField);
    assertNull(struct.mapField);
  }

  @Test
  public void nullableNullStructRoundTrip() {
    NullableInterface.NullableStruct struct = new NullableInterface.NullableStruct();

    NullableInterface.NullableStruct result = nullableInterface.methodWithNullableStruct(struct);

    assertNull(result.stringField);
    assertNull(result.boolField);
    assertNull(result.doubleField);
    assertNull(result.structField);
    assertNull(result.enumField);
    assertNull(result.arrayField);
    assertNull(result.inlineArrayField);
    assertNull(result.mapField);
  }

  @Test
  public void nullableZeroStructRoundTrip() {
    NullableInterface.NullableStruct struct = new NullableInterface.NullableStruct();
    struct.stringField = "";
    struct.boolField = false;
    struct.doubleField = 0.0;
    struct.structField = new NullableInterface.SomeStruct();
    struct.enumField = NullableInterface.SomeEnum.OFF;
    struct.arrayField = new LinkedList<>();
    struct.inlineArrayField = new LinkedList<>();
    struct.mapField = new HashMap<>();

    NullableInterface.NullableStruct result = nullableInterface.methodWithNullableStruct(struct);

    assertEquals(struct.stringField, result.stringField);
    assertEquals(struct.boolField, result.boolField);
    assertEquals(struct.doubleField, result.doubleField);
    assertEquals(struct.structField, result.structField);
    assertEquals(struct.enumField, result.enumField);
    assertEquals(struct.arrayField, result.arrayField);
    assertEquals(struct.inlineArrayField, result.inlineArrayField);
    assertEquals(struct.mapField, result.mapField);
  }

  @Test
  public void nullableFilledStructRoundTrip() {
    NullableInterface.NullableStruct struct = new NullableInterface.NullableStruct();
    struct.stringField = "Foo";
    struct.boolField = true;
    struct.doubleField = 3.14;
    struct.structField = new NullableInterface.SomeStruct();
    struct.structField.stringField = "Woo";
    struct.enumField = NullableInterface.SomeEnum.ON;
    struct.arrayField = new LinkedList<>(Collections.singletonList("Bar"));
    struct.inlineArrayField = new LinkedList<>(Collections.singletonList("Baz"));
    struct.mapField = new HashMap<>();
    struct.mapField.put(7L, "Wee");

    NullableInterface.NullableStruct result = nullableInterface.methodWithNullableStruct(struct);

    assertEquals(struct.stringField, result.stringField);
    assertEquals(struct.boolField, result.boolField);
    assertEquals(struct.doubleField, result.doubleField);
    assertEquals(struct.structField, result.structField);
    assertEquals(struct.enumField, result.enumField);
    assertEquals(struct.arrayField, result.arrayField);
    assertEquals(struct.inlineArrayField, result.inlineArrayField);
    assertEquals(struct.mapField, result.mapField);
  }

  @Test
  public void nullableIntsStructConstructor() {
    NullableInterface.NullableIntsStruct struct = new NullableInterface.NullableIntsStruct();

    assertNull(struct.int8Field);
    assertNull(struct.int16Field);
    assertNull(struct.int32Field);
    assertNull(struct.int64Field);
    assertNull(struct.uint8Field);
    assertNull(struct.uint16Field);
    assertNull(struct.uint32Field);
    assertNull(struct.uint64Field);
  }

  @Test
  public void nullableIntsNullStructRoundTrip() {
    NullableInterface.NullableIntsStruct struct = new NullableInterface.NullableIntsStruct();

    NullableInterface.NullableIntsStruct result
        = nullableInterface.methodWithNullableIntsStruct(struct);

    assertNull(result.int8Field);
    assertNull(result.int16Field);
    assertNull(result.int32Field);
    assertNull(result.int64Field);
    assertNull(result.uint8Field);
    assertNull(result.uint16Field);
    assertNull(result.uint32Field);
    assertNull(result.uint64Field);
  }

  @Test
  public void nullableIntsZeroStructRoundTrip() {
    NullableInterface.NullableIntsStruct struct = new NullableInterface.NullableIntsStruct();
    struct.int8Field = (byte)0;
    struct.int16Field = (short)0;
    struct.int32Field = 0;
    struct.int64Field = 0L;
    struct.uint8Field = (short)0;
    struct.uint16Field = 0;
    struct.uint32Field = 0L;
    struct.uint64Field = 0L;

    NullableInterface.NullableIntsStruct result
        = nullableInterface.methodWithNullableIntsStruct(struct);

    assertEquals(struct.int8Field, result.int8Field);
    assertEquals(struct.int16Field, result.int16Field);
    assertEquals(struct.int32Field, result.int32Field);
    assertEquals(struct.int64Field, result.int64Field);
    assertEquals(struct.uint8Field, result.uint8Field);
    assertEquals(struct.uint16Field, result.uint16Field);
    assertEquals(struct.uint32Field, result.uint32Field);
    assertEquals(struct.uint64Field, result.uint64Field);
  }

  @Test
  public void nullableIntsFilledStructRoundTrip() {
    NullableInterface.NullableIntsStruct struct = new NullableInterface.NullableIntsStruct();
    struct.int8Field = (byte)42;
    struct.int16Field = (short)-71;
    struct.int32Field = -1337;
    struct.int64Field = -3735928559L;
    struct.uint8Field = (short)71;
    struct.uint16Field = 1337;
    struct.uint32Field = 2735718543L;
    struct.uint64Field = 3735928559L;

    NullableInterface.NullableIntsStruct result
        = nullableInterface.methodWithNullableIntsStruct(struct);

    assertEquals(struct.int8Field, result.int8Field);
    assertEquals(struct.int16Field, result.int16Field);
    assertEquals(struct.int32Field, result.int32Field);
    assertEquals(struct.int64Field, result.int64Field);
    assertEquals(struct.uint8Field, result.uint8Field);
    assertEquals(struct.uint16Field, result.uint16Field);
    assertEquals(struct.uint32Field, result.uint32Field);
    assertEquals(struct.uint64Field, result.uint64Field);
  }

  @Test
  public void nullableStringMethodWithNull() {
    String value = null;

    String result = nullableInterface.methodWithString(value);

    assertEquals(result, value);
  }

  @Test
  public void nullableStringMethodWithNonNull() {
    String value = "Foo";

    String result = nullableInterface.methodWithString(value);

    assertEquals(result, value);
  }

  @Test
  public void nullableBooleanMethodWithNull() {
    Boolean value = null;

    Boolean result = nullableInterface.methodWithBoolean(value);

    assertEquals(result, value);
  }

  @Test
  public void nullableBooleanMethodWithZero() {
    Boolean value = false;

    Boolean result = nullableInterface.methodWithBoolean(value);

    assertEquals(result, value);
  }

  @Test
  public void nullableBooleanMethodWithNonNull() {
    Boolean value = true;

    Boolean result = nullableInterface.methodWithBoolean(value);

    assertEquals(result, value);
  }

  @Test
  public void nullableDoubleMethodWithNull() {
    Double value = null;

    Double result = nullableInterface.methodWithDouble(value);

    assertEquals(result, value);
  }

  @Test
  public void nullableDoubleMethodWithZero() {
    Double value = 0.0;

    Double result = nullableInterface.methodWithDouble(value);

    assertEquals(result, value);
  }

  @Test
  public void nullableDoubleMethodWithNonNull() {
    Double value = 3.14;

    Double result = nullableInterface.methodWithDouble(value);

    assertEquals(result, value);
  }

  @Test
  public void nullableIntegerMethodWithNull() {
    Long value = null;

    Long result = nullableInterface.methodWithInt(value);

    assertEquals(result, value);
  }

  @Test
  public void nullableIntegerMethodWithZero() {
    Long value = 0L;

    Long result = nullableInterface.methodWithInt(value);

    assertEquals(result, value);
  }

  @Test
  public void nullableIntegerMethodWithNonNull() {
    Long value = 42L;

    Long result = nullableInterface.methodWithInt(value);

    assertEquals(result, value);
  }

  @Test
  public void nullableStructMethodWithNull() {
    NullableInterface.SomeStruct value = null;

    NullableInterface.SomeStruct result = nullableInterface.methodWithSomeStruct(value);

    assertEquals(result, value);
  }

  @Test
  public void nullableStructMethodWithNonNull() {
    NullableInterface.SomeStruct value = new NullableInterface.SomeStruct();

    NullableInterface.SomeStruct result = nullableInterface.methodWithSomeStruct(value);

    assertEquals(result, value);
  }

  @Test
  public void nullableEnumMethodWithNull() {
    NullableInterface.SomeEnum value = null;

    NullableInterface.SomeEnum result = nullableInterface.methodWithSomeEnum(value);

    assertEquals(result, value);
  }

  @Test
  public void nullableEnumMethodWithNonNull() {
    NullableInterface.SomeEnum value = NullableInterface.SomeEnum.ON;

    NullableInterface.SomeEnum result = nullableInterface.methodWithSomeEnum(value);

    assertEquals(result, value);
  }

  @Test
  public void nullableArrayMethodWithNull() {
    List<String> value = null;

    List<String> result = nullableInterface.methodWithSomeArray(value);

    assertEquals(result, value);
  }

  @Test
  public void nullableArrayMethodWithNonNull() {
    List<String> value = new LinkedList<>();

    List<String> result = nullableInterface.methodWithSomeArray(value);

    assertEquals(result, value);
  }

  @Test
  public void nullableInlineArrayMethodWithNull() {
    List<String> value = null;

    List<String> result = nullableInterface.methodWithInlineArray(value);

    assertEquals(result, value);
  }

  @Test
  public void nullableInlineArrayMethodWithNonNull() {
    List<String> value = new LinkedList<>();

    List<String> result = nullableInterface.methodWithInlineArray(value);

    assertEquals(result, value);
  }

  @Test
  public void nullableMapMethodWithNull() {
    Map<Long, String> value = null;

    Map<Long, String> result = nullableInterface.methodWithSomeMap(value);

    assertEquals(result, value);
  }

  @Test
  public void nullableMapMethodWithNonNull() {
    Map<Long, String> value = new HashMap<>();

    Map<Long, String> result = nullableInterface.methodWithSomeMap(value);

    assertEquals(result, value);
  }

  @Test
  public void nullableStringAttributeWithNull() {
    String value = null;

    nullableInterface.setStringAttribute(value);
    String result = nullableInterface.getStringAttribute();

    assertEquals(result, value);
  }

  @Test
  public void nullableStringAttributeWithNonNull() {
    String value = "Foo";

    nullableInterface.setStringAttribute(value);
    String result = nullableInterface.getStringAttribute();

    assertEquals(result, value);
  }

  @Test
  public void nullableBooleanAttributeWithNull() {
    Boolean value = null;

    nullableInterface.setBoolAttribute(value);
    Boolean result = nullableInterface.getBoolAttribute();

    assertEquals(result, value);
  }

  @Test
  public void nullableBooleanAttributeWithNonNull() {
    Boolean value = true;

    nullableInterface.setBoolAttribute(value);
    Boolean result = nullableInterface.getBoolAttribute();

    assertEquals(result, value);
  }

  @Test
  public void nullableDoubleAttributeWithNull() {
    Double value = null;

    nullableInterface.setDoubleAttribute(value);
    Double result = nullableInterface.getDoubleAttribute();

    assertEquals(result, value);
  }

  @Test
  public void nullableDoubleAttributeWithNonNull() {
    Double value = 3.14;

    nullableInterface.setDoubleAttribute(value);
    Double result = nullableInterface.getDoubleAttribute();

    assertEquals(result, value);
  }

  @Test
  public void nullableIntegerAttributeWithNull() {
    Long value = null;

    nullableInterface.setIntAttribute(value);
    Long result = nullableInterface.getIntAttribute();

    assertEquals(result, value);
  }

  @Test
  public void nullableIntegerAttributeWithNonNull() {
    Long value = 42L;

    nullableInterface.setIntAttribute(value);
    Long result = nullableInterface.getIntAttribute();

    assertEquals(result, value);
  }

  @Test
  public void nullableStructAttributeWithNull() {
    NullableInterface.SomeStruct value = null;

    nullableInterface.setStructAttribute(value);
    NullableInterface.SomeStruct result = nullableInterface.getStructAttribute();

    assertEquals(result, value);
  }

  @Test
  public void nullableStructAttributeWithNonNull() {
    NullableInterface.SomeStruct value = new NullableInterface.SomeStruct();

    nullableInterface.setStructAttribute(value);
    NullableInterface.SomeStruct result = nullableInterface.getStructAttribute();

    assertEquals(result, value);
  }

  @Test
  public void nullableEnumAttributeWithNull() {
    NullableInterface.SomeEnum value = null;

    nullableInterface.setEnumAttribute(value);
    NullableInterface.SomeEnum result = nullableInterface.getEnumAttribute();

    assertEquals(result, value);
  }

  @Test
  public void nullableEnumAttributeWithNonNull() {
    NullableInterface.SomeEnum value = NullableInterface.SomeEnum.ON;

    nullableInterface.setEnumAttribute(value);
    NullableInterface.SomeEnum result = nullableInterface.getEnumAttribute();

    assertEquals(result, value);
  }

  @Test
  public void nullableArrayAttributeWithNull() {
    List<String> value = null;

    nullableInterface.setArrayAttribute(value);
    List<String> result = nullableInterface.getArrayAttribute();

    assertEquals(result, value);
  }

  @Test
  public void nullableArrayAttributeWithNonNull() {
    List<String> value = new LinkedList<>();

    nullableInterface.setArrayAttribute(value);
    List<String> result = nullableInterface.getArrayAttribute();

    assertEquals(result, value);
  }

  @Test
  public void nullableInlineArrayAttributeWithNull() {
    List<String> value = null;

    nullableInterface.setInlineArrayAttribute(value);
    List<String> result = nullableInterface.getInlineArrayAttribute();

    assertEquals(result, value);
  }

  @Test
  public void nullableInlineArrayAttributeWithNonNull() {
    List<String> value = new LinkedList<>();

    nullableInterface.setInlineArrayAttribute(value);
    List<String> result = nullableInterface.getInlineArrayAttribute();

    assertEquals(result, value);
  }

  @Test
  public void nullableMapAttributeWithNull() {
    Map<Long, String> value = null;

    nullableInterface.setMapAttribute(value);
    Map<Long, String> result = nullableInterface.getMapAttribute();

    assertEquals(result, value);
  }

  @Test
  public void nullableMapAttributeWithNonNull() {
    Map<Long, String> value = new HashMap<>();

    nullableInterface.setMapAttribute(value);
    Map<Long, String> result = nullableInterface.getMapAttribute();

    assertEquals(result, value);
  }

  @Test
  public void nullableMethodListenerRoundtripWithNull() {
    NullableListener listener = new NullableListenerImpl();
    Double value = null;

    Double result = NullableInterface.nullableListenerMethodRoundTrip(listener, value);

    assertEquals(result, value);
  }

  @Test
  public void nullableMethodListenerRoundtripWithNonNull() {
    NullableListener listener = new NullableListenerImpl();
    Double value = 3.14;

    Double result = NullableInterface.nullableListenerMethodRoundTrip(listener, value);

    assertEquals(result, value);
  }

  @Test
  public void nullableAttributeListenerRoundtripWithNull() {
    NullableListener listener = new NullableListenerImpl();
    List<String> value = null;

    List<String> result = NullableInterface.nullableListenerAttributeRoundTrip(listener, value);

    assertEquals(result, value);
  }

  @Test
  public void nullableAttributeListenerRoundtripWithNonNull() {
    NullableListener listener = new NullableListenerImpl();
    List<String> value = new LinkedList<>();

    List<String> result = NullableInterface.nullableListenerAttributeRoundTrip(listener, value);

    assertEquals(result, value);
  }
}
