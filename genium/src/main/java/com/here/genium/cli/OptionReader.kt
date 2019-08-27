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

package com.here.genium.cli

import com.here.genium.Genium
import com.here.genium.platform.common.GeneratorSuite
import com.natpryce.konfig.Configuration
import com.natpryce.konfig.ConfigurationProperties
import com.natpryce.konfig.overriding
import org.apache.commons.cli.CommandLine
import org.apache.commons.cli.DefaultParser
import org.apache.commons.cli.HelpFormatter
import org.apache.commons.cli.Option
import org.apache.commons.cli.Options
import org.apache.commons.cli.ParseException
import java.io.File
import java.nio.file.Paths

object OptionReader {
    private val options: Options = Options().run {
        addOption("input", true, "The path or the file to use for generation")
        addOption("output", true, "Generated files output destination")
        addOption("javapackage", true, "Java package name")
        addOption(
            "javanonnullannotation",
            true,
            "Java @NonNull annotation full name including package"
        )
        addOption(
            "javanullableannotation",
            true,
            "Java @Nullable annotation full name including package"
        )
        addOption(
            "intpackage",
            "java-internal-package",
            true,
            "Java package name to append to 'javapackage' for internal types."
        )
        addOption(
            "mergemanifest",
            "android-merge-manifest",
            true,
            "A second AndroidManifest.xml that will be merged with the generated AndroidManifest.xml"
        )
        addOption("stdout", false, "Echo generated files to stdout")
        addOption("help", false, "Shows this help and exits.")
        addOption(
            "validate",
            "validate-only",
            false,
            "Perform validation of input files without generating any code."
        )
        addOption(
            "cache",
            "enable-caching",
            false,
            "enable caching of output files, only available if output destination is set"
        )
        addOption(Option(
            "generators",
            true,
            "List of generators to use, separated by comma. If empty, all available generators are used. Available generators: " +
                    GeneratorSuite.generatorShortNames().joinToString(", ") + "\n"
        ).apply {
            valueSeparator = ','
            setOptionalArg(true)
            args = Option.UNLIMITED_VALUES
        })
        addOption(
            "time",
            "time-logging",
            false,
            "Enables logging of elapsed time at INFO level. Time for input model loading step and for code generation step is logged separately."
        )
        addOption(
            "copyright",
            "copyright-header",
            true,
            "Specify the path for the file containing the copyright header that will be appended to all the generated files."
        )
        addOption(
            "intnamespace",
            "cpp-internal-namespace",
            true,
            "C++ namespace for internal (non-API) headers. Multiple namespace levels may be separated with '.'."
        )
        addOption("cppnamespace", true, "C++ namespace for public (API) headers.")
        addOption("cppexport", true, "C++ export macro name for explicit symbol exporting.")
        addOption("cppnamerules", true, "C++ name rules property file.")
        addOption("javanamerules", true, "Java name rules property file.")
        addOption("swiftnamerules", true, "Swift name rules property file.")
    }

    @Throws(OptionReaderException::class)
    fun read(args: Array<String>): Genium.Options? {
        val cmd = try {
            DefaultParser().parse(this.options, args)
        } catch (e: ParseException) {
            throw OptionReaderException(e)
        }

        if (cmd.hasOption("help")) {
            printUsage()
            return null
        }

        val options = Genium.Options()
        if (cmd.hasOption("input")) {
            options.inputDirs = cmd.getOptionValues("input").toList()
        }

        options.outputDir = getSingleOptionValue(cmd, "output")
        val javaPackage = getSingleOptionValue(cmd, "javapackage")
        options.javaPackages = javaPackage?.split(".") ?: emptyList()

        options.javaNonNullAnnotation =
            getAnnotation(getSingleOptionValue(cmd, "javanonnullannotation"))
        options.javaNullableAnnotation =
            getAnnotation(getSingleOptionValue(cmd, "javanullableannotation"))

        val javaInternalPackage = getSingleOptionValue(cmd, "intpackage")
        options.javaInternalPackages = javaInternalPackage?.split(".") ?: emptyList()

        options.androidMergeManifestPath = getSingleOptionValue(cmd, "mergemanifest")

        if (cmd.hasOption("generators")) {
            val arg = cmd.getOptionValues("generators")
            // Use all generators none are provided in the options.
            options.generators = arg?.let { setOf(*it) } ?: GeneratorSuite.generatorShortNames()
        }

        options.isValidatingOnly = cmd.hasOption("validate")
        options.isDumpingToStdout = cmd.hasOption("stdout")
        options.isEnableCaching = cmd.hasOption("output") && cmd.hasOption("cache")
        options.isLoggingTimes = cmd.hasOption("time")

        val cppRootNamespaces = getSingleOptionValue(cmd, "cppnamespace")
        options.cppRootNamespace = when {
            cppRootNamespaces.isNullOrEmpty() -> emptyList()
            else -> cppRootNamespaces.split(".")
        }

        val internalNamespaces = getSingleOptionValue(cmd, "intnamespace")
        options.cppInternalNamespace = internalNamespaces?.split(".")

        val cppExport = getSingleOptionValue(cmd, "cppexport")
        if (cppExport != null) {
            options.cppExport = cppExport
        }

        val cppNameRulesPath = getSingleOptionValue(cmd, "cppnamerules")
        if (cppNameRulesPath != null) {
            options.cppNameRules =
                readNameRulesConfig(cppNameRulesPath) overriding options.cppNameRules
        }

        val javaNameRulesPath = getSingleOptionValue(cmd, "javanamerules")
        if (javaNameRulesPath != null) {
            options.javaNameRules =
                readNameRulesConfig(javaNameRulesPath) overriding options.javaNameRules
        }

        val swiftNameRulesPath = getSingleOptionValue(cmd, "swiftnamerules")
        if (swiftNameRulesPath != null) {
            options.swiftNameRules =
                readNameRulesConfig(swiftNameRulesPath) overriding options.swiftNameRules
        }

        val copyrightHeader = cmd.getOptionValue("copyright")
        if (copyrightHeader != null) {
            val contents = File(copyrightHeader).readText()
            options.copyrightHeaderContents = contents
        }

        // Validation
        if (options.inputDirs.isEmpty()) {
            throw OptionReaderException("input option required")
        }

        return options
    }

    fun printUsage() {
        val header = "Genium - Generate APIs from LimeIDL files\n\n"
        val footer = "\nPlease report issues at /dev/null"

        HelpFormatter().printHelp("generate [input]", header, options, footer, true)
    }

    @Throws(OptionReaderException::class)
    private fun readNameRulesConfig(path: String): Configuration {
        val nameRulesFile = File(path)
        if (!nameRulesFile.exists()) {
            val currentDir = Paths.get("").toAbsolutePath()
            throw OptionReaderException("Name rules file $path does not exit in $currentDir")
        }
        return ConfigurationProperties.fromFile(nameRulesFile)
    }

    @Throws(OptionReaderException::class)
    private fun getSingleOptionValue(cmd: CommandLine, option: String): String? {
        val result = cmd.getOptionValues(option) ?: return null

        if (result.size != 1) {
            throw OptionReaderException("multiple values for option: $option")
        }
        return result[0]
    }

    private fun getAnnotation(argument: String?) = argument?.let {
        val nameElements = argument.split('.')
        Pair(nameElements.last(), nameElements.dropLast(1))
    }
}
