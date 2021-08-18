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
import android.os.Parcel;
import com.here.android.RobolectricApplication;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = Build.VERSION_CODES.M, application = RobolectricApplication.class)
public final class SerializationTest {

  @Test
  public void serializableStructParcelRoundTrip() {
    NestedSerializableStruct nestedStruct = new NestedSerializableStruct("foo");
    byte[] byteBuffer = {1, 7};
    List<String> stringList = Arrays.asList("bar", "baz");
    List<NestedSerializableStruct> structList =
        Arrays.asList(new NestedSerializableStruct("crazy"), new NestedSerializableStruct("stuff"));
    Map<Integer, String> errorMap = new HashMap<>();
    errorMap.put(0, "one");
    errorMap.put(1, "two");
    Set<String> hashSet = new java.util.HashSet<>(java.util.Arrays.asList("foo", "bar"));

    SerializableStruct serializableStruct = new SerializableStruct(
        true, (byte) 42, (short) 542, 65542, 2147484000L, 1.0f, 2.0, "nonsense", nestedStruct,
        byteBuffer, stringList, structList, errorMap, hashSet, java.util.EnumSet.of(FooEnum.BAR),
        FooEnum.BAR);

    Parcel parcel = Parcel.obtain();
    parcel.writeParcelable(serializableStruct, 0);
    parcel.setDataPosition(0);

    SerializableStruct resultStruct =
        parcel.readParcelable(Thread.currentThread().getContextClassLoader());

    assertNotNull(resultStruct);
    assertEquals(serializableStruct.boolField, resultStruct.boolField);
    assertEquals(serializableStruct.byteField, resultStruct.byteField);
    assertEquals(serializableStruct.shortField, resultStruct.shortField);
    assertEquals(serializableStruct.longField, resultStruct.longField);
    assertEquals(serializableStruct.floatField, resultStruct.floatField);
    assertEquals(serializableStruct.doubleField, resultStruct.doubleField);
    assertEquals(serializableStruct.stringField, resultStruct.stringField);
    assertNotNull(resultStruct.structField);
    assertEquals(serializableStruct.structField.someField, resultStruct.structField.someField);
    assertNotNull(resultStruct.byteBufferField);
    assertEquals(serializableStruct.byteBufferField[0], resultStruct.byteBufferField[0]);
    assertEquals(serializableStruct.byteBufferField[1], resultStruct.byteBufferField[1]);
    assertEquals(serializableStruct.arrayField, resultStruct.arrayField);
    assertNotNull(resultStruct.structArrayField);
    assertEquals(serializableStruct.structArrayField.size(), resultStruct.structArrayField.size());
    assertNotNull(resultStruct.structArrayField.get(0));
    assertEquals(
        serializableStruct.structArrayField.get(0).someField,
        resultStruct.structArrayField.get(0).someField);
    assertNotNull(resultStruct.structArrayField.get(1));
    assertEquals(
        serializableStruct.structArrayField.get(1).someField,
        resultStruct.structArrayField.get(1).someField);
    assertNotNull(resultStruct.mapField);
    assertEquals(serializableStruct.mapField.size(), resultStruct.mapField.size());
    assertEquals(serializableStruct.mapField.get(0), resultStruct.mapField.get(0));
    assertEquals(serializableStruct.mapField.get(1), resultStruct.mapField.get(1));
    assertEquals(serializableStruct.setField.size(), resultStruct.setField.size());
    assertTrue(resultStruct.setField.contains("foo"));
    assertTrue(resultStruct.setField.contains("bar"));
    assertEquals(serializableStruct.enumSetField.size(), resultStruct.enumSetField.size());
    assertTrue(resultStruct.enumSetField.contains(FooEnum.BAR));
    assertEquals(serializableStruct.enumField, resultStruct.enumField);
  }
}
