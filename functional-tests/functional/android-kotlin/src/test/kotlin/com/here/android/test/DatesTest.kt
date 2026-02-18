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
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertNull
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config
import java.util.Calendar
import java.util.Date
import java.util.GregorianCalendar
import java.util.TimeZone

@RunWith(RobolectricTestRunner::class)
@Config(application = RobolectricApplication::class)
class DatesTest {

    @org.junit.Test
    fun dateAttributeRoundTrip() {
        val date = Date()
        Dates.setDateAttribute(date)

        assertEquals(date, Dates.getDateAttribute())
    }

    @org.junit.Test
    fun dateMethodRoundTrip() {
        val dateCalendar: Calendar = GregorianCalendar()
        dateCalendar.set(1900, 1, 3, 5, 7, 9)
        val date = dateCalendar.getTime()

        val result = Dates.increaseDate(date)
        val resultCalendar = GregorianCalendar()
        resultCalendar.setTime(result)

        assertEquals(dateCalendar.get(Calendar.YEAR), resultCalendar.get(Calendar.YEAR))
        assertEquals(dateCalendar.get(Calendar.MONTH), resultCalendar.get(Calendar.MONTH))
        assertEquals(dateCalendar.get(Calendar.DATE) + 1, resultCalendar.get(Calendar.DATE))
        assertEquals(dateCalendar.get(Calendar.HOUR) + 1, resultCalendar.get(Calendar.HOUR))
        assertEquals(dateCalendar.get(Calendar.MINUTE) + 1, resultCalendar.get(Calendar.MINUTE))
        assertEquals(dateCalendar.get(Calendar.SECOND) + 1, resultCalendar.get(Calendar.SECOND))
    }

    @org.junit.Test
    fun dateMethodNullableNullRoundTrip() {
        val result = Dates.increaseDateMaybe(null)
        assertNull(result)
    }

    @org.junit.Test
    fun dateMethodNullableRoundTrip() {
        val dateCalendar: Calendar = GregorianCalendar()
        dateCalendar.set(1900, 1, 3, 5, 7, 9)
        val date = dateCalendar.getTime()

        val result: Date? = Dates.increaseDateMaybe(date)
        assertNotNull(result)

        val resultCalendar: Calendar = GregorianCalendar()
        resultCalendar.setTime(result!!)

        assertEquals(dateCalendar.get(Calendar.YEAR), resultCalendar.get(Calendar.YEAR))
        assertEquals(dateCalendar.get(Calendar.MONTH), resultCalendar.get(Calendar.MONTH))
        assertEquals(dateCalendar.get(Calendar.DATE) + 1, resultCalendar.get(Calendar.DATE))
        assertEquals(dateCalendar.get(Calendar.HOUR) + 1, resultCalendar.get(Calendar.HOUR))
        assertEquals(dateCalendar.get(Calendar.MINUTE) + 1, resultCalendar.get(Calendar.MINUTE))
        assertEquals(dateCalendar.get(Calendar.SECOND) + 1, resultCalendar.get(Calendar.SECOND))
    }

    @org.junit.Test
    fun steadyDateMethodRoundTrip() {
        val dateCalendar: Calendar = GregorianCalendar()
        dateCalendar.set(1900, 1, 3, 5, 7, 9)
        val date = dateCalendar.getTime()

        val result: Date = DatesSteady.increaseDate(date)
        val resultCalendar: Calendar = GregorianCalendar()
        resultCalendar.setTime(result)

        assertEquals(dateCalendar.get(Calendar.YEAR), resultCalendar.get(Calendar.YEAR))
        assertEquals(dateCalendar.get(Calendar.MONTH), resultCalendar.get(Calendar.MONTH))
        assertEquals(dateCalendar.get(Calendar.DATE) + 1, resultCalendar.get(Calendar.DATE))
        assertEquals(dateCalendar.get(Calendar.HOUR) + 1, resultCalendar.get(Calendar.HOUR))
        assertEquals(dateCalendar.get(Calendar.MINUTE) + 1, resultCalendar.get(Calendar.MINUTE))
        assertEquals(dateCalendar.get(Calendar.SECOND) + 1, resultCalendar.get(Calendar.SECOND))
    }

    @org.junit.Test
    fun steadyDateMethodNullableNullRoundTrip() {
        val result = DatesSteady.increaseDateMaybe(null)
        assertNull(result)
    }

    @org.junit.Test
    fun steadyDateMethodNullableRoundTrip() {
        val dateCalendar: Calendar = GregorianCalendar()
        dateCalendar.set(1900, 1, 3, 5, 7, 9)
        val date = dateCalendar.getTime()

        val result: Date? = DatesSteady.increaseDateMaybe(date)
        assertNotNull(result)

        val resultCalendar: Calendar = GregorianCalendar()
        resultCalendar.setTime(result!!)

        assertEquals(dateCalendar.get(Calendar.YEAR), resultCalendar.get(Calendar.YEAR))
        assertEquals(dateCalendar.get(Calendar.MONTH), resultCalendar.get(Calendar.MONTH))
        assertEquals(dateCalendar.get(Calendar.DATE) + 1, resultCalendar.get(Calendar.DATE))
        assertEquals(dateCalendar.get(Calendar.HOUR) + 1, resultCalendar.get(Calendar.HOUR))
        assertEquals(dateCalendar.get(Calendar.MINUTE) + 1, resultCalendar.get(Calendar.MINUTE))
        assertEquals(dateCalendar.get(Calendar.SECOND) + 1, resultCalendar.get(Calendar.SECOND))
    }

    @org.junit.Test
    fun dateDefaultsCet() {
        val defaults: DateDefaults = DateDefaults()
        val date: Date = defaults.dateTime

        val resultCalendar: Calendar = GregorianCalendar(TimeZone.getTimeZone("UTC"))
        resultCalendar.setTime(date)

        assertEquals(2022, resultCalendar.get(Calendar.YEAR))
        assertEquals(GregorianCalendar.FEBRUARY, resultCalendar.get(Calendar.MONTH))
        assertEquals(4, resultCalendar.get(Calendar.DATE))
        assertEquals(9, resultCalendar.get(Calendar.HOUR))
        assertEquals(15, resultCalendar.get(Calendar.MINUTE))
        assertEquals(17, resultCalendar.get(Calendar.SECOND))
    }

    @org.junit.Test
    fun dateDefaultsUtc() {
        val defaults: DateDefaults = DateDefaults()
        val date: Date = defaults.dateTimeUtc

        val resultCalendar: Calendar = GregorianCalendar(TimeZone.getTimeZone("UTC"))
        resultCalendar.setTime(date)

        assertEquals(2022, resultCalendar.get(Calendar.YEAR))
        assertEquals(GregorianCalendar.FEBRUARY, resultCalendar.get(Calendar.MONTH))
        assertEquals(4, resultCalendar.get(Calendar.DATE))
        assertEquals(9, resultCalendar.get(Calendar.HOUR))
        assertEquals(15, resultCalendar.get(Calendar.MINUTE))
        assertEquals(17, resultCalendar.get(Calendar.SECOND))
    }

    @org.junit.Test
    fun dateDefaultsBefore() {
        val defaults: DateDefaults = DateDefaults()
        val date: Date = defaults.beforeEpoch

        val resultCalendar: Calendar = GregorianCalendar(TimeZone.getTimeZone("UTC"))
        resultCalendar.setTime(date)

        assertEquals(1922, resultCalendar.get(Calendar.YEAR))
        assertEquals(GregorianCalendar.FEBRUARY, resultCalendar.get(Calendar.MONTH))
        assertEquals(4, resultCalendar.get(Calendar.DATE))
        assertEquals(9, resultCalendar.get(Calendar.HOUR))
        assertEquals(15, resultCalendar.get(Calendar.MINUTE))
        assertEquals(17, resultCalendar.get(Calendar.SECOND))
    }

    @org.junit.Test
    fun dateDefaultsCpp() {
        val defaults: DateDefaults = DateDefaults.getCppDefaults()
        val date: Date = defaults.dateTimeUtc

        val resultCalendar: Calendar = GregorianCalendar(TimeZone.getTimeZone("UTC"))
        resultCalendar.setTime(date)

        assertEquals(2022, resultCalendar.get(Calendar.YEAR))
        assertEquals(GregorianCalendar.FEBRUARY, resultCalendar.get(Calendar.MONTH))
        assertEquals(4, resultCalendar.get(Calendar.DATE))
        assertEquals(9, resultCalendar.get(Calendar.HOUR))
        assertEquals(15, resultCalendar.get(Calendar.MINUTE))
        assertEquals(17, resultCalendar.get(Calendar.SECOND))
    }
}