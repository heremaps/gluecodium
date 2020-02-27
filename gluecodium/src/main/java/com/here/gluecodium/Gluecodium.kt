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

import com.android.manifmerger.Merger
import com.here.gluecodium.cache.SplitSourceSetCache
import com.here.gluecodium.cli.GluecodiumExecutionException
import com.here.gluecodium.cli.OptionReader
import com.here.gluecodium.cli.OptionReaderException
import com.here.gluecodium.generator.common.GeneratedFile
import com.here.gluecodium.generator.common.templates.TemplateEngine
import com.here.gluecodium.loader.getLoader
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimeModelLoader
import com.here.gluecodium.model.lime.LimeModelLoaderException
import com.here.gluecodium.output.FileOutput
import com.here.gluecodium.platform.android.AndroidGeneratorSuite
import com.here.gluecodium.platform.common.GeneratorSuite
import com.natpryce.konfig.Configuration
import com.natpryce.konfig.ConfigurationProperties
import java.io.File
import java.io.FileNotFoundException
import java.io.IOException
import java.nio.file.Paths
import java.util.Properties
import java.util.logging.Level
import java.util.logging.LogManager
import java.util.logging.Logger
import kotlin.system.exitProcess

class Gluecodium(
    private val options: Options,
    private val modelLoader: LimeModelLoader = LimeModelLoader.getLoader()
) {
    private val version = loadVersion()
    internal val cache = SplitSourceSetCache(
        options.outputDir,
        options.commonOutputDir,
        options.isEnableCaching
    )

    init {
        try {
            LogManager.getLogManager().readConfiguration(
                Gluecodium::class.java.classLoader.getResourceAsStream("logging.properties")
            )
        } catch (e: IOException) {
            e.printStackTrace()
        }
    }

    fun execute(): Boolean {
        LOGGER.info("Version: $version")

        if (options.idlSources.isEmpty()) {
            throw OptionReaderException("input option required")
        }

        val limeModel: LimeModel
        try {
            limeModel = modelLoader.loadModel(options.idlSources, options.auxiliaryIdlSources)
        } catch (e: LimeModelLoaderException) {
            LOGGER.severe(e.message)
            return false
        }

        if (options.isValidatingOnly) {
            return true
        }

        TemplateEngine.initCopyrightHeaderContents(options.copyrightHeaderContents)

        val fileNamesCache = hashMapOf<String, String>()
        var executionSucceeded = false
        try {
            executionSucceeded = discoverGenerators().all {
                executeGenerator(it, limeModel, fileNamesCache)
            }
        } finally {
            // cache has to be updated in any case
            executionSucceeded = cache.write(executionSucceeded)
        }
        return executionSucceeded
    }

    internal fun executeGenerator(
        generatorName: String,
        limeModel: LimeModel,
        fileNamesCache: MutableMap<String, String>
    ): Boolean {
        LOGGER.fine("Using generator $generatorName")
        val generator = GeneratorSuite.instantiateByShortName(generatorName, options)
        if (generator == null) {
            LOGGER.severe("Failed instantiation of generator '$generatorName'")
            return false
        }
        LOGGER.fine("Instantiated generator " + generator.name)

        val outputFiles = try {
            generator.generate(limeModel)
        } catch (e: LimeModelLoaderException) {
            LOGGER.severe(e.message)
            return false
        }

        val outputSuccessful = output(generatorName, outputFiles)
        val processedWithoutCollisions =
            checkForFileNameCollisions(fileNamesCache, outputFiles, generatorName)

        if (AndroidGeneratorSuite.GENERATOR_NAME == generatorName &&
            options.androidMergeManifestPath != null &&
            outputSuccessful &&
            processedWithoutCollisions
        ) {
            val baseManifestPath =
                Paths.get(options.outputDir, "android", "AndroidManifest.xml").toString()
            return mergeAndroidManifests(
                baseManifestPath, options.androidMergeManifestPath.toString(), baseManifestPath
            )
        }
        return processedWithoutCollisions && outputSuccessful
    }

    private fun discoverGenerators(): Set<String> {
        var generators = options.generators
        if (generators.isNotEmpty()) {
            LOGGER.fine("Following generators were specified on command line: $generators")
        } else {
            generators = GeneratorSuite.generatorShortNames()
            LOGGER.fine("No generators specified, using all available generators: $generators")
        }
        return generators
    }

    internal fun output(generatorName: String, files: List<GeneratedFile>): Boolean {
        val filesToBeWritten = cache.updateCache(generatorName, files)
        val mainFiles = filesToBeWritten.filter { it.sourceSet == GeneratedFile.SourceSet.MAIN }
        val commonFiles = filesToBeWritten.filter { it.sourceSet == GeneratedFile.SourceSet.COMMON }

        return saveToDirectory(
            options.outputDir,
            mainFiles
        ) && saveToDirectory(options.commonOutputDir, commonFiles)
    }

    data class Options(
        var idlSources: List<String> = emptyList(),
        var auxiliaryIdlSources: List<String> = emptyList(),
        var outputDir: String = "",
        var commonOutputDir: String = "",
        var javaPackages: List<String> = listOf(),
        var javaInternalPackages: List<String> = listOf(),
        var javaNullableAnnotation: Pair<String, List<String>>? = null,
        var javaNonNullAnnotation: Pair<String, List<String>>? = null,
        var isValidatingOnly: Boolean = false,
        var generators: Set<String> = setOf(),
        var isEnableCaching: Boolean = false,
        var androidMergeManifestPath: String? = null,
        var copyrightHeaderContents: String? = null,
        var cppInternalNamespace: List<String> = emptyList(),
        var cppRootNamespace: List<String> = listOf(),
        var cppExport: String = DEFAULT_CPP_EXPORT_MACRO_NAME,
        var swiftInternalPrefix: String? = null,
        var libraryName: String = "library",
        var cppNameRules: Configuration = ConfigurationProperties.fromResource(
            Gluecodium::class.java,
            "/namerules/cpp.properties"
        ),
        var javaNameRules: Configuration = ConfigurationProperties.fromResource(
            Gluecodium::class.java,
            "/namerules/java.properties"
        ),
        var swiftNameRules: Configuration = ConfigurationProperties.fromResource(
            Gluecodium::class.java,
            "/namerules/swift.properties"
        ),
        var dartNameRules: Configuration = ConfigurationProperties.fromResource(
            Gluecodium::class.java,
            "/namerules/dart.properties"
        )
    )

    companion object {
        private val LOGGER = Logger.getLogger(Gluecodium::class.java.name)
        val DEFAULT_INTERNAL_NAMESPACE = listOf("gluecodium")
        const val DEFAULT_CPP_EXPORT_MACRO_NAME = "_GLUECODIUM_CPP"

        internal fun testOptions() = Options(
            cppInternalNamespace = DEFAULT_INTERNAL_NAMESPACE,
            javaNonNullAnnotation = Pair("NonNull", listOf("android", "support", "annotation")),
            javaNullableAnnotation = Pair("Nullable", listOf("android", "support", "annotation"))
        )

        private fun loadVersion(): String {
            val prop = Properties()
            try {
                val stream =
                    Gluecodium::class.java.classLoader.getResourceAsStream("version.properties")
                prop.load(stream)
            } catch (e: IOException) {
                LOGGER.severe("Could not load Gluecodium version value: " + e.message)
            }
            return prop.getProperty("version", "0.0.1")
        }

        private fun checkForFileNameCollisions(
            fileNamesCache: MutableMap<String, String>,
            files: List<GeneratedFile>,
            generatorName: String
        ): Boolean {
            var succeeded = true
            for (file in files) {
                val path = file.targetFile.path
                val previousEntry = fileNamesCache[path]
                if (previousEntry == null) {
                    fileNamesCache[path] = generatorName
                } else {
                    LOGGER.severe(
                        String.format(
                            "Generator '%s' is overwriting file %s created already by '%s' ",
                            generatorName, path, previousEntry
                        )
                    )
                    succeeded = false
                }
            }
            return succeeded
        }

        internal fun mergeAndroidManifests(
            baseManifestPath: String,
            appendManifestPath: String,
            outputFilePath: String
        ) = try {
            Merger().process(
                arrayOf(
                    "--main",
                    baseManifestPath,
                    "--overlays",
                    appendManifestPath,
                    "--out",
                    outputFilePath
                )
            ) == 0
        } catch (e: FileNotFoundException) {
            LOGGER.severe("Could not merge base Android Manifest files: " + e.message)
            false
        }

        private fun saveToDirectory(outputDir: String, files: List<GeneratedFile>): Boolean {
            try {
                FileOutput(File(outputDir)).output(files)
            } catch (ignored: IOException) {
                LOGGER.severe("Cannot open output directory '$outputDir' for writing")
                return false
            }
            return true
        }

        @JvmStatic
        fun main(args: Array<String>) {
            try {
                val options = OptionReader.read(args)
                if (options == null || Gluecodium(options).execute()) {
                    exitProcess(0)
                }
            } catch (e: GluecodiumExecutionException) {
                LOGGER.log(Level.SEVERE, "Running Gluecodium failed!", e)
            } catch (e: OptionReaderException) {
                LOGGER.severe("Failed reading options: ${e.message}")
                OptionReader.printUsage()
            }
            exitProcess(1)
        }
    }
}
