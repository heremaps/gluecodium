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
import org.junit.Assert.assertTrue
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

import java.util.Collections
import java.util.EnumSet

@RunWith(RobolectricTestRunner::class)
@Config(application = RobolectricApplication::class)
class SetTypeTest {
    @org.junit.Test
    fun emptyStringSetRoundTrip() {
        val stringSet = mutableSetOf<String>()
        val result = SetType.stringSetRoundTrip(stringSet)

        assertTrue(result.isEmpty())
    }

    @org.junit.Test
    fun stringSetRoundTrip() {
        val stringSet = Collections.singleton("foo")
        val result = SetType.stringSetRoundTrip(stringSet)

        assertEquals(stringSet, result)
    }

    @org.junit.Test
    fun emptyEnumSetRoundTrip() {
        val enumSet = mutableSetOf<SetType.SomeEnum>()
        val result = SetType.enumSetRoundTrip(enumSet)

        assertTrue(result.isEmpty())
    }

    @org.junit.Test
    fun enumSetRoundTrip() {
        val enumSet = Collections.singleton(SetType.SomeEnum.ON)
        val result = SetType.enumSetRoundTrip(enumSet)

        assertTrue(result is EnumSet<*>)
        assertEquals(enumSet, result)
    }

    @org.junit.Test
    fun nullNullableSetRoundTrip() {
        val result = SetType.nullableIntSetRoundTrip(null)
        assertNull(result)
    }

    @org.junit.Test
    fun emptyNullableSetRoundTrip() {
        val intSet = mutableSetOf<Int>()
        val result = SetType.nullableIntSetRoundTrip(intSet)

        assertTrue(result!!.isEmpty())
    }

    @org.junit.Test
    fun nullableSetRoundTrip() {
        val intSet = Collections.singleton(42)
        val result = SetType.nullableIntSetRoundTrip(intSet)

        assertEquals(intSet, result)
    }

    @org.junit.Test
    fun structSetRoundTrip() {
        val input = Collections.singleton(SetType.EquatableStruct("foo"))
        val result = SetType.structSetRoundTrip(input)

        assertEquals(input, result)
    }

    @org.junit.Test
    fun classSetRoundTrip() {
        val input = Collections.singleton(SomeEquatableClass("foo"))
        val result = SetType.classSetRoundTrip(input)

        assertEquals(input, result)
    }

    @org.junit.Test
    fun somePointerEquatableClassSetRoundTrip() {
        val input = Collections.singleton(SomePointerEquatableClass("foo"))
        val result = SetType.pointerEquatableSetRoundTrip(input)

        assertEquals(input, result)
    }
}