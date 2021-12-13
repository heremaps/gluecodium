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

import com.here.gluecodium.cli.OptionReader
import com.here.gluecodium.generator.common.GeneratedFile
import com.here.gluecodium.generator.common.Generator
import com.here.gluecodium.generator.common.GeneratorOptions
import com.here.gluecodium.model.lime.LimeModelLoader
import com.here.gluecodium.test.NiceErrorCollector
import io.mockk.every
import io.mockk.spyk
import junit.framework.TestCase
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Assert.fail
import org.junit.Assume.assumeFalse
import org.junit.Before
import org.junit.Rule
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.Parameterized
import java.io.File
import java.net.URISyntaxException
import java.util.HashMap

@RunWith(Parameterized::class)
class SmokeTest(
    private val featureDirectory: File,
    private val generatorName: String,
    @Suppress("UNUSED_PARAMETER") featureName: String
) {
    @JvmField
    @Rule
    val errorCollector = NiceErrorCollector()

    private lateinit var gluecodium: Gluecodium

    private val results = mutableListOf<GeneratedFile>()

    private fun getOptions(): Pair<GluecodiumOptions, GeneratorOptions> {
        val inputDirectory = File(featureDirectory, FEATURE_INPUT_FOLDER)
        val auxDirectory = File(featureDirectory, FEATURE_AUX_FOLDER)
        val commandLineOptions = File(inputDirectory, "commandlineoptions.txt")
        if (commandLineOptions.exists()) {
            // read command line options and replace INPUT_FOLDER with absolute input path from test
            val commands = commandLineOptions.readText()
                .replace("\$INPUT_FOLDER", inputDirectory.toString())
                .replace("\$AUX_FOLDER", auxDirectory.toString())
                .split("\\s".toRegex())
            val options = OptionReader.read(commands.toTypedArray())
            TestCase.assertNotNull("Failed to read commandlineoptions.txt", options)
            return options!!
        }

        return Pair(GluecodiumOptions(), TEST_OPTIONS)
    }

    @Before
    fun setUp() {
        val options = getOptions()
        gluecodium = spyk(Gluecodium(options.first, options.second))
        every { gluecodium.output(any(), any()) }.answers {
            @Suppress("UNCHECKED_CAST")
            results.addAll(it.invocation.args[1] as List<GeneratedFile>)
            true
        }
    }

    @Test
    fun smokeTest() {
        val inputDirectory = File(featureDirectory, FEATURE_INPUT_FOLDER)
        val auxDirectory = File(featureDirectory, FEATURE_AUX_FOLDER)
        val outputDirectory = File(featureDirectory, FEATURE_OUTPUT_FOLDER)
        val validationShouldFail = File(inputDirectory, "validationfail.txt").exists()

        val generatorDirectories = listOf(generatorName) + (ADDITIONAL_GENERATOR_DIRS[generatorName] ?: emptyList())
        val referenceFiles = generatorDirectories
            .map { generatorDirectoryName -> File(outputDirectory, generatorDirectoryName) }
            .flatMap { listFilesRecursively(it) }
            .filterNot { it.name.toLowerCase().startsWith(IGNORE_PREFIX) }

        assumeFalse("No reference files were found", referenceFiles.isEmpty())

        val limeModel = LOADER.loadModel(listOf(inputDirectory.toString()), listOf(auxDirectory.toString()))
        val validationResult = gluecodium.validateModel(limeModel)
        if (validationShouldFail) {
            assertFalse(validationResult)
            return
        } else {
            assertTrue(validationResult)
        }
        assertTrue(gluecodium.executeGenerator(generatorName, limeModel, HashMap()))

        val generatedContents = results.associateBy({ it.targetFile.path }, { it.content })

        referenceFiles.forEach {
            val relativePath = getRelativePath(outputDirectory, it)
            val generatedContent = generatedContents[relativePath]
            errorCollector.checkNotNull(
                "File was not generated: $relativePath, generated files:\n${generatedContents.keys.joinToString("\n")}",
                generatedContent
            )

            if (generatedContent != null) {
                val expected = it.readText()
                errorCollector.checkEquals(
                    "File content differs for file: $relativePath",
                    ignoreUnimportantDifferences(expected),
                    ignoreUnimportantDifferences(generatedContent)
                )
            }
        }
    }

    companion object {
        private val TEST_OPTIONS = GeneratorOptions(
            cppInternalNamespace = listOf("gluecodium"),
            internalPrefix = "foobar_",
            javaNonNullAnnotation = Pair("NonNull", listOf("android", "support", "annotation")),
            javaNullableAnnotation = Pair("Nullable", listOf("android", "support", "annotation"))
        )

        private const val FEATURE_INPUT_FOLDER = "input"
        private const val FEATURE_AUX_FOLDER = "auxiliary"
        private const val FEATURE_OUTPUT_FOLDER = "output"
        private const val IGNORE_PREFIX = "ignore"
        private val ADDITIONAL_GENERATOR_DIRS = mapOf("swift" to listOf("cbridge", "cbridge_internal"))

        private val LOADER = LimeModelLoader.getLoaders().first()

        private const val RESOURCE_PREFIX = "smoke"

        @JvmStatic
        @Parameterized.Parameters(name = "{2}, {1}")
        fun data(): Collection<Array<Any>> {
            val testResourcesUrl = ClassLoader.getSystemClassLoader().getResource(RESOURCE_PREFIX)
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
            val generatorNames = Generator.allGeneratorShortNames
            return featureDirectoryResources.filter { it.isDirectory }.sorted()
                .flatMap { directory ->
                    generatorNames.map { generatorName ->
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
            directory.toPath().relativize(file.toPath()).toString()

        private fun ignoreUnimportantDifferences(text: String) =
            text
                .replace("( *[\r\n])+".toRegex(), "\n") // ignore repeating empty lines
                .trim { it <= ' ' } // ignore leading and trailing whitespace
                // treat Windows path separators as if they were Unix ones
                .split('\n').joinToString("\n") { if (it.startsWith("#include")) it.replace('/', '\\') else it }

        private fun getFeatureName(parentDirectory: File, featureDirectory: File) =
            getRelativePath(parentDirectory, featureDirectory).replace("/", "")
    }
}
