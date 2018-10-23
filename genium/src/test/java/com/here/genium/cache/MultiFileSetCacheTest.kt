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

import com.here.genium.cli.GeniumExecutionException
import com.here.genium.generator.common.GeneratedFile
import org.junit.Assert.assertEquals
import org.junit.Before
import org.junit.Rule
import org.junit.Test
import org.junit.rules.ExpectedException
import org.junit.rules.TemporaryFolder
import org.junit.runner.RunWith
import org.mockito.ArgumentMatchers.any
import org.mockito.Mock
import org.mockito.Mockito.`when`
import org.mockito.Mockito.never
import org.mockito.Mockito.verify
import org.powermock.api.mockito.PowerMockito
import org.powermock.api.mockito.PowerMockito.verifyStatic
import org.powermock.core.classloader.annotations.PrepareForTest
import org.powermock.modules.junit4.PowerMockRunner
import java.io.File
import java.nio.file.Files
import java.nio.file.Path
import java.nio.file.Paths
import java.util.function.Predicate

@RunWith(PowerMockRunner::class)
@PrepareForTest(MultiFileSetCache::class) // Required for mocking of FileSetCache constructor call
class MultiFileSetCacheTest {
    @Rule
    @JvmField
    var testFolder = TemporaryFolder()

    @Rule
    private val expectedException = ExpectedException.none()
    private var cacheFileSetA: File? = null
    private var cacheFileSetB: File? = null

    @Mock
    private val cacheA: FileSetCache? = null
    @Mock
    private val cacheB: FileSetCache? = null

    private lateinit var rootDir: File
    private lateinit var multiCache: MultiFileSetCache

    @Before
    @Throws(Exception::class)
    fun setupFileSetCache() {
        rootDir = File(testFolder.root, ROOT_FOLDER_NAME)

        cacheFileSetA = File(rootDir.absolutePath, FILE_SET_A_PATH)
        cacheFileSetB = File(rootDir.absolutePath, FILE_SET_B_PATH)

        PowerMockito.whenNew(FileSetCache::class.java).withArguments(cacheFileSetA)
            .thenReturn(cacheA)
        PowerMockito.whenNew(FileSetCache::class.java).withArguments(cacheFileSetB)
            .thenReturn(cacheB)

        multiCache =
                MultiFileSetCache(rootDir.absolutePath, hashSetOf(FILE_SET_A_NAME, FILE_SET_B_NAME))
    }

    @Test
    fun retrieveExistingCacheFiles() {
        PowerMockito.mockStatic(Files::class.java)
        `when`(Files.isRegularFile(cacheFileSetA!!.toPath())).thenReturn(true)

        // Act
        val cacheFiles = MultiFileSetCache.retrieveExistingCacheFiles(
            rootDir.absolutePath,
            hashSetOf(FILE_SET_A_NAME, FILE_SET_B_NAME)
        )

        // Assert
        assertEquals(1, cacheFiles.size.toLong())
        assertEquals(cacheFileSetA!!.toPath(), cacheFiles[0])
        assertEquals(cacheFileSetA!!.toPath(), cacheFiles[0])
        verifyStatic()
        Files.isRegularFile(cacheFileSetB!!.toPath())
    }

    @Test
    fun updateCacheFileSetNotFound() {
        // Arrange, assert
        expectedException.expect(GeniumExecutionException::class.java)

        // Act
        multiCache.updateCache(FILE_SET_A_NAME + "_X", emptyList<GeneratedFile>())
    }

    @Test
    fun updateCacheFileSetFound() {
        // Act
        multiCache.updateCache(FILE_SET_A_NAME, emptyList<GeneratedFile>())

        // Assert
        verify<FileSetCache>(cacheA).updateCache(emptyList<GeneratedFile>())
        verify<FileSetCache>(cacheB, never()).updateCache(any<List<GeneratedFile>>())
    }

    @Test
    fun finalizeUpdates() {
        // Act
        multiCache.finalizeUpdates()

        // Assert
        verify<FileSetCache>(cacheA).finalizeUpdates()
        verify<FileSetCache>(cacheB).finalizeUpdates()
    }

    @Test
    @Throws(Exception::class)
    fun getNonCachedFiles() {
        // Arrange
        `when`<Predicate<Path>>(cacheA!!.filterOutCachedFiles())
            .thenReturn(Predicate {
                if (it.isAbsolute) {
                    throw GeniumExecutionException("this should never happen")
                }
                it != Paths.get(TestFiles.PATH3).normalize()
            })
        `when`<Predicate<Path>>(cacheB!!.filterOutCachedFiles())
            .thenReturn(Predicate {
                if (it.isAbsolute) {
                    throw GeniumExecutionException("this should never happen")
                }
                it != Paths.get(TestFiles.PATH4).normalize()
            })

        rootDir.mkdirs()

        File(rootDir.absolutePath, TestFiles.PATH3).createNewFile()
        File(rootDir.absolutePath, TestFiles.PATH4).createNewFile()
        File(rootDir.absolutePath, TestFiles.PATH_UNCACHED).createNewFile()

        // Act
        val result = multiCache.nonCachedFiles

        // Assert
        assertEquals(1, result.size.toLong())
        assertEquals(
            Paths.get(rootDir.absolutePath, TestFiles.PATH_UNCACHED).normalize(), result[0]
        )
        verify(cacheA).filterOutCachedFiles()
        verify(cacheB).filterOutCachedFiles()
    }

    companion object {
        private const val FILE_SET_A_NAME = "setA"
        private const val FILE_SET_A_PATH = ".cache/setA"
        private const val FILE_SET_B_NAME = "setB"
        private const val FILE_SET_B_PATH = ".cache/setB"
        private const val ROOT_FOLDER_NAME = "buildRoot"
    }
}
