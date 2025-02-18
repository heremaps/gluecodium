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
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertTrue

import android.os.Parcel
import com.here.android.RobolectricApplication
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

@RunWith(RobolectricTestRunner::class)
@Config(application = RobolectricApplication::class)
class SerializationTest {
    val delta = 0.00000000001

    @org.junit.Test
    fun serializableStructParcelRoundTrip() {
        val nestedStruct = NestedSerializableStruct("foo")
        val byteBuffer = byteArrayOf(1, 7)
        val stringList = mutableListOf("bar", "baz")
        val structList = mutableListOf(NestedSerializableStruct("crazy"), NestedSerializableStruct("stuff"))
        val errorMap = mutableMapOf(0 to "one", 1 to "two")
        val hashSet = mutableSetOf("foo", "bar")

        val serializableStruct = SerializableStruct(
            true, 42.toByte(), 542.toShort(), 65542, 2147484000L, 1.0f, 2.0, "nonsense", nestedStruct,
            byteBuffer, stringList, structList, errorMap, hashSet, mutableSetOf(FooEnum.BAR),
            FooEnum.BAR
        )

        val parcel: Parcel = Parcel.obtain()
        parcel.writeParcelable(serializableStruct, 0)
        parcel.setDataPosition(0)

        val nullableResult: SerializableStruct? =
            parcel.readParcelable(java.lang.Thread.currentThread().getContextClassLoader())
        assertNotNull(nullableResult)

        val resultStruct = nullableResult!!
        assertEquals(serializableStruct.boolField, resultStruct.boolField)
        assertEquals(serializableStruct.byteField, resultStruct.byteField)
        assertEquals(serializableStruct.shortField, resultStruct.shortField)
        assertEquals(serializableStruct.longField, resultStruct.longField)
        assertEquals(serializableStruct.floatField, resultStruct.floatField)
        assertEquals(serializableStruct.doubleField, resultStruct.doubleField, delta)
        assertEquals(serializableStruct.stringField, resultStruct.stringField)
        assertNotNull(resultStruct.structField)
        assertEquals(serializableStruct.structField.someField, resultStruct.structField.someField)
        assertNotNull(resultStruct.byteBufferField)
        assertEquals(serializableStruct.byteBufferField[0], resultStruct.byteBufferField[0])
        assertEquals(serializableStruct.byteBufferField[1], resultStruct.byteBufferField[1])
        assertEquals(serializableStruct.arrayField, resultStruct.arrayField)
        assertNotNull(resultStruct.structArrayField)
        assertEquals(serializableStruct.structArrayField.size, resultStruct.structArrayField.size)
        assertNotNull(resultStruct.structArrayField[0])
        assertEquals(
            serializableStruct.structArrayField[0].someField,
            resultStruct.structArrayField[0].someField
        )
        assertNotNull(resultStruct.structArrayField[1])
        assertEquals(
            serializableStruct.structArrayField[1].someField,
            resultStruct.structArrayField[1].someField
        )
        assertNotNull(resultStruct.mapField)
        assertEquals(serializableStruct.mapField.size, resultStruct.mapField.size)
        assertEquals(serializableStruct.mapField[0], resultStruct.mapField[0])
        assertEquals(serializableStruct.mapField[1], resultStruct.mapField[1])
        assertEquals(serializableStruct.setField.size, resultStruct.setField.size)
        assertTrue(resultStruct.setField.contains("foo"))
        assertTrue(resultStruct.setField.contains("bar"))
        assertEquals(serializableStruct.enumSetField.size, resultStruct.enumSetField.size)
        assertTrue(resultStruct.enumSetField.contains(FooEnum.BAR))
        assertEquals(serializableStruct.enumField, resultStruct.enumField)
    }
}