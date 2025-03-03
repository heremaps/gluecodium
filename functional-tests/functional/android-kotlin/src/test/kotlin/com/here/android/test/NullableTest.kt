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
class NullableTest {
    val nullableInterface = NullableInterface()
    val doubleDelta = 0.0000000000001

    class NullableListenerImpl : NullableListener {
        override var arrayAttribute: MutableList<String>? = null

        override fun methodWithDouble(input: Double?): Double? {
            return input
        }
    }

    @org.junit.Test
    fun nullableStructConstructor() {
        val struct = NullableInterface.NullableStruct()

        assertNull(struct.stringField)
        assertNull(struct.boolField)
        assertNull(struct.doubleField)
        assertNull(struct.structField)
        assertNull(struct.enumField)
        assertNull(struct.arrayField)
        assertNull(struct.inlineArrayField)
        assertNull(struct.mapField)
        assertNull(struct.blobField)
    }

    @org.junit.Test
    fun nullableNullStructRoundTrip() {
        val struct = NullableInterface.NullableStruct()
        val result = nullableInterface.methodWithNullableStruct(struct)

        assertNull(result.stringField)
        assertNull(result.boolField)
        assertNull(result.doubleField)
        assertNull(result.structField)
        assertNull(result.enumField)
        assertNull(result.arrayField)
        assertNull(result.inlineArrayField)
        assertNull(result.mapField)
        assertNull(result.blobField)
    }

    @org.junit.Test
    fun nullableZeroStructRoundTrip() {
        val struct = NullableInterface.NullableStruct()
        struct.stringField = ""
        struct.boolField = false
        struct.doubleField = 0.0
        struct.structField = NullableInterface.SomeStruct()
        struct.enumField = NullableInterface.SomeEnum.OFF
        struct.arrayField = mutableListOf()
        struct.inlineArrayField = mutableListOf()
        struct.mapField = mutableMapOf()
        struct.blobField = byteArrayOf()

        val result = nullableInterface.methodWithNullableStruct(struct)

        assertEquals(struct.stringField, result.stringField)
        assertEquals(struct.boolField, result.boolField)
        assertEquals(struct.doubleField, result.doubleField)
        assertEquals(struct.structField, result.structField)
        assertEquals(struct.enumField, result.enumField)
        assertEquals(struct.arrayField, result.arrayField)
        assertEquals(struct.inlineArrayField, result.inlineArrayField)
        assertEquals(struct.mapField, result.mapField)
        assertEquals(0, result.blobField?.size)
    }

    @org.junit.Test
    fun nullableFilledStructRoundTrip() {
        val struct = NullableInterface.NullableStruct()
        struct.stringField = "Foo"
        struct.boolField = true
        struct.doubleField = 3.14
        struct.structField = NullableInterface.SomeStruct("Woo")
        struct.enumField = NullableInterface.SomeEnum.ON
        struct.arrayField = mutableListOf("Bar")
        struct.inlineArrayField = mutableListOf<String>("Baz")
        struct.mapField = mutableMapOf(7L to "Wee")
        struct.blobField = byteArrayOf(42.toByte())

        val result = nullableInterface.methodWithNullableStruct(struct)

        assertEquals(struct.stringField, result.stringField)
        assertEquals(struct.boolField, result.boolField)
        assertEquals(struct.doubleField!!, result.doubleField!!, doubleDelta)
        assertEquals(struct.structField, result.structField)
        assertEquals(struct.enumField, result.enumField)
        assertEquals(struct.arrayField, result.arrayField)
        assertEquals(struct.inlineArrayField, result.inlineArrayField)
        assertEquals(struct.mapField, result.mapField)
        assertEquals(1, result.blobField?.size)
        assertEquals(42.toByte(), result.blobField!![0])
    }

    @org.junit.Test
    fun nullableIntsStructConstructor() {
        val struct = NullableInterface.NullableIntsStruct()

        assertNull(struct.int8Field)
        assertNull(struct.int16Field)
        assertNull(struct.int32Field)
        assertNull(struct.int64Field)
        assertNull(struct.uint8Field)
        assertNull(struct.uint16Field)
        assertNull(struct.uint32Field)
        assertNull(struct.uint64Field)
    }

    @org.junit.Test
    fun nullableIntsNullStructRoundTrip() {
        val struct = NullableInterface.NullableIntsStruct()
        val result = nullableInterface.methodWithNullableIntsStruct(struct)

        assertNull(result.int8Field)
        assertNull(result.int16Field)
        assertNull(result.int32Field)
        assertNull(result.int64Field)
        assertNull(result.uint8Field)
        assertNull(result.uint16Field)
        assertNull(result.uint32Field)
        assertNull(result.uint64Field)
    }

    @org.junit.Test
    fun nullableIntsZeroStructRoundTrip() {
        val struct = NullableInterface.NullableIntsStruct()
        struct.int8Field = 0
        struct.int16Field = 0
        struct.int32Field = 0
        struct.int64Field = 0
        struct.uint8Field = 0
        struct.uint16Field = 0
        struct.uint32Field = 0
        struct.uint64Field = 0

        val result = nullableInterface.methodWithNullableIntsStruct(struct)

        assertEquals(struct.int8Field, result.int8Field)
        assertEquals(struct.int16Field, result.int16Field)
        assertEquals(struct.int32Field, result.int32Field)
        assertEquals(struct.int64Field, result.int64Field)
        assertEquals(struct.uint8Field, result.uint8Field)
        assertEquals(struct.uint16Field, result.uint16Field)
        assertEquals(struct.uint32Field, result.uint32Field)
        assertEquals(struct.uint64Field, result.uint64Field)
    }

    @org.junit.Test
    fun nullableIntsFilledStructRoundTrip() {
        val struct = NullableInterface.NullableIntsStruct()
        struct.int8Field = 42
        struct.int16Field = -71
        struct.int32Field = -1337
        struct.int64Field = -3735928559L
        struct.uint8Field = 71
        struct.uint16Field = 1337
        struct.uint32Field = 2735718543L
        struct.uint64Field = 3735928559L

        val result = nullableInterface.methodWithNullableIntsStruct(struct)

        assertEquals(struct.int8Field, result.int8Field)
        assertEquals(struct.int16Field, result.int16Field)
        assertEquals(struct.int32Field, result.int32Field)
        assertEquals(struct.int64Field, result.int64Field)
        assertEquals(struct.uint8Field, result.uint8Field)
        assertEquals(struct.uint16Field, result.uint16Field)
        assertEquals(struct.uint32Field, result.uint32Field)
        assertEquals(struct.uint64Field, result.uint64Field)
    }

    @org.junit.Test
    fun nullableStringMethodWithNull() {
        val value: String? = null
        val result: String? = nullableInterface.methodWithString(value)

        assertEquals(result, value)
    }

    @org.junit.Test
    fun nullableStringMethodWithNonNull() {
        val value: String? = "Foo"
        val result: String? = nullableInterface.methodWithString(value)

        assertEquals(result, value)
    }

    @org.junit.Test
    fun nullableBooleanMethodWithNull() {
        val value: Boolean? = null
        val result: Boolean? = nullableInterface.methodWithBoolean(value)

        assertEquals(result, value)
    }

    @org.junit.Test
    fun nullableBooleanMethodWithFalse() {
        val value: Boolean? = false
        val result: Boolean? = nullableInterface.methodWithBoolean(value)

        assertEquals(result, value)
    }

    @org.junit.Test
    fun nullableBooleanMethodWithTrue() {
        val value: Boolean? = true
        val result: Boolean? = nullableInterface.methodWithBoolean(value)

        assertEquals(result, value)
    }

    @org.junit.Test
    fun nullableDoubleMethodWithNull() {
        val value: Double? = null
        val result: Double? = nullableInterface.methodWithDouble(value)

        assertEquals(result, value)
    }

    @org.junit.Test
    fun nullableDoubleMethodWithZero() {
        val value: Double = 0.0
        val result: Double? = nullableInterface.methodWithDouble(value)

        assertEquals(result!!, value, doubleDelta)
    }

    @org.junit.Test
    fun nullableDoubleMethodWithNonNull() {
        val value: Double = 3.14
        val result: Double? = nullableInterface.methodWithDouble(value)

        assertEquals(result!!, value, doubleDelta)
    }

    @org.junit.Test
    fun nullableIntegerMethodWithNull() {
        val value: Long? = null
        val result: Long? = nullableInterface.methodWithInt(value)

        assertEquals(result, value)
    }

    @org.junit.Test
    fun nullableIntegerMethodWithZero() {
        val value: Long? = 0L
        val result: Long? = nullableInterface.methodWithInt(value)

        assertEquals(result, value)
    }

    @org.junit.Test
    fun nullableIntegerMethodWithNonNull() {
        val value: Long? = 42L
        val result: Long? = nullableInterface.methodWithInt(value)

        assertEquals(result, value)
    }

    @org.junit.Test
    fun nullableStructMethodWithNull() {
        val value: NullableInterface.SomeStruct? = null
        val result: NullableInterface.SomeStruct? = nullableInterface.methodWithSomeStruct(value)

        assertEquals(result, value)
    }

    @org.junit.Test
    fun nullableStructMethodWithNonNull() {
        val value: NullableInterface.SomeStruct? = NullableInterface.SomeStruct("SOME STRUCTURE")
        val result: NullableInterface.SomeStruct? = nullableInterface.methodWithSomeStruct(value)

        assertEquals(result, value)
    }

    @org.junit.Test
    fun nullableEnumMethodWithNull() {
        val value: NullableInterface.SomeEnum? = null
        val result: NullableInterface.SomeEnum? = nullableInterface.methodWithSomeEnum(value)

        assertEquals(result, value)
    }

    @org.junit.Test
    fun nullableEnumMethodWithNonNull() {
        val value: NullableInterface.SomeEnum? = NullableInterface.SomeEnum.ON
        val result: NullableInterface.SomeEnum? = nullableInterface.methodWithSomeEnum(value)

        assertEquals(result, value)
    }

    @org.junit.Test
    fun nullableArrayMethodWithNull() {
        val value: MutableList<String>? = null
        val result: MutableList<String>? = nullableInterface.methodWithSomeArray(value)

        assertEquals(result, value)
    }

    @org.junit.Test
    fun nullableArrayMethodWithNonNull() {
        val value: MutableList<String>? = mutableListOf()
        val result: MutableList<String>? = nullableInterface.methodWithSomeArray(value)

        assertEquals(result, value)
    }

    @org.junit.Test
    fun nullableInlineArrayMethodWithNull() {
        val value: MutableList<String>? = null
        val result: MutableList<String>? = nullableInterface.methodWithInlineArray(value)

        assertEquals(result, value)
    }

    @org.junit.Test
    fun nullableInlineArrayMethodWithNonNull() {
        val value: MutableList<String>? = mutableListOf()
        val result: MutableList<String>? = nullableInterface.methodWithInlineArray(value)

        assertEquals(result, value)
    }

    @org.junit.Test
    fun nullableMapMethodWithNull() {
        val value: MutableMap<Long, String>? = null
        val result: MutableMap<Long, String>? = nullableInterface.methodWithSomeMap(value)

        assertEquals(result, value)
    }

    @org.junit.Test
    fun nullableMapMethodWithNonNull() {
        val value: MutableMap<Long, String>? = mutableMapOf()
        val result: MutableMap<Long, String>? = nullableInterface.methodWithSomeMap(value)

        assertEquals(result, value)
    }

    @org.junit.Test
    fun nullableStringAttributeWithNull() {
        nullableInterface.stringAttribute = null
        assertNull(nullableInterface.stringAttribute)
    }

    @org.junit.Test
    fun nullableStringAttributeWithNonNull() {
        val value: String = "Foo"
        nullableInterface.stringAttribute = value

        assertEquals(nullableInterface.stringAttribute, value)
    }

    @org.junit.Test
    fun nullableBooleanAttributeWithNull() {
        nullableInterface.isBoolAttribute = null
        assertNull(nullableInterface.isBoolAttribute)
    }

    @org.junit.Test
    fun nullableBooleanAttributeWithNonNull() {
        val value: Boolean = true
        nullableInterface.isBoolAttribute = value

        assertEquals(nullableInterface.isBoolAttribute, value)
    }

    @org.junit.Test
    fun nullableDoubleAttributeWithNull() {
        nullableInterface.doubleAttribute = null
        assertNull(nullableInterface.doubleAttribute)
    }

    @org.junit.Test
    fun nullableDoubleAttributeWithNonNull() {
        val value: Double = 3.14
        nullableInterface.doubleAttribute = value

        assertEquals(nullableInterface.doubleAttribute!!, value, doubleDelta)
    }

    @org.junit.Test
    fun nullableIntegerAttributeWithNull() {
        nullableInterface.intAttribute = null
        assertNull(nullableInterface.intAttribute)
    }

    @org.junit.Test
    fun nullableIntegerAttributeWithNonNull() {
        val value: Long = 42L
        nullableInterface.intAttribute = value

        assertEquals(nullableInterface.intAttribute, value)
    }

    @org.junit.Test
    fun nullableStructAttributeWithNull() {
        nullableInterface.structAttribute = null
        assertNull(nullableInterface.structAttribute)
    }

    @org.junit.Test
    fun nullableStructAttributeWithNonNull() {
        val value = NullableInterface.SomeStruct("NICE STRUCT")
        nullableInterface.structAttribute = value

        assertEquals(nullableInterface.structAttribute, value)
    }

    @org.junit.Test
    fun nullableEnumAttributeWithNull() {
        nullableInterface.enumAttribute = null
        assertNull(nullableInterface.enumAttribute)
    }

    @org.junit.Test
    fun nullableEnumAttributeWithNonNull() {
        val value = NullableInterface.SomeEnum.ON
        nullableInterface.enumAttribute = value

        assertEquals(nullableInterface.enumAttribute, value)
    }

    @org.junit.Test
    fun nullableArrayAttributeWithNull() {
        nullableInterface.arrayAttribute = null
        assertNull(nullableInterface.arrayAttribute)
    }

    @org.junit.Test
    fun nullableArrayAttributeWithNonNull() {
        val value: MutableList<String> = mutableListOf("abc", "def")
        nullableInterface.arrayAttribute = value

        assertEquals(nullableInterface.arrayAttribute, value)
    }

    @org.junit.Test
    fun nullableInlineArrayAttributeWithNull() {
        nullableInterface.inlineArrayAttribute = null
        assertNull(nullableInterface.inlineArrayAttribute)
    }

    @org.junit.Test
    fun nullableInlineArrayAttributeWithNonNull() {
        val value: MutableList<String> = mutableListOf("qwe", "rty")
        nullableInterface.inlineArrayAttribute = value

        assertEquals(nullableInterface.inlineArrayAttribute, value)
    }

    @org.junit.Test
    fun nullableMapAttributeWithNull() {
        nullableInterface.mapAttribute = null
        assertNull(nullableInterface.mapAttribute)
    }

    @org.junit.Test
    fun nullableMapAttributeWithNonNull() {
        val value = mutableMapOf(1L to "123", 2L to "456")
        nullableInterface.mapAttribute = value

        assertEquals(nullableInterface.mapAttribute, value)
    }

    @org.junit.Test
    fun nullableMethodListenerRoundtripWithNull() {
        val listener: NullableListener = NullableListenerImpl()
        val result: Double? = NullableInterface.nullableListenerMethodRoundTrip(listener, null)

        assertNull(result)
    }

    @org.junit.Test
    fun nullableMethodListenerRoundtripWithNonNull() {
        val listener: NullableListener = NullableListenerImpl()
        val value: Double = 3.14

        val result: Double? = NullableInterface.nullableListenerMethodRoundTrip(listener, value)
        assertEquals(result!!, value, doubleDelta)
    }

    @org.junit.Test
    fun nullableAttributeListenerRoundtripWithNull() {
        val listener: NullableListener = NullableListenerImpl()
        val result: MutableList<String>? = NullableInterface.nullableListenerAttributeRoundTrip(listener, null)

        assertNull(result)
    }

    @org.junit.Test
    fun nullableAttributeListenerRoundtripWithNonNull() {
        val listener: NullableListener = NullableListenerImpl()
        val value: MutableList<String> = mutableListOf("some", "non", "null", "list")

        val result: MutableList<String>? = NullableInterface.nullableListenerAttributeRoundTrip(listener, value)
        assertEquals(result, value)
    }
}