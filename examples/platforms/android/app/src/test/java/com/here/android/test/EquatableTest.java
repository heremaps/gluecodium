/*
 * Copyright (C) 2016-2018 HERE Europe B.V.
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
import static org.junit.Assert.assertNotEquals;

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
public final class EquatableTest {

  private final EquatableStruct mainStruct = createEquatableStruct();

  @Test
  public void equatableStructEquals() {
    EquatableStruct otherStruct = createEquatableStruct();

    assertEquals(mainStruct, otherStruct);
    assertEquals(mainStruct.hashCode(), otherStruct.hashCode());
  }

  @Test
  public void equatableStructNotEqualsBooleanField() {
    EquatableStruct otherStruct = createEquatableStruct();
    otherStruct.boolField = !otherStruct.boolField;

    assertNotEquals(mainStruct, otherStruct);
    assertNotEquals(mainStruct.hashCode(), otherStruct.hashCode());
  }

  @Test
  public void equatableStructNotEqualsIntField() {
    EquatableStruct otherStruct = createEquatableStruct();
    otherStruct.intField += 1;

    assertNotEquals(mainStruct, otherStruct);
    assertNotEquals(mainStruct.hashCode(), otherStruct.hashCode());
  }

  @Test
  public void equatableStructNotEqualsLongField() {
    EquatableStruct otherStruct = createEquatableStruct();
    otherStruct.longField += 1;

    assertNotEquals(mainStruct, otherStruct);
    assertNotEquals(mainStruct.hashCode(), otherStruct.hashCode());
  }

  @Test
  public void equatableStructNotEqualsFloatField() {
    EquatableStruct otherStruct = createEquatableStruct();
    otherStruct.floatField += 1;

    assertNotEquals(mainStruct, otherStruct);
    assertNotEquals(mainStruct.hashCode(), otherStruct.hashCode());
  }

  @Test
  public void equatableStructNotEqualsDoubleField() {
    EquatableStruct otherStruct = createEquatableStruct();
    otherStruct.doubleField += 1;

    assertNotEquals(mainStruct, otherStruct);
    assertNotEquals(mainStruct.hashCode(), otherStruct.hashCode());
  }

  @Test
  public void equatableStructNotEqualsStringField() {
    EquatableStruct otherStruct = createEquatableStruct();
    otherStruct.stringField += "foo";

    assertNotEquals(mainStruct, otherStruct);
    assertNotEquals(mainStruct.hashCode(), otherStruct.hashCode());
  }

  @Test
  public void equatableStructNotEqualsStructField() {
    EquatableStruct otherStruct = createEquatableStruct();
    otherStruct.structField.fooField += "bar";

    assertNotEquals(mainStruct, otherStruct);
    assertNotEquals(mainStruct.hashCode(), otherStruct.hashCode());
  }

  @Test
  public void equatableStructNotEqualsEnumField() {
    EquatableStruct otherStruct = createEquatableStruct();
    otherStruct.enumField = SomeSomeEnum.FOO;

    assertNotEquals(mainStruct, otherStruct);
    assertNotEquals(mainStruct.hashCode(), otherStruct.hashCode());
  }

  @Test
  public void equatableStructNotEqualsMapField() {
    EquatableStruct otherStruct = createEquatableStruct();
    otherStruct.mapField.put(2, "foo");

    assertNotEquals(mainStruct, otherStruct);
    assertNotEquals(mainStruct.hashCode(), otherStruct.hashCode());
  }

  @Test
  public void equatableStructNotEqualsArrayField() {
    EquatableStruct otherStruct = createEquatableStruct();
    otherStruct.arrayField.add("foo");

    assertNotEquals(mainStruct, otherStruct);
    assertNotEquals(mainStruct.hashCode(), otherStruct.hashCode());
  }

  private static EquatableStruct createEquatableStruct() {

    Map<Integer, String> someMap = new HashMap<>();
    someMap.put(0, "one");
    someMap.put(1, "two");

    List<String> someArray = new LinkedList<>();
    someArray.add("one");
    someArray.add("two");

    return new EquatableStruct.Builder()
        .setBoolField(true)
        .setIntField(65542)
        .setLongField(2147484000L)
        .setFloatField(1.0f)
        .setDoubleField(2.0)
        .setStringField("nonsense")
        .setStructField(new NestedEquatableStruct("foo"))
        .setEnumField(SomeSomeEnum.BAR)
        .setMapField(someMap)
        .setArrayField(someArray)
        .build();
  }
}
