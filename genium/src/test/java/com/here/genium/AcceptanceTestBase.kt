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

package com.here.genium

import com.here.genium.generator.common.GeneratedFile
import com.here.genium.loader.getLoader
import com.here.genium.model.lime.LimeModelLoader
import com.here.genium.platform.android.AndroidGeneratorSuite
import com.here.genium.platform.baseapi.BaseApiGeneratorSuite
import com.here.genium.platform.swift.SwiftGeneratorSuite
import com.here.genium.test.NiceErrorCollector
import io.mockk.every
import io.mockk.spyk
import org.junit.Assert.assertTrue
import org.junit.Assert.fail
import org.junit.Assume.assumeFalse
import org.junit.Before
import org.junit.Rule
import java.io.File
import java.net.URISyntaxException
import java.util.HashMap

abstract class AcceptanceTestBase protected constructor(
    private val featureDirectory: File,
    private val generatorName: String
) {
    @JvmField
    @Rule
    val errorCollector = NiceErrorCollector()

    private val genium = spyk(Genium(getGeniumOptions()))

    private val results = mutableListOf<GeneratedFile>()

    protected open fun getGeniumOptions() = Genium.DEFAULT_OPTIONS

    @Before
    fun setUp() {
        every { genium.output(any(), any()) }.answers {
            @Suppress("UNCHECKED_CAST")
            results.addAll(it.invocation.args[1] as List<GeneratedFile>)
            true
        }
    }

    protected fun runTest() {
        val inputDirectory = File(featureDirectory, FEATURE_INPUT_FOLDER)
        val outputDirectory = File(featureDirectory, FEATURE_OUTPUT_FOLDER)

        val referenceFiles = GENERATOR_DIRECTORIES[generatorName]!!
            .map { generatorDirectoryName -> File(outputDirectory, generatorDirectoryName) }
            .flatMap { listFilesRecursively(it) }
            .filterNot { it.name.toLowerCase().startsWith(IGNORE_PREFIX) }

        assumeFalse("No reference files were found", referenceFiles.isEmpty())

        val limeModel = LimeModelLoader.getLoader().loadModel(listOf(inputDirectory.toString()))
        assertTrue(genium.executeGenerator(generatorName, limeModel, HashMap()))

        val generatedContents = results.associateBy({ it.targetFile.path }, { it.content })

        referenceFiles.forEach {
            val relativePath = getRelativePath(outputDirectory, it)
            val generatedContent = generatedContents[relativePath]
            errorCollector.checkNotNull(
                "File was not generated: $relativePath, generated files: ${generatedContents.keys}",
                generatedContent
            )

            if (generatedContent != null) {
                val expected = it.readText()
                errorCollector.checkEquals(
                    "File content differs for file: $relativePath",
                    ignoreWhitespace(expected),
                    ignoreWhitespace(generatedContent)
                )
            }
        }
    }

    companion object {
        private const val FEATURE_INPUT_FOLDER = "input"
        private const val FEATURE_OUTPUT_FOLDER = "output"
        private const val IGNORE_PREFIX = "ignore"
        private val GENERATOR_NAMES = listOf(
            BaseApiGeneratorSuite.GENERATOR_NAME,
            AndroidGeneratorSuite.GENERATOR_NAME,
            SwiftGeneratorSuite.GENERATOR_NAME
        )
        private val GENERATOR_DIRECTORIES = hashMapOf<String, List<String>>()

        init {
            GENERATOR_DIRECTORIES[BaseApiGeneratorSuite.GENERATOR_NAME] =
                    listOf(BaseApiGeneratorSuite.GENERATOR_NAME)
            GENERATOR_DIRECTORIES[AndroidGeneratorSuite.GENERATOR_NAME] =
                    listOf(AndroidGeneratorSuite.GENERATOR_NAME)
            GENERATOR_DIRECTORIES[SwiftGeneratorSuite.GENERATOR_NAME] =
                    listOf(SwiftGeneratorSuite.GENERATOR_NAME, "cbridge", "cbridge_internal")
        }

        @JvmStatic
        protected fun getData(resourcePrefix: String): Collection<Array<Any>> {
            val testResourcesUrl = ClassLoader.getSystemClassLoader().getResource(resourcePrefix)
            if (testResourcesUrl == null) {
                fail("Test resources directory not found")
                return emptyList()
            }

            val testResourcesDirectory: File
            try {
                testResourcesDirectory = File(testResourcesUrl.toURI())
            } catch (e: URISyntaxException) {
                fail("Unable to load test resources")
                return emptyList()
            }

            val featureDirectoryResources = testResourcesDirectory.listFiles()
            if (featureDirectoryResources == null) {
                fail("No test features were found")
                return emptyList()
            }
            return featureDirectoryResources.filter { it.isDirectory }.sorted()
                .flatMap { directory ->
                    GENERATOR_NAMES.map { generatorName ->
                        arrayOf(
                            directory,
                            generatorName,
                            getFeatureName(testResourcesDirectory, directory)
                        )
                    }
                }
        }

        private fun listFilesRecursively(directory: File): Collection<File> {
            val files = directory.listFiles() ?: return emptyList()
            val result = mutableListOf<File>()
            files.forEach {
                if (it.isDirectory) {
                    result.addAll(listFilesRecursively(it))
                } else {
                    result.add(it)
                }
            }
            return result
        }

        private fun getRelativePath(directory: File, file: File) =
            directory.toURI().relativize(file.toURI()).path

        private fun ignoreWhitespace(text: String) =
            text.replace("( *\n)+".toRegex(), "\n") // ignore repeating empty lines
                .trim { it <= ' ' } // ignore leading and trailing whitespace

        private fun getFeatureName(parentDirectory: File, featureDirectory: File) =
            getRelativePath(parentDirectory, featureDirectory).replace("/", "")
    }
}
