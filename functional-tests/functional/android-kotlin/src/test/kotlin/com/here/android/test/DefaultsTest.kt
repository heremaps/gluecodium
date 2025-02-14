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
class DefaultsTest {
    @org.junit.Test
    fun checkCppDefaultsImmutable() {
        val myStruct: Defaults.ImmutableStructWithDefaults = Defaults.getImmutableDefault()

        assertEquals(42, myStruct.intField)
        assertEquals(0, myStruct.uintField)
        assertEquals(3.14f, myStruct.floatField)
        assertEquals(false, myStruct.boolField)
        assertEquals("some string", myStruct.stringField)
        assertEquals(Defaults.SomeEnum.BAR_VALUE, myStruct.enumField)
    }

    @org.junit.Test
    fun checkKotlinDefaultsImmutable() {
        val uintValue: Long = 77L
        val boolValue: Boolean = true
        val myStruct = Defaults.ImmutableStructWithDefaults(uintValue, boolValue)

        assertEquals(42, myStruct.intField)
        assertEquals(uintValue, myStruct.uintField)
        assertEquals(3.14f, myStruct.floatField)
        assertEquals(boolValue, myStruct.boolField)
        assertEquals("some string", myStruct.stringField)
        assertEquals(Defaults.SomeEnum.BAR_VALUE, myStruct.enumField)
    }

    @org.junit.Test
    fun checkKotlinSpecialDefaults() {
        val special = Defaults.StructWithSpecialDefaults()

        assertTrue(Defaults.isNan(special.floatNanField))
        assertTrue(Defaults.isInfinity(special.floatInfinityField))
        assertTrue(Defaults.isInfinity(special.floatNegativeInfinityField))
        assertTrue(Defaults.isNan(special.doubleNanField))
        assertTrue(Defaults.isInfinity(special.doubleInfinityField))
        assertTrue(Defaults.isInfinity(special.doubleNegativeInfinityField))
    }

    @org.junit.Test
    fun checkCppSpecialDefaults() {
        val special: Defaults.StructWithSpecialDefaults = Defaults.createSpecial()

        assertTrue(special.floatNanField.isNaN())
        assertTrue(special.floatInfinityField.isInfinite())
        assertTrue(special.floatNegativeInfinityField.isInfinite())
        assertTrue(special.floatNegativeInfinityField < 0)
        assertTrue(special.doubleNanField.isNaN())
        assertTrue(special.doubleInfinityField.isInfinite())
        assertTrue(special.doubleNegativeInfinityField.isInfinite())
        assertTrue(special.doubleNegativeInfinityField < 0)
    }

    @org.junit.Test
    fun checkKotlinEmptyDefaults() {
        val result = Defaults.StructWithEmptyDefaults()

        assertTrue(result.intsField.isEmpty())
        assertTrue(result.floatsField.isEmpty())
        assertTrue(result.mapField.isEmpty())
        assertTrue(result.setTypeField.isEmpty())

        // TODO: enable me when equatable is respected by structures
        // assertEquals(Defaults.StructWithDefaults(), result.structField)
    }

    @org.junit.Test
    fun checkCppEmptyDefaults() {
        val result: Defaults.StructWithEmptyDefaults = Defaults.getEmptyDefaults()

        assertTrue(result.intsField.isEmpty())
        assertTrue(result.floatsField.isEmpty())
        assertTrue(result.mapField.isEmpty())
        assertTrue(result.setTypeField.isEmpty())
        assertTrue(result.setTypeField.isEmpty())

        // TODO: enable me when equatable is respected by structures
        // assertEquals(Defaults.StructWithDefaults(), result.structField)
    }

    @org.junit.Test
    fun checkKotlinInitializerDefaults() {
        val result = Defaults.StructWithInitializerDefaults()

        assertEquals(listOf(4, -2, 42), result.intsField)
        assertEquals(listOf(3.14f, Float.NEGATIVE_INFINITY), result.floatsField)
        assertEquals(Defaults.ExternalEnum.ONE_VALUE, result.structField.enumField)
        assertEquals(setOf("foo", "bar"), result.setTypeField)
        assertEquals(mapOf(1L to "foo", 42L to "bar"), result.mapField)
    }

    @org.junit.Test
    fun checkCppInitializerDefaults() {
        val result: Defaults.StructWithInitializerDefaults = Defaults.getInitializerDefaults()

        assertEquals(listOf(4, -2, 42), result.intsField)
        assertEquals(listOf(3.14f, Float.NEGATIVE_INFINITY), result.floatsField)
        assertEquals(Defaults.ExternalEnum.ONE_VALUE, result.structField.enumField)
        assertEquals(setOf("foo", "bar"), result.setTypeField)
        assertEquals(mapOf(1L to "foo", 42L to "bar"), result.mapField)
    }

    @org.junit.Test
    fun testPositionalDefaultsFreeArgsCtor() {
        val result: StructWithKotlinPositionalDefaults = StructWithKotlinPositionalDefaults("Foo", true)

        assertEquals(42, result.firstInitField)
        assertEquals("Foo", result.firstFreeField)
        assertEquals(7.2f, result.secondInitField)
        assertEquals(true, result.secondFreeField)
        assertEquals("\\Jonny \"Magic\" Smith\n", result.thirdInitField)
    }

    @org.junit.Test
    fun testPositionalDefaultsOneInitArgCtor() {
        val result: StructWithKotlinPositionalDefaults =
            StructWithKotlinPositionalDefaults("Foo", true, -17)

        assertEquals(-17, result.firstInitField)
        assertEquals("Foo", result.firstFreeField)
        assertEquals(7.2f, result.secondInitField)
        assertEquals(true, result.secondFreeField)
        assertEquals("\\Jonny \"Magic\" Smith\n", result.thirdInitField)
    }

    @org.junit.Test
    fun testPositionalDefaultsTwoInitArgsCtor() {
        val result: StructWithKotlinPositionalDefaults =
            StructWithKotlinPositionalDefaults("Foo", true, -17, 3.14f)

        assertEquals(-17, result.firstInitField)
        assertEquals("Foo", result.firstFreeField)
        assertEquals(3.14f, result.secondInitField)
        assertEquals(true, result.secondFreeField)
        assertEquals("\\Jonny \"Magic\" Smith\n", result.thirdInitField)
    }

    @org.junit.Test
    fun testPositionalDefaultsThreeInitArgsCtor() {
        val result: StructWithKotlinPositionalDefaults =
            StructWithKotlinPositionalDefaults("Foo", true, -17, 3.14f, "bar")

        assertEquals(-17, result.firstInitField)
        assertEquals("Foo", result.firstFreeField)
        assertEquals(3.14f, result.secondInitField)
        assertEquals(true, result.secondFreeField)
        assertEquals("bar", result.thirdInitField)
    }

    @org.junit.Test
    fun testConstantDefaults() {
        val result: ConstantDefaults = ConstantDefaults()

        assertEquals(42, result.field1.intField)
        assertEquals(-1, result.field2.intField)
    }

    @org.junit.Test
    fun checkPositionalEnumeratorDefaults() {
        val result: StructWithEnums = StructWithEnums()

        assertEquals(SomethingEnum.REALLY_FIRST, result.firstField)
        assertEquals(SomethingEnum.EXPLICIT, result.explicitField)
        assertEquals(SomethingEnum.LAST, result.lastField)
        assertEquals(SomethingEnum.REALLY_FIRST, StructWithEnums.FIRST_CONSTANT)
    }
}