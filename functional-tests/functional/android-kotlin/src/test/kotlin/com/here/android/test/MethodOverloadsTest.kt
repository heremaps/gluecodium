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
import org.junit.Assert.assertFalse
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

@RunWith(RobolectricTestRunner::class)
@Config(application = RobolectricApplication::class)
class MethodOverloadsTest {
    @org.junit.Test
    fun isBooleanWithBoolean() {
        assertTrue(MethodOverloads.isBoolean(false))
    }

    @org.junit.Test
    fun isBooleanWithByte() {
        assertFalse(MethodOverloads.isBoolean(42.toByte()))
    }

    @org.junit.Test
    fun isBooleanWithString() {
        assertFalse(MethodOverloads.isBoolean("nonsense"))
    }

    @org.junit.Test
    fun isBooleanWithStruct() {
        assertFalse(MethodOverloads.isBoolean(MethodOverloads.Point()))
    }

    @org.junit.Test
    fun isBooleanWithEverything() {
        assertFalse(MethodOverloads.isBoolean(false, 42.toByte(), "nonsense", MethodOverloads.Point()))
    }

    @org.junit.Test
    fun isBooleanWithIntArray() {
        assertFalse(MethodOverloads.isBooleanIntArrayOverload(mutableListOf(42.toByte(), 255.toByte())))
    }
}