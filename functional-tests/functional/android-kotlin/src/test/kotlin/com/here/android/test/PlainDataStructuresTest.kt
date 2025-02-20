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
class PlainDataStructuresTest {
    private val delta = 0.00000001

    @org.junit.Test
    fun returnSimpleDataStructure() {
        val point: PlainDataStructures.Point = PlainDataStructures.createPoint(1.0, 2.0)
        assertEquals(1.0, point.x, delta)
        assertEquals(2.0, point.y, delta)
    }

    @org.junit.Test
    fun manipulateSimpleDataStructure() {
        val point = PlainDataStructures.Point()
        point.x = 1.0
        point.y = 2.0

        val result: PlainDataStructures.Point = PlainDataStructures.swapPointCoordinates(point)
        assertEquals(2.0, result.x, delta)
        assertEquals(1.0, result.y, delta)
    }

    @org.junit.Test
    fun createNestedDataStructureWithMultipleParams() {
        val point1: PlainDataStructures.Point = PlainDataStructures.createPoint(1.0, 2.0)
        val point2 = PlainDataStructures.Point()
        point2.x = 3.0
        point2.y = 4.0

        val line: PlainDataStructures.Line = PlainDataStructures.createLine(point1, point2)
        assertEquals(1.0, line.a.x, delta)
        assertEquals(2.0, line.a.y, delta)
        assertEquals(3.0, line.b.x, delta)
        assertEquals(4.0, line.b.y, delta)
    }

    @org.junit.Test
    fun manifoldNestedDataStructure() {
        val point1: PlainDataStructures.Point = PlainDataStructures.createPoint(1.0, 2.0)
        val point2: PlainDataStructures.Point = PlainDataStructures.createPoint(3.0, 4.0)
        val line: PlainDataStructures.Line = PlainDataStructures.createLine(point1, point2)

        val color = PlainDataStructures.Color()
        color.red = 10
        color.green = 20
        color.blue = 30

        val coloredLine = PlainDataStructures.createColoredLine(line, color)

        assertEquals(1.0, coloredLine.line.a.x, delta)
        assertEquals(2.0, coloredLine.line.a.y, delta)
        assertEquals(3.0, coloredLine.line.b.x, delta)
        assertEquals(4.0, coloredLine.line.b.y, delta)
        assertEquals(10.toShort(), coloredLine.color.red)
        assertEquals(20.toShort(), coloredLine.color.green)
        assertEquals(30.toShort(), coloredLine.color.blue)
    }

    @org.junit.Test
    fun allTypesZeroesRoundTrip() {
        val allTypesStruct = PlainDataStructures.AllTypesStruct(PlainDataStructures.createPoint(0.0, 0.0))
        allTypesStruct.booleanField = false
        allTypesStruct.doubleField = 0.0
        allTypesStruct.floatField = 0.0f
        allTypesStruct.int8Field = 0
        allTypesStruct.int16Field = 0
        allTypesStruct.int32Field = 0
        allTypesStruct.int64Field = 0
        allTypesStruct.uint8Field = 0
        allTypesStruct.uint16Field = 0
        allTypesStruct.uint32Field = 0
        allTypesStruct.uint64Field = 0
        allTypesStruct.stringField = ""

        val result = PlainDataStructures.returnAllTypesStruct(allTypesStruct)

        assertEquals(false, result.booleanField)
        assertEquals(0.0, result.doubleField, delta)
        assertEquals(0.0f, result.floatField)
        assertEquals(0.toByte(), result.int8Field)
        assertEquals(0.toShort(), result.int16Field)
        assertEquals(0, result.int32Field)
        assertEquals(0L, result.int64Field)
        assertEquals(0.toShort(), result.uint8Field)
        assertEquals(0, result.uint16Field)
        assertEquals(0, result.uint32Field)
        assertEquals(0, result.uint64Field)
        assertEquals("", result.stringField)
        assertEquals(0.0, result.pointField.x, delta)
        assertEquals(0.0, result.pointField.y, delta)
    }

    @org.junit.Test
    fun modifyAllBuiltInAndCustomTypesDataStructure() {
        val allTypesStruct =  PlainDataStructures.AllTypesStruct(PlainDataStructures.createPoint(11.0, 12.0))
        allTypesStruct.booleanField = true
        allTypesStruct.doubleField = 1.0
        allTypesStruct.floatField = 2.0f
        allTypesStruct.int8Field = 3
        allTypesStruct.int16Field = 4
        allTypesStruct.int32Field = 5
        allTypesStruct.int64Field = 6
        allTypesStruct.uint8Field = 7
        allTypesStruct.uint16Field = 8
        allTypesStruct.uint32Field = 9
        allTypesStruct.uint64Field = 10
        allTypesStruct.stringField = "test string"

        val result = PlainDataStructures.modifyAllTypesStruct(allTypesStruct)

        assertEquals(false, result.booleanField)
        assertEquals(allTypesStruct.doubleField + 1.0, result.doubleField, delta)
        assertEquals(allTypesStruct.floatField + 1.0f, result.floatField)
        assertEquals(allTypesStruct.int8Field + 1, result.int8Field.toInt())
        assertEquals(allTypesStruct.int16Field + 1, result.int16Field.toInt())
        assertEquals(allTypesStruct.int32Field + 1, result.int32Field)
        assertEquals(allTypesStruct.int64Field + 1, result.int64Field)
        assertEquals(allTypesStruct.uint8Field + 1, result.uint8Field.toInt())
        assertEquals(allTypesStruct.uint16Field + 1, result.uint16Field)
        assertEquals(allTypesStruct.uint32Field + 1, result.uint32Field)
        assertEquals(allTypesStruct.uint64Field + 1, result.uint64Field)
        assertEquals("Hello test string", result.stringField)
        assertEquals(12.0, result.pointField.x, delta)
        assertEquals(11.0, result.pointField.y, delta)
    }

    @org.junit.Test
    fun checkAllFieldsAreInitialized() {
        assertTrue(PlainDataStructures.checkAllFieldsAreInitialized())
    }
}