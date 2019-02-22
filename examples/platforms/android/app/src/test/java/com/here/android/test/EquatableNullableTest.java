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

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertTrue;

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
  constants = BuildConfig.class
)
public final class EquatableNullableTest {

  private final EquatableNullableStruct mainStruct = createEquatableNullableStruct();

  @Test
  public void equatableNullableStructEquals() {
    EquatableNullableStruct otherStruct = createEquatableNullableStruct();

    assertEquals(mainStruct, otherStruct);
    assertEquals(mainStruct.hashCode(), otherStruct.hashCode());
  }

  @Test
  public void equatableNullableStructNotEqualsBooleanField() {
    EquatableNullableStruct otherStruct = createEquatableNullableStruct();
    otherStruct.boolField = !otherStruct.boolField;

    assertNotEquals(mainStruct, otherStruct);
    assertNotEquals(mainStruct.hashCode(), otherStruct.hashCode());
  }

  @Test
  public void equatableNullableStructNotEqualsIntField() {
    EquatableNullableStruct otherStruct = createEquatableNullableStruct();
    otherStruct.intField += 1;

    assertNotEquals(mainStruct, otherStruct);
    assertNotEquals(mainStruct.hashCode(), otherStruct.hashCode());
  }

  @Test
  public void equatableNullableStructNotEqualsUintField() {
    EquatableNullableStruct otherStruct = createEquatableNullableStruct();
    otherStruct.uintField += 1;

    assertNotEquals(mainStruct, otherStruct);
    assertNotEquals(mainStruct.hashCode(), otherStruct.hashCode());
  }

  @Test
  public void equatableNullableStructNotEqualsFloatField() {
    EquatableNullableStruct otherStruct = createEquatableNullableStruct();
    otherStruct.floatField += 1;

    assertNotEquals(mainStruct, otherStruct);
    assertNotEquals(mainStruct.hashCode(), otherStruct.hashCode());
  }

  @Test
  public void equatableNullableStructNotEqualsStringField() {
    EquatableNullableStruct otherStruct = createEquatableNullableStruct();
    otherStruct.stringField += "foo";

    assertNotEquals(mainStruct, otherStruct);
    assertNotEquals(mainStruct.hashCode(), otherStruct.hashCode());
  }

  @Test
  public void equatableNullableStructNotEqualsStructField() {
    EquatableNullableStruct otherStruct = createEquatableNullableStruct();
    otherStruct.structField.fooField += "bar";

    assertNotEquals(mainStruct, otherStruct);
    assertNotEquals(mainStruct.hashCode(), otherStruct.hashCode());
  }

  @Test
  public void equatableNullableStructNotEqualsEnumField() {
    EquatableNullableStruct otherStruct = createEquatableNullableStruct();
    otherStruct.enumField = SomeSomeEnum.FOO;

    assertNotEquals(mainStruct, otherStruct);
    assertNotEquals(mainStruct.hashCode(), otherStruct.hashCode());
  }

  @Test
  public void equatableNullableStructNotEqualsMapField() {
    EquatableNullableStruct otherStruct = createEquatableNullableStruct();
    otherStruct.mapField.put(2, "foo");

    assertNotEquals(mainStruct, otherStruct);
    assertNotEquals(mainStruct.hashCode(), otherStruct.hashCode());
  }

  @Test
  public void equatableNullableStructNotEqualsArrayField() {
    EquatableNullableStruct otherStruct = createEquatableNullableStruct();
    otherStruct.arrayField.add("foo");

    assertNotEquals(mainStruct, otherStruct);
    assertNotEquals(mainStruct.hashCode(), otherStruct.hashCode());
  }

  @Test
  public void equatableNullableStructEqualsCpp() {
    EquatableNullableStruct otherStruct = createEquatableNullableStruct();

    assertTrue(EquatableInterface.areEqual(mainStruct, otherStruct));
  }

  @Test
  public void equatableNullableStructEqualsCppWithNulls() {
    assertTrue(EquatableInterface.areEqual(
      new EquatableNullableStruct(), new EquatableNullableStruct()));
  }

  @Test
  public void equatableNullableStructNotEqualsCpp() {
    EquatableNullableStruct otherStruct = createEquatableNullableStruct();
    otherStruct.arrayField.add("foo");

    assertFalse(EquatableInterface.areEqual(mainStruct, otherStruct));
  }

  private static EquatableNullableStruct createEquatableNullableStruct() {

    Map<Integer, String> someMap = new HashMap<>();
    someMap.put(0, "one");
    someMap.put(1, "two");

    List<String> someArray = new LinkedList<>();
    someArray.add("one");
    someArray.add("two");

    return new EquatableNullableStruct.Builder()
        .setBoolField(true)
        .setIntField(-42)
        .setUintField(6542)
        .setFloatField(3.14f)
        .setStringField("nonsense")
        .setStructField(new NestedEquatableStruct("foo"))
        .setEnumField(SomeSomeEnum.BAR)
        .setMapField(someMap)
        .setArrayField(someArray)
        .build();
  }
}
