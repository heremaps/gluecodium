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

import org.junit.Assert.assertArrayEquals
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Rule
import org.junit.Test
import org.junit.rules.TemporaryFolder
import org.junit.runner.RunWith
import org.mockito.ArgumentMatchers.anyString
import org.mockito.Mockito.times
import org.powermock.api.mockito.PowerMockito
import org.powermock.api.mockito.PowerMockito.`when`
import org.powermock.api.mockito.PowerMockito.verifyStatic
import org.powermock.core.classloader.annotations.PrepareForTest
import org.powermock.modules.junit4.PowerMockRunner
import java.io.File
import java.io.FileInputStream
import java.io.IOException
import java.io.ObjectInputStream
import java.nio.file.Paths

@RunWith(PowerMockRunner::class)
@PrepareForTest(HashValueCalculator::class)
class FileSetCacheTest {
    @Rule
    @JvmField
    var testFolder = TemporaryFolder()

    private lateinit var cache: FileSetCache
    private lateinit var cacheFile: File

    @Before
    fun setupFileSetCache() {
        PowerMockito.mockStatic(HashValueCalculator::class.java)

        cacheFile = File(testFolder.root, RELATIVE_CACHE_PATH)
        cache = FileSetCache(cacheFile)

        `when`(HashValueCalculator.calculateHashValue(anyString()))
            .thenAnswer { (it.arguments[0] as String).toByteArray() }
    }

    @Test
    fun createEmptyCache() =
        assertEquals(hashMapOf<String, CacheEntry>(), cache.cacheEntries)

    @Test
    @Throws(IOException::class, ClassNotFoundException::class)
    fun writeEmptyCache() {
        // Act
        cache.writeCache()

        // Assert
        assertTrue(cacheFile.exists())
        assertEquals(ObjectInputStream(FileInputStream(cacheFile)).readObject(), cache.cacheEntries)
    }

    @Test
    fun loadEmptyCache() {
        // Arrange
        cache.writeCache()

        // Act
        val loadedCache = FileSetCache(cacheFile)

        // Assert
        assertEquals(cache.cacheEntries, loadedCache.cacheEntries)
    }

    @Test
    fun updateEmptyCache() {
        // Act
        val result = cache.updateCache(TestFiles.INITIAL_FILES)

        // Assert
        assertTrue(cache.cacheEntries.entries.stream().allMatch { entry -> entry.value.touched })
        TestFiles.INITIAL_FILES.forEach {
            assertTrue(cache.cacheEntries.containsKey(it.targetFile.toPath().normalize().toString()))
            assertTrue(result.contains(it))
        }
        TestFiles.INITIAL_FILES.forEach {
            verifyStatic()
            HashValueCalculator.calculateHashValue(it.content)
        }
    }

    @Suppress("UNCHECKED_CAST")
    @Test
    @Throws(IOException::class, ClassNotFoundException::class)
    fun writeNonEmptyCache() {
        // Arrange
        cache.updateCache(TestFiles.INITIAL_FILES)

        // Act
        cache.writeCache()

        // Assert
        assertTrue(cacheFile.exists())
        val fileInput = FileInputStream(cacheFile)
        val objectInputStream = ObjectInputStream(fileInput)
        val fileDirectory = objectInputStream.readObject() as Map<String, CacheEntry>
        val cacheEntries = cache.cacheEntries

        assertEquals(cacheEntries.size.toLong(), fileDirectory.size.toLong())
        assertEquals(cacheEntries.keys, fileDirectory.keys)
        cacheEntries.keys.forEach {
            assertArrayEquals(
                cacheEntries[it]?.cachedFileHashValue,
                fileDirectory[it]?.cachedFileHashValue
            )
        }
    }

    @Test
    fun loadNonEmptyCache() {
        // Arrange
        cache.updateCache(TestFiles.INITIAL_FILES)
        cache.writeCache()

        // Act
        val loadedCache = FileSetCache(cacheFile)

        // Assert
        val loadedEntries = loadedCache.cacheEntries
        val cacheEntries = cache.cacheEntries

        assertEquals(cacheEntries.size.toLong(), loadedEntries.size.toLong())
        assertEquals(cacheEntries.keys, loadedEntries.keys)
        cacheEntries.keys.forEach {
            assertArrayEquals(
                cacheEntries[it]?.cachedFileHashValue,
                loadedEntries[it]?.cachedFileHashValue
            )
        }
        assertTrue(loadedEntries.entries.none { entry -> entry.value.touched })
    }

    @Test
    fun updateNonEmptyCache() {
        // Arrange
        cache.updateCache(TestFiles.INITIAL_FILES)
        cache.finalizeUpdates()

        // Act (changes: one file removed, one added, one changed, one unchanged)
        val result = cache.updateCache(TestFiles.UPDATED_FILES)

        // Assert
        assertEquals(4, cache.cacheEntries.size.toLong())

        // check that all files are in and have correct touched flag
        TestFiles.INITIAL_FILES.union(TestFiles.UPDATED_FILES)
            .map { it.targetFile.toPath().normalize().toString() }
            .forEach { path ->
                val value = cache.cacheEntries[path]
                assertNotNull(value)
                if (TestFiles.UPDATED_FILES.any { it.targetFile.toPath().normalize().toString() == path }) {
                    assertTrue(value?.touched ?: false)
                } else {
                    assertFalse(value?.touched ?: false)
                }
            }

        assertEquals(2, result.size.toLong())
        TestFiles.CHANGED_FILES.forEach { file ->
            assertTrue(result.any { it.targetFile == file.targetFile && it.content == file.content })
        }

        val contentsWithUsageCount = TestFiles.INITIAL_FILES.union(TestFiles.UPDATED_FILES)
            .asSequence()
            .map { it.content }
            .groupingBy { it }
            .eachCount()

        contentsWithUsageCount.forEach { (key, value) ->
            verifyStatic(times(value))
            HashValueCalculator.calculateHashValue(key)
        }
    }

    @Test
    fun finalizeUpdateTest() {
        // Arrange
        val first = CacheEntry(byteArrayOf(1, 2, 3))
        first.touched = false
        cache.cacheEntries["first"] = first
        val second = CacheEntry(byteArrayOf(1, 2, 3))
        second.touched = true
        cache.cacheEntries["second"] = second
        val third = CacheEntry(byteArrayOf(1, 2, 3))
        third.touched = true
        cache.cacheEntries["third"] = third

        // Act
        cache.finalizeUpdates()

        // Assert
        assertEquals(2, cache.cacheEntries.size)
        assertTrue(cache.cacheEntries.values.none { it.touched })
        assertEquals(second, cache.cacheEntries["second"])
        assertEquals(third, cache.cacheEntries["third"])
    }

    @Test
    fun predicateTest() {
        // Arrange
        cache.updateCache(TestFiles.UPDATED_FILES)

        // Act
        val checker = cache.filterOutCachedFiles()

        // Assert
        assertTrue(checker.test(Paths.get(TestFiles.PATH2)))
        assertTrue(checker.test(Paths.get(RELATIVE_CACHE_PATH)))
        assertFalse(checker.test(Paths.get(TestFiles.PATH3)))
        assertFalse(checker.test(Paths.get(TestFiles.PATH3)))
    }

    companion object {
        private const val RELATIVE_CACHE_PATH = "someDirectory/setA.txt"
    }
}
