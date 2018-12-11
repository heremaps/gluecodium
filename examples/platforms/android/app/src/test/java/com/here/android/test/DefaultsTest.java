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

import static junit.framework.Assert.assertTrue;
import static junit.framework.Assert.assertEquals;

import android.os.Build;
import android.support.compat.BuildConfig;
import com.here.android.RobolectricApplication;
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
public final class DefaultsTest {

  private static final Defaults.StructWithDefaults STRUCT_WITH_DEFAULTS =
      new Defaults.StructWithDefaults();

  private static boolean checkIfStructEqualsDefault(final Defaults.StructWithDefaults struct) {

    return struct.intField == 42
        && struct.uintField == 4294967295L
        && struct.floatField == 3.14F
        && struct.boolField == true
        && struct.stringField.equals("some string")
        && struct.enumField == Defaults.SomeEnum.BAR_VALUE;
  }

  @Test
  public void checkJavaDefaults() {

    //act
    Defaults.StructWithDefaults myStruct = new Defaults.StructWithDefaults();

    //assert
    assertTrue(checkIfStructEqualsDefault(myStruct));
  }

  @Test
  public void checkCppDefaults() {

    //act
    Defaults.StructWithDefaults myStruct = Defaults.getDefault();

    //assert
    assertTrue(checkIfStructEqualsDefault(myStruct));
  }

  @Test
  public void checkCppDefaultsImmutable() {

    Defaults.ImmutableStructWithDefaults myStruct = Defaults.getImmutableDefault();

    assertEquals(42, myStruct.intField);
    assertEquals(0, myStruct.uintField);
    assertEquals(3.14F, myStruct.floatField);
    assertEquals(false, myStruct.boolField);
    assertEquals("some string", myStruct.stringField);
    assertEquals(Defaults.SomeEnum.BAR_VALUE, myStruct.enumField);
  }

  @Test
  public void checkJavaSpecialDefaults() {
    Defaults.StructWithSpecialDefaults special = new Defaults.StructWithSpecialDefaults();

    assertTrue(Defaults.isNan(special.floatNanField));
    assertTrue(Defaults.isInfinity(special.floatInfinityField));
    assertTrue(Defaults.isInfinity(special.floatNegativeInfinityField));
    assertTrue(Defaults.isNan(special.doubleNanField));
    assertTrue(Defaults.isInfinity(special.doubleInfinityField));
    assertTrue(Defaults.isInfinity(special.doubleNegativeInfinityField));
  }

  @Test
  public void checkCppSpecialDefaults() {
    Defaults.StructWithSpecialDefaults special = Defaults.createSpecial();

    assertTrue(Float.isNaN(special.floatNanField));
    assertTrue(Float.isInfinite(special.floatInfinityField));
    assertTrue(Float.isInfinite(special.floatNegativeInfinityField));
    assertTrue(special.floatNegativeInfinityField < 0);
    assertTrue(Double.isNaN(special.doubleNanField));
    assertTrue(Double.isInfinite(special.doubleInfinityField));
    assertTrue(Double.isInfinite(special.doubleNegativeInfinityField));
    assertTrue(special.doubleNegativeInfinityField < 0);
  }
}
