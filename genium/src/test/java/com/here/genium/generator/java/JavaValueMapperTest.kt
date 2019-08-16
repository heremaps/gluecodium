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
import com.here.genium.model.java.JavaPrimitiveType
import com.here.genium.model.java.JavaReferenceType
import com.here.genium.model.java.JavaTemplateType
import com.here.genium.model.java.JavaType
import com.here.genium.model.lime.LimeBasicType
import com.here.genium.model.lime.LimeBasicTypeRef
import com.here.genium.model.lime.LimeElement
import com.here.genium.model.lime.LimeEnumeration
import com.here.genium.model.lime.LimeEnumerator
import com.here.genium.model.lime.LimeInterface
import com.here.genium.model.lime.LimeLazyEnumeratorRef
import com.here.genium.model.lime.LimeLazyTypeRef
import com.here.genium.model.lime.LimePath
import com.here.genium.model.lime.LimeTypeAlias
import com.here.genium.model.lime.LimeTypesCollection
import com.here.genium.model.lime.LimeValue
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
class JavaValueMapperTest {
    private val javaType = object : JavaType("") {}

    private val limeReferenceMap = mutableMapOf<String, LimeElement>()
    private val nameRuleSet = nameRuleSetFromConfig(Genium.testOptions().javaNameRules)
    @MockK private lateinit var typeMapper: JavaTypeMapper

    private lateinit var valueMapper: JavaValueMapper

    @Before
    fun setUp() {
        MockKAnnotations.init(this, relaxed = true)
        valueMapper = JavaValueMapper(limeReferenceMap, JavaNameRules(nameRuleSet), typeMapper)
    }

    @Test
    fun mapEnumeratorInContainer() {
        limeReferenceMap["foo"] = LimeInterface(LimePath(emptyList(), listOf("foo")))
        limeReferenceMap["bar"] = LimeEnumeration(LimePath(emptyList(), listOf("foo", "bar")))
        limeReferenceMap["baz"] = LimeEnumerator(LimePath(emptyList(), listOf("baz")))
        val enumeratorRef = LimeLazyTypeRef("bar", limeReferenceMap)
        val valueRef = LimeLazyEnumeratorRef(limeReferenceMap, "baz")
        val limeValue = LimeValue.Enumerator(enumeratorRef, valueRef)

        val result = valueMapper.mapValue(limeValue, javaType)

        assertTrue(result.isCustom)
        assertEquals("Foo.Bar.BAZ", result.name)
    }

    @Test
    fun mapTypeDefToEnumerator() {
        limeReferenceMap["foo"] = LimeInterface(LimePath(emptyList(), listOf("foo")))
        limeReferenceMap["bar"] = LimeEnumeration(LimePath(emptyList(), listOf("foo", "bar")))
        limeReferenceMap["baz"] = LimeEnumerator(LimePath(emptyList(), listOf("baz")))
        limeReferenceMap["barDef"] = LimeTypeAlias(
            LimePath(emptyList(), listOf("foo", "barDef")),
            typeRef = LimeLazyTypeRef("bar", limeReferenceMap)
        )
        val enumeratorRef = LimeLazyTypeRef("barDef", limeReferenceMap)
        val valueRef = LimeLazyEnumeratorRef(limeReferenceMap, "baz")
        val limeValue = LimeValue.Enumerator(enumeratorRef, valueRef)

        val result = valueMapper.mapValue(limeValue, javaType)

        assertTrue(result.isCustom)
        assertEquals("Foo.Bar.BAZ", result.name)
    }

    @Test
    fun mapEnumeratorInTypeCollection() {
        limeReferenceMap["foo"] = LimeTypesCollection(LimePath(emptyList(), listOf("foo")))
        limeReferenceMap["bar"] = LimeEnumeration(LimePath(emptyList(), listOf("foo", "bar")))
        limeReferenceMap["baz"] = LimeEnumerator(LimePath(emptyList(), listOf("baz")))
        val enumeratorRef = LimeLazyTypeRef("bar", limeReferenceMap)
        val valueRef = LimeLazyEnumeratorRef(limeReferenceMap, "baz")
        val limeValue = LimeValue.Enumerator(enumeratorRef, valueRef)

        val result = valueMapper.mapValue(limeValue, javaType)

        assertTrue(result.isCustom)
        assertEquals("Bar.BAZ", result.name)
    }

    @Test
    fun mapNullValue() {
        val limeValue = LimeValue.Null(LimeLazyTypeRef("", emptyMap()))

        val result = valueMapper.mapValue(limeValue, javaType)

        assertTrue(result.isCustom)
        assertEquals("null", result.name)
    }

    @Test
    fun mapEmptyListValue() {
        val limeValue = LimeValue.InitializerList(LimeLazyTypeRef("", emptyMap()), emptyList())
        val javaTemplateType =
            JavaTemplateType.create(JavaTemplateType.TemplateClass.LIST, javaType)

        val result = valueMapper.mapValue(limeValue, javaTemplateType)

        assertTrue(result.isCustom)
        assertEquals("new ArrayList<>()", result.name)
    }

    @Test
    fun mapEmptyMapValue() {
        val limeValue = LimeValue.InitializerList(LimeLazyTypeRef("", emptyMap()), emptyList())
        val javaTemplateType =
            JavaTemplateType.create(JavaTemplateType.TemplateClass.MAP, javaType, javaType)

        val result = valueMapper.mapValue(limeValue, javaTemplateType)

        assertTrue(result.isCustom)
        assertEquals("new HashMap<>()", result.name)
    }

    @Test
    fun mapEmptyStructValue() {
        val limeValue = LimeValue.InitializerList(LimeLazyTypeRef("", emptyMap()), emptyList())
        val javaCustomType = JavaCustomType("Foo")

        val result = valueMapper.mapValue(limeValue, javaCustomType)

        assertTrue(result.isCustom)
        assertEquals("new Foo()", result.name)
    }

    @Test
    fun mapTypedefToLongValue() {
        limeReferenceMap["foo"] = LimeTypeAlias(
            LimePath(emptyList(), listOf("foo")),
            typeRef = LimeBasicTypeRef(LimeBasicType.TypeId.INT64)
        )
        val limeTypeRef = LimeLazyTypeRef("foo", limeReferenceMap)
        val limeValue = LimeValue.Literal(limeTypeRef, "1")
        val javaType = JavaPrimitiveType.LONG

        val result = valueMapper.mapValue(limeValue, javaType)

        assertEquals("1L", result.name)
    }

    @Test
    fun mapEmptySetValue() {
        val limeValue = LimeValue.InitializerList(LimeLazyTypeRef("", emptyMap()), emptyList())
        val javaTemplateType =
            JavaTemplateType.create(JavaTemplateType.TemplateClass.SET, javaType)

        val result = valueMapper.mapValue(limeValue, javaTemplateType)

        assertTrue(result.isCustom)
        assertEquals("new HashSet<>()", result.name)
    }

    @Test
    fun mapStructInitializerValue() {
        val limeElement = LimeValue.InitializerList(
            LimeBasicTypeRef.DOUBLE,
            listOf(
                LimeValue.Null(LimeBasicTypeRef.DOUBLE),
                LimeValue.InitializerList(LimeBasicTypeRef.FLOAT, emptyList())
            )
        )
        val javaCustomType = JavaCustomType("Foo")
        every { typeMapper.mapType(any()) }.returnsMany(
            JavaPrimitiveType.DOUBLE,
            JavaReferenceType.boxPrimitiveType(JavaPrimitiveType.FLOAT)
        )

        val result = valueMapper.mapValue(limeElement, javaCustomType)

        assertTrue(result.isCustom)
        assertEquals("new Foo(null, new Float())", result.name)
    }
}
