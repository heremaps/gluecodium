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

package com.here.gluecodium.generator.cpp

import com.here.gluecodium.model.common.Include
import com.here.gluecodium.model.cpp.CppComplexTypeRef
import com.here.gluecodium.model.cpp.CppPrimitiveTypeRef
import com.here.gluecodium.model.cpp.CppTemplateTypeRef
import com.here.gluecodium.model.cpp.CppTypeDefRef
import com.here.gluecodium.model.lime.LimeBasicType.TypeId
import com.here.gluecodium.model.lime.LimeBasicTypeRef
import com.here.gluecodium.model.lime.LimeClass
import com.here.gluecodium.model.lime.LimeDirectTypeRef
import com.here.gluecodium.model.lime.LimeEnumeration
import com.here.gluecodium.model.lime.LimeExternalDescriptor
import com.here.gluecodium.model.lime.LimeExternalDescriptor.Companion.CPP_TAG
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeList
import com.here.gluecodium.model.lime.LimeMap
import com.here.gluecodium.model.lime.LimePath.Companion.EMPTY_PATH
import com.here.gluecodium.model.lime.LimeSet
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeTypeAlias
import io.mockk.MockKAnnotations
import io.mockk.every
import io.mockk.impl.annotations.MockK
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class CppTypeMapperTest {
    @MockK
    private lateinit var includeResolver: CppIncludeResolver
    @MockK
    private lateinit var nameResolver: CppNameResolver

    private lateinit var typeMapper: CppTypeMapper

    @Before
    fun setUp() {
        MockKAnnotations.init(this, relaxed = true)
        typeMapper = CppTypeMapper(nameResolver, includeResolver, emptyList())

        every { nameResolver.getFullyQualifiedName(any()) } returns "Foo"
        every {
            includeResolver.resolveIncludes(any())
        } returns listOf(Include.createInternalInclude("Bar"))
    }

    @Test
    fun mapTypeDefRef() {
        val limeType = LimeTypeAlias(EMPTY_PATH, typeRef = LimeBasicTypeRef.DOUBLE)
        val limeTypeRef = LimeDirectTypeRef(limeType)

        val result = typeMapper.mapType(limeTypeRef)

        assertTrue(result is CppTypeDefRef)
        assertEquals("Foo", result.fullyQualifiedName)
        assertEquals("Bar", result.includes.first().fileName)
    }

    @Test
    fun mapStructRef() {
        val limeType = LimeStruct(EMPTY_PATH)
        val limeTypeRef = LimeDirectTypeRef(limeType)

        val result = typeMapper.mapType(limeTypeRef)

        assertTrue(result is CppComplexTypeRef)
        assertEquals("Foo", result.fullyQualifiedName)
        assertEquals("Bar", result.includes.first().fileName)
    }

    @Test
    fun mapEnumRef() {
        val limeType = LimeEnumeration(EMPTY_PATH)
        val limeTypeRef = LimeDirectTypeRef(limeType)

        val result = typeMapper.mapType(limeTypeRef)

        assertTrue(result is CppComplexTypeRef)
        assertEquals("Foo", result.fullyQualifiedName)
        assertEquals("Bar", result.includes.first().fileName)
        assertTrue(result.refersToValueType)
    }

    @Test
    fun mapArrayRef() {
        val limeType = LimeList(LimeBasicTypeRef.DOUBLE)
        val limeTypeRef = LimeDirectTypeRef(limeType)

        val result = typeMapper.mapType(limeTypeRef)

        assertTrue(result is CppTemplateTypeRef)
        assertEquals(
            CppTemplateTypeRef.TemplateClass.VECTOR,
            (result as CppTemplateTypeRef).templateClass
        )
        assertEquals(CppPrimitiveTypeRef.DOUBLE, result.templateParameters.first())
    }

    @Test
    fun mapMapRef() {
        val limeType = LimeMap(LimeBasicTypeRef(TypeId.STRING), LimeBasicTypeRef.DOUBLE)
        val limeTypeRef = LimeDirectTypeRef(limeType)

        val result = typeMapper.mapType(limeTypeRef)

        assertTrue(result is CppTemplateTypeRef)
        assertEquals(
            CppTemplateTypeRef.TemplateClass.MAP,
            (result as CppTemplateTypeRef).templateClass
        )
        assertEquals("::std::string", result.templateParameters.first().name)
        assertEquals(CppPrimitiveTypeRef.DOUBLE, result.templateParameters.last())
    }

    @Test
    fun mapMapEnumRef() {
        val limeEnumType = LimeEnumeration(EMPTY_PATH)
        val limeEnumTypeRef = LimeDirectTypeRef(limeEnumType)
        val limeType = LimeMap(limeEnumTypeRef, LimeBasicTypeRef.DOUBLE)
        val limeTypeRef = LimeDirectTypeRef(limeType)

        val result = typeMapper.mapType(limeTypeRef)

        assertTrue(result is CppTemplateTypeRef)
    }

    @Test
    fun mapInstanceRef() {
        val limeType = LimeInterface(EMPTY_PATH)
        val limeTypeRef = LimeDirectTypeRef(limeType)

        val result = typeMapper.mapType(limeTypeRef)

        assertTrue(result is CppTemplateTypeRef)
        assertEquals(
            CppTemplateTypeRef.TemplateClass.SHARED_POINTER,
            (result as CppTemplateTypeRef).templateClass
        )

        val instanceType = result.templateParameters.first()
        assertTrue(instanceType is CppComplexTypeRef)
        assertEquals("Foo", instanceType.fullyQualifiedName)
        assertEquals("Bar", instanceType.includes.first().fileName)
        assertTrue((instanceType as CppComplexTypeRef).needsForwardDeclaration)
    }

    @Test
    fun mapExternalInstanceRef() {
        val limeType = LimeClass(
            EMPTY_PATH,
            external = LimeExternalDescriptor.Builder().addValue(CPP_TAG, "foobar", "").build()
        )
        val limeTypeRef = LimeDirectTypeRef(limeType)

        val result = typeMapper.mapType(limeTypeRef)

        val instanceType = (result as CppTemplateTypeRef).templateParameters.first()
        assertTrue(instanceType is CppComplexTypeRef)
        assertEquals("Foo", instanceType.fullyQualifiedName)
        assertEquals("Bar", instanceType.includes.first().fileName)
        assertFalse((instanceType as CppComplexTypeRef).needsForwardDeclaration)
    }

    @Test
    fun mapSetTypeRef() {
        val limeType = LimeSet(LimeBasicTypeRef.DOUBLE)
        val limeTypeRef = LimeDirectTypeRef(limeType)

        val result = typeMapper.mapType(limeTypeRef)

        assertTrue(result is CppTemplateTypeRef)
        assertEquals(
            CppTemplateTypeRef.TemplateClass.SET,
            (result as CppTemplateTypeRef).templateClass
        )
        assertEquals(CppPrimitiveTypeRef.DOUBLE, result.templateParameters.first())
    }

    @Test
    fun mapEnumSetRef() {
        val limeEnumType = LimeEnumeration(EMPTY_PATH)
        val limeEnumTypeRef = LimeDirectTypeRef(limeEnumType)
        val limeType = LimeSet(limeEnumTypeRef)
        val limeTypeRef = LimeDirectTypeRef(limeType)

        val result = typeMapper.mapType(limeTypeRef)

        assertTrue(result is CppTemplateTypeRef)
    }

    @Test
    fun mapOptionalType() {
        val limeTypeRef = LimeBasicTypeRef.DOUBLE.asNullable()

        val result = typeMapper.mapType(limeTypeRef)

        assertEquals(
            CppTemplateTypeRef.TemplateClass.OPTIONAL,
            (result as CppTemplateTypeRef).templateClass
        )
    }

    @Test
    fun `default hash in set is used for typedef to primitive type`() {
        val limeElementType = LimeTypeAlias(EMPTY_PATH, typeRef = LimeBasicTypeRef.DOUBLE)
        val limeElementTypeRef = LimeDirectTypeRef(limeElementType)
        val limeType = LimeSet(limeElementTypeRef)
        val limeTypeRef = LimeDirectTypeRef(limeType)

        val result = typeMapper.mapType(limeTypeRef)

        assertTrue(result is CppTemplateTypeRef)
        assertEquals(
            CppTemplateTypeRef.TemplateClass.SET,
            (result as CppTemplateTypeRef).templateClass
        )
        assertEquals("default hash for primitive types", 1, result.templateParameters.size)
        assertTrue(result.templateParameters.first() is CppTypeDefRef)
    }

    @Test
    fun `gluecodium hash in set is used for typedef to non-primitive type`() {
        val limeElementType = LimeStruct(EMPTY_PATH)
        val limeElementTypeRef = LimeDirectTypeRef(limeElementType)
        val limeType = LimeSet(limeElementTypeRef)
        val limeTypeRef = LimeDirectTypeRef(limeType)

        val result = typeMapper.mapType(limeTypeRef)

        assertTrue(result is CppTemplateTypeRef)
        assertEquals(
            CppTemplateTypeRef.TemplateClass.SET,
            (result as CppTemplateTypeRef).templateClass
        )
        assertEquals(
            "additional hash parameter for non-primitive types",
            2,
            result.templateParameters.size
        )
        assertTrue(result.templateParameters.last() is CppTemplateTypeRef)
        assertEquals(CppTemplateTypeRef.TemplateClass.HASH, (result.templateParameters.last() as CppTemplateTypeRef).templateClass)
    }

    @Test
    fun `default hash is used in map for typedef to primitive type`() {
        val limeKeyType = LimeTypeAlias(EMPTY_PATH, typeRef = LimeBasicTypeRef.DOUBLE)
        val limeKeyTypeRef = LimeDirectTypeRef(limeKeyType)
        val limeType = LimeMap(limeKeyTypeRef, LimeBasicTypeRef.INT)
        val limeTypeRef = LimeDirectTypeRef(limeType)

        val result = typeMapper.mapType(limeTypeRef)

        assertTrue(result is CppTemplateTypeRef)
        assertEquals(
            CppTemplateTypeRef.TemplateClass.MAP,
            (result as CppTemplateTypeRef).templateClass
        )
        assertEquals("default hash for primitive key types", 2, result.templateParameters.size)
        assertTrue(result.templateParameters.first() is CppTypeDefRef)
    }

    @Test
    fun `gluecodium hash is used in set for typedef to non-primitive type`() {
        val limeKeyType = LimeStruct(EMPTY_PATH)
        val limeKeyTypeRef = LimeDirectTypeRef(limeKeyType)
        val limeType = LimeMap(limeKeyTypeRef, LimeBasicTypeRef.INT)
        val limeTypeRef = LimeDirectTypeRef(limeType)

        val result = typeMapper.mapType(limeTypeRef)

        assertTrue(result is CppTemplateTypeRef)
        assertEquals(
            CppTemplateTypeRef.TemplateClass.MAP,
            (result as CppTemplateTypeRef).templateClass
        )
        assertEquals(
            "additional hash parameter for non-primitive types",
            3,
            result.templateParameters.size
        )
        assertTrue(result.templateParameters.last() is CppTemplateTypeRef)
        assertEquals(CppTemplateTypeRef.TemplateClass.HASH, (result.templateParameters.last() as CppTemplateTypeRef).templateClass)
    }
}
