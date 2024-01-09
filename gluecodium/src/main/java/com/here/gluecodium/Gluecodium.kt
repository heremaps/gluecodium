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

import com.here.gluecodium.cache.FileOutput
import com.here.gluecodium.cache.SplitSourceSetCache
import com.here.gluecodium.cli.GluecodiumExecutionException
import com.here.gluecodium.cli.OptionReader
import com.here.gluecodium.cli.OptionReaderException
import com.here.gluecodium.common.LimeLogger
import com.here.gluecodium.common.LimeModelFilter
import com.here.gluecodium.common.LimeModelSkipPredicates
import com.here.gluecodium.generator.common.GeneratedFile
import com.here.gluecodium.generator.common.Generator
import com.here.gluecodium.generator.common.GeneratorOptions
import com.here.gluecodium.generator.common.templates.TemplateEngine
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimeModelLoader
import com.here.gluecodium.model.lime.LimeModelLoaderException
import com.here.gluecodium.validator.LimeAsyncValidator
import com.here.gluecodium.validator.LimeConstantRefsValidator
import com.here.gluecodium.validator.LimeExternalTypesValidator
import com.here.gluecodium.validator.LimeFieldConstructorsValidator
import com.here.gluecodium.validator.LimeFunctionsValidator
import com.here.gluecodium.validator.LimeGenericTypesValidator
import com.here.gluecodium.validator.LimeInheritanceValidator
import com.here.gluecodium.validator.LimeOptimizedListsValidator
import com.here.gluecodium.validator.LimePropertiesValidator
import com.here.gluecodium.validator.LimeSerializableStructsValidator
import com.here.gluecodium.validator.LimeSkipValidator
import com.here.gluecodium.validator.LimeStructsValidator
import com.here.gluecodium.validator.LimeTypeRefTargetValidator
import com.here.gluecodium.validator.LimeTypeRefsValidator
import com.here.gluecodium.validator.LimeValuesValidator
import java.io.File
import java.io.IOException
import java.util.Properties
import java.util.logging.Level
import java.util.logging.LogManager
import java.util.logging.Logger
import kotlin.system.exitProcess

class Gluecodium(
    private val gluecodiumOptions: GluecodiumOptions,
    private val generatorOptions: GeneratorOptions,
    private val modelLoader: LimeModelLoader = LimeModelLoader.getLoaders().first(),
) {
    internal val cache =
        SplitSourceSetCache(
            gluecodiumOptions.outputDir,
            gluecodiumOptions.commonOutputDir,
            gluecodiumOptions.isEnableCaching,
        )

    init {
        try {
            LogManager.getLogManager().readConfiguration(
                Gluecodium::class.java.classLoader.getResourceAsStream("logging.properties"),
            )
        } catch (e: IOException) {
            e.printStackTrace()
        }
    }

    fun execute(): Boolean {
        if (gluecodiumOptions.idlSources.isEmpty()) {
            throw OptionReaderException("input option required")
        }

        val limeModel: LimeModel
        try {
            limeModel = modelLoader.loadModel(gluecodiumOptions.idlSources, gluecodiumOptions.auxiliaryIdlSources)
        } catch (e: LimeModelLoaderException) {
            LOGGER.severe(e.message)
            return false
        }

        if (!validateModel(limeModel)) {
            LOGGER.severe("Validation errors found, see log for details.")
            return false
        }
        if (gluecodiumOptions.isValidatingOnly) {
            return true
        }

        TemplateEngine.initCopyrightHeaderContents(generatorOptions.copyrightHeaderContents)

        val fileNamesCache = hashMapOf<String, String>()
        var executionSucceeded = false
        try {
            executionSucceeded = discoverGenerators().all { executeGenerator(it, limeModel, fileNamesCache) }
        } finally {
            // cache has to be updated in any case
            executionSucceeded = cache.write(executionSucceeded)
        }
        return executionSucceeded
    }

    internal fun executeGenerator(
        generatorName: String,
        limeModel: LimeModel,
        fileNamesCache: MutableMap<String, String>,
    ): Boolean {
        LOGGER.fine("Using generator '$generatorName'")
        val generator = Generator.initializeGenerator(generatorName, generatorOptions)
        if (generator == null) {
            LOGGER.severe("Failed initialization of generator '$generatorName'")
            return false
        }
        LOGGER.fine("Initialized generator '$generatorName'")

        val outputFiles =
            try {
                generator.generate(limeModel)
            } catch (e: LimeModelLoaderException) {
                LOGGER.severe(e.message)
                return false
            }

        val outputSuccessful = output(generatorName, outputFiles)
        val processedWithoutCollisions = checkForFileNameCollisions(fileNamesCache, outputFiles, generatorName)

        return processedWithoutCollisions && outputSuccessful
    }

    private fun discoverGenerators(): Set<String> {
        var generators = gluecodiumOptions.generators
        if (generators.isNotEmpty()) {
            LOGGER.fine("Following generators were specified on command line: $generators")
        } else {
            generators = Generator.allGeneratorShortNames
            LOGGER.fine("No generators specified, using all available generators: $generators")
        }
        return generators
    }

    internal fun output(
        generatorName: String,
        files: List<GeneratedFile>,
    ): Boolean {
        val filesToBeWritten = cache.updateCache(generatorName, files)
        val mainFiles = filesToBeWritten.filter { it.sourceSet == GeneratedFile.SourceSet.MAIN }
        val commonFiles = filesToBeWritten.filter { it.sourceSet == GeneratedFile.SourceSet.COMMON }

        return saveToDirectory(gluecodiumOptions.outputDir, mainFiles) &&
            saveToDirectory(gluecodiumOptions.commonOutputDir, commonFiles)
    }

    internal fun validateModel(limeModel: LimeModel): Boolean {
        val filteredModel =
            LimeModelFilter.filter(limeModel) { LimeModelSkipPredicates.shouldRetainElement(it, generatorOptions.tags) }
        val limeLogger = LimeLogger(LOGGER, filteredModel.fileNameMap)
        val typeRefsValidationResult = LimeTypeRefsValidator(limeLogger).validate(filteredModel)
        val validators =
            getIndependentValidators(limeLogger) +
                if (typeRefsValidationResult) getTypeRefDependentValidators(limeLogger) else emptyList()
        val validationResults = validators.map { it.invoke(filteredModel) }
        return typeRefsValidationResult && !validationResults.contains(false)
    }

    private fun getTypeRefDependentValidators(limeLogger: LimeLogger) =
        listOf<(LimeModel) -> Boolean>(
            { LimeTypeRefTargetValidator(limeLogger).validate(it) },
            { LimeGenericTypesValidator(limeLogger).validate(it) },
            { LimeStructsValidator(limeLogger, gluecodiumOptions.isStrictMode).validate(it) },
            { LimeSerializableStructsValidator(limeLogger).validate(it) },
            { LimeInheritanceValidator(limeLogger).validate(it) },
            { LimeFunctionsValidator(limeLogger).validate(it) },
            { LimeOptimizedListsValidator(limeLogger).validate(it) },
            { LimeFieldConstructorsValidator(limeLogger).validate(it) },
            { LimeValuesValidator(limeLogger).validate(it) },
        )

    private fun getIndependentValidators(limeLogger: LimeLogger) =
        listOf<(LimeModel) -> Boolean>(
            { LimeConstantRefsValidator(limeLogger).validate(it) },
            { LimeExternalTypesValidator(limeLogger).validate(it) },
            { LimePropertiesValidator(limeLogger).validate(it) },
            { LimeFunctionsValidator(limeLogger).validate(it) },
            { LimeSkipValidator(limeLogger).validate(it) },
            { LimeAsyncValidator(limeLogger).validate(it) },
        )

    companion object {
        private val LOGGER = Logger.getLogger(Gluecodium::class.java.name)

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
            generatorName: String,
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
                            generatorName,
                            path,
                            previousEntry,
                        ),
                    )
                    succeeded = false
                }
            }
            return succeeded
        }

        private fun saveToDirectory(
            outputDir: String,
            files: List<GeneratedFile>,
        ): Boolean {
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
            LOGGER.info("Version: ${loadVersion()}")
            try {
                val options = OptionReader.read(args)
                if (options == null || Gluecodium(options.first, options.second).execute()) {
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
