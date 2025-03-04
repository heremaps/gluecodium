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
import org.junit.Assert.assertTrue
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

@RunWith(RobolectricTestRunner::class)
@Config(application = RobolectricApplication::class)
class ArraysTest {
    val floatDelta = 0.000000000001f
    val doubleDelta = 0.000000000001

    @org.junit.Test
    fun reverseStringArray() {
        val first = "abc"
        val second = "def"

        val stringList = mutableListOf(first, second)
        val resultsList = Arrays.reverseStringArray(stringList)

        assertEquals(2, resultsList.size)
        assertEquals("def", resultsList[0])
        assertEquals("abc", resultsList[1])
    }

    @org.junit.Test
    fun methodWithInlineArray() {
        val first: Short = 77
        val second: Short = 21

        val shortList = mutableListOf(first, second)
        val resultsList = Arrays.reverseArrayInline(shortList)

        assertEquals(2, resultsList.size)
        assertEquals(second, resultsList[0])
        assertEquals(first, resultsList[1])
    }

    @org.junit.Test
    fun reverseInt8Array() {
        val first: Byte = 55
        val second: Byte = 33

        val byteList = mutableListOf(first, second)
        val resultsList = Arrays.reverseInt8Array(byteList)

        assertEquals(2, resultsList.size)
        assertEquals(second, resultsList[0])
        assertEquals(first, resultsList[1])
    }

    @org.junit.Test
    fun reverseInt16Array() {
        val first: Short = 77
        val second: Short = 21

        val shortList = mutableListOf(first, second)
        val resultsList = Arrays.reverseInt16Array(shortList)

        assertEquals(2, resultsList.size)
        assertEquals(second, resultsList[0])
        assertEquals(first, resultsList[1])
    }

    @org.junit.Test
    fun reverseInt32Array() {
        val first: Int = 57
        val second: Int = 23

        val intList = mutableListOf(first, second)
        val resultsList = Arrays.reverseInt32Array(intList)

        assertEquals(2, resultsList.size)
        assertEquals(second, resultsList[0])
        assertEquals(first, resultsList[1])
    }

    @org.junit.Test
    fun reverseInt64Array() {
        val first: Long = 17L
        val second: Long = 23L

        val longList = mutableListOf(first, second)
        val resultsList = Arrays.reverseInt64Array(longList)

        assertEquals(2, resultsList.size)
        assertEquals(second, resultsList[0])
        assertEquals(first, resultsList[1])
    }

    @org.junit.Test
    fun reverseUint8Array() {
        val first: Short = 77
        val second: Short = 21

        val shortList = mutableListOf(first, second)
        val resultsList = Arrays.reverseUint8Array(shortList)

        assertEquals(2, resultsList.size)
        assertEquals(second, resultsList[0])
        assertEquals(first, resultsList[1])
    }

    @org.junit.Test
    fun reverseUint16Array() {
        val first: Int = 57
        val second: Int = 23

        val intList = mutableListOf(first, second)
        val resultsList = Arrays.reverseUint16Array(intList)

        assertEquals(2, resultsList.size)
        assertEquals(second, resultsList[0])
        assertEquals(first, resultsList[1])
    }

    @org.junit.Test
    fun reverseUint32Array() {
        val first: Long = 17L
        val second: Long = 23L

        val longList = mutableListOf(first, second)
        val resultsList = Arrays.reverseUint32Array(longList)

        assertEquals(2, resultsList.size)
        assertEquals(second, resultsList[0])
        assertEquals(first, resultsList[1])
    }

    @org.junit.Test
    fun reverseUint64Array() {
        val first: Long = 17L
        val second: Long = 23L

        val longList = mutableListOf(first, second)
        val resultsList = Arrays.reverseUint64Array(longList)

        assertEquals(2, resultsList.size)
        assertEquals(second, resultsList[0])
        assertEquals(first, resultsList[1])
    }

    @org.junit.Test
    fun reverseFloatArray() {
        val first: Float = 77.77f
        val second: Float = 23.23f

        val floatList = mutableListOf(first, second)
        val resultsList = Arrays.reverseFloatArray(floatList)

        assertEquals(2, resultsList.size)
        assertEquals(second, resultsList[0], floatDelta)
        assertEquals(first, resultsList[1], floatDelta)
    }

    @org.junit.Test
    fun reverseDoubleArray() {
        val first: Double = 22.22
        val second: Double = 66.66

        val doubleList = mutableListOf(first, second)
        val resultsList = Arrays.reverseDoubleArray(doubleList)

        assertEquals(2, resultsList.size)
        assertEquals(second, resultsList[0], doubleDelta)
        assertEquals(first, resultsList[1], doubleDelta)
    }

    @org.junit.Test
    fun methodWithBooleanArray() {
        val booleanList = mutableListOf<Boolean>(true, true, false)
        val resultsList = Arrays.reverseBoolArray(booleanList)

        assertEquals(3, resultsList.size)
        assertFalse(resultsList[0])
        assertTrue(resultsList[1])
        assertTrue(resultsList[2])
    }

    @org.junit.Test
    fun reverseStructArray() {
        val first = Arrays.BasicStruct(22.22)
        val second = Arrays.BasicStruct(33.33)

        val structList = mutableListOf(first, second)
        val resultsList = Arrays.reverseStructArray(structList)

        assertEquals(2, resultsList.size)
        assertEquals(second.value, resultsList[0].value, doubleDelta)
        assertEquals(first.value, resultsList[1].value, doubleDelta)
    }

    @org.junit.Test
    fun reverseMapsArray() {
        val first = mutableMapOf(32.toShort() to "abc")
        val second = mutableMapOf<Short, String>()

        val input = mutableListOf(first, second)
        val result = Arrays.reverseMapsArray(input)

        assertEquals(2, result.size)
        assertEquals(second, result[0])
        assertEquals(first, result[1])
    }

    @org.junit.Test
    fun reverseArrayMapsArray() {
        val first = mutableMapOf(42.toShort() to mutableListOf("john", "doe"))
        val second = mutableMapOf(44.toShort() to mutableListOf("example", "dot", "com"))

        val input = mutableListOf(first, second)
        val result = Arrays.reverseArrayMapsArray(input)

        assertEquals(2, result.size)
        assertEquals(second, result[0])
        assertEquals(first, result[1])
    }

    @org.junit.Test
    fun methodWithExplicitInstanceArray() {
        val first = InstancesFactory.createSimpleInstantiableOne()
        first.setStringValue("FIRST STRING")

        val second = InstancesFactory.createSimpleInstantiableOne()
        second.setStringValue("SECOND STRING")

        val instancesArray = mutableListOf(first, second)
        val resultsList = Arrays.reverseExplicitInstancesArray(instancesArray)

        assertEquals(2, resultsList.size)
        assertEquals(second.getStringValue(), resultsList[0].getStringValue())
        assertEquals(first.getStringValue(), resultsList[1].getStringValue())
    }

    @org.junit.Test
    fun methodWithImplicitInstanceArray() {
        val first = InstancesFactory.createSimpleInstantiableOne()
        first.setStringValue("FIRST STRING")

        val second = InstancesFactory.createSimpleInstantiableOne()
        second.setStringValue("SECOND STRING")

        val instancesArray = mutableListOf(first, second)
        val resultsList: List<SimpleInstantiableOne> = Arrays.reverseImplicitInstancesArray(instancesArray)

        assertEquals(2, resultsList.size)
        assertEquals(second.getStringValue(), resultsList[0].getStringValue())
        assertEquals(first.getStringValue(), resultsList[1].getStringValue())
    }

    @org.junit.Test
    fun reverseNestedPrimitiveArray() {
        val nestedDoubleList = mutableListOf(mutableListOf(11.11, 22.22), mutableListOf(33.33, 44.44))
        val resultsList = Arrays.reverseNestedPrimitiveArray(nestedDoubleList)

        assertEquals(2, resultsList.size)

        val firstResult = resultsList[0]
        assertEquals(2, firstResult.size)
        assertEquals(nestedDoubleList[1][1], firstResult[0], doubleDelta)
        assertEquals(nestedDoubleList[1][0], firstResult[1], doubleDelta)

        val secondResult = resultsList[1]
        assertEquals(2, secondResult.size)
        assertEquals(nestedDoubleList[0][1], secondResult[0], doubleDelta)
        assertEquals(nestedDoubleList[0][0], secondResult[1], doubleDelta)
    }

    @org.junit.Test
    fun reverseNestedStructArray() {
        val nestedStructList = mutableListOf(
            mutableListOf(Arrays.BasicStruct(11.11), Arrays.BasicStruct(22.22)),
            mutableListOf(Arrays.BasicStruct(33.33), Arrays.BasicStruct(44.44))
        )

        val resultsList = Arrays.reverseNestedStructArray(nestedStructList)

        val firstResult = resultsList[0]
        assertEquals(2, firstResult.size)
        assertEquals(nestedStructList[1][1].value, firstResult[0].value, doubleDelta)
        assertEquals(nestedStructList[1][0].value, firstResult[1].value, doubleDelta)

        val secondResult = resultsList[1]
        assertEquals(2, secondResult.size)
        assertEquals(nestedStructList[0][1].value, secondResult[0].value, doubleDelta)
        assertEquals(nestedStructList[0][0].value, secondResult[1].value, doubleDelta)
    }

    @org.junit.Test
    fun reverseNestedArraysInline() {
        val nestedLongList = mutableListOf(mutableListOf(21L, 31L), mutableListOf(45L, 75L))
        val resultsList = Arrays.reverseNestedArraysInline(nestedLongList)

        assertEquals(2, resultsList.size)

        val firstResult = resultsList[0]
        assertEquals(2, firstResult.size)
        assertEquals(nestedLongList[1][1], firstResult[0])
        assertEquals(nestedLongList[1][0], firstResult[1])

        val secondResult = resultsList[1]
        assertEquals(2, secondResult.size)
        assertEquals(nestedLongList[0][1], secondResult[0])
        assertEquals(nestedLongList[0][0], secondResult[1])
    }

    @org.junit.Test
    fun mergeArraysOfStructsWithArrays() {
        val instance1 = InstancesFactory.createSimpleInstantiableOne()
        instance1.setStringValue("Instance 1: STRING")

        val instance2 = InstancesFactory.createSimpleInstantiableOne()
        instance2.setStringValue("Instance 2: STRING")

        val instance3 = InstancesFactory.createSimpleInstantiableOne()
        instance3.setStringValue("Instance 3: STRING")

        val instancesArray1 = mutableListOf(instance1, instance2)
        val instancesArray2 = mutableListOf(instance3)
        val instancesArray3 = mutableListOf<SimpleInstantiableOne>()

        val struct1 = Arrays.FancyStruct(
            mutableListOf("struct", "1"),
            mutableListOf(1.toShort(), 2.toShort()),
            instancesArray1
        )

        val struct2 = Arrays.FancyStruct(
            mutableListOf("struct", "2"),
            mutableListOf(3.toShort(), 4.toShort()),
            instancesArray2
        )

        val struct3 =  Arrays.FancyStruct(
            mutableListOf("struct", "3"),
            mutableListOf(5.toShort(), 6.toShort()),
            instancesArray3
        )

        val fancyStructList1 = mutableListOf(struct1, struct2)
        val fancyStructList2 = mutableListOf(struct3)
        val resultsList = Arrays.mergeArraysOfStructsWithArrays(fancyStructList1, fancyStructList2)

        assertEquals(3, resultsList.size)

        assertEquals("struct", resultsList[0].messages[0])
        assertEquals("3", resultsList[0].messages[1])
        assertTrue(resultsList[0].instances.isEmpty())

        assertEquals("2", resultsList[1].messages[1])
        assertEquals(1, resultsList[1].instances.size)
        assertEquals("Instance 3: STRING", resultsList[1].instances[0].getStringValue())

        assertEquals("1", resultsList[2].messages[1])
        assertEquals(2, resultsList[2].instances.size)
        assertEquals("Instance 1: STRING", resultsList[2].instances[0].getStringValue())
        assertEquals("Instance 2: STRING", resultsList[2].instances[1].getStringValue())
    }

    @org.junit.Test
    fun reverseArrayOfAliases_emptyList() {
        val stringList = mutableListOf<String>()
        val resultsList = Arrays.reverseArrayOfAliases(stringList)

        assertEquals(0, resultsList.size)
    }

    @org.junit.Test
    fun reverseArrayOfAliases_reversesArray() {
        val stringList = mutableListOf("abc", "def")
        val resultsList = Arrays.reverseArrayOfAliases(stringList)

        assertEquals(2, resultsList.size)
        assertEquals("def", resultsList[0])
        assertEquals("abc", resultsList[1])
    }
}