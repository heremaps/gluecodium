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

@file:Suppress("unused", "UnstableApiUsage")

package com.here.gluecodium.gradle

import com.here.gluecodium.GluecodiumOptions
import com.here.gluecodium.cli.OptionReader
import com.here.gluecodium.generator.common.GeneratorOptions
import java.io.File
import org.gradle.api.NonNullApi
import org.gradle.api.file.FileTree
import org.gradle.api.provider.Property
import org.gradle.api.tasks.CacheableTask
import org.gradle.api.tasks.Input
import org.gradle.api.tasks.InputFile
import org.gradle.api.tasks.InputFiles
import org.gradle.api.tasks.Internal
import org.gradle.api.tasks.Optional
import org.gradle.api.tasks.OutputDirectory
import org.gradle.api.tasks.PathSensitive
import org.gradle.api.tasks.PathSensitivity
import org.gradle.api.tasks.SourceTask
import org.gradle.api.tasks.TaskAction

@NonNullApi
@CacheableTask
open class GluecodiumTask : SourceTask() {
    @Internal
    lateinit var javaGenerator: String

    @OutputDirectory
    val outputDirectory: Property<File> = project.objects.property(File::class.java)

    @Optional
    @OutputDirectory
    val commonOutputDirectory: Property<File> = project.objects.property(File::class.java)

    @Optional
    @InputFile
    @PathSensitive(PathSensitivity.ABSOLUTE)
    val copyrightHeaderFile: Property<File> = project.objects.property(File::class.java)

    @Optional
    @InputFiles
    @PathSensitive(PathSensitivity.ABSOLUTE)
    val auxiliarySource: Property<FileTree> = project.objects.property(FileTree::class.java)

    @Optional
    @Input
    val javaPackage: Property<String> = project.objects.property(String::class.java)

    @Optional
    @Input
    val javaInternalPackage: Property<String> = project.objects.property(String::class.java)

    @Optional
    @InputFile
    @PathSensitive(PathSensitivity.ABSOLUTE)
    val javaNameRules: Property<File> = project.objects.property(File::class.java)

    @Optional
    @Input
    val javaNonNullAnnotation: Property<String> = project.objects.property(String::class.java)

    @Optional
    @Input
    val javaNullableAnnotation: Property<String> = project.objects.property(String::class.java)

    @Optional
    @Input
    val cppNamespace: Property<String> = project.objects.property(String::class.java)

    @Optional
    @Input
    val cppInternalNamespace: Property<String> = project.objects.property(String::class.java)

    @Optional
    @Input
    val cppExportMacroName: Property<String> = project.objects.property(String::class.java)

    @Optional
    @Input
    val cppExportCommonMacroName: Property<String> = project.objects.property(String::class.java)

    @Optional
    @InputFile
    @PathSensitive(PathSensitivity.ABSOLUTE)
    val cppNameRules: Property<File> = project.objects.property(File::class.java)

    @TaskAction
    fun generate() {
        logOptions()
        GluecodiumRunner().run(createGluecodiumOptions(), createGeneratorOptions())
    }

    private fun createGluecodiumOptions(): GluecodiumOptions {
        val options = GluecodiumOptions()

        options.idlSources = source.files.map { it.absolutePath }
        options.outputDir = outputDirectory.get().absolutePath
        options.commonOutputDir = commonOutputDirectory.getOrElse(outputDirectory.get()).absolutePath
        options.generators = setOf(javaGenerator, "cpp")
        auxiliarySource.orNull?.let {
            options.auxiliaryIdlSources = it.files.map { file -> file.absolutePath }
        }

        return options
    }

    private fun createGeneratorOptions(): GeneratorOptions {
        val options = GeneratorOptions()

        copyrightHeaderFile.orNull?.let { options.copyrightHeaderContents = it.readText() }
        javaPackage.orNull?.let { options.javaPackages = it.split(".") }
        javaInternalPackage.orNull?.let { options.javaInternalPackages = it.split(".") }
        options.javaNameRules =
            OptionReader.readConfigFile(javaNameRules.orNull?.absolutePath, options.javaNameRules)
        options.javaNonNullAnnotation = OptionReader.parseAnnotation(javaNonNullAnnotation.orNull)
        options.javaNullableAnnotation = OptionReader.parseAnnotation(javaNullableAnnotation.orNull)
        cppNamespace.orNull?.let { options.cppRootNamespace = it.split(".") }
        cppInternalNamespace.orNull?.let { options.cppInternalNamespace = it.split(".") }
        cppExportMacroName.orNull?.let { options.cppExport = it }
        cppExportCommonMacroName.orNull?.let { options.cppExportCommon = it }
        options.cppNameRules = OptionReader.readConfigFile(cppNameRules.orNull?.absolutePath, options.cppNameRules)

        return options
    }

    private fun logOptions() {
        logger.debug(GLUECODIUM_OPTIONS_FORMAT, "javaGenerator", javaGenerator)
        logger.debug(GLUECODIUM_OPTIONS_FORMAT, "source", source.files.map { it.absolutePath })
        logProperty("outputDirectory", outputDirectory)

        logProperty("copyrightHeaderFile", copyrightHeaderFile)
        logProperty("javaPackage", javaPackage)
        logProperty("javaInternalPackage", javaInternalPackage)
        logProperty("javaNameRules", javaNameRules, DEFAULT_VALUE_STRING)
        logProperty("javaNonNullAnnotation", javaNonNullAnnotation)
        logProperty("javaNullableAnnotation", javaNullableAnnotation)
        logProperty("cppNamespace", cppNamespace)
        logProperty("cppInternalNamespace", cppInternalNamespace)
        logProperty("cppExportMacroName", cppExportMacroName,
            DEFAULT_VALUE_STRING + " " + GeneratorOptions.DEFAULT_CPP_EXPORT_MACRO_NAME
        )
        logProperty("cppNameRules", cppNameRules, DEFAULT_VALUE_STRING)
    }

    private fun logProperty(optionName: String, property: Property<*>, defaultValue: String = "") {
        logger.debug(GLUECODIUM_OPTIONS_FORMAT, optionName, property.orNull ?: defaultValue)
    }

    companion object {
        private const val GLUECODIUM_OPTIONS_FORMAT = "Gluecodium.Options.{} = {}"
        private const val DEFAULT_VALUE_STRING = "(default)"
    }
}
