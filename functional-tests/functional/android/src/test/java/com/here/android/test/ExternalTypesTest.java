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
import static junit.framework.Assert.assertFalse;
import static junit.framework.Assert.assertNotNull;
import static junit.framework.Assert.assertTrue;

import android.os.Build;
import android.os.Parcel;
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
@Config(sdk = Build.VERSION_CODES.M, application = RobolectricApplication.class)
public final class ExternalTypesTest {

  public static class MyJavaClass implements MyClass {
    @Override
    public int foo() {
      return 77;
    }
  }

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

  @Test
  public void useJavaExternalColor() {
    Integer color = android.graphics.Color.argb(0, 0, 127, 255);

    Integer result = UseJavaExternalTypes.colorRoundTrip(color);

    assertEquals(color, result);
  }

  @Test
  public void useJavaExternalSeason() {
    String season = "SPRING";

    String result = UseJavaExternalTypes.seasonRoundTrip(season);

    assertEquals(season, result);
  }

  @Test
  public void useJavaExternalTypesInStruct() {
    SimpleTimeZone timeZone = new SimpleTimeZone(2, "foobar");
    timeZone.setRawOffset(42);
    JavaExternalTypesStruct struct =
        new JavaExternalTypesStruct(
            Currency.getInstance("EUR"),
            timeZone,
            Month.of(2),
            android.graphics.Color.argb(0, 0, 127, 255),
            "SPRING");

    JavaExternalTypesStruct result = UseJavaExternalTypes.structRoundTrip(struct);

    assertEquals(struct.currency.getCurrencyCode(), result.currency.getCurrencyCode());
    assertEquals(struct.timeZone.getRawOffset(), result.timeZone.getRawOffset());
    assertEquals(struct.month, result.month);
    assertEquals(struct.color, result.color);
    assertEquals(struct.season, result.season);
  }

  @Test
  public void useMyClass() {
    int result = (new UseMyClass()).callBar(new MyJavaClass());

    assertEquals(77, result);
  }

  @Test
  public void createSomeSerializableExternalStruct() {
    ExternalMarkedAsSerializable struct = new ExternalMarkedAsSerializable(42);

    assertFalse(android.os.Parcelable.class.isInstance(struct));
  }

  @Test
  public void createSomeSerializableExternalStructWithExternalSerializableField() {
    AnExternalStruct externalStruct = new AnExternalStruct(42);
    SerializableStructWithExternalField mainStruct =
        new SerializableStructWithExternalField(externalStruct);

    Parcel parcel = Parcel.obtain();
    parcel.writeParcelable(mainStruct, 0);
    parcel.setDataPosition(0);

    SerializableStructWithExternalField resultStruct =
        parcel.readParcelable(Thread.currentThread().getContextClassLoader());

    assertNotNull(resultStruct);
    assertTrue(android.os.Parcelable.class.isInstance(mainStruct));
    assertEquals(42, resultStruct.someStruct.mData);
  }

  @Test
  public void unboxVeryBoolean() {
    Boolean veryBoolean = new Boolean(true);

    boolean result = UseJavaExternalTypes.veryBooleanUnbox(veryBoolean);

    assertEquals(true, result);
  }

  @Test
  public void checkExternalConst() {
    Boolean result = UseJavaExternalConst.DEFAULT_TRUTH;

    assertEquals(true, result.booleanValue());
  }
}
