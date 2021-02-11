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

import android.os.Build;
import com.here.android.RobolectricApplication;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = Build.VERSION_CODES.M, application = RobolectricApplication.class)
public final class BuilderTest {

  @Test
  public void oneMandatoryField() {
    OneMandatoryField struct = new OneMandatoryField.Builder().setMandatory(5).build();

    assertEquals(5, struct.mandatory);
  }

  @Test
  public void oneMandatoryOneOptionalField() {
    OneMandatoryOneOptional struct =
        new OneMandatoryOneOptional.Builder().setMandatory(true).build();

    assertEquals(true, struct.mandatory);
  }

  @Test
  public void twoMandatoryFields() {
    TwoMandatoryFields struct =
        new TwoMandatoryFields.Builder().setMandatory(9).setAlsoMandatory("Foo").build();
    assertEquals(9, struct.mandatory);
    assertEquals("Foo", struct.alsoMandatory);
  }

  @Test
  public void twoOptionalTwoMandatory() {
    TwoMandatoryTwoOptional struct =
        new TwoMandatoryTwoOptional.Builder()
            .setMandatory(false)
            .setAlsoMandatory(9)
            .setAlsoOptional(7)
            .setOptional(true)
            .build();

    assertEquals(false, struct.mandatory);
    assertEquals(9, struct.alsoMandatory);
    assertEquals(true, struct.optional);
    assertEquals(7, struct.alsoOptional);
  }

  @Test
  public void manyMandatoryAndOptionalFields() {
    ManyMandatorAndOptionalFields struct =
        new ManyMandatorAndOptionalFields.Builder()
            .setMandatory(9)
            .setAlsoMandatory(8)
            .setMoreMandatory(7)
            .setEvenMoreMandatory(6)
            .setStillOptional(5)
            .setAlsoOptional(4)
            .build();

    assertEquals(9, struct.mandatory);
    assertEquals(8, struct.alsoMandatory);
    assertEquals(7, struct.moreMandatory);
    assertEquals(6, struct.evenMoreMandatory);
    assertEquals(5, struct.stillOptional);
    assertEquals(4, struct.alsoOptional);
    assertEquals(1, struct.optional);
  }

  @Test
  public void setValuesMultipleTimes() {
    TwoMandatoryTwoOptional struct =
        new TwoMandatoryTwoOptional.Builder()
            .setMandatory(false)
            .setAlsoMandatory(9)
            .setAlsoOptional(7)
            .setOptional(true)
            .setAlsoMandatory(5)
            .setOptional(false)
            .build();

    assertEquals(false, struct.mandatory);
    assertEquals(5, struct.alsoMandatory);
    assertEquals(false, struct.optional);
    assertEquals(7, struct.alsoOptional);
  }
}
