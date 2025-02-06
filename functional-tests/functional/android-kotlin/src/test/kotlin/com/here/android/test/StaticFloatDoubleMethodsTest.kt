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

import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue

import com.here.android.RobolectricApplication
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

@RunWith(RobolectricTestRunner::class)
@Config(application = RobolectricApplication::class)
class StaticFloatDoubleMethodsTest {
    private val deltaFloat = 0.0000000001f
    private val deltaDouble = 0.0000000001

    @org.junit.Test
    fun returnIncrementedFloat_simpleCase() {
        assertEquals(2.5f, StaticFloatDoubleMethods.returnIncrementedFloat(1.5f), deltaFloat)
    }

    @org.junit.Test
    fun sumTwoFloats_simpleCase() {
        assertEquals(5.0f, StaticFloatDoubleMethods.sumTwoFloats(1.5f, 3.5f), deltaFloat)
    }

    @org.junit.Test
    fun returnFloat_notANumber() {
        assertTrue(StaticFloatDoubleMethods.returnFloat(Float.NaN).isNaN())
    }

    @org.junit.Test
    fun returnFloat_maxValue() {
        assertEquals(Float.MAX_VALUE, StaticFloatDoubleMethods.returnFloat(Float.MAX_VALUE), deltaFloat)
    }

    @org.junit.Test
    fun returnFloat_minValue() {
        assertEquals(Float.MIN_VALUE, StaticFloatDoubleMethods.returnFloat(Float.MIN_VALUE), deltaFloat)
    }

    @org.junit.Test
    fun returnIncrementedDouble_simpleCase() {
        assertEquals(2.5, StaticFloatDoubleMethods.returnIncrementedDouble(1.5), deltaDouble)
    }

    @org.junit.Test
    fun sumTwoDoubles() {
        assertEquals(5.0, StaticFloatDoubleMethods.sumTwoDoubles(1.5, 3.5), deltaDouble)
    }

    @org.junit.Test
    fun nanDoubleValue() {
        assertTrue(StaticFloatDoubleMethods.returnDouble(Double.NaN).isNaN())
    }

    @org.junit.Test
    fun maxDoubleValue() {
        assertEquals(Double.MAX_VALUE, StaticFloatDoubleMethods.returnDouble(Double.MAX_VALUE), deltaDouble)
    }

    @org.junit.Test
    fun minDoubleValue() {
        assertEquals(Double.MIN_VALUE, StaticFloatDoubleMethods.returnDouble(Double.MIN_VALUE), deltaDouble)
    }
}