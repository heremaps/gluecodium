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

package com.here.genium.generator.java

import com.here.genium.Genium
import com.here.genium.generator.common.nameRuleSetFromConfig
import com.here.genium.model.java.JavaCustomType
import com.here.genium.model.java.JavaEnumType
import com.here.genium.model.java.JavaPackage
import com.here.genium.model.java.JavaPrimitiveType
import com.here.genium.model.java.JavaReferenceType
import com.here.genium.model.java.JavaTemplateType
import com.here.genium.model.java.JavaType
import com.here.genium.model.lime.LimeArray
import com.here.genium.model.lime.LimeBasicType
import com.here.genium.model.lime.LimeBasicTypeRef
import com.here.genium.model.lime.LimeContainer
import com.here.genium.model.lime.LimeDirectTypeRef
import com.here.genium.model.lime.LimeElement
import com.here.genium.model.lime.LimeEnumeration
import com.here.genium.model.lime.LimeException
import com.here.genium.model.lime.LimeLazyTypeRef
import com.here.genium.model.lime.LimeMap
import com.here.genium.model.lime.LimePath
import com.here.genium.model.lime.LimeSet
import com.here.genium.model.lime.LimeStruct
import com.here.genium.model.lime.LimeThrownType
import com.here.genium.model.lime.LimeTypeDef
import com.here.genium.test.AssertHelpers.assertContains
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class JavaTypeMapperTest {
    private val limeReferenceMap = mutableMapOf<String, LimeElement>()
    private val limeTypeRef = LimeLazyTypeRef("foo", limeReferenceMap)

    private val nonNullAnnotation = object : JavaType("Foo") {}
    private val nullableAnnotation = object : JavaType("Bar") {}
    private val nameRuleSet = nameRuleSetFromConfig(Genium.testOptions().javaNameRules)
    private val nameRules = JavaNameRules(nameRuleSet)

    private val typeMapper = JavaTypeMapper(
        limeReferenceMap,
        JavaPackage.DEFAULT,
        JavaPackage(listOf("foo", "bar", "baz")),
        serializationBase = null,
        nonNullAnnotation = nonNullAnnotation,
        nullableAnnotation = nullableAnnotation,
        nameRules = nameRules
    )

    @Test
    fun mapNullabilityAnnotationsNone() {
        val javaType = object : JavaType("") {}

        val result = typeMapper.applyNullability(javaType, false)

        assertEquals(javaType, result)
    }

    @Test
    fun mapNullabilityAnnotationsNullable() {
        val javaType = object : JavaType("") {}

        val result = typeMapper.applyNullability(javaType, true)

        assertEquals(javaType, result)
        assertContains(nullableAnnotation, result.annotations)
    }

    @Test
    fun mapNullabilityAnnotationsPrimitiveNullable() {
        val javaType = JavaPrimitiveType.BOOL

        val result = typeMapper.applyNullability(javaType, true)

        assertTrue(result is JavaReferenceType)
        assertEquals(JavaReferenceType.Type.BOOL, (result as JavaReferenceType).type)
        assertContains(nullableAnnotation, result.annotations)
    }

    @Test
    fun mapNullabilityWithoutAnnotationsPrimitiveNullable() {
        val typeMapper = JavaTypeMapper(
            limeReferenceMap,
            JavaPackage.DEFAULT,
            JavaPackage(listOf("foo", "bar", "baz")),
            serializationBase = null,
            nonNullAnnotation = null,
            nullableAnnotation = null,
            nameRules = nameRules
        )
        val javaType = JavaPrimitiveType.BOOL

        val result = typeMapper.applyNullability(javaType, true)

        assertTrue(result is JavaReferenceType)
        assertEquals(JavaReferenceType.Type.BOOL, (result as JavaReferenceType).type)
    }

    @Test
    fun mapNullabilityAnnotationsNotNull() {
        val javaType = JavaCustomType("", JavaPackage.DEFAULT)

        val result = typeMapper.applyNullability(javaType, false)

        assertEquals(javaType, result)
        assertContains(nonNullAnnotation, result.annotations)
    }

    @Test
    fun mapTypeTypeDef() {
        limeReferenceMap["foo"] = LimeTypeDef(LimePath.EMPTY_PATH, typeRef = LimeBasicTypeRef.FLOAT)

        val result = typeMapper.mapType(limeTypeRef)

        assertEquals(JavaPrimitiveType.FLOAT, result)
    }

    @Test
    fun mapTypeArray() {
        limeReferenceMap["foo"] = LimeArray(LimeBasicTypeRef.FLOAT)

        val result = typeMapper.mapType(limeTypeRef)

        assertEquals("List<Float>", result.name)
    }

    @Test
    fun mapTypeMap() {
        limeReferenceMap["foo"] =
            LimeMap(LimeBasicTypeRef(LimeBasicType.TypeId.STRING), LimeBasicTypeRef.FLOAT)

        val result = typeMapper.mapType(limeTypeRef)

        assertEquals("Map<String, Float>", result.name)
    }

    @Test
    fun mapTypeSet() {
        limeReferenceMap["foo"] = LimeSet(LimeBasicTypeRef.FLOAT)

        val result = typeMapper.mapType(limeTypeRef)

        assertEquals("Set<Float>", result.name)
        assertEquals("HashSet<>", (result as JavaTemplateType).implementationType.name)
    }

    @Test
    fun mapTypeEnumSet() {
        val limeEnumeration = LimeEnumeration(LimePath(emptyList(), listOf("bar", "baz")))
        limeReferenceMap["foo"] = LimeSet(LimeDirectTypeRef(limeEnumeration))
        limeReferenceMap["bar"] = LimeContainer(
            LimePath.EMPTY_PATH,
            type = LimeContainer.ContainerType.TYPE_COLLECTION
        )

        val result = typeMapper.mapType(limeTypeRef)

        assertEquals("Set<Baz>", result.name)
        assertEquals("EnumSet<>", (result as JavaTemplateType).implementationType.name)
    }

    @Test
    fun mapTypeContainer() {
        limeReferenceMap["foo"] = LimeContainer(
            LimePath(listOf("bar"), listOf("baz")),
            type = LimeContainer.ContainerType.INTERFACE
        )

        val result = typeMapper.mapType(limeTypeRef)

        assertTrue(result is JavaCustomType)
        assertEquals("Baz", result.name)
        assertEquals(listOf("com", "example", "bar"), (result as JavaCustomType).packageNames)
        assertEquals("Baz", result.imports.first().className)
        assertEquals(
            listOf("com", "example", "bar"),
            result.imports.first().javaPackage.packageNames
        )
        assertTrue(result.isInterface)
    }

    @Test
    fun mapCustomTypeContainer() {
        val limeType = LimeContainer(
            LimePath(listOf("bar"), emptyList()),
            type = LimeContainer.ContainerType.TYPE_COLLECTION
        )

        val result = typeMapper.mapCustomType(limeType, "Foo")

        assertTrue(result is JavaCustomType)
        assertEquals("Foo", result.name)
        assertEquals(listOf("com", "example", "bar"), (result as JavaCustomType).packageNames)
        assertEquals("Foo", result.imports.first().className)
        assertEquals(
            listOf("com", "example", "bar"),
            result.imports.first().javaPackage.packageNames
        )
    }

    @Test
    fun mapCustomTypeStructInTypeCollection() {
        limeReferenceMap["foo"] = LimeContainer(
            LimePath(listOf("baz"), emptyList()),
            type = LimeContainer.ContainerType.TYPE_COLLECTION
        )
        val limeType = LimeStruct(LimePath(emptyList(), listOf("foo", "bar")))

        val result = typeMapper.mapCustomType(limeType, "SomeType")

        assertTrue(result is JavaCustomType)
        assertEquals("SomeType", result.name)
        assertEquals(listOf("com", "example", "baz"), (result as JavaCustomType).packageNames)
        assertEquals("SomeType", result.imports.first().className)
        assertEquals(
            listOf("com", "example", "baz"),
            result.imports.first().javaPackage.packageNames
        )
    }

    @Test
    fun mapCustomTypeEnumInTypeCollection() {
        limeReferenceMap["foo"] = LimeContainer(
            LimePath(listOf("baz"), emptyList()),
            type = LimeContainer.ContainerType.TYPE_COLLECTION
        )
        val limeType = LimeEnumeration(LimePath(emptyList(), listOf("foo", "bar")))

        val result = typeMapper.mapCustomType(limeType, "SomeType")

        assertTrue(result is JavaEnumType)
    }

    @Test
    fun mapCustomTypeInInterface() {
        limeReferenceMap["foo"] = LimeContainer(
            LimePath(listOf("baz"), listOf("nonsense")),
            type = LimeContainer.ContainerType.INTERFACE
        )
        val limeType = LimeStruct(LimePath(emptyList(), listOf("foo", "bar")))

        val result = typeMapper.mapCustomType(limeType, "SomeType")

        assertTrue(result is JavaCustomType)
        assertEquals("Nonsense.SomeType", result.name)
        assertEquals(listOf("com", "example", "baz"), (result as JavaCustomType).packageNames)
        assertEquals("Nonsense", result.imports.first().className)
        assertEquals(
            listOf("com", "example", "baz"),
            result.imports.first().javaPackage.packageNames
        )
    }

    @Test
    fun mapExceptionTypeInTypeCollection() {
        limeReferenceMap["foo"] = LimeContainer(
            LimePath(listOf("baz"), emptyList()),
            type = LimeContainer.ContainerType.TYPE_COLLECTION
        )
        val limeEnum = LimeEnumeration(LimePath(emptyList(), listOf("foo", "bar")))
        val limeException = LimeException(LimePath.EMPTY_PATH, errorEnum = LimeDirectTypeRef(limeEnum))
        val limeType = LimeThrownType(LimeDirectTypeRef(limeException))

        val result = typeMapper.mapExceptionType(limeType)

        assertEquals("BarException", result.name)
        assertEquals(listOf("com", "example", "baz"), (result as JavaCustomType).packageNames)
        assertEquals("BarException", result.imports.first().className)
        assertEquals(
            listOf("com", "example", "baz"),
            result.imports.first().javaPackage.packageNames
        )
    }

    @Test
    fun mapExceptionTypeInInterface() {
        limeReferenceMap["foo"] = LimeContainer(
            LimePath(listOf("baz"), listOf("nonsense")),
            type = LimeContainer.ContainerType.INTERFACE
        )
        val limeEnum = LimeEnumeration(LimePath(emptyList(), listOf("foo", "bar")))
        val limeException = LimeException(LimePath.EMPTY_PATH, errorEnum = LimeDirectTypeRef(limeEnum))
        val limeType = LimeThrownType(LimeDirectTypeRef(limeException))

        val result = typeMapper.mapExceptionType(limeType)

        assertEquals("Nonsense.BarException", result.name)
        assertEquals(listOf("com", "example", "baz"), (result as JavaCustomType).packageNames)
        assertEquals("Nonsense", result.imports.first().className)
        assertEquals(
            listOf("com", "example", "baz"),
            result.imports.first().javaPackage.packageNames
        )
    }

    @Test
    fun mapNativeBase() {
        val result = typeMapper.nativeBase

        assertEquals("NativeBase", result.name)
        assertEquals(listOf("foo", "bar", "baz"), (result as JavaCustomType).packageNames)
        assertEquals(
            listOf("foo", "bar", "baz"),
            result.imports.first().javaPackage.packageNames
        )
    }
}
