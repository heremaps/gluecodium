/*
 * Copyright (C) 2016-2025 HERE Europe B.V.
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
package com.here.android.test

import com.here.android.RobolectricApplication
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
import org.junit.Assert.assertThrows
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config
import java.util.IllformedLocaleException
import java.util.Locale

@RunWith(RobolectricTestRunner::class)
@Config(application = RobolectricApplication::class)
class LocalesTest {

    @org.junit.Test
    fun localeRoundTrip() {
        val locale: Locale = Locale.getDefault()
        val result: Locale = Locales.localeRoundTrip(locale)

        assertEquals(locale, result)
    }

    @org.junit.Test
    fun localeRoundTripStripTag() {
        val locale: Locale = Locale.getDefault()
        val result: Locale = Locales.localeRoundTripStripTag(locale)

        assertEquals(locale, result)
    }

    @org.junit.Test
    fun localeRoundTripNullable() {
        val locale: Locale = Locale.getDefault()
        val result: Locale? = Locales.localeRoundTripNullable(locale)

        assertEquals(locale, result)
    }

    @org.junit.Test
    fun localeRoundTripNullableNull() {
        val result: Locale? = Locales.localeRoundTripNullable(null)
        assertNull(result)
    }

    @org.junit.Test
    fun localePropertyRoundTrip() {
        val locale: Locale = Locale.getDefault()
        Locales.setLocaleProperty(locale)

        assertEquals(locale, Locales.getLocaleProperty())
    }

    @org.junit.Test
    fun localeWithMalformedLanguage() {
        assertThrows(IllformedLocaleException::class.java) {
            @Suppress("UNUSED_VARIABLE")
            val locale = Locales.getLocaleWithMalformedLanguage()
        }
    }

    @org.junit.Test
    fun localeWithMalformedCountry() {
        assertThrows(IllformedLocaleException::class.java) {
            @Suppress("UNUSED_VARIABLE")
            val locale = Locales.getLocaleWithMalformedCountry()
        }
    }

    @org.junit.Test
    fun localeWithMalformedScript() {
        assertThrows(IllformedLocaleException::class.java) {
            @Suppress("UNUSED_VARIABLE")
            val locale = Locales.getLocaleWithMalformedScript()
        }
    }

    @org.junit.Test
    fun localesStructRoundTrip() {
        val locale: Locale = Locale.getDefault()
        val localesStruct: LocalesStruct = LocalesStruct(locale, locale)

        val result: LocalesStruct = LocalesStruct.localesStructRoundTrip(localesStruct)

        assertEquals(localesStruct, result)
        assertEquals(localesStruct.hashCode(), result.hashCode())
    }

    @org.junit.Test
    fun localeDefaultsTct() {
        val result: Locale = (LocaleDefaults()).traditionalChineseTaiwan

        assertEquals("nan", result.getLanguage())
        assertEquals("Hant", result.getScript())
        assertEquals("TW", result.getCountry())
    }

    @org.junit.Test
    fun localeDefaultsTctFromCpp() {
        val result: Locale = LocaleDefaults.getCppDefaults().traditionalChineseTaiwan

        assertEquals("nan", result.getLanguage())
        assertEquals("Hant", result.getScript())
        assertEquals("TW", result.getCountry())
    }
}