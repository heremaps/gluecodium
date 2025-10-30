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
class EquatableTest {
    private val mainStruct: Equatable.EquatableStruct = createEquatableStruct()

    @org.junit.Test
    fun equatableStructEquals() {
        val otherStruct: Equatable.EquatableStruct = createEquatableStruct()

        assertEquals(mainStruct, otherStruct)
        assertEquals(mainStruct.hashCode(), otherStruct.hashCode())
    }

    @org.junit.Test
    fun equatableStructNotEqualsBooleanField() {
        val otherStruct: Equatable.EquatableStruct = createEquatableStruct()
        otherStruct.boolField = !otherStruct.boolField

        assertNotEquals(mainStruct, otherStruct)
        assertNotEquals(mainStruct.hashCode(), otherStruct.hashCode())
    }

    @org.junit.Test
    fun equatableStructNotEqualsIntField() {
        val otherStruct: Equatable.EquatableStruct = createEquatableStruct()
        otherStruct.intField += 1

        assertNotEquals(mainStruct, otherStruct)
        assertNotEquals(mainStruct.hashCode(), otherStruct.hashCode())
    }

    @org.junit.Test
    fun equatableStructNotEqualsLongField() {
        val otherStruct: Equatable.EquatableStruct = createEquatableStruct()
        otherStruct.longField += 1

        assertNotEquals(mainStruct, otherStruct)
        assertNotEquals(mainStruct.hashCode(), otherStruct.hashCode())
    }

    @org.junit.Test
    fun equatableStructNotEqualsFloatField() {
        val otherStruct: Equatable.EquatableStruct = createEquatableStruct()
        otherStruct.floatField += 1

        assertNotEquals(mainStruct, otherStruct)
        assertNotEquals(mainStruct.hashCode(), otherStruct.hashCode())
    }

    @org.junit.Test
    fun equatableStructNotEqualsDoubleField() {
        val otherStruct: Equatable.EquatableStruct = createEquatableStruct()
        otherStruct.doubleField += 1

        assertNotEquals(mainStruct, otherStruct)
        assertNotEquals(mainStruct.hashCode(), otherStruct.hashCode())
    }

    @org.junit.Test
    fun equatableStructNotEqualsStringField() {
        val otherStruct: Equatable.EquatableStruct = createEquatableStruct()
        otherStruct.stringField += "foo"

        assertNotEquals(mainStruct, otherStruct)
        assertNotEquals(mainStruct.hashCode(), otherStruct.hashCode())
    }

    @org.junit.Test
    fun equatableStructNotEqualsStructField() {
        val otherStruct: Equatable.EquatableStruct = createEquatableStruct()
        otherStruct.structField.fooField += "bar"

        assertNotEquals(mainStruct, otherStruct)
        assertNotEquals(mainStruct.hashCode(), otherStruct.hashCode())
    }

    @org.junit.Test
    fun equatableStructNotEqualsEnumField() {
        val otherStruct: Equatable.EquatableStruct = createEquatableStruct()
        otherStruct.enumField = Equatable.SomeSomeEnum.FOO

        assertNotEquals(mainStruct, otherStruct)
        assertNotEquals(mainStruct.hashCode(), otherStruct.hashCode())
    }

    @org.junit.Test
    fun equatableStructNotEqualsMapField() {
        val otherStruct: Equatable.EquatableStruct = createEquatableStruct()
        otherStruct.mapField = otherStruct.mapField + mapOf(2 to "foo")

        assertNotEquals(mainStruct, otherStruct)
        assertNotEquals(mainStruct.hashCode(), otherStruct.hashCode())
    }

    @org.junit.Test
    fun equatableStructNotEqualsArrayField() {
        val otherStruct: Equatable.EquatableStruct = createEquatableStruct()
        otherStruct.arrayField = otherStruct.arrayField + listOf("foo")

        assertNotEquals(mainStruct, otherStruct)
        assertNotEquals(mainStruct.hashCode(), otherStruct.hashCode())
    }

    @org.junit.Test
    fun equatableArrayEquals() {
        val otherStruct: Equatable.EquatableStruct = createEquatableStruct()
        otherStruct.boolField = !otherStruct.boolField

        val first = listOf(mainStruct, otherStruct)
        val second = listOf(mainStruct, otherStruct)

        assertEquals(first, second)
        assertEquals(first.hashCode().toLong(), second.hashCode().toLong())
    }

    @org.junit.Test
    fun equatableArrayNotEquals() {
        val otherStruct: Equatable.EquatableStruct = createEquatableStruct()
        otherStruct.boolField = !otherStruct.boolField

        val first = listOf(mainStruct, otherStruct)
        val second = listOf(mainStruct, mainStruct)

        assertNotEquals(first, second)
        assertNotEquals(first.hashCode().toLong(), second.hashCode().toLong())
    }

    @org.junit.Test
    fun equatableStructEqualsCpp() {
        val otherStruct: Equatable.EquatableStruct = createEquatableStruct()
        assertTrue(EquatableClass.areEqual(mainStruct, otherStruct))
    }

    @org.junit.Test
    fun equatableStructNotEqualsCpp() {
        val otherStruct: Equatable.EquatableStruct = createEquatableStruct()
        otherStruct.arrayField = otherStruct.arrayField + listOf("foo")

        assertFalse(EquatableClass.areEqual(mainStruct, otherStruct))
    }

    @org.junit.Test
    fun differentInstancesPointerUnequal() {
        val one: PointerEquatableClass = PointerEquatableClass.createNew()
        val other: PointerEquatableClass = PointerEquatableClass.createNew()

        assertNotEquals(one, other)
        assertNotEquals(one.hashCode(), other.hashCode())
    }

    @org.junit.Test
    fun sameInstancesPointerEqual() {
        val one: PointerEquatableClass = PointerEquatableClass.createNew()
        val same: PointerEquatableClass = PointerEquatableClass.returnLast()

        assertEquals(one, same)
        assertEquals(one.hashCode(), same.hashCode())
    }

    @org.junit.Test
    fun classEqual() {
        val one: EquatableClass = EquatableClass("one")
        val other: EquatableClass = EquatableClass("one")

        assertEquals(one, other)
        assertEquals(one.hashCode(), other.hashCode())
    }

    @org.junit.Test
    fun classUnequal() {
        val one: EquatableClass = EquatableClass("one")
        val other: EquatableClass = EquatableClass("two")

        assertNotEquals(one, other)
        assertNotEquals(one.hashCode(), other.hashCode())
    }

    @org.junit.Test
    fun differentTypeUnequal() {
        val one: EquatableClass = EquatableClass("one")
        assertNotEquals(one, 7)
    }

    @org.junit.Test
    fun equalInstancesInStruct() {
        val one: EquatableClass = EquatableClass("one")
        val other: EquatableClass = EquatableClass("one")
        val uninteresting: PointerEquatableClass = PointerEquatableClass.createNew()
        val oneStruct = PointerEquatableClass.EquatableStruct(one, uninteresting)
        val otherStruct = PointerEquatableClass.EquatableStruct(other, uninteresting)

        assertEquals(oneStruct, otherStruct)
        assertEquals(oneStruct.hashCode(), otherStruct.hashCode())
        assertTrue(PointerEquatableClass.areEqual(oneStruct, otherStruct))
    }

    @org.junit.Test
    fun unequalInstancesInStruct() {
        val one: EquatableClass = EquatableClass("one")
        val other: EquatableClass = EquatableClass("other")
        val uninteresting: PointerEquatableClass = PointerEquatableClass.createNew()
        val oneStruct = PointerEquatableClass.EquatableStruct(one, uninteresting)
        val otherStruct = PointerEquatableClass.EquatableStruct(other, uninteresting)

        assertNotEquals(oneStruct, otherStruct)
        assertNotEquals(oneStruct.hashCode(), otherStruct.hashCode())
        assertFalse(PointerEquatableClass.areEqual(oneStruct, otherStruct))
    }

    @org.junit.Test
    fun pointerEqualInstancesInStruct() {
        val one: PointerEquatableClass = PointerEquatableClass.createNew()
        val other: PointerEquatableClass = PointerEquatableClass.returnLast()
        val uninteresting: EquatableClass = EquatableClass("same for both")
        val oneStruct = PointerEquatableClass.EquatableStruct(uninteresting, one)
        val otherStruct = PointerEquatableClass.EquatableStruct(uninteresting, other)

        assertEquals(oneStruct, otherStruct)
        assertEquals(oneStruct.hashCode(), otherStruct.hashCode())
        assertTrue(PointerEquatableClass.areEqual(oneStruct, otherStruct))
    }

    @org.junit.Test
    fun pointerUnequalInstancesInStruct() {
        val one: PointerEquatableClass = PointerEquatableClass.createNew()
        val other: PointerEquatableClass = PointerEquatableClass.createNew()
        val uninteresting: EquatableClass = EquatableClass("same for both")
        val oneStruct = PointerEquatableClass.EquatableStruct(uninteresting, one)
        val otherStruct = PointerEquatableClass.EquatableStruct(uninteresting, other)

        assertNotEquals(oneStruct, otherStruct)
        assertNotEquals(oneStruct.hashCode(), otherStruct.hashCode())
        assertFalse(PointerEquatableClass.areEqual(oneStruct, otherStruct))
    }

    @org.junit.Test
    fun optionalEqualInstancesInStruct() {
        val one: EquatableClass = EquatableClass("one")
        val other: EquatableClass = EquatableClass("one")
        val uninteresting: PointerEquatableClass = PointerEquatableClass.createNew()
        val oneStruct = PointerEquatableClass.OptionalEquatableStruct(one, uninteresting)
        val otherStruct = PointerEquatableClass.OptionalEquatableStruct(other, uninteresting)

        assertEquals(oneStruct, otherStruct)
        assertEquals(oneStruct.hashCode(), otherStruct.hashCode())
        assertTrue(PointerEquatableClass.areEqual(oneStruct, otherStruct))
    }

    @org.junit.Test
    fun optionalUnequalInstancesInStruct() {
        val one: EquatableClass = EquatableClass("one")
        val other: EquatableClass = EquatableClass("other")
        val uninteresting: PointerEquatableClass = PointerEquatableClass.createNew()
        val oneStruct = PointerEquatableClass.OptionalEquatableStruct(one, uninteresting)
        val otherStruct = PointerEquatableClass.OptionalEquatableStruct(other, uninteresting)

        assertNotEquals(oneStruct, otherStruct)
        assertNotEquals(oneStruct.hashCode(), otherStruct.hashCode())
        assertFalse(PointerEquatableClass.areEqual(oneStruct, otherStruct))
    }

    @org.junit.Test
    fun optionalPointerEqualInstancesInStruct() {
        val one: PointerEquatableClass = PointerEquatableClass.createNew()
        val other: PointerEquatableClass = PointerEquatableClass.returnLast()
        val uninteresting: EquatableClass = EquatableClass("same for both")
        val oneStruct = PointerEquatableClass.OptionalEquatableStruct(uninteresting, one)
        val otherStruct = PointerEquatableClass.OptionalEquatableStruct(uninteresting, other)

        assertEquals(oneStruct, otherStruct)
        assertEquals(oneStruct.hashCode(), otherStruct.hashCode())
        assertTrue(PointerEquatableClass.areEqual(oneStruct, otherStruct))
    }

    @org.junit.Test
    fun optionalPointerUnequalInstancesInStruct() {
        val one: PointerEquatableClass = PointerEquatableClass.createNew()
        val other: PointerEquatableClass = PointerEquatableClass.createNew()
        val uninteresting: EquatableClass = EquatableClass("same for both")
        val oneStruct = PointerEquatableClass.OptionalEquatableStruct(uninteresting, one)
        val otherStruct = PointerEquatableClass.OptionalEquatableStruct(uninteresting, other)

        assertNotEquals(oneStruct, otherStruct)
        assertNotEquals(oneStruct.hashCode(), otherStruct.hashCode())
        assertFalse(PointerEquatableClass.areEqual(oneStruct, otherStruct))
    }

    @org.junit.Test
    fun nullEqualInstancesInStruct() {
        val one: EquatableClass? = null
        val other: EquatableClass? = null
        val uninteresting: PointerEquatableClass = PointerEquatableClass.createNew()
        val oneStruct = PointerEquatableClass.OptionalEquatableStruct(one, uninteresting)
        val otherStruct = PointerEquatableClass.OptionalEquatableStruct(other, uninteresting)

        assertEquals(oneStruct, otherStruct)
        assertEquals(oneStruct.hashCode(), otherStruct.hashCode())
        assertTrue(PointerEquatableClass.areEqual(oneStruct, otherStruct))
    }

    @org.junit.Test
    fun nullUnequalInstancesInStruct() {
        val one: EquatableClass? = null
        val other: EquatableClass = EquatableClass("one")
        val uninteresting: PointerEquatableClass = PointerEquatableClass.createNew()
        val oneStruct = PointerEquatableClass.OptionalEquatableStruct(one, uninteresting)
        val otherStruct = PointerEquatableClass.OptionalEquatableStruct(other, uninteresting)

        assertNotEquals(oneStruct, otherStruct)
        assertNotEquals(oneStruct.hashCode(), otherStruct.hashCode())
        assertFalse(PointerEquatableClass.areEqual(oneStruct, otherStruct))
    }

    @org.junit.Test
    fun nullPointerEqualInstancesInStruct() {
        val one: PointerEquatableClass? = null
        val other: PointerEquatableClass? = null
        val uninteresting: EquatableClass = EquatableClass("same for both")
        val oneStruct = PointerEquatableClass.OptionalEquatableStruct(uninteresting, one)
        val otherStruct = PointerEquatableClass.OptionalEquatableStruct(uninteresting, other)

        assertEquals(oneStruct, otherStruct)
        assertEquals(oneStruct.hashCode(), otherStruct.hashCode())
        assertTrue(PointerEquatableClass.areEqual(oneStruct, otherStruct))
    }

    @org.junit.Test
    fun nullPointerUnequalInstancesInStruct() {
        val one: PointerEquatableClass? = null
        val other: PointerEquatableClass = PointerEquatableClass.createNew()
        val uninteresting: EquatableClass = EquatableClass("same for both")
        val oneStruct = PointerEquatableClass.OptionalEquatableStruct(uninteresting, one)
        val otherStruct = PointerEquatableClass.OptionalEquatableStruct(uninteresting, other)

        assertNotEquals(oneStruct, otherStruct)
        assertNotEquals(oneStruct.hashCode(), otherStruct.hashCode())
        assertFalse(PointerEquatableClass.areEqual(oneStruct, otherStruct))
    }

    @org.junit.Test
    fun equatableInterfaceEquals() {
        val oneInterface: EquatableInterface = EquatableInterfaceFactory.createEquatableInterface("foo")
        val otherInterface: EquatableInterface = EquatableInterfaceFactory.createEquatableInterface("foo")

        assertEquals(oneInterface, otherInterface)
        assertEquals(oneInterface.hashCode(), otherInterface.hashCode())
    }

    @org.junit.Test
    fun equatableInterfaceNotEquals() {
        val oneInterface: EquatableInterface = EquatableInterfaceFactory.createEquatableInterface("foo")
        val otherInterface: EquatableInterface = EquatableInterfaceFactory.createEquatableInterface("bar")

        assertNotEquals(oneInterface, otherInterface)
        assertNotEquals(oneInterface.hashCode(), otherInterface.hashCode())
    }

    private fun createEquatableStruct(): Equatable.EquatableStruct {
        return Equatable.EquatableStruct(
            true, 65542, 2147484000L, 1.0f, 2.0, "nonsense", Equatable.NestedEquatableStruct("foo"),
            Equatable.SomeSomeEnum.BAR, mapOf(0 to "one", 1 to "two"), listOf("one", "two")
        )
    }
}