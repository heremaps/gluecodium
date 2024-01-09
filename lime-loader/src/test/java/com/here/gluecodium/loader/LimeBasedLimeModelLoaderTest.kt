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

package com.here.gluecodium.loader

import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimePath
import com.here.gluecodium.model.lime.LimeReferenceResolver
import io.mockk.MockKAnnotations
import io.mockk.every
import io.mockk.spyk
import io.mockk.verify
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class LimeBasedLimeModelLoaderTest {
    private val modelLoader = spyk(LimeBasedLimeModelLoader(), recordPrivateCalls = true)

    @Before
    fun setUp() {
        MockKAnnotations.init(this, relaxed = true)

        every {
            modelLoader["loadFile"](
                any<String>(),
                any<LimeReferenceResolver>(),
                any<MutableMap<String, List<LimePath>>>(),
            )
        } answers {
            listOf(object : LimeNamedElement(LimePath(listOf(firstArg()), emptyList())) {})
        }
    }

    @Test
    fun loadModelNoAuxSources() {
        val result = modelLoader.loadModel(listOf("foo.lime"), emptyList())

        assertEquals(1, result.topElements.size)
        assertTrue(result.topElements.first().fullName.endsWith("foo.lime"))
    }

    @Test
    fun loadModelWithAuxSources() {
        val result = modelLoader.loadModel(listOf("foo.lime"), listOf("bar.lime"))

        assertEquals(1, result.topElements.size)
        assertTrue(result.topElements.first().fullName.endsWith("foo.lime"))

        verify {
            modelLoader["loadFile"](
                match<String> { it.endsWith("bar.lime") },
                any<LimeReferenceResolver>(),
                any<MutableMap<String, List<LimePath>>>(),
            )
        }
    }

    @Test
    fun loadModelOnlyAuxSources() {
        val result = modelLoader.loadModel(emptyList(), listOf("bar.lime"))

        assertEquals(0, result.topElements.size)

        verify {
            modelLoader["loadFile"](
                match<String> { it.endsWith("bar.lime") },
                any<LimeReferenceResolver>(),
                any<MutableMap<String, List<LimePath>>>(),
            )
        }
    }

    @Test
    fun loadModelWithAuxSourcesOverlappingMainSources() {
        val result =
            modelLoader.loadModel(listOf("foo.lime", "buzz.lime"), listOf("bar.lime", "buzz.lime"))

        assertEquals(2, result.topElements.size)
        assertTrue(result.topElements.first().fullName.endsWith("foo.lime"))
        assertTrue(result.topElements.last().fullName.endsWith("buzz.lime"))

        verify {
            modelLoader["loadFile"](
                match<String> { it.endsWith("bar.lime") },
                any<LimeReferenceResolver>(),
                any<MutableMap<String, List<LimePath>>>(),
            )
        }
    }
}
