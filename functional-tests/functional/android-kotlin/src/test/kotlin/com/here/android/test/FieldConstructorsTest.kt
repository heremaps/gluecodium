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
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

@RunWith(RobolectricTestRunner::class)
@Config(application = RobolectricApplication::class)
class FieldConstructorsTest {
    @org.junit.Test
    fun withPartialDefaults2() {
        val result: FieldConstructorsPartialDefaults = FieldConstructorsPartialDefaults(7, "foo")

        assertEquals("foo", result.stringField)
        assertEquals(7, result.intField)
        assertEquals(true, result.boolField)
    }

    @org.junit.Test
    fun withPartialDefaults3() {
        val result: FieldConstructorsPartialDefaults = FieldConstructorsPartialDefaults(false, 7, "foo")

        assertEquals("foo", result.stringField)
        assertEquals(7, result.intField)
        assertEquals(false, result.boolField)
    }

    @org.junit.Test
    fun withAllDefaults0() {
        val result: FieldConstructorsAllDefaults = FieldConstructorsAllDefaults()

        assertEquals("nonsense", result.stringField)
        assertEquals(42, result.intField)
        assertEquals(true, result.boolField)
    }

    @org.junit.Test
    fun withAllDefaults1() {
        val result: FieldConstructorsAllDefaults = FieldConstructorsAllDefaults(7)

        assertEquals("nonsense", result.stringField)
        assertEquals(7, result.intField)
        assertEquals(true, result.boolField)
    }

    @org.junit.Test
    fun immutableNoClash() {
        val result: ImmutableStructNoClash = ImmutableStructNoClash("foo", 7, false)

        assertEquals("foo", result.stringField)
        assertEquals(7, result.intField)
        assertEquals(false, result.boolField)
    }

    @org.junit.Test
    fun immutableWithClash() {
        val result: ImmutableStructWithClash = ImmutableStructWithClash(false, 7, "foo")

        assertEquals("foo", result.stringField)
        assertEquals(7, result.intField)
        assertEquals(false, result.boolField)
    }
}