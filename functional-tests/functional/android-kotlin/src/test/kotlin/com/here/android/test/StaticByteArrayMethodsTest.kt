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

import kotlin.random.Random

@RunWith(RobolectricTestRunner::class)
@Config(application = RobolectricApplication::class)
class StaticByteArrayMethodsTest {

    @org.junit.Test
    fun returnReverseByteBuffer_smallByteArray() {
        val input: ByteArray = "InputBytes".toByteArray()
        val output: ByteArray = StaticByteArrayMethods.returnReverseByteBuffer(input)

        assertEquals("setyBtupnI", String(output))
    }

    @org.junit.Test
    fun returnInputByteBuffer_emptyByteArray() {
        val input: ByteArray = byteArrayOf()
        val output: ByteArray = StaticByteArrayMethods.returnInputByteBuffer(input)

        assertTrue(input.contentEquals(output))
    }

    @org.junit.Test
    fun returnInputByteBuffer_largeByteArray() {
        val input: ByteArray = ByteArray(100000)
        Random.nextBytes(input)

        val output: ByteArray = StaticByteArrayMethods.returnInputByteBuffer(input)
        assertTrue(input.contentEquals(output))
    }

    @org.junit.Test
    fun concatenateByteBuffers_twoSimpleByteArrays() {
        val input1: ByteArray = "byte".toByteArray()
        val input2: ByteArray = "array".toByteArray()

        val output: ByteArray = StaticByteArrayMethods.concatenateByteBuffers(input1, input2)

        assertEquals("bytearray", String(output))
    }

    @org.junit.Test
    fun reverseBlobInStruct_smallBlob() {
        val input = StaticByteArrayMethods.StructWithBlob("InputBytes".toByteArray())
        val result = StaticByteArrayMethods.reverseBlobInStruct(input)

        assertEquals("setyBtupnI", String(result.blob))
    }

    @org.junit.Test
    fun reverseBlobInStruct_emptyBlob() {
        val input = StaticByteArrayMethods.StructWithBlob(ByteArray(0))
        val result = StaticByteArrayMethods.reverseBlobInStruct(input)

        assertEquals(input.blob.size, result.blob.size)
    }
}