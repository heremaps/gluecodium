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

import static junit.framework.Assert.assertFalse;
import static junit.framework.Assert.assertTrue;

import android.os.Build;
import com.here.android.RobolectricApplication;
import com.here.android.matchers.FieldMatcher;
import com.here.gluecodium.test.functional.BuildConfig;
import java.util.ArrayList;
import java.util.List;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.ExpectedException;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(
    sdk = Build.VERSION_CODES.M,
    application = RobolectricApplication.class,
    constants = BuildConfig.class)
public final class MethodOverloadsTest {

  @Rule public final ExpectedException expectedException = ExpectedException.none();

  @Test
  public void isBooleanWithBoolean() {
    boolean result = MethodOverloads.isBoolean(false);

    assertTrue(result);
  }

  @Test
  public void isBooleanWithByte() {
    boolean result = MethodOverloads.isBoolean((byte) 42);

    assertFalse(result);
  }

  @Test
  public void isBooleanWithString() {
    boolean result = MethodOverloads.isBoolean("nonsense");

    assertFalse(result);
  }

  @Test
  public void isBooleanWithStruct() {
    MethodOverloads.Point value = new MethodOverloads.Point();

    boolean result = MethodOverloads.isBoolean(value);

    assertFalse(result);
  }

  @Test
  public void isBooleanWithEverything() {
    MethodOverloads.Point value4 = new MethodOverloads.Point();

    boolean result = MethodOverloads.isBoolean(false, (byte) 42, "nonsense", value4);

    assertFalse(result);
  }

  @Test
  public void isBooleanWithStringArray() {
    List<String> stringList = new ArrayList<>();
    stringList.add("nonsense");
    stringList.add("more nonsense");

    boolean result = MethodOverloads.isBooleanStringArrayOverload(stringList);

    assertFalse(result);
  }

  @Test
  public void isBooleanWithIntArray() {
    List<Byte> byteList = new ArrayList<>();
    byteList.add((byte) 42);
    byteList.add((byte) 255);

    boolean result = MethodOverloads.isBooleanIntArrayOverload(byteList);

    assertFalse(result);
  }

  @Test
  public void constructorDoesNotThrow() throws ThrowingConstructor.SomeException {
    ThrowingConstructor result = new ThrowingConstructor(0.0);
  }

  @Test
  public void constructorThrows() throws ThrowingConstructor.SomeException {
    expectedException.expect(ThrowingConstructor.SomeException.class);
    expectedException.expect(
        FieldMatcher.hasFieldWithValue("error", ThrowingConstructor.ErrorEnum.CRASHED));

    ThrowingConstructor result = new ThrowingConstructor(1.0);
  }
}
