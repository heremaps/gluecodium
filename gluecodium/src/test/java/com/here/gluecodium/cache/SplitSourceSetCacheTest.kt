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

package com.here.gluecodium.cache

import com.here.gluecodium.generator.common.GeneratedFile
import io.mockk.MockKAnnotations
import io.mockk.every
import io.mockk.impl.annotations.MockK
import io.mockk.mockkStatic
import io.mockk.slot
import io.mockk.unmockkAll
import io.mockk.verifyAll
import org.junit.After
import org.junit.Assert.assertEquals
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class SplitSourceSetCacheTest {

    val mainFile = GeneratedFile("I'm a main file", "main", GeneratedFile.SourceSet.MAIN)
    val commonFile = GeneratedFile("I'm a common file", "common", GeneratedFile.SourceSet.COMMON)

    @MockK
    lateinit var mainCache: CachingStrategy

    @MockK
    lateinit var commonCache: CachingStrategy

    @Before
    fun setUp() {
        MockKAnnotations.init(this, relaxed = true)
        mockkStatic(CachingStrategyCreator::class)

        every { CachingStrategyCreator.initializeCaching(any(), any(), any()) } returns mainCache

        var updatedMainFiles = slot<List<GeneratedFile>>()
        every { mainCache.updateCache(any(), capture(updatedMainFiles)) }.answers { updatedMainFiles.captured }

        var updatedCommonFiles = slot<List<GeneratedFile>>()
        every { commonCache.updateCache(any(), capture(updatedCommonFiles)) }.answers { updatedCommonFiles.captured }
    }

    @After
    fun tearDown() {
        unmockkAll()
    }

    @Test
    fun `same main and common output dir creates only main cache`() {
        SplitSourceSetCache("main", "main", true)

        verifyAll { CachingStrategyCreator.initializeCaching(true, "main", any()) }
    }

    @Test
    fun `two distinct pathes create two caches`() {
        SplitSourceSetCache("main", "common", true)

        verifyAll {
            CachingStrategyCreator.initializeCaching(true, "main", any())
            CachingStrategyCreator.initializeCaching(true, "common", any())
        }
    }

    @Test
    fun `nested common in main creates only main cache`() {
        SplitSourceSetCache("main", "main/common", true)

        verifyAll { CachingStrategyCreator.initializeCaching(true, "main", any()) }
    }

    @Test
    fun `nested main in common creates only common cache`() {
        SplitSourceSetCache("common/main", "common", true)

        verifyAll { CachingStrategyCreator.initializeCaching(true, "common", any()) }
    }

    @Test
    fun `not-nested common in main with same prefix creates two caches`() {
        SplitSourceSetCache("main", "maincommon", true)

        verifyAll {
            CachingStrategyCreator.initializeCaching(true, "main", any())
            CachingStrategyCreator.initializeCaching(true, "maincommon", any())
        }
    }

    @Test
    fun `update cache with one cache passes all source files`() {
        val cache = SplitSourceSetCache("main", "main", true)
        val generatedFiles = listOf(mainFile, commonFile)

        val returnedUpdatedFiles = cache.updateCache("Test", generatedFiles)

        assertEquals(returnedUpdatedFiles.toSet(), generatedFiles.toSet())
        verifyAll { mainCache.updateCache("Test", generatedFiles) }
    }

    @Test
    fun `update cache with two caches splits sources`() {
        every { CachingStrategyCreator.initializeCaching(any(), "main", any()) } returns mainCache
        every { CachingStrategyCreator.initializeCaching(any(), "common", any()) } returns commonCache

        val cache = SplitSourceSetCache("main", "common", true)
        val generatedFiles = listOf(mainFile, commonFile)

        val returnedUpdatedFiles = cache.updateCache("Test", generatedFiles)

        assertEquals(returnedUpdatedFiles.toSet(), generatedFiles.toSet())
        verifyAll { mainCache.updateCache("Test", listOf(mainFile)) }
        verifyAll { commonCache.updateCache("Test", listOf(commonFile)) }
    }
}
