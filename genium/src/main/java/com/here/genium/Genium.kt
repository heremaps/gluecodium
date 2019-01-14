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
import com.here.genium.loader.FrancaModelLoader
import com.here.genium.logger.GeniumLogger
import com.here.genium.model.franca.FrancaDeploymentModel
import com.here.genium.model.franca.ModelHelper
import com.here.genium.output.ConsoleOutput
import com.here.genium.output.FileOutput
import com.here.genium.platform.android.AndroidGeneratorSuite
import com.here.genium.platform.common.GeneratorSuite
import com.here.genium.validator.ConstructorsValidatorPredicate
import com.here.genium.validator.DefaultsValidatorPredicate
import com.here.genium.validator.EquatableValidatorPredicate
import com.here.genium.validator.ErrorEnumsValidatorPredicate
import com.here.genium.validator.ExpressionValidatorPredicate
import com.here.genium.validator.ExternalElementsValidatorPredicate
import com.here.genium.validator.ExternalTypesValidatorPredicate
import com.here.genium.validator.FrancaModelValidator
import com.here.genium.validator.FrancaResourcesValidator
import com.here.genium.validator.InheritanceValidatorPredicate
import com.here.genium.validator.IntegerIntervalValidatorPredicate
import com.here.genium.validator.MapKeyValidatorPredicate
import com.here.genium.validator.NameValidator
import com.here.genium.validator.NullabilityValidatorPredicate
import com.here.genium.validator.SerializationValidatorPredicate
import com.here.genium.validator.StaticAttributesValidatorPredicate
import com.here.genium.validator.StaticMethodsValidatorPredicate
import com.here.genium.validator.StructInheritanceValidatorPredicate
import com.here.genium.validator.UnionsValidatorPredicate
import com.here.genium.validator.visibility.ArrayVisibilityValidatorPredicate
import com.here.genium.validator.visibility.AttributeVisibilityValidatorPredicate
import com.here.genium.validator.visibility.FieldVisibilityValidatorPredicate
import com.here.genium.validator.visibility.InterfaceVisibilityValidatorPredicate
import com.here.genium.validator.visibility.MethodVisibilityValidatorPredicate
import org.franca.core.franca.FTypeCollection
import java.io.File
import java.io.FileNotFoundException
import java.io.IOException
import java.nio.file.Paths
import java.util.Properties
import java.util.concurrent.TimeUnit
import java.util.logging.Level
import java.util.logging.Logger

class Genium(private val options: Options) {
    private val version = parseVersion()
    private val cacheStrategy = CachingStrategyCreator.initializeCaching(
        options.isEnableCaching,
        options.outputDir,
        GeneratorSuite.generatorShortNames()
    )

    val francaModelLoader: FrancaModelLoader
        get() {
            val francaModelLoader = FrancaModelLoader()
            ModelHelper.getFdeplInjector().injectMembers(francaModelLoader)
            return francaModelLoader
        }

    init {
        GeniumLogger.initialize("logging.properties")
    }

    fun execute(): Boolean {
        LOGGER.info("Version: $version")

        val inputDirs = options.inputDirs.map { File(it) }
        val typeCollections = mutableListOf<FTypeCollection>()
        val times = TimeLogger(LOGGER, TimeUnit.MILLISECONDS, Level.INFO)
        times.start()
        val deploymentModel = loadModel(inputDirs, typeCollections)
        times.addLogEntry("model loading")

        if (deploymentModel == null) {
            return false
        }
        if (options.isValidatingOnly) {
            return true
        }

        TemplateEngine.initCopyrightHeaderContents(options.copyrightHeaderContents)

        val fileNamesCache = hashMapOf<String, String>()
        var executionSucceeded = false
        try {
            executionSucceeded = discoverGenerators()
                .all {
                    executeGenerator(it, deploymentModel, typeCollections, fileNamesCache)
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
    fun loadModel(
        inputDirs: List<File>,
        typeCollections: MutableList<FTypeCollection>
    ): FrancaDeploymentModel? {
        val inputFiles = FrancaModelLoader.listFilesRecursively(inputDirs)

        val francaModelLoader = francaModelLoader
        if (!FrancaResourcesValidator.validate(
                francaModelLoader.resourceSetProvider.get(), inputFiles
            )
        ) {
            LOGGER.severe("Validation of Franca files Failed")
            return null
        }

        val deploymentModel =
            francaModelLoader.load(GeneratorSuite.SPEC_PATH, inputFiles, typeCollections)
        LOGGER.fine("Built franca model")

        if (!validateFrancaModel(deploymentModel, typeCollections)) {
            LOGGER.severe("Validation of Franca model Failed")
            return null
        }
        return deploymentModel
    }

    @VisibleForTesting
    fun executeGenerator(
        generatorName: String,
        deploymentModel: FrancaDeploymentModel,
        typeCollections: List<FTypeCollection>,
        fileNamesCache: MutableMap<String, String>
    ): Boolean {
        LOGGER.fine("Using generator $generatorName")
        val generator =
            GeneratorSuite.instantiateByShortName(generatorName, options, deploymentModel)
        if (generator == null) {
            LOGGER.severe("Failed instantiation of generator '$generatorName'")
            return false
        }
        LOGGER.fine("Instantiated generator " + generator.name)

        val outputFiles = generator.generate(typeCollections)
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
        val filesToBeWritten = cacheStrategy.updateCache(generatorName, files) ?: listOf()
        return saveToDirectory(options.outputDir, filesToBeWritten)
    }

    /**
     * Uses the internal validators to validate the model.
     *
     * @return boolean True if the model is valid, false otherwise.
     */
    @VisibleForTesting
    internal fun validateFrancaModel(
        deploymentModel: FrancaDeploymentModel,
        typeCollections: List<FTypeCollection>
    ) = NameValidator.validate(typeCollections) && FrancaModelValidator(
        listOf(
            DefaultsValidatorPredicate(),
            ExpressionValidatorPredicate(),
            MapKeyValidatorPredicate(),
            IntegerIntervalValidatorPredicate(),
            StaticMethodsValidatorPredicate(),
            StaticAttributesValidatorPredicate(),
            ErrorEnumsValidatorPredicate(),
            InheritanceValidatorPredicate(),
            UnionsValidatorPredicate(),
            SerializationValidatorPredicate(),
            EquatableValidatorPredicate(),
            InterfaceVisibilityValidatorPredicate(),
            AttributeVisibilityValidatorPredicate(),
            MethodVisibilityValidatorPredicate(),
            FieldVisibilityValidatorPredicate(),
            ArrayVisibilityValidatorPredicate(),
            ExternalElementsValidatorPredicate(),
            ExternalTypesValidatorPredicate(),
            StructInheritanceValidatorPredicate(),
            NullabilityValidatorPredicate(),
            ConstructorsValidatorPredicate()
        )
    ).validate(deploymentModel, typeCollections)

    class Options @JvmOverloads constructor(
        var inputDirs: List<String> = listOf(),
        var outputDir: String? = null,
        var javaPackages: List<String> = listOf(),
        var isDumpingToStdout: Boolean = false,
        var isValidatingOnly: Boolean = false,
        var generators: Set<String> = setOf(),
        var isEnableCaching: Boolean = false,
        var androidMergeManifestPath: String? = null,
        var isLoggingTimes: Boolean = false,
        var copyrightHeaderContents: String? = null,
        var cppInternalNamespace: String? = null,
        var cppRootNamespace: List<String> = listOf()
    )

    companion object {
        private val LOGGER = Logger.getLogger(Genium::class.java.name)
        const val DEFAULT_INTERNAL_NAMESPACE = "genium"
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
