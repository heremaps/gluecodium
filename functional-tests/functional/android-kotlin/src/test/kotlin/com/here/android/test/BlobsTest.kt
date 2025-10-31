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
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

@RunWith(RobolectricTestRunner::class)
@Config(application = RobolectricApplication::class)
class BlobsTest {

    @org.junit.Test
    fun methodWithByteBuffer_emptyArray() {
        val byteBuffer: ByteArray = ByteArray(0)
        val resultBuffer: ByteArray = ArraysByteBuffer.methodWithByteBuffer(byteBuffer)

        assertEquals(0, resultBuffer.size)
    }

    @org.junit.Test
    fun methodWithByteBuffer_reversesArray() {
        val byteBuffer: ByteArray = "Nonsense".toByteArray()
        val resultBuffer: ByteArray = ArraysByteBuffer.methodWithByteBuffer(byteBuffer)

        assertEquals("esnesnoN", String(resultBuffer))
    }

    @org.junit.Test
    fun methodWithImplicitArray_emptyArray() {
        val uintList: List<Short> = listOf<Short>()
        val resultList: List<Short>  = ArraysByteBuffer.methodWithImplicitArray(uintList)

        assertEquals(0, resultList.size)
    }

    @org.junit.Test
    fun methodWithImplicitArray_reversesArray() {
        val uintList: List<Short> = listOf(1.toShort(), 2.toShort(), 3.toShort())
        val resultList: List<Short> = ArraysByteBuffer.methodWithImplicitArray(uintList)

        val expectedResult: List<Short> = listOf(3.toShort(), 2.toShort(), 1.toShort())
        assertEquals(expectedResult, resultList)
    }

    @org.junit.Test
    fun methodWithExplicitArray_emptyArray() {
        val uintList: List<Short> = listOf<Short>()
        val resultList: List<Short> = ArraysByteBuffer.methodWithExplicitArray(uintList)

        assertEquals(0, resultList.size)
    }

    @org.junit.Test
    fun methodWithExplicitArray_reversesArray() {
        val uintList: List<Short> = listOf<Short>(1.toShort(), 2.toShort(), 3.toShort())
        val resultList: List<Short> = ArraysByteBuffer.methodWithExplicitArray(uintList)

        assertEquals(listOf<Short>(3.toShort(), 2.toShort(), 1.toShort()), resultList)
    }

    @org.junit.Test
    fun methodWithByteBufferInStruct_emptyArray() {
        val struct = ArraysByteBuffer.StructWithByteBuffer(ByteArray(0))
        val resultStruct = ArraysByteBuffer.methodWithByteBufferInStruct(struct)

        assertEquals(0, resultStruct.image.size)
    }

    @org.junit.Test
    fun methodWithByteBufferInStruct_reversesArray() {
        val struct = ArraysByteBuffer.StructWithByteBuffer("Nonsense".toByteArray())
        val resultStruct = ArraysByteBuffer.methodWithByteBufferInStruct(struct)

        assertEquals("esnesnoN", String(resultStruct.image))
    }

    @org.junit.Test
    fun methodWithImplicitArrayInStruct_emptyArray() {
        val struct = ArraysByteBuffer.StructWithImplicitArray(listOf<Short>())
        val resultStruct = ArraysByteBuffer.methodWithImplicitArrayInStruct(struct)

        assertEquals(0, resultStruct.image.size)
    }

    @org.junit.Test
    fun methodWithImplicitArrayInStruct_reversesArray() {
        val struct = ArraysByteBuffer.StructWithImplicitArray(listOf(1.toShort(), 2.toShort(), 3.toShort()))
        val resultStruct = ArraysByteBuffer.methodWithImplicitArrayInStruct(struct)

        assertEquals(listOf(3.toShort(), 2.toShort(), 1.toShort()), resultStruct.image)
    }

    @org.junit.Test
    fun methodWithExplicitArrayInStruct_emptyArray() {
        val struct = ArraysByteBuffer.StructWithExplicitArray(listOf<Short>())
        val resultStruct = ArraysByteBuffer.methodWithExplicitArrayInStruct(struct)

        assertEquals(0, resultStruct.image.size)
    }

    @org.junit.Test
    fun methodWithExplicitArrayInStruct_reversesArray() {
        val struct = ArraysByteBuffer.StructWithExplicitArray(listOf(1.toShort(), 2.toShort(), 3.toShort()))
        val resultStruct = ArraysByteBuffer.methodWithExplicitArrayInStruct(struct)

        assertEquals(listOf(3.toShort(), 2.toShort(), 1.toShort()), resultStruct.image)
    }

    @org.junit.Test
    fun blobNullsBreakingNull() {
        val resultBuffer: ByteArray = BlobNulls.getBreakingNull()
        assertEquals(0, resultBuffer.size)
    }

    @org.junit.Test
    fun blobNullsValidNull() {
        val resultBuffer: ByteArray? = BlobNulls.getValidNull()
        assertNull(resultBuffer)
    }

    @org.junit.Test
    fun blobDefaultsEmpty() {
        val result: ByteArray = (BlobDefaults()).emptyList
        assertEquals(0, result.size)
    }

    @org.junit.Test
    fun blobDefaultsDeadBeef() {
        val result: ByteArray = (BlobDefaults()).deadBeef

        assertEquals(0xDE.toByte(), result[0])
        assertEquals(0xAD.toByte(), result[1])
        assertEquals(0xBE.toByte(), result[2])
        assertEquals(0xEF.toByte(), result[3])
    }

    @org.junit.Test
    fun blobDefaultsDeadBeefFromCpp() {
        val result: ByteArray = BlobDefaults.getCppDefaults().deadBeef

        assertEquals(0xDE.toByte(), result[0])
        assertEquals(0xAD.toByte(), result[1])
        assertEquals(0xBE.toByte(), result[2])
        assertEquals(0xEF.toByte(), result[3])
    }
}