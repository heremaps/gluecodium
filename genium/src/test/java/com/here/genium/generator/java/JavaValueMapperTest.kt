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

import com.here.genium.model.lime.LimeContainer
import com.here.genium.model.lime.LimeElement
import com.here.genium.model.lime.LimeEnumeration
import com.here.genium.model.lime.LimeEnumerator
import com.here.genium.model.lime.LimeEnumeratorRef
import com.here.genium.model.lime.LimePath
import com.here.genium.model.lime.LimeTypeRef
import com.here.genium.model.lime.LimeValue
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class JavaValueMapperTest {
    private val limeReferenceMap = mutableMapOf<String, LimeElement>()

    private val valueMapper = JavaValueMapper(limeReferenceMap)

    @Test
    fun mapEnumeratorInContainer() {
        limeReferenceMap["foo"] = LimeContainer(
            LimePath(emptyList(), listOf("foo")),
            type = LimeContainer.ContainerType.INTERFACE
        )
        limeReferenceMap["bar"] = LimeEnumeration(LimePath(emptyList(), listOf("foo", "bar")))
        limeReferenceMap["baz"] = LimeEnumerator(LimePath(emptyList(), listOf("baz")))
        val enumeratorRef = LimeTypeRef(limeReferenceMap, "bar")
        val valueRef = LimeEnumeratorRef(limeReferenceMap, "baz")
        val limeValue = LimeValue.Enumerator(enumeratorRef, valueRef)

        val result = valueMapper.mapValue(limeValue)

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
        val enumeratorRef = LimeTypeRef(limeReferenceMap, "bar")
        val valueRef = LimeEnumeratorRef(limeReferenceMap, "baz")
        val limeValue = LimeValue.Enumerator(enumeratorRef, valueRef)

        val result = valueMapper.mapValue(limeValue)

        assertTrue(result.isCustom)
        assertEquals("Bar.BAZ", result.name)
    }
}
