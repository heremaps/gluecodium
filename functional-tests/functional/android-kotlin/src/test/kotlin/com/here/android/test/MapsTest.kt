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
import org.junit.Assert.assertNotNull
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

@RunWith(RobolectricTestRunner::class)
@Config(application = RobolectricApplication::class)
class MapsTest {
    @org.junit.Test
    fun methodWithMaps_emptyMap() {
        val intStringMap= mutableMapOf<Int, String>()
        val resultsMap = Maps.methodWithMap(intStringMap)

        assertEquals(0, resultsMap.size)
    }

    @org.junit.Test
    fun methodWithMaps_multipleItems() {
        val intStringMap = mutableMapOf(11 to "abc", 22 to "def", 33 to "ghi")
        val resultsMap = Maps.methodWithMap(intStringMap)

        assertEquals(3, resultsMap.size)

        // The method returns string values in uppercase
        assertEquals("ABC", resultsMap[11])
        assertEquals("DEF", resultsMap[22])
        assertEquals("GHI", resultsMap[33])
    }

    @org.junit.Test
    fun methodWithMapToArray_emptyMap() {
        val arrayMap = mutableMapOf<Short, MutableList<String>>()
        val resultsMap = Maps.methodWithMapOfArrays(arrayMap)

        assertEquals(0, resultsMap.size)
    }

    @org.junit.Test
    fun methodWithMapToArray_multipleItems() {
        val arrayMap = mutableMapOf(
            11.toShort() to mutableListOf("abc"),
            22.toShort() to mutableListOf("def", "ghi"),
            33.toShort() to mutableListOf(),
        )

        val resultsMap = Maps.methodWithMapOfArrays(arrayMap)
        assertEquals(3, resultsMap.size)

        // The method returns string values in uppercase
        assertEquals(mutableListOf("ABC"), resultsMap[11.toShort()])
        assertEquals(mutableListOf("DEF", "GHI"), resultsMap[22.toShort()])
        assertEquals(emptyList<String>(), resultsMap[33.toShort()])
    }

    @org.junit.Test
    fun methodWithMapToStruct_emptyMap() {
        val byteStructMap = mutableMapOf<Short, Maps.SomeStruct>()
        val resultsMap = Maps.methodWithMapToStruct(byteStructMap)

        assertEquals(0, resultsMap.size)
    }

    @org.junit.Test
    fun methodWithMapToStruct_multipleItems() {
        val byteStructMap = mutableMapOf(
            11.toShort() to Maps.SomeStruct("abc"),
            22.toShort() to Maps.SomeStruct("def"),
            33.toShort() to Maps.SomeStruct("ghi"),
        )

        val resultsMap = Maps.methodWithMapToStruct(byteStructMap)
        assertEquals(3, resultsMap.size)

        // The method returns string values in uppercase
        assertEquals("ABC", resultsMap[11.toShort()]!!.value)
        assertEquals("DEF", resultsMap[22.toShort()]!!.value)
        assertEquals("GHI", resultsMap[33.toShort()]!!.value)
    }

    @org.junit.Test
    fun methodWithNestedMap_emptyMap() {
        val byteMapMap = mutableMapOf<Short, MutableMap<Short, Maps.SomeStruct>>()
        val resultsMap = Maps.methodWithNestedMap(byteMapMap)

        assertEquals(0, resultsMap.size)
    }

    @org.junit.Test
    fun methodWithNestedMap_multipleItems() {
        val inputMap = mutableMapOf(
            55.toShort() to mutableMapOf(
                11.toShort() to Maps.SomeStruct("abc"),
                22.toShort() to Maps.SomeStruct("def"),
                33.toShort() to Maps.SomeStruct("ghi"),
            ),
            77.toShort() to mutableMapOf<Short, Maps.SomeStruct>()
        )

        val resultsMap = Maps.methodWithNestedMap(inputMap)
        assertEquals(2, resultsMap.size)

        // First map should have 3 elements converted to uppercase inside structs.
        val resultSubMap: Map<Short, Maps.SomeStruct> = resultsMap[55.toShort()]!!
        assertEquals(3, resultSubMap.size)

        // The method returns string values in uppercase
        assertEquals("ABC", resultSubMap[11.toShort()]!!.value)
        assertEquals("DEF", resultSubMap[22.toShort()]!!.value)
        assertEquals("GHI", resultSubMap[33.toShort()]!!.value)

        // The second map should remain empty.
        assertEquals(0, resultsMap[77.toShort()]!!.size)
    }

    @org.junit.Test
    fun methodWithStructWithMap_emptyMap() {
        val structWithMap = Maps.StructWithMap(mutableMapOf())
        val result = Maps.methodWithStructWithMap(structWithMap)

        assertEquals(0, result.errorMapping.size)
    }

    @org.junit.Test
    fun methodWithStructWithMap_multipleItems() {
        val structWithMap = Maps.StructWithMap(mutableMapOf(11 to "abc", 22 to "def", 33 to "ghi"))

        val result = Maps.methodWithStructWithMap(structWithMap)
        assertEquals(3, result.errorMapping.size)

        // The method returns string values in uppercase
        assertEquals("ABC", result.errorMapping[11])
        assertEquals("DEF", result.errorMapping[22])
        assertEquals("GHI", result.errorMapping[33])
    }

    @org.junit.Test
    fun methodWithEnumToStringMap_emptyMap() {
        val enumStringMap = mutableMapOf<Maps.SomeEnum, String>()
        val resultsMap = Maps.methodWithEnumToStringMap(enumStringMap)

        assertEquals(0, resultsMap.size)
    }

    @org.junit.Test
    fun methodWithEnumToStringMap_multipleItems() {
        val enumStringMap = mutableMapOf<Maps.SomeEnum, String>(
            Maps.SomeEnum.FOO_VALUE to "this is foo",
            Maps.SomeEnum.BAR_VALUE to "this is bar",
        )

        val resultsMap = Maps.methodWithEnumToStringMap(enumStringMap)
        assertEquals(2, resultsMap.size)

        // The method returns string values in uppercase
        assertEquals("THIS IS FOO", resultsMap[Maps.SomeEnum.FOO_VALUE])
        assertEquals("THIS IS BAR", resultsMap[Maps.SomeEnum.BAR_VALUE])
    }

    @org.junit.Test
    fun methodWithMapOfInstances() {
        val first = InterfacesFactory.createSimpleInterfaceOne()
        first.setStringValue("first =")

        val second = InterfacesFactory.createSimpleInterfaceOne()
        second.setStringValue("second =")

        val inputMap = mutableMapOf("primo" to first, "secundo" to second)
        val resultsMap = Maps.methodWithMapOfInstances(inputMap)
        assertEquals(2, resultsMap.size)

        assertNotNull(resultsMap["primo"])
        assertEquals("first = primo", resultsMap["primo"]!!.getStringValue())

        assertNotNull(resultsMap["secundo"])
        assertEquals("second = secundo", resultsMap["secundo"]!!.getStringValue())
    }

    @org.junit.Test
    fun structToStringMapRoundTrip() {
        val input = mutableMapOf(
            Maps.EquatableStruct("foo") to "foo",
            Maps.EquatableStruct("bar") to "bar",
        )

        val result = Maps.structToStringRoundTrip(input)
        assertEquals(input, result)
    }

    @org.junit.Test
    fun classToStringMapRoundTrip() {
        val input = mutableMapOf(
            SomeEquatableClass("foo") to "foo",
            SomeEquatableClass("bar") to "bar",
        )

        val result = Maps.classToStringRoundTrip(input)
        assertEquals(input, result)
    }

    @org.junit.Test
    fun SomePointerEquatableClassToStringMapRoundTrip() {
        val input = mutableMapOf(
            SomePointerEquatableClass("foo") to "foo",
            SomePointerEquatableClass("bar") to "bar",
        )

        val result = Maps.somePointerEquatableClassToStringRoundTrip(input)
        assertEquals(input, result)
    }
}