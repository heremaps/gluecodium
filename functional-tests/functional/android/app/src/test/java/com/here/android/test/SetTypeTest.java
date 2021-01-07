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
import static junit.framework.Assert.assertNull;
import static junit.framework.Assert.assertTrue;

import android.os.Build;
import com.here.android.RobolectricApplication;
import com.here.gluecodium.test.functional.BuildConfig;
import java.util.Collections;
import java.util.EnumSet;
import java.util.Set;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(
    sdk = Build.VERSION_CODES.M,
    application = RobolectricApplication.class,
    constants = BuildConfig.class)
public class SetTypeTest {

  @Test
  public void emptyStringSetRoundTrip() {
    Set<String> stringSet = Collections.emptySet();

    Set<String> result = SetType.stringSetRoundTrip(stringSet);

    assertTrue(result.isEmpty());
  }

  @Test
  public void stringSetRoundTrip() {
    Set<String> stringSet = Collections.singleton("foo");

    Set<String> result = SetType.stringSetRoundTrip(stringSet);

    assertEquals(stringSet, result);
  }

  @Test
  public void emptyEnumSetRoundTrip() {
    Set<SetType.SomeEnum> enumSet = Collections.emptySet();

    Set<SetType.SomeEnum> result = SetType.enumSetRoundTrip(enumSet);

    assertTrue(result.isEmpty());
  }

  @Test
  public void enumSetRoundTrip() {
    Set<SetType.SomeEnum> enumSet = Collections.singleton(SetType.SomeEnum.ON);

    Set<SetType.SomeEnum> result = SetType.enumSetRoundTrip(enumSet);

    assertTrue(result instanceof EnumSet);
    assertEquals(enumSet, result);
  }

  @Test
  public void nullNullableSetRoundTrip() {
    Set<Integer> result = SetType.nullableIntSetRoundTrip(null);

    assertNull(result);
  }

  @Test
  public void emptyNullableSetRoundTrip() {
    Set<Integer> intSet = Collections.emptySet();

    Set<Integer> result = SetType.nullableIntSetRoundTrip(intSet);

    assertTrue(result.isEmpty());
  }

  @Test
  public void nullableSetRoundTrip() {
    Set<Integer> intSet = Collections.singleton(42);

    Set<Integer> result = SetType.nullableIntSetRoundTrip(intSet);

    assertEquals(intSet, result);
  }

  @Test
  public void structSetRoundTrip() {
    Set<SetType.EquatableStruct> input = Collections.singleton(new SetType.EquatableStruct("foo"));

    Set<SetType.EquatableStruct> result = SetType.structSetRoundTrip(input);

    assertEquals(input, result);
  }

  @Test
  public void classSetRoundTrip() {
    Set<SomeEquatableClass> input = Collections.singleton(new SomeEquatableClass("foo"));

    Set<SomeEquatableClass> result = SetType.classSetRoundTrip(input);

    assertEquals(input, result);
  }

  @Test
  public void SomePointerEquatableClassSetRoundTrip() {
    Set<SomePointerEquatableClass> input =
        Collections.singleton(new SomePointerEquatableClass("foo"));

    Set<SomePointerEquatableClass> result = SetType.pointerEquatableSetRoundTrip(input);

    assertEquals(input, result);
  }
}
