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
import org.junit.Assert.assertTrue
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

@RunWith(RobolectricTestRunner::class)
@Config(application = RobolectricApplication::class)
class StaticTypedefTest {
    companion object {
        val EXAMPLE_STRING: String = "exampleString"
        val HELLO_PREFIX: String = "Hello "
        val VALUE_X: Double = 10.0
        val VALUE_Y: Double = 20.0
        val DELTA: Double = 0.00000000000001
    }

    @org.junit.Test
    fun returnIntTypedef() {
        val testValue: Int = 10
        val result: Int = StaticTypedef.returnIntTypedef(testValue)

        assertEquals(testValue + 1, result)
    }

    @org.junit.Test
    fun returnStringTypedef() {
        val testValue: String = EXAMPLE_STRING
        val result: String = StaticTypedef.returnStringTypedef(testValue)

        assertEquals(HELLO_PREFIX + testValue, result)
    }

    @org.junit.Test
    fun returnByteBufferTypedef() {
        val testValue: ByteArray = "byteArray".toByteArray()
        val result: ByteArray = StaticTypedef.returnByteBufferTypedef(testValue)

        assertTrue("yarrAetyb".toByteArray().contentEquals(result))
    }

    @org.junit.Test
    fun returnExampleStructTypedef() {
        val exampleStruct = StaticTypedef.ExampleStruct()
        exampleStruct.exampleString = EXAMPLE_STRING

        val result: StaticTypedef.ExampleStruct = StaticTypedef.returnExampleStructTypedef(exampleStruct)
        assertEquals(HELLO_PREFIX + EXAMPLE_STRING, result.exampleString)
    }

    @org.junit.Test
    fun returnTypedefPointFromTypeCollection() {
        val point = TypeCollection.Point(VALUE_X, VALUE_Y)
        val result: TypeCollection.Point = StaticTypedef.returnTypedefPointFromTypeCollection(point)

        assertEquals(VALUE_X, result.x, DELTA)
        assertEquals(VALUE_Y, result.y, DELTA)
    }

    @org.junit.Test
    fun returnNestedIntTypedef() {
        val testValue: Int = 20
        val result: Int = StaticTypedef.returnNestedIntTypedef(testValue)

        assertEquals(testValue + 1, result)
    }

    @org.junit.Test
    fun returnNestedStructTypedef() {
        val exampleStruct = StaticTypedef.ExampleStruct()
        exampleStruct.exampleString = EXAMPLE_STRING

        val result: StaticTypedef.ExampleStruct = StaticTypedef.returnNestedStructTypedef(exampleStruct)
        assertEquals(HELLO_PREFIX + EXAMPLE_STRING, result.exampleString)
    }
}