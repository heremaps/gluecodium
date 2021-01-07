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
import com.here.gluecodium.test.functional.BuildConfig;
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

  @Test
  public void equatableArrayEquals() {
    EquatableStruct otherStruct = createEquatableStruct();
    otherStruct.boolField = !otherStruct.boolField;
    List<EquatableStruct> array = java.util.Arrays.asList(mainStruct, otherStruct);
    List<EquatableStruct> otherArray =
        new LinkedList<>(java.util.Arrays.asList(mainStruct, otherStruct));

    assertEquals(array, otherArray);
    assertEquals(array.hashCode(), otherArray.hashCode());
  }

  @Test
  public void equatableArrayNotEquals() {
    EquatableStruct otherStruct = createEquatableStruct();
    otherStruct.boolField = !otherStruct.boolField;
    List<EquatableStruct> array = java.util.Arrays.asList(mainStruct, otherStruct);
    List<EquatableStruct> otherArray =
        new LinkedList<>(java.util.Arrays.asList(mainStruct, mainStruct));

    assertNotEquals(array, otherArray);
    assertNotEquals(array.hashCode(), otherArray.hashCode());
  }

  @Test
  public void equatableStructEqualsCpp() {
    EquatableStruct otherStruct = createEquatableStruct();

    assertTrue(EquatableClass.areEqual(mainStruct, otherStruct));
  }

  @Test
  public void equatableStructNotEqualsCpp() {
    EquatableStruct otherStruct = createEquatableStruct();
    otherStruct.arrayField.add("foo");

    assertFalse(EquatableClass.areEqual(mainStruct, otherStruct));
  }

  @Test
  public void differentInstancesPointerUnequal() {
    PointerEquatableClass one = PointerEquatableClass.createNew();
    PointerEquatableClass other = PointerEquatableClass.createNew();

    assertNotEquals(one, other);
    assertNotEquals(one.hashCode(), other.hashCode());
  }

  @Test
  public void sameInstancesPointerEqual() {
    PointerEquatableClass one = PointerEquatableClass.createNew();
    PointerEquatableClass same = PointerEquatableClass.returnLast();

    assertEquals(one, same);
    assertEquals(one.hashCode(), same.hashCode());
  }

  @Test
  public void classEqual() {
    EquatableClass one = new EquatableClass("one");
    EquatableClass other = new EquatableClass("one");

    assertEquals(one, other);
    assertEquals(one.hashCode(), other.hashCode());
  }

  @Test
  public void classUnequal() {
    EquatableClass one = new EquatableClass("one");
    EquatableClass other = new EquatableClass("two");

    assertNotEquals(one, other);
    assertNotEquals(one.hashCode(), other.hashCode());
  }

  @Test
  public void differentTypeUnequal() {
    EquatableClass one = new EquatableClass("one");

    assertNotEquals(one, 7);
  }

  @Test
  public void equalInstancesInStruct() {
    EquatableClass one = new EquatableClass("one");
    EquatableClass other = new EquatableClass("one");
    PointerEquatableClass uninteresting = PointerEquatableClass.createNew();
    PointerEquatableClass.EquatableStruct oneStruct =
        new PointerEquatableClass.EquatableStruct(one, uninteresting);
    PointerEquatableClass.EquatableStruct otherStruct =
        new PointerEquatableClass.EquatableStruct(other, uninteresting);

    assertEquals(oneStruct, otherStruct);
    assertEquals(oneStruct.hashCode(), otherStruct.hashCode());
    assertTrue(PointerEquatableClass.areEqual(oneStruct, otherStruct));
  }

  @Test
  public void unequalInstancesInStruct() {
    EquatableClass one = new EquatableClass("one");
    EquatableClass other = new EquatableClass("other");
    PointerEquatableClass uninteresting = PointerEquatableClass.createNew();
    PointerEquatableClass.EquatableStruct oneStruct =
        new PointerEquatableClass.EquatableStruct(one, uninteresting);
    PointerEquatableClass.EquatableStruct otherStruct =
        new PointerEquatableClass.EquatableStruct(other, uninteresting);

    assertNotEquals(oneStruct, otherStruct);
    assertNotEquals(oneStruct.hashCode(), otherStruct.hashCode());
    assertFalse(PointerEquatableClass.areEqual(oneStruct, otherStruct));
  }

  @Test
  public void pointerEqualInstancesInStruct() {
    PointerEquatableClass one = PointerEquatableClass.createNew();
    PointerEquatableClass other = PointerEquatableClass.returnLast();
    EquatableClass uninteresting = new EquatableClass("same for both");
    PointerEquatableClass.EquatableStruct oneStruct =
        new PointerEquatableClass.EquatableStruct(uninteresting, one);
    PointerEquatableClass.EquatableStruct otherStruct =
        new PointerEquatableClass.EquatableStruct(uninteresting, other);

    assertEquals(oneStruct, otherStruct);
    assertEquals(oneStruct.hashCode(), otherStruct.hashCode());
    assertTrue(PointerEquatableClass.areEqual(oneStruct, otherStruct));
  }

  @Test
  public void pointerUnequalInstancesInStruct() {
    PointerEquatableClass one = PointerEquatableClass.createNew();
    PointerEquatableClass other = PointerEquatableClass.createNew();
    EquatableClass uninteresting = new EquatableClass("same for both");
    PointerEquatableClass.EquatableStruct oneStruct =
        new PointerEquatableClass.EquatableStruct(uninteresting, one);
    PointerEquatableClass.EquatableStruct otherStruct =
        new PointerEquatableClass.EquatableStruct(uninteresting, other);

    assertNotEquals(oneStruct, otherStruct);
    assertNotEquals(oneStruct.hashCode(), otherStruct.hashCode());
    assertFalse(PointerEquatableClass.areEqual(oneStruct, otherStruct));
  }

  @Test
  public void optionalEqualInstancesInStruct() {
    EquatableClass one = new EquatableClass("one");
    EquatableClass other = new EquatableClass("one");
    PointerEquatableClass uninteresting = PointerEquatableClass.createNew();
    PointerEquatableClass.OptionalEquatableStruct oneStruct =
        new PointerEquatableClass.OptionalEquatableStruct(one, uninteresting);
    PointerEquatableClass.OptionalEquatableStruct otherStruct =
        new PointerEquatableClass.OptionalEquatableStruct(other, uninteresting);

    assertEquals(oneStruct, otherStruct);
    assertEquals(oneStruct.hashCode(), otherStruct.hashCode());
    assertTrue(PointerEquatableClass.areEqual(oneStruct, otherStruct));
  }

  @Test
  public void optionalUnequalInstancesInStruct() {
    EquatableClass one = new EquatableClass("one");
    EquatableClass other = new EquatableClass("other");
    PointerEquatableClass uninteresting = PointerEquatableClass.createNew();
    PointerEquatableClass.OptionalEquatableStruct oneStruct =
        new PointerEquatableClass.OptionalEquatableStruct(one, uninteresting);
    PointerEquatableClass.OptionalEquatableStruct otherStruct =
        new PointerEquatableClass.OptionalEquatableStruct(other, uninteresting);

    assertNotEquals(oneStruct, otherStruct);
    assertNotEquals(oneStruct.hashCode(), otherStruct.hashCode());
    assertFalse(PointerEquatableClass.areEqual(oneStruct, otherStruct));
  }

  @Test
  public void optionalPointerEqualInstancesInStruct() {
    PointerEquatableClass one = PointerEquatableClass.createNew();
    PointerEquatableClass other = PointerEquatableClass.returnLast();
    EquatableClass uninteresting = new EquatableClass("same for both");
    PointerEquatableClass.OptionalEquatableStruct oneStruct =
        new PointerEquatableClass.OptionalEquatableStruct(uninteresting, one);
    PointerEquatableClass.OptionalEquatableStruct otherStruct =
        new PointerEquatableClass.OptionalEquatableStruct(uninteresting, other);

    assertEquals(oneStruct, otherStruct);
    assertEquals(oneStruct.hashCode(), otherStruct.hashCode());
    assertTrue(PointerEquatableClass.areEqual(oneStruct, otherStruct));
  }

  @Test
  public void optionalPointerUnequalInstancesInStruct() {
    PointerEquatableClass one = PointerEquatableClass.createNew();
    PointerEquatableClass other = PointerEquatableClass.createNew();
    EquatableClass uninteresting = new EquatableClass("same for both");
    PointerEquatableClass.OptionalEquatableStruct oneStruct =
        new PointerEquatableClass.OptionalEquatableStruct(uninteresting, one);
    PointerEquatableClass.OptionalEquatableStruct otherStruct =
        new PointerEquatableClass.OptionalEquatableStruct(uninteresting, other);

    assertNotEquals(oneStruct, otherStruct);
    assertNotEquals(oneStruct.hashCode(), otherStruct.hashCode());
    assertFalse(PointerEquatableClass.areEqual(oneStruct, otherStruct));
  }

  @Test
  public void nullEqualInstancesInStruct() {
    EquatableClass one = null;
    EquatableClass other = null;
    PointerEquatableClass uninteresting = PointerEquatableClass.createNew();
    PointerEquatableClass.OptionalEquatableStruct oneStruct =
        new PointerEquatableClass.OptionalEquatableStruct(one, uninteresting);
    PointerEquatableClass.OptionalEquatableStruct otherStruct =
        new PointerEquatableClass.OptionalEquatableStruct(other, uninteresting);

    assertEquals(oneStruct, otherStruct);
    assertEquals(oneStruct.hashCode(), otherStruct.hashCode());
    assertTrue(PointerEquatableClass.areEqual(oneStruct, otherStruct));
  }

  @Test
  public void nullUnequalInstancesInStruct() {
    EquatableClass one = null;
    EquatableClass other = new EquatableClass("one");
    PointerEquatableClass uninteresting = PointerEquatableClass.createNew();
    PointerEquatableClass.OptionalEquatableStruct oneStruct =
        new PointerEquatableClass.OptionalEquatableStruct(one, uninteresting);
    PointerEquatableClass.OptionalEquatableStruct otherStruct =
        new PointerEquatableClass.OptionalEquatableStruct(other, uninteresting);

    assertNotEquals(oneStruct, otherStruct);
    assertNotEquals(oneStruct.hashCode(), otherStruct.hashCode());
    assertFalse(PointerEquatableClass.areEqual(oneStruct, otherStruct));
  }

  @Test
  public void nullPointerEqualInstancesInStruct() {
    PointerEquatableClass one = null;
    PointerEquatableClass other = null;
    EquatableClass uninteresting = new EquatableClass("same for both");
    PointerEquatableClass.OptionalEquatableStruct oneStruct =
        new PointerEquatableClass.OptionalEquatableStruct(uninteresting, one);
    PointerEquatableClass.OptionalEquatableStruct otherStruct =
        new PointerEquatableClass.OptionalEquatableStruct(uninteresting, other);

    assertEquals(oneStruct, otherStruct);
    assertEquals(oneStruct.hashCode(), otherStruct.hashCode());
    assertTrue(PointerEquatableClass.areEqual(oneStruct, otherStruct));
  }

  @Test
  public void nullPointerUnequalInstancesInStruct() {
    PointerEquatableClass one = null;
    PointerEquatableClass other = PointerEquatableClass.createNew();
    EquatableClass uninteresting = new EquatableClass("same for both");
    PointerEquatableClass.OptionalEquatableStruct oneStruct =
        new PointerEquatableClass.OptionalEquatableStruct(uninteresting, one);
    PointerEquatableClass.OptionalEquatableStruct otherStruct =
        new PointerEquatableClass.OptionalEquatableStruct(uninteresting, other);

    assertNotEquals(oneStruct, otherStruct);
    assertNotEquals(oneStruct.hashCode(), otherStruct.hashCode());
    assertFalse(PointerEquatableClass.areEqual(oneStruct, otherStruct));
  }

  @Test
  public void equatableInterfaceEquals() {
    EquatableInterface oneInterface = EquatableInterfaceFactory.createEquatableInterface("foo");
    EquatableInterface otherInterface = EquatableInterfaceFactory.createEquatableInterface("foo");

    assertEquals(oneInterface, otherInterface);
    assertEquals(oneInterface.hashCode(), otherInterface.hashCode());
  }

  @Test
  public void equatableInterfaceNotEquals() {
    EquatableInterface oneInterface = EquatableInterfaceFactory.createEquatableInterface("foo");
    EquatableInterface otherInterface = EquatableInterfaceFactory.createEquatableInterface("bar");

    assertNotEquals(oneInterface, otherInterface);
    assertNotEquals(oneInterface.hashCode(), otherInterface.hashCode());
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
