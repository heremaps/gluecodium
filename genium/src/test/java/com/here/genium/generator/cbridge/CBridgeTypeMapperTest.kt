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

package com.here.genium.generator.cbridge

import com.here.genium.generator.cbridge.CBridgeNameRules.BASE_REF_NAME
import com.here.genium.generator.cpp.CppIncludeResolver
import com.here.genium.generator.cpp.CppLibraryIncludes
import com.here.genium.generator.cpp.CppNameResolver
import com.here.genium.model.cbridge.CBridgeIncludeResolver
import com.here.genium.model.cbridge.CType
import com.here.genium.model.common.Include
import com.here.genium.model.lime.LimeArray
import com.here.genium.model.lime.LimeBasicType.TypeId
import com.here.genium.model.lime.LimeBasicTypeRef
import com.here.genium.model.lime.LimeDirectTypeRef
import com.here.genium.model.lime.LimeEnumeration
import com.here.genium.model.lime.LimeMap
import com.here.genium.model.lime.LimeNamedElement
import com.here.genium.model.lime.LimePath
import com.here.genium.model.lime.LimePath.Companion.EMPTY_PATH
import com.here.genium.model.lime.LimeTypeDef
import com.here.genium.test.AssertHelpers.assertContains
import io.mockk.MockKAnnotations
import io.mockk.every
import io.mockk.impl.annotations.MockK
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class CBridgeTypeMapperTest {
    @MockK private lateinit var cppIncludeResolver: CppIncludeResolver
    @MockK private lateinit var cppNameResolver: CppNameResolver
    @MockK private lateinit var includeResolver: CBridgeIncludeResolver

    private lateinit var typeMapper: CBridgeTypeMapper

    @Before
    fun setUp() {
        MockKAnnotations.init(this, relaxed = true)

        typeMapper =
            CBridgeTypeMapper(cppIncludeResolver, cppNameResolver, includeResolver, "FooHash")
    }

    @Test
    fun mapTypeTypeDef() {
        val limeElement = LimeTypeDef(EMPTY_PATH, typeRef = LimeBasicTypeRef.FLOAT)

        val result = typeMapper.mapType(limeElement)

        assertEquals(CType.FLOAT, result.cType)
    }

    @Test
    fun mapTypeTypeDefToMapType() {
        val limeMap = LimeMap(LimeBasicTypeRef(TypeId.STRING), LimeBasicTypeRef.DOUBLE)
        val limeElement = LimeTypeDef(EMPTY_PATH, typeRef = LimeDirectTypeRef(limeMap))
        every { cppNameResolver.getFullyQualifiedName(limeElement) } returns "bar.Baz"

        val result = typeMapper.mapType(limeElement)

        assertEquals("bar.Baz", result.name)
        assertEquals(BASE_REF_NAME, result.cType.name)
        assertEquals(BASE_REF_NAME, result.functionReturnType.name)
        assertEquals(2, result.includes.size)
        assertEquals(CBridgeNameRules.BASE_HANDLE_IMPL_FILE, result.includes.first().fileName)
        assertEquals(CppLibraryIncludes.MAP, result.includes.last())
        assertEquals("std::string", (result as CppMapTypeInfo).keyType.name)
        assertEquals("double", result.valueType.name)
        assertNull(result.enumHashType)
    }

    @Test
    fun mapTypeTypeDefToMapTypeWithEnum() {
        val limeEnum = LimeEnumeration(LimePath(emptyList(), listOf("bar")))
        val limeMap = LimeMap(LimeDirectTypeRef(limeEnum), LimeBasicTypeRef.DOUBLE)
        val limeElement = LimeTypeDef(EMPTY_PATH, typeRef = LimeDirectTypeRef(limeMap))
        every { cppNameResolver.getFullyQualifiedName(limeEnum) } returns "Baz"
        every { cppNameResolver.getFullyQualifiedName(limeElement) } returns ""

        val result = typeMapper.mapType(limeElement)

        assertEquals(3, result.includes.size)
        assertEquals(CppLibraryIncludes.ENUM_HASH, result.includes.last())
        assertEquals("Baz", (result as CppMapTypeInfo).keyType.name)
        assertEquals("double", result.valueType.name)
        assertEquals("FooHash", result.enumHashType)
    }

    @Test
    fun mapTypeArray() {
        val limeElement = LimeArray(LimeBasicTypeRef.FLOAT)

        val result = typeMapper.mapType(limeElement)

        assertEquals("std::vector<float>", result.name)
        assertEquals(BASE_REF_NAME, result.cType.name)
        assertEquals(BASE_REF_NAME, result.functionReturnType.name)
        assertEquals(2, result.includes.size)
        assertEquals(CBridgeNameRules.BASE_HANDLE_IMPL_FILE, result.includes.first().fileName)
        assertEquals(CppLibraryIncludes.VECTOR, result.includes.last())
        assertEquals(CType.FLOAT, (result as CppArrayTypeInfo).innerType.cType)
    }

    @Test
    fun createCustomTypeInfo() {
        val limeElement = object : LimeNamedElement(EMPTY_PATH) {}
        val barInclude = Include.createInternalInclude("Bar")
        val bazInclude = Include.createInternalInclude("Baz")
        every { cppNameResolver.getFullyQualifiedName(limeElement) } returns "Foo"
        every { includeResolver.resolveInclude(limeElement) } returns barInclude
        every { cppIncludeResolver.resolveIncludes(limeElement) } returns listOf(bazInclude)

        val result = typeMapper.createCustomTypeInfo(limeElement, CppTypeInfo.TypeCategory.STRUCT)

        assertEquals("Foo", result.name)
        assertEquals(BASE_REF_NAME, result.cType.name)
        assertEquals(barInclude, result.cType.includes.first())
        assertEquals(BASE_REF_NAME, result.functionReturnType.name)
        assertEquals(barInclude, result.functionReturnType.includes.first())
        assertEquals(CppTypeInfo.TypeCategory.STRUCT, result.typeCategory)
        assertContains(barInclude, result.includes)
        assertContains(bazInclude, result.includes)
        assertContains(CBridgeTypeMapper.BASE_HANDLE_IMPL_INCLUDE, result.includes)
        assertContains(CppLibraryIncludes.OPTIONAL, result.includes)
        assertContains(CppLibraryIncludes.MEMORY, result.includes)
        assertContains(CppLibraryIncludes.NEW, result.includes)
    }

    @Test
    fun createEnumTypeInfo() {
        val limeElement = LimeEnumeration(LimePath(emptyList(), listOf("foobar", "barbaz")))
        val barInclude = Include.createInternalInclude("Bar")
        val bazInclude = Include.createInternalInclude("Baz")
        every { cppNameResolver.getFullyQualifiedName(limeElement) } returns "nonsense"
        every { includeResolver.resolveInclude(limeElement) } returns barInclude
        every { cppIncludeResolver.resolveIncludes(limeElement) } returns listOf(bazInclude)

        val result = typeMapper.createEnumTypeInfo(limeElement)

        assertEquals("nonsense", result.name)
        assertEquals("Foobar_Barbaz", result.cType.name)
        assertEquals(barInclude, result.cType.includes.first())
        assertEquals("Foobar_Barbaz", result.functionReturnType.name)
        assertEquals(barInclude, result.functionReturnType.includes.first())
        assertEquals(CppTypeInfo.TypeCategory.ENUM, result.typeCategory)
        assertContains(barInclude, result.includes)
        assertContains(bazInclude, result.includes)
    }
}
