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
import org.junit.Assert.assertNotEquals
import org.junit.Assert.assertTrue
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

@RunWith(RobolectricTestRunner::class)
@Config(application = RobolectricApplication::class)
class EquatableNullableTest {
    private val mainStruct: Equatable.EquatableNullableStruct = createEquatableNullableStruct()

    @org.junit.Test
    fun equatableNullableStructEquals() {
        val otherStruct: Equatable.EquatableNullableStruct = createEquatableNullableStruct()

        assertEquals(mainStruct, otherStruct)
        assertEquals(mainStruct.hashCode(), otherStruct.hashCode())
    }

    @org.junit.Test
    fun equatableNullableStructNotEqualsBooleanField() {
        val otherStruct: Equatable.EquatableNullableStruct = createEquatableNullableStruct()
        otherStruct.boolField = !otherStruct.boolField!!

        assertNotEquals(mainStruct, otherStruct)
        assertNotEquals(mainStruct.hashCode(), otherStruct.hashCode())
    }

    @org.junit.Test
    fun equatableNullableStructNotEqualsIntField() {
        val otherStruct: Equatable.EquatableNullableStruct = createEquatableNullableStruct()
        otherStruct.intField = otherStruct.intField!! + 1

        assertNotEquals(mainStruct, otherStruct)
        assertNotEquals(mainStruct.hashCode(), otherStruct.hashCode())
    }

    @org.junit.Test
    fun equatableNullableStructNotEqualsUintField() {
        val otherStruct: Equatable.EquatableNullableStruct = createEquatableNullableStruct()
        otherStruct.uintField = otherStruct.uintField!! + 1

        assertNotEquals(mainStruct, otherStruct)
        assertNotEquals(mainStruct.hashCode(), otherStruct.hashCode())
    }

    @org.junit.Test
    fun equatableNullableStructNotEqualsFloatField() {
        val otherStruct: Equatable.EquatableNullableStruct = createEquatableNullableStruct()
        otherStruct.floatField = otherStruct.floatField!! + 1

        assertNotEquals(mainStruct, otherStruct)
        assertNotEquals(mainStruct.hashCode(), otherStruct.hashCode())
    }

    @org.junit.Test
    fun equatableNullableStructNotEqualsStringField() {
        val otherStruct: Equatable.EquatableNullableStruct = createEquatableNullableStruct()
        otherStruct.stringField += "foo"

        assertNotEquals(mainStruct, otherStruct)
        assertNotEquals(mainStruct.hashCode(), otherStruct.hashCode())
    }

    @org.junit.Test
    fun equatableNullableStructNotEqualsStructField() {
        val otherStruct: Equatable.EquatableNullableStruct = createEquatableNullableStruct()
        otherStruct.structField!!.fooField = otherStruct.structField!!.fooField + "bar"

        assertNotEquals(mainStruct, otherStruct)
        assertNotEquals(mainStruct.hashCode(), otherStruct.hashCode())
    }

    @org.junit.Test
    fun equatableNullableStructNotEqualsEnumField() {
        val otherStruct: Equatable.EquatableNullableStruct = createEquatableNullableStruct()
        otherStruct.enumField = Equatable.SomeSomeEnum.FOO

        assertNotEquals(mainStruct, otherStruct)
        assertNotEquals(mainStruct.hashCode(), otherStruct.hashCode())
    }

    @org.junit.Test
    fun equatableNullableStructNotEqualsMapField() {
        val otherStruct: Equatable.EquatableNullableStruct = createEquatableNullableStruct()
        otherStruct.mapField = otherStruct.mapField!! + mapOf(2 to "foo")

        assertNotEquals(mainStruct, otherStruct)
        assertNotEquals(mainStruct.hashCode(), otherStruct.hashCode())
    }

    @org.junit.Test
    fun equatableNullableStructNotEqualsArrayField() {
        val otherStruct: Equatable.EquatableNullableStruct = createEquatableNullableStruct()
        otherStruct.arrayField = otherStruct.arrayField!! + listOf("foo")

        assertNotEquals(mainStruct, otherStruct)
        assertNotEquals(mainStruct.hashCode(), otherStruct.hashCode())
    }

    @org.junit.Test
    fun equatableNullableStructEqualsCpp() {
        val otherStruct: Equatable.EquatableNullableStruct = createEquatableNullableStruct()
        assertTrue(EquatableClass.areEqual(mainStruct, otherStruct))
    }

    @org.junit.Test
    fun equatableNullableStructEqualsCppWithNulls() {
        assertTrue(EquatableClass.areEqual(Equatable.EquatableNullableStruct(), Equatable.EquatableNullableStruct()))
    }

    @org.junit.Test
    fun equatableNullableStructNotEqualsCpp() {
        val otherStruct: Equatable.EquatableNullableStruct = createEquatableNullableStruct()
        otherStruct.arrayField = otherStruct.arrayField!! + listOf("foo")

        assertFalse(EquatableClass.areEqual(mainStruct, otherStruct))
    }

    private fun createEquatableNullableStruct(): Equatable.EquatableNullableStruct {
        return Equatable.EquatableNullableStruct(
            true, -42, 6542, 3.14f, "nonsense", Equatable.NestedEquatableStruct("foo"),
            Equatable.SomeSomeEnum.BAR, mapOf(0 to "one", 1 to "two"), listOf("one", "two")
        )
    }
}