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
import com.here.android.RobolectricApplication;
import java.util.*;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = Build.VERSION_CODES.M, application = RobolectricApplication.class)
public final class EquatableNullableTest {

  private final Equatable.EquatableNullableStruct mainStruct = createEquatableNullableStruct();

  @Test
  public void equatableNullableStructEquals() {
    Equatable.EquatableNullableStruct otherStruct = createEquatableNullableStruct();

    assertEquals(mainStruct, otherStruct);
    assertEquals(mainStruct.hashCode(), otherStruct.hashCode());
  }

  @Test
  public void equatableNullableStructNotEqualsBooleanField() {
    Equatable.EquatableNullableStruct otherStruct = createEquatableNullableStruct();
    otherStruct.boolField = !otherStruct.boolField;

    assertNotEquals(mainStruct, otherStruct);
    assertNotEquals(mainStruct.hashCode(), otherStruct.hashCode());
  }

  @Test
  public void equatableNullableStructNotEqualsIntField() {
    Equatable.EquatableNullableStruct otherStruct = createEquatableNullableStruct();
    otherStruct.intField += 1;

    assertNotEquals(mainStruct, otherStruct);
    assertNotEquals(mainStruct.hashCode(), otherStruct.hashCode());
  }

  @Test
  public void equatableNullableStructNotEqualsUintField() {
    Equatable.EquatableNullableStruct otherStruct = createEquatableNullableStruct();
    otherStruct.uintField += 1;

    assertNotEquals(mainStruct, otherStruct);
    assertNotEquals(mainStruct.hashCode(), otherStruct.hashCode());
  }

  @Test
  public void equatableNullableStructNotEqualsFloatField() {
    Equatable.EquatableNullableStruct otherStruct = createEquatableNullableStruct();
    otherStruct.floatField += 1;

    assertNotEquals(mainStruct, otherStruct);
    assertNotEquals(mainStruct.hashCode(), otherStruct.hashCode());
  }

  @Test
  public void equatableNullableStructNotEqualsStringField() {
    Equatable.EquatableNullableStruct otherStruct = createEquatableNullableStruct();
    otherStruct.stringField += "foo";

    assertNotEquals(mainStruct, otherStruct);
    assertNotEquals(mainStruct.hashCode(), otherStruct.hashCode());
  }

  @Test
  public void equatableNullableStructNotEqualsStructField() {
    Equatable.EquatableNullableStruct otherStruct = createEquatableNullableStruct();
    otherStruct.structField.fooField += "bar";

    assertNotEquals(mainStruct, otherStruct);
    assertNotEquals(mainStruct.hashCode(), otherStruct.hashCode());
  }

  @Test
  public void equatableNullableStructNotEqualsEnumField() {
    Equatable.EquatableNullableStruct otherStruct = createEquatableNullableStruct();
    otherStruct.enumField = Equatable.SomeSomeEnum.FOO;

    assertNotEquals(mainStruct, otherStruct);
    assertNotEquals(mainStruct.hashCode(), otherStruct.hashCode());
  }

  @Test
  public void equatableNullableStructNotEqualsMapField() {
    Equatable.EquatableNullableStruct otherStruct = createEquatableNullableStruct();
    otherStruct.mapField.put(2, "foo");

    assertNotEquals(mainStruct, otherStruct);
    assertNotEquals(mainStruct.hashCode(), otherStruct.hashCode());
  }

  @Test
  public void equatableNullableStructNotEqualsArrayField() {
    Equatable.EquatableNullableStruct otherStruct = createEquatableNullableStruct();
    otherStruct.arrayField.add("foo");

    assertNotEquals(mainStruct, otherStruct);
    assertNotEquals(mainStruct.hashCode(), otherStruct.hashCode());
  }

  @Test
  public void equatableNullableStructEqualsCpp() {
    Equatable.EquatableNullableStruct otherStruct = createEquatableNullableStruct();

    assertTrue(EquatableClass.areEqual(mainStruct, otherStruct));
  }

  @Test
  public void equatableNullableStructEqualsCppWithNulls() {
    assertTrue(
        EquatableClass.areEqual(new Equatable.EquatableNullableStruct(), new Equatable.EquatableNullableStruct()));
  }

  @Test
  public void equatableNullableStructNotEqualsCpp() {
    Equatable.EquatableNullableStruct otherStruct = createEquatableNullableStruct();
    otherStruct.arrayField.add("foo");

    assertFalse(EquatableClass.areEqual(mainStruct, otherStruct));
  }

  private static Equatable.EquatableNullableStruct createEquatableNullableStruct() {

    Map<Integer, String> someMap = new HashMap<>();
    someMap.put(0, "one");
    someMap.put(1, "two");

    List<String> someArray = new LinkedList<>();
    someArray.add("one");
    someArray.add("two");

    return new Equatable.EquatableNullableStruct(
        true, -42, 6542, 3.14f, "nonsense", new Equatable.NestedEquatableStruct("foo"),
        Equatable.SomeSomeEnum.BAR, someMap, someArray);
  }
}
