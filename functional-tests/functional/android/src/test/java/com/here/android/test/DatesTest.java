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

import android.os.Build;
import com.here.android.RobolectricApplication;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.TimeZone;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = Build.VERSION_CODES.M, application = RobolectricApplication.class)
public class DatesTest {

  @Test
  public void dateAttributeRoundTrip() {
    Date date = new Date();

    Dates.setDateAttribute(date);
    Date result = Dates.getDateAttribute();

    assertEquals(date, result);
  }

  @Test
  public void dateMethodRoundTrip() {
    Date date = new Date(1, 3, 5, 7, 9, 11);
    Calendar dateCalendar = new GregorianCalendar();
    dateCalendar.setTime(date);

    Date result = Dates.increaseDate(date);

    Calendar resultCalendar = new GregorianCalendar();
    resultCalendar.setTime(result);
    assertEquals(dateCalendar.get(Calendar.YEAR), resultCalendar.get(Calendar.YEAR));
    assertEquals(dateCalendar.get(Calendar.MONTH), resultCalendar.get(Calendar.MONTH));
    assertEquals(dateCalendar.get(Calendar.DATE) + 1, resultCalendar.get(Calendar.DATE));
    assertEquals(dateCalendar.get(Calendar.HOUR) + 1, resultCalendar.get(Calendar.HOUR));
    assertEquals(dateCalendar.get(Calendar.MINUTE) + 1, resultCalendar.get(Calendar.MINUTE));
    assertEquals(dateCalendar.get(Calendar.SECOND) + 1, resultCalendar.get(Calendar.SECOND));
  }

  @Test
  public void dateMethodNullableNullRoundTrip() {
    Date result = Dates.increaseDateMaybe(null);

    assertNull(result);
  }

  @Test
  public void dateMethodNullableRoundTrip() {
    Date date = new Date(1, 3, 5, 7, 9, 11);
    Calendar dateCalendar = new GregorianCalendar();
    dateCalendar.setTime(date);

    Date result = Dates.increaseDateMaybe(date);

    Calendar resultCalendar = new GregorianCalendar();
    resultCalendar.setTime(result);
    assertEquals(dateCalendar.get(Calendar.YEAR), resultCalendar.get(Calendar.YEAR));
    assertEquals(dateCalendar.get(Calendar.MONTH), resultCalendar.get(Calendar.MONTH));
    assertEquals(dateCalendar.get(Calendar.DATE) + 1, resultCalendar.get(Calendar.DATE));
    assertEquals(dateCalendar.get(Calendar.HOUR) + 1, resultCalendar.get(Calendar.HOUR));
    assertEquals(dateCalendar.get(Calendar.MINUTE) + 1, resultCalendar.get(Calendar.MINUTE));
    assertEquals(dateCalendar.get(Calendar.SECOND) + 1, resultCalendar.get(Calendar.SECOND));
  }

  @Test
  public void steadyDateMethodRoundTrip() {
    Date date = new Date(1, 3, 5, 7, 9, 11);
    Calendar dateCalendar = new GregorianCalendar();
    dateCalendar.setTime(date);

    Date result = DatesSteady.increaseDate(date);

    Calendar resultCalendar = new GregorianCalendar();
    resultCalendar.setTime(result);
    assertEquals(dateCalendar.get(Calendar.YEAR), resultCalendar.get(Calendar.YEAR));
    assertEquals(dateCalendar.get(Calendar.MONTH), resultCalendar.get(Calendar.MONTH));
    assertEquals(dateCalendar.get(Calendar.DATE) + 1, resultCalendar.get(Calendar.DATE));
    assertEquals(dateCalendar.get(Calendar.HOUR) + 1, resultCalendar.get(Calendar.HOUR));
    assertEquals(dateCalendar.get(Calendar.MINUTE) + 1, resultCalendar.get(Calendar.MINUTE));
    assertEquals(dateCalendar.get(Calendar.SECOND) + 1, resultCalendar.get(Calendar.SECOND));
  }

  @Test
  public void steadyDateMethodNullableNullRoundTrip() {
    Date result = DatesSteady.increaseDateMaybe(null);

    assertNull(result);
  }

  @Test
  public void steadyDateMethodNullableRoundTrip() {
    Date date = new Date(1, 3, 5, 7, 9, 11);
    Calendar dateCalendar = new GregorianCalendar();
    dateCalendar.setTime(date);

    Date result = DatesSteady.increaseDateMaybe(date);

    Calendar resultCalendar = new GregorianCalendar();
    resultCalendar.setTime(result);
    assertEquals(dateCalendar.get(Calendar.YEAR), resultCalendar.get(Calendar.YEAR));
    assertEquals(dateCalendar.get(Calendar.MONTH), resultCalendar.get(Calendar.MONTH));
    assertEquals(dateCalendar.get(Calendar.DATE) + 1, resultCalendar.get(Calendar.DATE));
    assertEquals(dateCalendar.get(Calendar.HOUR) + 1, resultCalendar.get(Calendar.HOUR));
    assertEquals(dateCalendar.get(Calendar.MINUTE) + 1, resultCalendar.get(Calendar.MINUTE));
    assertEquals(dateCalendar.get(Calendar.SECOND) + 1, resultCalendar.get(Calendar.SECOND));
  }

  @Test
  public void dateDefaultsCet() {
    DateDefaults defaults = new DateDefaults();
    Date date = defaults.dateTime;

    Calendar resultCalendar = new GregorianCalendar(TimeZone.getTimeZone("UTC"));
    resultCalendar.setTime(date);
    assertEquals(2022, resultCalendar.get(Calendar.YEAR));
    assertEquals(GregorianCalendar.FEBRUARY, resultCalendar.get(Calendar.MONTH));
    assertEquals(4, resultCalendar.get(Calendar.DATE));
    assertEquals(9, resultCalendar.get(Calendar.HOUR));
    assertEquals(15, resultCalendar.get(Calendar.MINUTE));
    assertEquals(17, resultCalendar.get(Calendar.SECOND));
  }

  @Test
  public void dateDefaultsUtc() {
    DateDefaults defaults = new DateDefaults();
    Date date = defaults.dateTimeUtc;

    Calendar resultCalendar = new GregorianCalendar(TimeZone.getTimeZone("UTC"));
    resultCalendar.setTime(date);
    assertEquals(2022, resultCalendar.get(Calendar.YEAR));
    assertEquals(GregorianCalendar.FEBRUARY, resultCalendar.get(Calendar.MONTH));
    assertEquals(4, resultCalendar.get(Calendar.DATE));
    assertEquals(9, resultCalendar.get(Calendar.HOUR));
    assertEquals(15, resultCalendar.get(Calendar.MINUTE));
    assertEquals(17, resultCalendar.get(Calendar.SECOND));
  }

  @Test
  public void dateDefaultsBefore() {
    DateDefaults defaults = new DateDefaults();
    Date date = defaults.beforeEpoch;

    Calendar resultCalendar = new GregorianCalendar(TimeZone.getTimeZone("UTC"));
    resultCalendar.setTime(date);
    assertEquals(1922, resultCalendar.get(Calendar.YEAR));
    assertEquals(GregorianCalendar.FEBRUARY, resultCalendar.get(Calendar.MONTH));
    assertEquals(4, resultCalendar.get(Calendar.DATE));
    assertEquals(9, resultCalendar.get(Calendar.HOUR));
    assertEquals(15, resultCalendar.get(Calendar.MINUTE));
    assertEquals(17, resultCalendar.get(Calendar.SECOND));
  }

  @Test
  public void dateDefaultsCpp() {
    DateDefaults defaults = DateDefaults.getCppDefaults();
    Date date = defaults.dateTimeUtc;

    Calendar resultCalendar = new GregorianCalendar(TimeZone.getTimeZone("UTC"));
    resultCalendar.setTime(date);
    assertEquals(2022, resultCalendar.get(Calendar.YEAR));
    assertEquals(GregorianCalendar.FEBRUARY, resultCalendar.get(Calendar.MONTH));
    assertEquals(4, resultCalendar.get(Calendar.DATE));
    assertEquals(9, resultCalendar.get(Calendar.HOUR));
    assertEquals(15, resultCalendar.get(Calendar.MINUTE));
    assertEquals(17, resultCalendar.get(Calendar.SECOND));
  }
}
