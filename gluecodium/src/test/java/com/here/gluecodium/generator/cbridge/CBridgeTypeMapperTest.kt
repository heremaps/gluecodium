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

package com.here.gluecodium.generator.cbridge

import com.here.gluecodium.generator.cbridge.CBridgeNameRules.BASE_REF_NAME
import com.here.gluecodium.generator.cpp.CppIncludeResolver
import com.here.gluecodium.generator.cpp.CppLibraryIncludes
import com.here.gluecodium.generator.cpp.CppNameResolver
import com.here.gluecodium.model.cbridge.CBridgeIncludeResolver
import com.here.gluecodium.model.cbridge.CType
import com.here.gluecodium.model.common.Include
import com.here.gluecodium.model.cpp.CppPrimitiveTypeRef
import com.here.gluecodium.model.cpp.CppTemplateTypeRef
import com.here.gluecodium.model.lime.LimeBasicType.TypeId
import com.here.gluecodium.model.lime.LimeBasicTypeRef
import com.here.gluecodium.model.lime.LimeDirectTypeRef
import com.here.gluecodium.model.lime.LimeEnumeration
import com.here.gluecodium.model.lime.LimeList
import com.here.gluecodium.model.lime.LimeMap
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimePath
import com.here.gluecodium.model.lime.LimePath.Companion.EMPTY_PATH
import com.here.gluecodium.model.lime.LimeSet
import com.here.gluecodium.model.lime.LimeTypeAlias
import com.here.gluecodium.test.AssertHelpers.assertContains
import io.mockk.MockKAnnotations
import io.mockk.every
import io.mockk.impl.annotations.MockK
import org.junit.Assert.assertEquals
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class CBridgeTypeMapperTest {
    @MockK private lateinit var cppIncludeResolver: CppIncludeResolver
    @MockK private lateinit var cppNameResolver: CppNameResolver
    @MockK private lateinit var includeResolver: CBridgeIncludeResolver

    private val cppTypeRef = CppPrimitiveTypeRef.VOID
    private val cppTemplateTypeRef =
        CppTemplateTypeRef(CppTemplateTypeRef.TemplateClass.MAP, emptyList(), cppTypeRef, cppTypeRef)

    private lateinit var typeMapper: CBridgeTypeMapper

    @Before
    fun setUp() {
        MockKAnnotations.init(this, relaxed = true)

        typeMapper =
            CBridgeTypeMapper(cppIncludeResolver, cppNameResolver, includeResolver, emptyList())
    }

    @Test
    fun mapTypeTypeDef() {
        val limeElement = LimeTypeAlias(EMPTY_PATH, typeRef = LimeBasicTypeRef.FLOAT)

        val result = typeMapper.mapType(LimeDirectTypeRef(limeElement), cppTypeRef)

        assertEquals(CType.FLOAT, result.cType)
    }

    @Test
    fun mapTypeTypeDefToMapType() {
        val limeMap = LimeMap(LimeBasicTypeRef(TypeId.STRING), LimeBasicTypeRef.DOUBLE)
        val limeElement = LimeTypeAlias(EMPTY_PATH, typeRef = LimeDirectTypeRef(limeMap))

        val result = typeMapper.mapType(LimeDirectTypeRef(limeElement), cppTemplateTypeRef)

        assertEquals("std::unordered_map<std::string, double>", result.name)
        assertEquals(BASE_REF_NAME, result.cType.name)
        assertEquals(BASE_REF_NAME, result.functionReturnType.name)
        assertEquals(2, result.includes.size)
        assertEquals(CBridgeNameRules.BASE_HANDLE_IMPL_FILE, result.includes.first().fileName)
        assertEquals(CppLibraryIncludes.MAP, result.includes.last())
        assertEquals("std::string", (result as CppMapTypeInfo).keyType.name)
        assertEquals("double", result.valueType.name)
    }

    @Test
    fun mapTypeTypeDefToMapTypeWithEnum() {
        val limeEnum = LimeEnumeration(LimePath(emptyList(), listOf("bar")))
        val limeMap = LimeMap(LimeDirectTypeRef(limeEnum), LimeBasicTypeRef.DOUBLE)
        val limeElement = LimeTypeAlias(EMPTY_PATH, typeRef = LimeDirectTypeRef(limeMap))
        every { cppNameResolver.getFullyQualifiedName(limeEnum) } returns "Baz"
        every { cppNameResolver.getFullyQualifiedName(limeElement) } returns ""

        val result = typeMapper.mapType(LimeDirectTypeRef(limeElement), cppTemplateTypeRef)

        assertEquals(2, result.includes.size)
        assertEquals("Baz", (result as CppMapTypeInfo).keyType.name)
        assertEquals("double", result.valueType.name)
    }

    @Test
    fun mapTypeTypeDefToSetType() {
        val limeSet = LimeSet(LimeBasicTypeRef.DOUBLE)
        val limeElement = LimeTypeAlias(EMPTY_PATH, typeRef = LimeDirectTypeRef(limeSet))

        val result = typeMapper.mapType(LimeDirectTypeRef(limeElement), cppTemplateTypeRef)

        assertEquals("std::unordered_set<double>", result.name)
        assertEquals(BASE_REF_NAME, result.cType.name)
        assertEquals(BASE_REF_NAME, result.functionReturnType.name)
        assertEquals(2, result.includes.size)
        assertEquals(CBridgeNameRules.BASE_HANDLE_IMPL_FILE, result.includes.first().fileName)
        assertEquals(CppLibraryIncludes.SET, result.includes.last())
        assertEquals("double", (result as CppSetTypeInfo).elementType.name)
    }

    @Test
    fun mapTypeArray() {
        val limeElement = LimeList(LimeBasicTypeRef.FLOAT)

        val result = typeMapper.mapType(LimeDirectTypeRef(limeElement), cppTemplateTypeRef)

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
        val fizzInclude = Include.createInternalInclude("Fizz")
        every { cppNameResolver.getFullyQualifiedName(limeElement) } returns "Foo"
        every { includeResolver.resolveInclude(limeElement) } returns barInclude
        every { cppIncludeResolver.resolveIncludes(limeElement) } returns listOf(bazInclude)
        every { cppIncludeResolver.optionalInclude } returns fizzInclude

        val result = typeMapper.createCustomTypeInfo(limeElement)

        assertEquals("Foo", result.name)
        assertEquals(BASE_REF_NAME, result.cType.name)
        assertEquals(barInclude, result.cType.includes.first())
        assertEquals(BASE_REF_NAME, result.functionReturnType.name)
        assertEquals(barInclude, result.functionReturnType.includes.first())
        assertContains(barInclude, result.includes)
        assertContains(bazInclude, result.includes)
        assertContains(CBridgeTypeMapper.BASE_HANDLE_IMPL_INCLUDE, result.includes)
        assertContains(fizzInclude, result.includes)
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
