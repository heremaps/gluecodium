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

package com.here.gluecodium.model.lime

import com.here.gluecodium.model.lime.LimePath.Companion.EMPTY_PATH
import org.junit.Assert.assertThrows
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class LimeAmbiguityResolverTest {
    private val fooPath = LimePath(listOf("foo"), emptyList())
    private val limeElement = object : LimeNamedElement(EMPTY_PATH) {}

    private val relativePath = mutableListOf("Bar")
    private val parentPaths = mutableListOf<LimePath>()
    private val imports = mutableListOf<LimePath>()
    private val referenceMap = mutableMapOf<String, LimeElement>("foo.Bar" to limeElement)

    private fun doResolve() {
        LimeAmbiguityResolver.resolve<LimeNamedElement>(
            relativePath,
            parentPaths,
            imports,
            referenceMap,
        )
    }

    @Test
    fun resolveWithNoPaths() {
        assertThrows(LimeModelLoaderException::class.java) {
            doResolve()
        }
    }

    @Test
    fun resolveWithParentPath() {
        parentPaths += fooPath

        doResolve()
    }

    @Test
    fun resolveWithImport() {
        imports += fooPath.child("Bar")

        doResolve()
    }

    @Test
    fun resolveWithRedundantImport() {
        parentPaths += fooPath
        imports += fooPath.child("Bar")

        doResolve()
    }

    @Test
    fun resolveWithParentPathEmptyMap() {
        referenceMap.clear()
        parentPaths += fooPath

        assertThrows(LimeModelLoaderException::class.java) {
            doResolve()
        }
    }

    @Test
    fun resolveWithImportEmptyMap() {
        referenceMap.clear()
        imports += fooPath.child("Bar")

        assertThrows(LimeModelLoaderException::class.java) {
            doResolve()
        }
    }

    @Test
    fun resolveWithAmbiguousImports() {
        imports += fooPath.child("Bar")
        imports += fooPath.child("Buzz").child("Bar")
        referenceMap["foo.Buzz.Bar"] = object : LimeType(EMPTY_PATH) {}

        assertThrows(LimeModelLoaderException::class.java) {
            doResolve()
        }
    }

    @Test
    fun resolveWithAmbiguousLocalObjects() {
        parentPaths += fooPath
        parentPaths += fooPath.child("Buzz")
        referenceMap["foo.Buzz.Bar"] = object : LimeNamedElement(EMPTY_PATH) {}

        assertThrows(LimeModelLoaderException::class.java) {
            doResolve()
        }
    }

    @Test
    fun resolveWithCombinedAmbiguity() {
        parentPaths += fooPath
        imports += fooPath.child("Buzz").child("Bar")
        referenceMap["foo.Buzz.Bar"] = object : LimeNamedElement(EMPTY_PATH) {}

        assertThrows(LimeModelLoaderException::class.java) {
            doResolve()
        }
    }
}
