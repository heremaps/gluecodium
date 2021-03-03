/*
 * Copyright (C) 2016-2020 HERE Europe B.V.
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
import java.util.IllformedLocaleException;
import java.util.Locale;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.ExpectedException;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = Build.VERSION_CODES.M, application = RobolectricApplication.class)
public class LocalesTest {

  @Rule public final ExpectedException expectedException = ExpectedException.none();

  @Test
  public void localeRoundTrip() {
    Locale locale = Locale.getDefault();

    Locale result = Locales.localeRoundTrip(locale);

    assertEquals(locale, result);
  }

  @Test
  public void localeRoundTripStripTag() {
    Locale locale = Locale.getDefault();

    Locale result = Locales.localeRoundTripStripTag(locale);

    assertEquals(locale, result);
  }

  @Test
  public void localeRoundTripNullable() {
    Locale locale = Locale.getDefault();

    Locale result = Locales.localeRoundTripNullable(locale);

    assertEquals(locale, result);
  }

  @Test
  public void localeRoundTripNullableNull() {
    Locale result = Locales.localeRoundTripNullable(null);

    assertNull(result);
  }

  @Test
  public void localePropertyRoundTrip() {
    Locale locale = Locale.getDefault();

    Locales.setLocaleProperty(locale);
    Locale result = Locales.getLocaleProperty();

    assertEquals(locale, result);
  }

  @Test
  public void localeWithMalformedTag() {
    expectedException.expect(IllformedLocaleException.class);

    Locales.getLocaleWithMalformedTag();
  }

  @Test
  public void localeWithMalformedLanguage() {
    expectedException.expect(IllformedLocaleException.class);

    Locales.getLocaleWithMalformedLanguage();
  }

  @Test
  public void localeWithMalformedCountry() {
    expectedException.expect(IllformedLocaleException.class);

    Locales.getLocaleWithMalformedCountry();
  }

  @Test
  public void localeWithMalformedScript() {
    expectedException.expect(IllformedLocaleException.class);

    Locales.getLocaleWithMalformedScript();
  }

  @Test
  public void localesStructRoundTrip() {
    Locale locale = Locale.getDefault();
    LocalesStruct localesStruct = new LocalesStruct(locale, locale);

    LocalesStruct result = LocalesStruct.localesStructRoundTrip(localesStruct);

    assertEquals(localesStruct, result);
    assertEquals(localesStruct.hashCode(), result.hashCode());
  }
}
