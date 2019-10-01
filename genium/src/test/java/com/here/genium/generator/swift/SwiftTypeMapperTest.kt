/*
 * Copyright (C) 2016-2019 HERE Europe B.V.
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

package com.here.gluecodium.generator.swift

import com.here.gluecodium.model.lime.LimeBasicTypeRef
import com.here.gluecodium.model.lime.LimeEnumeration
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeList
import com.here.gluecodium.model.lime.LimePath
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeTypeAlias
import com.here.gluecodium.model.lime.LimeTypesCollection
import com.here.gluecodium.model.swift.SwiftArray
import com.here.gluecodium.model.swift.SwiftEnum
import com.here.gluecodium.model.swift.SwiftStruct
import com.here.gluecodium.model.swift.SwiftType
import io.mockk.MockKAnnotations
import io.mockk.every
import io.mockk.impl.annotations.MockK
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class SwiftTypeMapperTest {
    @MockK private lateinit var nameResolver: SwiftNameResolver

    private lateinit var typeMapper: SwiftTypeMapper

    @Before
    fun setUp() {
        MockKAnnotations.init(this, relaxed = true)

        typeMapper = SwiftTypeMapper(nameResolver)

        every { nameResolver.getFullName(any()) } returns "nonsense"
    }

    @Test
    fun mapTypeStruct() {
        val limeElement = LimeStruct(LimePath(emptyList(), listOf("foo", "bar")))

        val result = typeMapper.mapType(limeElement)

        assertTrue(result is SwiftStruct)
        assertEquals("nonsense", result.name)
        assertEquals("Foo_Bar", result.cPrefix)
    }

    @Test
    fun mapTypeEnumeration() {
        val limeElement = LimeEnumeration(LimePath(emptyList(), listOf("foo", "bar")))

        val result = typeMapper.mapType(limeElement)

        assertTrue(result is SwiftEnum)
        assertEquals("nonsense", result.name)
    }

    @Test
    fun mapTypeTypeDef() {
        val limeElement = LimeTypeAlias(
            LimePath(emptyList(), listOf("foo", "bar")),
            typeRef = LimeBasicTypeRef.FLOAT
        )

        val result = typeMapper.mapType(limeElement)

        assertEquals("nonsense", result.publicName)
    }

    @Test
    fun mapTypeContainer() {
        val limeElement = LimeTypesCollection(LimePath(emptyList(), listOf("foo", "bar")))

        val result = typeMapper.mapType(limeElement)

        assertTrue(result is SwiftStruct)
        assertEquals("nonsense", result.name)
        assertEquals("Foo", result.cPrefix)
    }

    @Test
    fun mapTypeContainerInterface() {
        val limeElement = LimeInterface(LimePath(emptyList(), listOf("foo", "bar")))

        val result = typeMapper.mapType(limeElement)

        assertTrue(result is SwiftStruct)
        assertEquals("nonsense", result.name)
        assertEquals("Foo", result.cPrefix)
        assertTrue((result as SwiftStruct).isInterface)
    }

    @Test
    fun mapTypeArray() {
        val limeElement = LimeList(LimeBasicTypeRef.FLOAT)

        val result = typeMapper.mapType(limeElement)

        assertTrue(result is SwiftArray)
        assertEquals("ArrayOf_Float", result.cPrefix)
        assertEquals(SwiftType.FLOAT, (result as SwiftArray).underlyingType)
    }
}
