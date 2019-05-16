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

import com.android.manifmerger.Merger
import com.google.common.annotations.VisibleForTesting
import com.here.genium.cache.CachingStrategyCreator
import com.here.genium.cli.GeniumExecutionException
import com.here.genium.cli.OptionReader
import com.here.genium.cli.OptionReaderException
import com.here.genium.common.TimeLogger
import com.here.genium.generator.common.GeneratedFile
import com.here.genium.generator.common.Version
import com.here.genium.generator.common.templates.TemplateEngine
import com.here.genium.loader.getLoader
import com.here.genium.model.lime.LimeModel
import com.here.genium.model.lime.LimeModelLoader
import com.here.genium.model.lime.LimeModelLoaderException
import com.here.genium.output.ConsoleOutput
import com.here.genium.output.FileOutput
import com.here.genium.platform.android.AndroidGeneratorSuite
import com.here.genium.platform.common.GeneratorSuite
import java.io.File
import java.io.FileNotFoundException
import java.io.IOException
import java.nio.file.Paths
import java.util.Properties
import java.util.concurrent.TimeUnit
import java.util.logging.Level
import java.util.logging.LogManager
import java.util.logging.Logger

class Genium @VisibleForTesting internal constructor(
    private val modelLoader: LimeModelLoader,
    private val options: Options
) {
    private val version = parseVersion()
    private val cacheStrategy = CachingStrategyCreator.initializeCaching(
        options.isEnableCaching,
        options.outputDir,
        GeneratorSuite.generatorShortNames()
    )

    init {
        try {
            LogManager.getLogManager().readConfiguration(
                Genium::class.java.classLoader.getResourceAsStream("logging.properties")
            )
        } catch (e: IOException) {
            e.printStackTrace()
        }
    }

    @VisibleForTesting
    constructor(options: Options) : this(LimeModelLoader.getLoader(), options)

    fun execute(): Boolean {
        LOGGER.info("Version: $version")

        val times = TimeLogger(LOGGER, TimeUnit.MILLISECONDS, Level.INFO)
        times.start()
        val limeModel: LimeModel
        try {
            limeModel = modelLoader.loadModel(options.inputDirs)
            times.addLogEntry("model loading")
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
            executionSucceeded = cacheStrategy.write(executionSucceeded)

            times.addLogEntry("code generation (including file output)")
        }
        if (options.isLoggingTimes) {
            times.log()
        }
        return executionSucceeded
    }

    @VisibleForTesting
    fun executeGenerator(
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

        val outputFiles = generator.generate(limeModel)
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

    @VisibleForTesting
    internal fun discoverGenerators(): Set<String> {
        var generators = options.generators
        if (generators.isNotEmpty()) {
            LOGGER.fine("Following generators were specified on command line: $generators")
        } else {
            generators = GeneratorSuite.generatorShortNames()
            LOGGER.fine("No generators specified, using all available generators: $generators")
        }
        return generators
    }

    @VisibleForTesting
    fun output(generatorName: String, files: List<GeneratedFile>): Boolean {
        // handle output options
        if (options.isDumpingToStdout) {
            val co = ConsoleOutput()
            co.output(files)
        }
        val filesToBeWritten = cacheStrategy.updateCache(generatorName, files) ?: emptyList()
        return saveToDirectory(options.outputDir, filesToBeWritten)
    }

    class Options(
        var inputDirs: List<String> = listOf(),
        var outputDir: String? = null,
        var javaPackages: List<String> = listOf(),
        var javaInternalPackages: List<String> = listOf(),
        var isDumpingToStdout: Boolean = false,
        var isValidatingOnly: Boolean = false,
        var generators: Set<String> = setOf(),
        var isEnableCaching: Boolean = false,
        var androidMergeManifestPath: String? = null,
        var isLoggingTimes: Boolean = false,
        var copyrightHeaderContents: String? = null,
        var cppInternalNamespace: List<String>? = null,
        var cppRootNamespace: List<String> = listOf(),
        var cppExport: String = "_GENIUM_CPP"
    )

    companion object {
        private val LOGGER = Logger.getLogger(Genium::class.java.name)
        val DEFAULT_INTERNAL_NAMESPACE = listOf("genium")
        val DEFAULT_OPTIONS = Options(cppInternalNamespace = DEFAULT_INTERNAL_NAMESPACE)

        private fun parseVersion(): Version {
            val prop = Properties()
            try {
                val stream =
                    Genium::class.java.classLoader.getResourceAsStream("version.properties")
                prop.load(stream)
            } catch (ex: IOException) {
                ex.printStackTrace()
            }
            return Version.createFromString(prop.getProperty("version", "0.0.1"))
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

        @VisibleForTesting
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

        private fun saveToDirectory(outputDir: String?, files: List<GeneratedFile>): Boolean {
            if (outputDir != null) {
                try {
                    FileOutput(File(outputDir)).output(files)
                } catch (ignored: IOException) {
                    LOGGER.severe("Cannot open output directory '$outputDir' for writing")
                    return false
                }
            }
            return true
        }

        @JvmStatic
        fun main(args: Array<String>) {
            var status = 1
            try {
                val options = OptionReader().read(args)
                status = if (options == null || Genium(options).execute()) 0 else 1
            } catch (e: GeniumExecutionException) {
                LOGGER.log(Level.SEVERE, "Running Genium failed!", e)
            } catch (e: OptionReaderException) {
                LOGGER.severe("Failed reading options: ${e.message}")
                OptionReader().printUsage()
            }
            System.exit(status)
        }
    }
}
