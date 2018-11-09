/*
 * Copyright (C) 2016-2018 HERE Europe B.V.
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

package com.here.genium.cache

import com.here.genium.generator.common.GeneratedFile
import com.here.genium.output.FileRemove
import junit.framework.TestCase.assertEquals
import junit.framework.TestCase.assertFalse
import junit.framework.TestCase.assertTrue
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.mockito.ArgumentMatchers.any
import org.mockito.Mockito
import org.mockito.Mockito.`when`
import org.mockito.Mockito.mock
import org.mockito.Mockito.verify
import org.powermock.api.mockito.PowerMockito.whenNew
import org.powermock.core.classloader.annotations.PrepareForTest
import org.powermock.modules.junit4.PowerMockRunner
import java.io.File
import java.io.FileNotFoundException
import java.nio.file.Path

@RunWith(PowerMockRunner::class)
@PrepareForTest(FullCachingStrategy::class) // Required for mocking of FileRemove constructor call
class FullCachingStrategyTest {
    private var cache = mock(MultiFileSetCache::class.java)
    private var fileRemover = mock(FileRemove::class.java)
    private lateinit var cacheStrategy: FullCachingStrategy

    @Before
    @Throws(Exception::class)
    fun setupCachingStrategy() {
        `when`(cache.nonCachedFiles).thenReturn(listOf())
        `when`(fileRemover.removeFiles(listOf())).thenReturn(true)
        whenNew(FileRemove::class.java).withArguments(File(OUT_FOLDER)).thenReturn(fileRemover)

        cacheStrategy = FullCachingStrategy(cache, OUT_FOLDER)
    }

    @Test
    fun writeFolderInvalid() {
        // Act
        val result = cacheStrategy.write(false)

        // Assert
        assertFalse(result)
        Mockito.inOrder(cache).apply {
            verify(cache).clearCaches()
            verify(cache).writeCache()
        }
    }

    @Test
    @Throws(FileNotFoundException::class)
    fun writeFolderValid() {
        // Act
        val result = cacheStrategy.write(true)

        // Assert
        assertTrue(result)
        Mockito.inOrder(cache, fileRemover).apply {
            verify(cache).finalizeUpdates()
            verify(cache).writeCache()
            verify(cache).nonCachedFiles
            verify(fileRemover).removeFiles(listOf())
        }
    }

    @Test
    @Throws(FileNotFoundException::class)
    fun writeFolderValidRemovalReturnsFalse() {
        // Arrange
        `when`(fileRemover.removeFiles(any<List<Path>>())).thenReturn(false)

        // Act
        val result = cacheStrategy.write(true)

        // Assert
        assertFalse(result)
        Mockito.inOrder(cache, fileRemover).apply {
            verify(cache).finalizeUpdates()
            verify(cache).writeCache()
            verify(cache).nonCachedFiles
            verify(fileRemover).removeFiles(listOf())
        }
    }

    @Test
    fun updateCache() {
        // Arrange
        val fileList = listOf(GeneratedFile("content", "fileName"))

        // Act
        val result = cacheStrategy.updateCache("myGeneratorName", fileList)

        // Assert
        assertEquals(listOf<Any>(), result)
        verify(cache).updateCache("myGeneratorName", fileList)
    }

    companion object {
        private const val OUT_FOLDER = "outFolder"
    }
}
