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

package com.here.gluecodium

import com.here.gluecodium.Gluecodium.Options
import com.here.gluecodium.cache.CachingStrategy
import com.here.gluecodium.cache.CachingStrategyCreator
import com.here.gluecodium.generator.common.GeneratedFile
import com.here.gluecodium.generator.common.GeneratorSuite
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimeModelLoader
import com.here.gluecodium.output.FileOutput
import io.mockk.MockKAnnotations
import io.mockk.every
import io.mockk.impl.annotations.MockK
import io.mockk.mockkConstructor
import io.mockk.mockkObject
import io.mockk.mockkStatic
import io.mockk.spyk
import io.mockk.unmockkAll
import io.mockk.verify
import io.mockk.verifyOrder
import java.io.IOException
import java.nio.file.Files
import java.nio.file.Paths
import org.junit.After
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Rule
import org.junit.Test
import org.junit.rules.ExpectedException
import org.junit.rules.TemporaryFolder
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class GluecodiumTest {
    @MockK private lateinit var modelLoader: LimeModelLoader
    @MockK private lateinit var generator: GeneratorSuite
    @MockK private lateinit var cache: CachingStrategy

    @JvmField
    @Rule
    val expectedException: ExpectedException = ExpectedException.none()
    @JvmField
    @Rule
    val temporaryFolder = TemporaryFolder()

    @Before
    fun setUp() {
        MockKAnnotations.init(this, relaxed = true)
        mockkObject(GeneratorSuite.Companion)
        mockkStatic(CachingStrategyCreator::class)
        mockkConstructor(FileOutput::class)

        every { CachingStrategyCreator.initializeCaching(any(), any(), any()) } returns cache
        every { cache.updateCache(any(), any()) } returns emptyList()
        every { cache.write(true) } returns true
        every { cache.write(false) } returns false

        every { GeneratorSuite.instantiateByShortName(any(), any()) } returns generator

        every { modelLoader.loadModel(any(), any()) } returns LimeModel(emptyMap(), emptyList())
    }

    @After
    fun tearDown() {
        unmockkAll()
    }

    @Test
    fun failedInstantiationOfGenerator() {
        // Arrange
        every { GeneratorSuite.instantiateByShortName(any(), any()) } returns null
        val options = Options(
            idlSources = listOf(""),
            generators = setOf("invalidGenerator")
        )

        // Act, Assert
        assertFalse(createGluecodium(options).execute())
    }

    @Test
    fun fileNameCollisionsResolved() {
        // Arrange
        every { generator.generate(any()) } returns listOf(FILE, FILE, FILE)
        val options = Options(
            idlSources = listOf(""),
            generators = setOf(SHORT_NAME),
            isValidatingOnly = false
        )

        // Act, assert
        assertFalse(createGluecodium(options).execute())
    }

    @Test
    fun executeValidateOnly() {
        // Arrange
        val options = Options(
            idlSources = listOf(""),
            generators = setOf(SHORT_NAME),
            isValidatingOnly = true
        )

        // Act
        createGluecodium(options).execute()

        // Assert
        verify(exactly = 0) { generator.generate(any()) }
    }

    @Test
    fun useCachingInExecute() {
        // Arrange
        val options = Options(
            idlSources = listOf(""),
            outputDir = temporaryFolder.root.path,
            commonOutputDir = temporaryFolder.root.path,
            generators = setOf(SHORT_NAME),
            isEnableCaching = true
        )

        // Act
        createGluecodium(options).execute()

        // Verify
        verifyOrder {
            cache.updateCache(any(), any())
            cache.write(true)
        }
    }

    @Test
    @Throws(Exception::class)
    fun ableToOutputFile() {
        val options = Options(outputDir = OUTPUT_DIR, commonOutputDir = OUTPUT_DIR)

        val result = Gluecodium(options).output("", GENERATED_FILES)

        assertTrue(result)
        every { anyConstructed<FileOutput>().output(any<List<GeneratedFile>>()) }
        verify { cache.updateCache(any(), any()) }
    }

    @Test
    @Throws(IOException::class)
    fun failWhenUnableToOpenOutputDirectory() {
        every { anyConstructed<FileOutput>().output(GENERATED_FILES) } throws IOException()
        val options = Options(outputDir = "")

        val result = Gluecodium(options).output("", GENERATED_FILES)

        assertFalse(result)
    }

    @Test
    @Throws(IOException::class)
    fun mergeAndroidManifestsMergesTwoManifests() {
        // Arrange
        val basePath = Paths.get("src", "test", "resources", "android_manifests").toString()
        val baseManifestPath = Paths.get(basePath, "BaseAndroidManifest.xml").toString()
        val appendManifestPath = Paths.get(basePath, "AppendAndroidManifest.xml").toString()
        val mergedManifestPath = Paths.get(temporaryFolder.root.path, "MergedAndroidManifest.xml")
        val expectedMergedManifestPath = Paths.get(basePath, "ExpectedMergedAndroidManifest.xml")

        // Act
        val result = Gluecodium.mergeAndroidManifests(
            baseManifestPath, appendManifestPath, mergedManifestPath.toString()
        )

        // Assert
        assertTrue(result)
        val expectedMergedManifest = String(Files.readAllBytes(expectedMergedManifestPath))
        val actualMergedManifest = String(Files.readAllBytes(mergedManifestPath))
        assertEquals(expectedMergedManifest, actualMergedManifest)
    }

    @Test
    fun mergeAndroidManifestsReturnsFalseIfFirstFileDoesNotExist() {
        // Arrange
        val basePath = Paths.get("src", "test", "resources", "android_manifests").toString()
        val baseManifestPath = "INVALID_PATH"
        val appendManifestPath = Paths.get(basePath, "AppendAndroidManifest.xml").toString()
        val mergedManifestPath = Paths.get(temporaryFolder.root.path, "MergedAndroidManifest.xml")

        // Act
        val result = Gluecodium.mergeAndroidManifests(
            baseManifestPath, appendManifestPath, mergedManifestPath.toString()
        )

        // Assert
        assertFalse(result)
    }

    @Test
    fun mergeAndroidManifestsReturnsFalseIfSecondFileDoesNotExist() {
        // Arrange
        val basePath = Paths.get("src", "test", "resources", "android_manifests").toString()
        val baseManifestPath = Paths.get(basePath, "BaseAndroidManifest.xml").toString()
        val appendManifestPath = "INVALID_PATH"
        val mergedManifestPath = Paths.get(temporaryFolder.root.path, "MergedAndroidManifest.xml")

        // Act, assert
        assertFalse(
            Gluecodium.mergeAndroidManifests(
                baseManifestPath, appendManifestPath, mergedManifestPath.toString()
            )
        )
    }

    private fun createGluecodium(options: Options) = spyk(Gluecodium(options, modelLoader))

    companion object {
        private const val SHORT_NAME = "android"
        private const val FILE_NAME = "fileName"
        private const val OUTPUT_DIR = "someDir"
        private val FILE = GeneratedFile("", FILE_NAME)
        private val GENERATED_FILES = listOf(FILE)
    }
}
