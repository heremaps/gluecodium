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

import com.here.gluecodium.Gluecodium
import com.here.gluecodium.generator.common.nameRuleSetFromConfig
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeExternalDescriptor
import com.here.gluecodium.model.lime.LimeExternalDescriptor.Companion.CPP_TAG
import com.here.gluecodium.model.lime.LimeExternalDescriptor.Companion.INCLUDE_NAME
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimePath
import com.here.gluecodium.model.lime.LimeTypesCollection
import org.junit.Assert.assertEquals
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class CppIncludeResolverTest {
    private val limeRootPath = LimePath(listOf("mo", "del"), listOf("foo"))
    private val limeReferenceMap = mutableMapOf<String, LimeElement>()

    private val nameRuleSet = nameRuleSetFromConfig(Gluecodium.testOptions().cppNameRules)
    private val includeResolver = CppIncludeResolver(
        limeReferenceMap,
        CppNameRules(listOf("ro", "ot"), nameRuleSet),
        emptyList()
    )

    @Test
    fun resolveRegularInclude() {
        limeReferenceMap[limeRootPath.toString()] = LimeTypesCollection(limeRootPath)
        val limeElement = object : LimeNamedElement(limeRootPath.child("bar")) {}

        val result = includeResolver.resolveIncludes(limeElement)

        assertEquals("ro/ot/mo/del/Foo.h", result.first().fileName)
    }

    @Test
    fun getOutputFilePathForContainer() {
        val limeElement = LimeTypesCollection(limeRootPath)

        val result = includeResolver.resolveIncludes(limeElement)

        assertEquals("ro/ot/mo/del/Foo.h", result.first().fileName)
    }

    @Test
    fun resolveExternalType() {
        val externalDescriptor =
            LimeExternalDescriptor.Builder().addValue(CPP_TAG, INCLUDE_NAME, "bar/Baz.h").build()
        val limeElement = object : LimeNamedElement(limeRootPath, external = externalDescriptor) {}

        val result = includeResolver.resolveIncludes(limeElement)

        assertEquals("bar/Baz.h", result.first().fileName)
    }

    @Test
    fun resolveExternalTypeMultipleIncludes() {
        val externalDescriptor =
            LimeExternalDescriptor.Builder().addValue(CPP_TAG, INCLUDE_NAME, "bar/Baz.h, non/Sense.h").build()
        val limeElement = object : LimeNamedElement(limeRootPath, external = externalDescriptor) {}

        val result = includeResolver.resolveIncludes(limeElement)

        assertEquals(2, result.size)
        assertEquals("bar/Baz.h", result.first().fileName)
        assertEquals("non/Sense.h", result.last().fileName)
    }

    @Test
    fun resolveExternalParent() {
        val externalDescriptor =
            LimeExternalDescriptor.Builder().addValue(CPP_TAG, INCLUDE_NAME, "bar/Baz.h").build()
        val parentElement = object : LimeNamedElement(limeRootPath, external = externalDescriptor) {}
        val limeElement = object : LimeNamedElement(limeRootPath.child("bar")) {}
        limeReferenceMap[parentElement.path.toString()] = parentElement

        val result = includeResolver.resolveIncludes(limeElement)

        assertEquals("bar/Baz.h", result.first().fileName)
    }
}
