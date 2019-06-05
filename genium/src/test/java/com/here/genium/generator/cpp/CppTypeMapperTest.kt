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

package com.here.genium.generator.cpp

import com.here.genium.model.common.Include
import com.here.genium.model.cpp.CppComplexTypeRef
import com.here.genium.model.cpp.CppPrimitiveTypeRef
import com.here.genium.model.cpp.CppTemplateTypeRef
import com.here.genium.model.cpp.CppTypeDefRef
import com.here.genium.model.lime.LimeArray
import com.here.genium.model.lime.LimeAttributeType
import com.here.genium.model.lime.LimeAttributes
import com.here.genium.model.lime.LimeBasicType.TypeId
import com.here.genium.model.lime.LimeBasicTypeRef
import com.here.genium.model.lime.LimeContainer
import com.here.genium.model.lime.LimeDirectTypeRef
import com.here.genium.model.lime.LimeEnumeration
import com.here.genium.model.lime.LimeMap
import com.here.genium.model.lime.LimePath.Companion.EMPTY_PATH
import com.here.genium.model.lime.LimeSet
import com.here.genium.model.lime.LimeStruct
import com.here.genium.model.lime.LimeTypeDef
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
    @MockK private lateinit var includeResolver: CppIncludeResolver
    @MockK private lateinit var nameResolver: CppNameResolver

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
        val limeType = LimeTypeDef(EMPTY_PATH, typeRef = LimeBasicTypeRef.DOUBLE)
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
        assertEquals(typeMapper.enumHashType, result.hashType)
        assertTrue(result.refersToValueType)
    }

    @Test
    fun mapArrayRef() {
        val limeType = LimeArray(LimeBasicTypeRef.DOUBLE)
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
        assertEquals(CppTypeMapper.STRING_TYPE, result.templateParameters.first())
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
        assertEquals(
            typeMapper.enumHashType,
            (result as CppTemplateTypeRef).templateParameters.last()
        )
    }

    @Test
    fun mapInstanceRef() {
        val limeType = LimeContainer(EMPTY_PATH, type = LimeContainer.ContainerType.TYPE_COLLECTION)
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
        val limeType = LimeContainer(
            EMPTY_PATH,
            type = LimeContainer.ContainerType.TYPE_COLLECTION,
            attributes = LimeAttributes.Builder()
                .addAttribute(LimeAttributeType.EXTERNAL_TYPE)
                .build()
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
        assertEquals(
            typeMapper.enumHashType,
            (result as CppTemplateTypeRef).templateParameters.last()
        )
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
}
