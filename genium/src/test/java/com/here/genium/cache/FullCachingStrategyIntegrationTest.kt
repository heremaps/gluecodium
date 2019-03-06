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

package com.here.genium.cache

import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertTrue

import java.io.File
import java.io.FileInputStream
import java.io.IOException
import java.io.ObjectInputStream
import java.nio.file.Files
import java.nio.file.Paths
import java.util.HashMap
import org.junit.Before
import org.junit.Rule
import org.junit.Test
import org.junit.rules.TemporaryFolder
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class FullCachingStrategyIntegrationTest {
    @Rule
    @JvmField
    var testFolder = TemporaryFolder()

    private lateinit var buildFolderPath: String
    private lateinit var myStrategy: CachingStrategy

    @Before
    fun setupCachingStrategy() {
        // Arrange
        buildFolderPath = testFolder.root.toString() + File.separator + BUILD_FOLDER
        myStrategy = CachingStrategyCreator.initializeCaching(
            true, buildFolderPath,
            IntegrationTestFiles.MY_GENERATORS
        )

        assertTrue(myStrategy is FullCachingStrategy)
    }

    @Test
    fun writeEmptyCacheValid() {
        // Act
        myStrategy.write(true)

        // Assert
        IntegrationTestFiles.MY_GENERATORS.forEach { generatorName ->
            assertTrue(Files.isRegularFile(Paths.get(buildFolderPath, "/.cache/$generatorName")))
            val result =
                loadCacheFile(Paths.get(buildFolderPath, "/.cache/$generatorName").toFile())
            assertTrue(result?.isEmpty() ?: false)
        }
    }

    @Test
    fun writeEmptyCacheInvalid() {
        // Act
        myStrategy.write(false)

        // Assert
        IntegrationTestFiles.MY_GENERATORS.forEach { generatorName ->
            assertTrue(Files.isRegularFile(Paths.get(buildFolderPath, "/.cache/$generatorName")))
            val result =
                loadCacheFile(Paths.get(buildFolderPath, "/.cache/$generatorName").toFile())
            assertTrue(result?.isEmpty() ?: false)
        }
    }

    @Test
    fun updateEmptyCache() {
        IntegrationTestFiles.FIRST_RUN.forEach { entry ->
            // Act
            val result = myStrategy.updateCache(entry.name, entry.inputFiles)

            // Assert
            assertEquals(entry.outputFiles.size.toLong(), result.size.toLong())
            assertTrue(result.containsAll(entry.outputFiles))
        }
    }

    @Test
    fun updateNonEmptyCache() {
        // Arrange
        IntegrationTestFiles.FIRST_RUN.forEach { myStrategy.updateCache(it.name, it.inputFiles) }
        myStrategy.write(true)

        // Act, assert
        IntegrationTestFiles.SECOND_RUN.forEach {
            val result = myStrategy.updateCache(it.name, it.inputFiles)

            assertEquals(result.size.toLong(), it.outputFiles.size.toLong())
            assertTrue(result.containsAll(it.outputFiles))
        }
        myStrategy.write(true)

        IntegrationTestFiles.THIRD_RUN.forEach {
            val result = myStrategy.updateCache(it.name, it.inputFiles)

            assertEquals(result.size.toLong(), it.outputFiles.size.toLong())
            assertTrue(result.containsAll(it.outputFiles))
        }
    }

    @Test
    fun writeNonEmptyCache() {
        // Arrange
        IntegrationTestFiles.FIRST_RUN.forEach { myStrategy.updateCache(it.name, it.inputFiles) }

        // Act
        myStrategy.write(true)

        // Assert
        IntegrationTestFiles.FIRST_RUN.forEach { iter ->
            val result = loadCacheFile(Paths.get(buildFolderPath, "/.cache/" + iter.name).toFile())

            // check that we have entries for all files
            assertNotNull(result)
            assertEquals(result?.size?.toLong(), iter.inputFiles.size.toLong())

            iter.inputFiles.all { result!!.containsKey(it.targetFile.path) }
        }
    }

    @Test
    fun writeNonEmptyCacheInvalid() {
        // Arrange
        IntegrationTestFiles.FIRST_RUN.forEach { myStrategy.updateCache(it.name, it.inputFiles) }

        // Act
        myStrategy.write(false)

        // Assert
        IntegrationTestFiles.FIRST_RUN.forEach {
            val result =
                loadCacheFile(Paths.get(buildFolderPath, "/.cache/" + it.name).toFile())

            assertNotNull(result)
            assertTrue(result!!.isEmpty())
        }
    }

    companion object {
        private const val BUILD_FOLDER = "buildFolder"

        @Suppress("UNCHECKED_CAST")
        private fun loadCacheFile(cacheFile: File): Map<String, CacheEntry>? = try {
            val fileInputStream = FileInputStream(cacheFile)
            val objectInputStream = ObjectInputStream(fileInputStream)
            objectInputStream.readObject() as HashMap<String, CacheEntry>
        } catch (e: IOException) {
            null
        } catch (e: ClassNotFoundException) {
            null
        }
    }
}
