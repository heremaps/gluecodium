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

package com.here.genium

import com.here.genium.Genium.Options
import com.here.genium.cache.CachingStrategy
import com.here.genium.cache.CachingStrategyCreator
import com.here.genium.generator.common.GeneratedFile
import com.here.genium.loader.FrancaModelLoader
import com.here.genium.model.franca.FrancaDeploymentModel
import com.here.genium.output.ConsoleOutput
import com.here.genium.output.FileOutput
import com.here.genium.platform.common.GeneratorSuite
import com.here.genium.validator.FrancaResourcesValidator
import org.eclipse.emf.ecore.resource.ResourceSet
import org.franca.core.franca.FTypeCollection
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Rule
import org.junit.Test
import org.junit.rules.ExpectedException
import org.junit.rules.TemporaryFolder
import org.junit.runner.RunWith
import org.mockito.Answers
import org.mockito.ArgumentMatchers
import org.mockito.ArgumentMatchers.any
import org.mockito.ArgumentMatchers.anyBoolean
import org.mockito.Mock
import org.mockito.Mockito
import org.mockito.Mockito.`when`
import org.mockito.Mockito.doReturn
import org.mockito.Mockito.mock
import org.mockito.Mockito.never
import org.mockito.Mockito.spy
import org.mockito.Mockito.times
import org.mockito.Mockito.verify
import org.mockito.MockitoAnnotations
import org.powermock.api.mockito.PowerMockito
import org.powermock.core.classloader.annotations.PrepareForTest
import org.powermock.modules.junit4.PowerMockRunner
import java.io.ByteArrayOutputStream
import java.io.File
import java.io.IOException
import java.io.PrintStream
import java.nio.file.Files
import java.nio.file.Paths
import java.util.LinkedList

@RunWith(PowerMockRunner::class)
@PrepareForTest(
    GeneratorSuite::class,
    FrancaResourcesValidator::class,
    CachingStrategyCreator::class
)
class GeniumTest {
    @Mock
    private lateinit var generator: GeneratorSuite
    @Mock
    private lateinit var cache: CachingStrategy

    @Mock(answer = Answers.RETURNS_DEEP_STUBS)
    private lateinit var francaModelLoader: FrancaModelLoader

    @Rule
    val expectedException: ExpectedException = ExpectedException.none()
    @Rule
    val temporaryFolder = TemporaryFolder()

    @Before
    fun setUp() {
        MockitoAnnotations.initMocks(this)
        PowerMockito.mockStatic(
            GeneratorSuite::class.java,
            FrancaResourcesValidator::class.java,
            CachingStrategyCreator::class.java
        )

        `when`(CachingStrategyCreator.initializeCaching(anyBoolean(), any(), any())).thenReturn(
            cache
        )
        Mockito.`when`(cache.updateCache(any(), any())).thenReturn(LinkedList())
        Mockito.`when`(cache.write(true)).thenReturn(true)
        Mockito.`when`(cache.write(false)).thenReturn(false)

        `when`(FrancaResourcesValidator.validate(any<ResourceSet>(), any())).thenReturn(true)
        `when`(generator.name).thenReturn("")
        `when`(
            GeneratorSuite.instantiateByShortName(
                any(),
                any(),
                any<FrancaDeploymentModel>()
            )
        ).thenReturn(generator)
    }

    @Test
    fun defaultGeneratorsAreUsed() {
        // Arrange
        val options = Options.builder().build()

        // Act, Assert
        assertEquals(
            GeneratorSuite.generatorShortNames(),
            createGenium(options).discoverGenerators()
        )
    }

    @Test
    fun failedInstantiationOfGenerator() {
        // Arrange
        `when`(
            GeneratorSuite.instantiateByShortName(
                any(),
                any(),
                any<FrancaDeploymentModel>()
            )
        ).thenReturn(null)
        val options = Options.builder()
            .inputDirs(arrayOf(""))
            .generators(setOf("invalidGenerator"))
            .build()

        // Act, Assert
        assertFalse(createGenium(options).execute())
    }

    @Test
    fun fileNameCollisionsResolved() {
        // Arrange
        `when`(generator.generate(any<List<FTypeCollection>>())).thenReturn(
            listOf(
                FILE,
                FILE,
                FILE
            )
        )
        val options = Options.builder()
            .inputDirs(arrayOf(""))
            .generators(setOf(SHORT_NAME))
            .validatingOnly(false)
            .build()

        assertFalse(createGenium(options).execute())
    }

    @Test
    fun executeValidateOnly() {
        // Arrange
        val options = Options.builder()
            .inputDirs(arrayOf(""))
            .generators(setOf(SHORT_NAME))
            .validatingOnly(true)
            .build()

        // Act
        createGenium(options).execute()

        // Assert
        verify<GeneratorSuite>(generator, never()).generate(any<List<FTypeCollection>>())
    }

    @Test
    fun useCachingInExecute() {
        // Arrange
        val options = Options.builder()
            .inputDirs(arrayOf(""))
            .outputDir(temporaryFolder.root.path)
            .generators(setOf(SHORT_NAME))
            .enableCaching(true)
            .build()

        // Act
        createGenium(options).execute()

        // Verify
        Mockito.inOrder(cache).apply {
            verify<CachingStrategy>(cache).updateCache(any(), any())
            verify<CachingStrategy>(cache).write(true)
        }
    }

    @Test
    @Throws(IOException::class)
    fun ableToOutputConsole() {
        // Arrange
        Options.builder().dumpingToStdout(true).build()
        val generatedFile = GeneratedFile(CONTENT, FILE_NAME)
        val bo = ByteArrayOutputStream()
        System.setOut(PrintStream(bo))
        val options = Options.builder().dumpingToStdout(true).build()

        // Act
        Genium(options).output(null, listOf(generatedFile))
        bo.flush()
        val consoleOutput = String(bo.toByteArray())

        // Assert
        assertTrue(consoleOutput.contains("Generated fileName") && consoleOutput.contains(CONTENT))
    }

    @Test
    @PrepareForTest(
        Genium::class,
        FileOutput::class,
        GeneratorSuite::class,
        FrancaResourcesValidator::class,
        CachingStrategyCreator::class
    )
    @Throws(Exception::class)
    fun ableToOutputFile() {
        // Arrange
        val mockFileOutput = mock(FileOutput::class.java)
        PowerMockito.whenNew(FileOutput::class.java).withAnyArguments().thenReturn(mockFileOutput)
        val options = Options.builder().outputDir(OUTPUT_DIR).build()
        val mockFile = mock(File::class.java)
        PowerMockito.whenNew(File::class.java).withAnyArguments().thenReturn(mockFile)

        // Act, Assert
        assertTrue(Genium(options).output(null, GENERATED_FILES))
        verify(mockFileOutput, times(1)).output(ArgumentMatchers.anyList())
        verify<CachingStrategy>(cache).updateCache(any(), any())
    }

    @PrepareForTest(
        Genium::class,
        GeneratorSuite::class,
        FrancaResourcesValidator::class,
        CachingStrategyCreator::class
    )
    @Throws(Exception::class)
    fun failWhenUnableToOpenConsoleForOutput() {
        // Arrange
        val mockConsoleOutput = mock(ConsoleOutput::class.java)
        PowerMockito.whenNew(ConsoleOutput::class.java).withNoArguments()
            .thenReturn(mockConsoleOutput)
        Mockito.doThrow(IOException()).`when`(mockConsoleOutput).output(ArgumentMatchers.anyList())
        val options = Options.builder().dumpingToStdout(true).build()

        // Act, Assert
        assertFalse(Genium(options).output(null, GENERATED_FILES))
    }

    @Test
    @Throws(Exception::class)
    fun failWhenUnableToOpenOutputDirectory() {
        // Arrange
        val mockFileOutput = mock(FileOutput::class.java)
        PowerMockito.whenNew(FileOutput::class.java).withAnyArguments().thenReturn(mockFileOutput)
        Mockito.doThrow(IOException()).`when`(mockFileOutput).output(GENERATED_FILES)
        val options = Options.builder().outputDir("").build()

        // Act, Assert
        assertFalse(Genium(options).output(null, GENERATED_FILES))
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
        val result = Genium.mergeAndroidManifests(
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
        val result = Genium.mergeAndroidManifests(
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
            Genium.mergeAndroidManifests(
                baseManifestPath, appendManifestPath, mergedManifestPath.toString()
            )
        )
    }

    private fun createGenium(options: Options): Genium {
        val genium = spy(Genium(options))
        doReturn(francaModelLoader).`when`(genium).francaModelLoader
        doReturn(true).`when`(genium)
            .validateFrancaModel(any<FrancaDeploymentModel>(), any<List<FTypeCollection>>())
        return genium
    }

    companion object {
        private const val SHORT_NAME = "android"
        private const val FILE_NAME = "fileName"
        private const val OUTPUT_DIR = "someDir"
        private const val CONTENT = "someContent"
        private val FILE = GeneratedFile("", FILE_NAME)
        private val GENERATED_FILES = listOf(FILE)
    }
}
