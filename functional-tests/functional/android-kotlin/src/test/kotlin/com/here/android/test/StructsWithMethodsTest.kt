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
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

@RunWith(RobolectricTestRunner::class)
@Config(application = RobolectricApplication::class)
class StructsWithMethodsTest {
    val deltaDouble: Double = 0.0000000001

    @org.junit.Test
    fun vectorDistanceToSelf() {
        val vector: Vector = Vector(1.0, 2.0)
        val result: Double = vector.distanceTo(vector)

        assertEquals(0.0, result, deltaDouble)
    }

    @org.junit.Test
    fun vectorDistanceToOther() {
        val vector: Vector = Vector(1.0, 2.0)
        val otherVector: Vector = Vector(-3.0, -4.0)
        val result: Double = vector.distanceTo(otherVector)

        assertEquals(7.211, result, 0.001)
    }

    @org.junit.Test
    fun vectorAddSelf() {
        val vector: Vector = Vector(1.0, 2.0)
        val result: Vector = vector.add(vector)

        assertEquals(Vector(2.0, 4.0), result)
    }

    @org.junit.Test
    fun vectorAddOther() {
        val vector: Vector = Vector(1.0, 2.0)
        val otherVector: Vector = Vector(-3.0, -7.0)

        val result: Vector = vector.add(otherVector)

        assertEquals(Vector(-2.0, -5.0), result)
    }

    @org.junit.Test
    fun vectorValidatePasses() {
        val result: Boolean = Vector.validate(1.0, 2.0)
        assertTrue(result)
    }

    @org.junit.Test
    fun vectorValidateFails() {
        val result: Boolean = Vector.validate(1.0, Double.NaN)
        assertFalse(result)
    }

    @org.junit.Test
    fun vectorCopyConstructorDoesNotThrow() {
        val vector: Vector = Vector(1.0, 2.0)
        val copy = Vector(vector)

        assertEquals(vector, copy)
    }

    @org.junit.Test
    fun vectorCopyConstructorThrows() {
        val vector: Vector = Vector(1.0, Double.NaN)
        assertThrows(ValidationUtils.ValidationException::class.java) {
            @Suppress("UNUSED_VARIABLE")
            val copy = Vector(vector)
        }
    }

    @org.junit.Test
    fun vector3DistanceToSelf() {
        val vector = StructsWithMethodsInterface.Vector3(1.0, 2.0, 3.0)
        val result = vector.distanceTo(vector)

        assertEquals(0.0, result, deltaDouble)
    }

    @org.junit.Test
    fun vector3DistanceToOther() {
        val vector = StructsWithMethodsInterface.Vector3(1.0, 2.0, 3.0)
        val otherVector = StructsWithMethodsInterface.Vector3(-4.0, -5.0, 6.0)

        val result: Double = vector.distanceTo(otherVector)
        assertEquals(9.110, result, 0.001)
    }

    @org.junit.Test
    fun vector3AddSelf() {
        val vector = StructsWithMethodsInterface.Vector3(1.0, 2.0, 3.0)
        val result: StructsWithMethodsInterface.Vector3 = vector.add(vector)

        assertEquals(StructsWithMethodsInterface.Vector3(2.0, 4.0, 6.0), result)
    }

    @org.junit.Test
    fun vector3AddOther() {
        val vector = StructsWithMethodsInterface.Vector3(1.0, 2.0, 3.0)
        val otherVector = StructsWithMethodsInterface.Vector3(-4.0, -7.0, -10.0)
        val result: StructsWithMethodsInterface.Vector3 = vector.add(otherVector)

        assertEquals(StructsWithMethodsInterface.Vector3(-3.0, -5.0, -7.0), result)
    }

    @org.junit.Test
    fun vector3ValidatePasses() {
        val result: Boolean = StructsWithMethodsInterface.Vector3.validate(1.0, 2.0, 3.0)
        assertTrue(result)
    }

    @org.junit.Test
    fun vector3ValidateFails() {
        val result: Boolean = StructsWithMethodsInterface.Vector3.validate(1.0, Double.NaN, 3.0)
        assertFalse(result)
    }

    @org.junit.Test
    fun vector3CopyConstructorDoesNotThrow() {
        val vector = StructsWithMethodsInterface.Vector3(1.0, 2.0, 3.0)
        val copy = StructsWithMethodsInterface.Vector3(vector)

        assertEquals(vector, copy)
    }

    @org.junit.Test
    fun vector3CopyConstructorThrows() {
        val vector = StructsWithMethodsInterface.Vector3(1.0, Double.NaN, 3.0)
        assertThrows(ValidationUtils.ValidationException::class.java) {
            @Suppress("UNUSED_VARIABLE")
            val copy = StructsWithMethodsInterface.Vector3(vector)
        }
    }
}