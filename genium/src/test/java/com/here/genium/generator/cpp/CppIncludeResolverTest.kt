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

import com.here.genium.model.lime.LimeAttributeType
import com.here.genium.model.lime.LimeAttributes
import com.here.genium.model.lime.LimeElement
import com.here.genium.model.lime.LimeNamedElement
import com.here.genium.model.lime.LimePath
import org.junit.Assert.assertEquals
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class CppIncludeResolverTest {
    private val limeRootPath = LimePath(listOf("mo", "del"), listOf("foo"))
    private val limeReferenceMap = mutableMapOf<String, LimeElement>()

    private var includeResolver = CppIncludeResolver(listOf("ro", "ot"), limeReferenceMap)

    @Test
    fun resolveRegularInclude() {
        val limeElement = object : LimeNamedElement(limeRootPath.child("bar")) {}

        val result = includeResolver.resolveIncludes(limeElement)

        assertEquals("ro/ot/mo/del/Foo.h", result.first().fileName)
    }

    @Test
    fun getOutputFilePathForContainer() {
        val limeElement = object : LimeNamedElement(limeRootPath) {}

        val result = includeResolver.resolveIncludes(limeElement)

        assertEquals("ro/ot/mo/del/Foo.h", result.first().fileName)
    }

    @Test
    fun resolveExternalType() {
        val limeAttributes = LimeAttributes.Builder()
            .addAttribute(LimeAttributeType.EXTERNAL_TYPE, "bar/Baz.h")
            .build()
        val limeElement = object : LimeNamedElement(limeRootPath, attributes = limeAttributes) {}

        val result = includeResolver.resolveIncludes(limeElement)

        assertEquals("bar/Baz.h", result.first().fileName)
    }

    @Test
    fun resolveExternalTypeMultipleIncludes() {
        val limeAttributes = LimeAttributes.Builder()
            .addAttribute(LimeAttributeType.EXTERNAL_TYPE, "bar/Baz.h, non/Sense.h")
            .build()
        val limeElement = object : LimeNamedElement(limeRootPath, attributes = limeAttributes) {}

        val result = includeResolver.resolveIncludes(limeElement)

        assertEquals(2, result.size)
        assertEquals("bar/Baz.h", result.first().fileName)
        assertEquals("non/Sense.h", result.last().fileName)
    }

    @Test
    fun resolveExternalParent() {
        val limeAttributes = LimeAttributes.Builder()
            .addAttribute(LimeAttributeType.EXTERNAL_TYPE, "bar/Baz.h")
            .build()
        val parentElement = object : LimeNamedElement(limeRootPath, attributes = limeAttributes) {}
        val limeElement = object : LimeNamedElement(limeRootPath.child("bar")) {}
        limeReferenceMap[parentElement.path.toString()] = parentElement

        val result = includeResolver.resolveIncludes(limeElement)

        assertEquals("bar/Baz.h", result.first().fileName)
    }
}
