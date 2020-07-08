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
import static junit.framework.Assert.assertNotNull;

import android.os.Build;
import com.example.here.hello.BuildConfig;
import com.here.android.RobolectricApplication;
import com.here.android.external.AnotherExternalStruct;
import com.here.android.external.ExternalEnum;
import com.here.android.external.ExternalStruct;
import java.time.Month;
import java.util.Currency;
import java.util.SimpleTimeZone;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(
    sdk = Build.VERSION_CODES.M,
    application = RobolectricApplication.class,
    constants = BuildConfig.class)
public final class ExternalTypesTest {

  @Test
  public void useExternalTypes() {
    ExternalStruct externalStruct =
        new ExternalStruct(
            "foo", "bar", java.util.Arrays.asList(7, 11), new AnotherExternalStruct(42));
    UseExternalTypes.StructWithExternalTypes inputStruct =
        new UseExternalTypes.StructWithExternalTypes(externalStruct, ExternalEnum.BAR);

    ExternalStruct resultStruct = UseExternalTypes.extractExternalStruct(inputStruct);

    assertNotNull(resultStruct);
    assertEquals("foo", resultStruct.stringField);
    assertEquals("bar", resultStruct.externalStringField);
    assertEquals(2, resultStruct.externalArrayField.size());
    assertEquals(7, resultStruct.externalArrayField.get(0).longValue());
    assertEquals(11, resultStruct.externalArrayField.get(1).longValue());
    assertEquals(42, resultStruct.externalStructField.intField);
  }

  @Test
  public void useExternalTypesExternalEnum() {
    ExternalStruct externalStruct =
        new ExternalStruct(
            "foo", "bar", java.util.Arrays.asList(7, 11), new AnotherExternalStruct(42));
    UseExternalTypes.StructWithExternalTypes inputStruct =
        new UseExternalTypes.StructWithExternalTypes(externalStruct, ExternalEnum.BAR);

    ExternalEnum resultEnum = UseExternalTypes.extractExternalEnum(inputStruct);

    assertNotNull(resultEnum);
    assertEquals(ExternalEnum.BAR, resultEnum);
  }

  @Test
  public void useJavaExternalStructCurrency() {
    Currency currency = Currency.getInstance("EUR");

    Currency result = UseJavaExternalTypes.currencyRoundTrip(currency);

    assertEquals(currency.getCurrencyCode(), result.getCurrencyCode());
    assertEquals(currency.getNumericCode(), result.getNumericCode());
  }

  @Test
  public void useJavaExternalStructTimeZone() {
    SimpleTimeZone timeZone = new SimpleTimeZone(2, "foobar");
    timeZone.setRawOffset(42);

    SimpleTimeZone result = UseJavaExternalTypes.timeZoneRoundTrip(timeZone);

    assertEquals(timeZone.getRawOffset(), result.getRawOffset());
  }

  @Test
  public void useJavaExternalEnum() {
    Month month = Month.of(2);

    Month result = UseJavaExternalTypes.monthRoundTrip(month);

    assertEquals(month, result);
  }
}
