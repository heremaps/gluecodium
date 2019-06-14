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
import com.here.genium.model.java.JavaTemplateType
import com.here.genium.model.java.JavaType
import com.here.genium.model.lime.LimeBasicType
import com.here.genium.model.lime.LimeBasicTypeRef
import com.here.genium.model.lime.LimeContainer
import com.here.genium.model.lime.LimeElement
import com.here.genium.model.lime.LimeEnumeration
import com.here.genium.model.lime.LimeEnumerator
import com.here.genium.model.lime.LimeEnumeratorRef
import com.here.genium.model.lime.LimePath
import com.here.genium.model.lime.LimeLazyTypeRef
import com.here.genium.model.lime.LimeTypeDef
import com.here.genium.model.lime.LimeValue
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class JavaValueMapperTest {
    private val limeReferenceMap = mutableMapOf<String, LimeElement>()
    private val javaType = object : JavaType("") {}

    private val nameRuleSet = nameRuleSetFromConfig(Genium.testOptions().javaNameRules)
    private val valueMapper = JavaValueMapper(limeReferenceMap, JavaNameRules(nameRuleSet))

    @Test
    fun mapEnumeratorInContainer() {
        limeReferenceMap["foo"] = LimeContainer(
            LimePath(emptyList(), listOf("foo")),
            type = LimeContainer.ContainerType.INTERFACE
        )
        limeReferenceMap["bar"] = LimeEnumeration(LimePath(emptyList(), listOf("foo", "bar")))
        limeReferenceMap["baz"] = LimeEnumerator(LimePath(emptyList(), listOf("baz")))
        val enumeratorRef = LimeLazyTypeRef("bar", limeReferenceMap)
        val valueRef = LimeEnumeratorRef(limeReferenceMap, "baz")
        val limeValue = LimeValue.Enumerator(enumeratorRef, valueRef)

        val result = valueMapper.mapValue(limeValue, javaType)

        assertTrue(result.isCustom)
        assertEquals("Foo.Bar.BAZ", result.name)
    }

    @Test
    fun mapTypeDefToEnumerator() {
        limeReferenceMap["foo"] = LimeContainer(
            LimePath(emptyList(), listOf("foo")),
            type = LimeContainer.ContainerType.INTERFACE
        )
        limeReferenceMap["bar"] = LimeEnumeration(LimePath(emptyList(), listOf("foo", "bar")))
        limeReferenceMap["baz"] = LimeEnumerator(LimePath(emptyList(), listOf("baz")))
        limeReferenceMap["barDef"] = LimeTypeDef(
            LimePath(emptyList(), listOf("foo", "barDef")),
            typeRef = LimeLazyTypeRef("bar", limeReferenceMap)
        )
        val enumeratorRef = LimeLazyTypeRef("barDef", limeReferenceMap)
        val valueRef = LimeEnumeratorRef(limeReferenceMap, "baz")
        val limeValue = LimeValue.Enumerator(enumeratorRef, valueRef)

        val result = valueMapper.mapValue(limeValue, javaType)

        assertTrue(result.isCustom)
        assertEquals("Foo.Bar.BAZ", result.name)
    }

    @Test
    fun mapEnumeratorInTypeCollection() {
        limeReferenceMap["foo"] = LimeContainer(
            LimePath(emptyList(), listOf("foo")),
            type = LimeContainer.ContainerType.TYPE_COLLECTION
        )
        limeReferenceMap["bar"] = LimeEnumeration(LimePath(emptyList(), listOf("foo", "bar")))
        limeReferenceMap["baz"] = LimeEnumerator(LimePath(emptyList(), listOf("baz")))
        val enumeratorRef = LimeLazyTypeRef("bar", limeReferenceMap)
        val valueRef = LimeEnumeratorRef(limeReferenceMap, "baz")
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
        assertEquals("ArrayList<>", result.name)
    }

    @Test
    fun mapEmptyMapValue() {
        val limeValue = LimeValue.InitializerList(LimeLazyTypeRef("", emptyMap()), emptyList())
        val javaTemplateType =
            JavaTemplateType.create(JavaTemplateType.TemplateClass.MAP, javaType, javaType)

        val result = valueMapper.mapValue(limeValue, javaTemplateType)

        assertTrue(result.isCustom)
        assertEquals("HashMap<>", result.name)
    }

    @Test
    fun mapEmptyStructValue() {
        val limeValue = LimeValue.InitializerList(LimeLazyTypeRef("", emptyMap()), emptyList())
        val javaCustomType = JavaCustomType("Foo")

        val result = valueMapper.mapValue(limeValue, javaCustomType)

        assertTrue(result.isCustom)
        assertEquals("Foo", result.name)
    }

    @Test
    fun mapTypedefToLongValue() {
        limeReferenceMap["foo"] = LimeTypeDef(
            LimePath(emptyList(), listOf("foo")),
            typeRef = LimeBasicTypeRef(LimeBasicType.TypeId.INT64)
        )
        val limeTypeRef = LimeLazyTypeRef("foo", limeReferenceMap)
        val limeValue = LimeValue.Literal(limeTypeRef, "1")
        val javaType = JavaPrimitiveType.LONG

        val result = valueMapper.mapValue(limeValue, javaType)

        assertEquals("1L", result.name)
    }
}
