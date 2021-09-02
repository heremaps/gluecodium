/*
 * Copyright (C) 2016-2021 HERE Europe B.V.
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

import android.os.Build;
import com.here.android.RobolectricApplication;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = Build.VERSION_CODES.M, application = RobolectricApplication.class)
public final class FieldConstructorsTest {

  @Test
  public void withPartialDefaults2() {
    FieldConstructorsPartialDefaults result = new FieldConstructorsPartialDefaults(7, "foo");

    assertEquals("foo", result.stringField);
    assertEquals(7, result.intField);
    assertEquals(true, result.boolField);
  }

  @Test
  public void withPartialDefaults3() {
    FieldConstructorsPartialDefaults result = new FieldConstructorsPartialDefaults(false, 7, "foo");

    assertEquals("foo", result.stringField);
    assertEquals(7, result.intField);
    assertEquals(false, result.boolField);
  }

  @Test
  public void withAllDefaults0() {
    FieldConstructorsAllDefaults result = new FieldConstructorsAllDefaults();

    assertEquals("nonsense", result.stringField);
    assertEquals(42, result.intField);
    assertEquals(true, result.boolField);
  }

  @Test
  public void withAllDefaults1() {
    FieldConstructorsAllDefaults result = new FieldConstructorsAllDefaults(7);

    assertEquals("nonsense", result.stringField);
    assertEquals(7, result.intField);
    assertEquals(true, result.boolField);
  }

  @Test
  public void immutableNoClash() {
    ImmutableStructNoClash result = new ImmutableStructNoClash("foo", 7, false);

    assertEquals("foo", result.stringField);
    assertEquals(7, result.intField);
    assertEquals(false, result.boolField);
  }

  @Test
  public void immutableWithClash() {
    ImmutableStructWithClash result = new ImmutableStructWithClash(false, 7, "foo");

    assertEquals("foo", result.stringField);
    assertEquals(7, result.intField);
    assertEquals(false, result.boolField);
  }
}
