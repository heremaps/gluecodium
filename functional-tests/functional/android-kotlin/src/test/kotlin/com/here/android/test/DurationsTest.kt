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

import com.here.android.lorem.ipsum.time.Duration

import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull

import com.here.android.RobolectricApplication
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

@RunWith(RobolectricTestRunner::class)
@Config(application = RobolectricApplication::class)
class DurationsTest {

    @org.junit.Test
    fun durationSecondsRoundTrip() {
        val duration: Duration = Duration.ofSeconds(42)
        val result: Duration = DurationSeconds.increaseDuration(duration)

        assertEquals(43, result.seconds)
        assertEquals(0, result.nano)
    }

    @org.junit.Test
    fun durationSecondsRoundTripRoundedDown() {
        val duration: Duration = Duration.ofMillis(42042)

        val result: Duration = DurationSeconds.increaseDuration(duration)

        assertEquals(43, result.seconds)
        assertEquals(0, result.nano)
    }

    @org.junit.Test
    fun durationSecondsRoundTripRoundedUp() {
        val duration: Duration = Duration.ofMillis(42840)

        val result: Duration = DurationSeconds.increaseDuration(duration)

        assertEquals(44, result.seconds)
        assertEquals(0, result.nano)
    }

    @org.junit.Test
    fun nullableDurationSecondsRoundTrip() {
        val duration: Duration = Duration.ofSeconds(42)

        val result: Duration? = DurationSeconds.increaseDurationMaybe(duration)

        assertEquals(43L, result?.seconds)
        assertEquals(0, result?.nano)
    }

    @org.junit.Test
    fun nullableDurationSecondsRoundTripNull() {
        val result: Duration? = DurationSeconds.increaseDurationMaybe(null)

        assertNull(result)
    }

    @org.junit.Test
    fun durationSecondsStructRoundTrip() {
        val struct: DurationSeconds.DurationStruct =
            DurationSeconds.DurationStruct(Duration.ofSeconds(42))

        val result: DurationSeconds.DurationStruct = DurationSeconds.durationStructRoundTrip(struct)

        assertEquals(42, result.durationField.seconds)
        assertEquals(0, result.durationField.nano)
    }

    @org.junit.Test
    fun durationMillisecondsRoundTrip() {
        val duration: Duration = Duration.ofMillis(42042)

        val result: Duration = DurationMilliseconds.increaseDuration(duration)

        assertEquals(43, result.seconds)
        assertEquals(42000000, result.nano)
    }

    @org.junit.Test
    fun durationMillisecondsRoundTripRoundedDown() {
        val duration: Duration = Duration.ofNanos(42042071000L)

        val result: Duration = DurationMilliseconds.increaseDuration(duration)

        assertEquals(43, result.seconds)
        assertEquals(42000000, result.nano)
    }

    @org.junit.Test
    fun durationMillisecondsRoundTripRoundedUp() {
        val duration: Duration = Duration.ofNanos(42042710000L)

        val result: Duration = DurationMilliseconds.increaseDuration(duration)

        assertEquals(43, result.seconds)
        assertEquals(43000000, result.nano)
    }

    @org.junit.Test
    fun nullableDurationMillisecondsRoundTrip() {
        val duration: Duration = Duration.ofMillis(42042)

        val result: Duration? = DurationMilliseconds.increaseDurationMaybe(duration)

        assertEquals(43L, result?.seconds)
        assertEquals(42000000, result?.nano)
    }

    @org.junit.Test
    fun nullableDurationMillisecondsRoundTripNull() {
        val result: Duration? = DurationMilliseconds.increaseDurationMaybe(null)

        assertNull(result)
    }

    @org.junit.Test
    fun durationMillisecondsStructRoundTrip() {
        val struct: DurationMilliseconds.DurationStruct =
            DurationMilliseconds.DurationStruct(Duration.ofMillis(42042))

        val result: DurationMilliseconds.DurationStruct =
            DurationMilliseconds.durationStructRoundTrip(struct)

        assertEquals(42, result.durationField.seconds)
        assertEquals(42000000, result.durationField.nano)
    }

    @org.junit.Test
    fun durationCallOverloadedFunction() {
        val result: String = DurationOverloads.durationFunction(Duration.ofSeconds(42))

        assertEquals("duration overload", result)
    }

    @org.junit.Test
    fun durationDefaults() {
        val javaDefaults: DurationDefaults = DurationDefaults()
        val cppDefaults: DurationDefaults = DurationDefaults.getCppDefaults()

        assertEquals(cppDefaults.dayz, javaDefaults.dayz)
        assertEquals(cppDefaults.hourz, javaDefaults.hourz)
        assertEquals(cppDefaults.minutez, javaDefaults.minutez)
        assertEquals(cppDefaults.secondz, javaDefaults.secondz)
        assertEquals(cppDefaults.milliz, javaDefaults.milliz)
        assertEquals(cppDefaults.microz, javaDefaults.microz)
        assertEquals(cppDefaults.nanoz, javaDefaults.nanoz)
    }
}