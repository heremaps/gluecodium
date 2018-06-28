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
public final class EquatableArraysTest {

  private final EquatableStructWithArray mainStruct = createEquatableStruct();

  @Test
  public void equatableStructEquals() {
    EquatableStructWithArray otherStruct = createEquatableStruct();

    assertEquals(mainStruct, otherStruct);
    assertEquals(mainStruct.hashCode(), otherStruct.hashCode());
  }

  @Test
  public void equatableStructNotEqualsArrayField() {
    EquatableStructWithArray otherStruct = createEquatableStruct();
    otherStruct.arrayField.add("foo");

    assertNotEquals(mainStruct, otherStruct);
    assertNotEquals(mainStruct.hashCode(), otherStruct.hashCode());
  }

  private static EquatableStructWithArray createEquatableStruct() {

    return new EquatableStructWithArray(new ArrayList<>(java.util.Arrays.asList("bar", "baz")));
  }
}
