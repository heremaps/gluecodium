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
class AttributesTest {
    private val deltaDouble = 0.00000001
    private val deltaFloat = 0.00000001f
    private val attributes: Attributes = Attributes()

    @org.junit.Test
    fun setGetBuiltInTypeAttribute() {
        attributes.builtInTypeAttribute = 42L
        assertEquals(42L, attributes.builtInTypeAttribute)
    }

    @org.junit.Test
    fun getReadonlyAttribute() {
        assertEquals(3.14f, attributes.readonlyAttribute, deltaFloat)
    }

    @org.junit.Test
    fun setGetStructAttribute() {
        val expectedStruct = Attributes.ExampleStruct(2.71, listOf())
        attributes.structAttribute = expectedStruct

        val result = attributes.structAttribute
        assertEquals(expectedStruct.value, result.value, deltaDouble)
        assertEquals(expectedStruct.intValue, result.intValue)
    }

    @org.junit.Test
    fun setGetStaticAttribute() {
        Attributes.setStaticAttribute("fooBar")
        assertEquals("fooBar", Attributes.getStaticAttribute())
    }

    @org.junit.Test
    fun getCachedProperty() {
        val instance: CachedProperties = CachedProperties()
        assertEquals(0, instance.callCount)

        val result1: List<String> = instance.cachedProperty
        val result2: List<String> = instance.cachedProperty

        assertEquals(1, instance.callCount)

        assertEquals(2, result1.size)
        assertEquals("foo", result1[0])
        assertEquals("bar", result1[1])

        assertEquals(result1, result2)
        assertTrue(result1 === result2)
    }

    @org.junit.Test
    fun getStaticCachedProperty() {
        assertEquals(0, CachedProperties.getStaticCallCount())

        val result1: ByteArray = CachedProperties.getStaticCachedProperty()
        val result2: ByteArray = CachedProperties.getStaticCachedProperty()
        val result3: ByteArray = CachedProperties.getStaticCachedProperty()

        assertEquals(1, CachedProperties.getStaticCallCount())

        assertEquals(3, result1.size)
        assertEquals(0, result1[0].toInt())
        assertEquals(1, result1[1].toInt())
        assertEquals(2, result1[2].toInt())

        assertEquals(result1, result2)
        assertTrue(result1 === result2)

        assertEquals(result1, result3)
        assertTrue(result1 === result3)
    }
}