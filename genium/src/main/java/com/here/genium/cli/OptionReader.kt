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

package com.here.genium.cli

import com.google.common.base.Splitter
import com.here.genium.Genium
import com.here.genium.platform.common.GeneratorSuite
import org.apache.commons.cli.BasicParser
import org.apache.commons.cli.CommandLine
import org.apache.commons.cli.HelpFormatter
import org.apache.commons.cli.Option
import org.apache.commons.cli.Options
import org.apache.commons.cli.ParseException
import org.eclipse.xtext.util.Files

class OptionReader {
    private val options: Options = Options().run {
        addOption("input", true, "The path or the file to use for generation")
        addOption("output", true, "Generated files output destination")
        addOption("javapackage", true, "Java package name")
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
            "Perform fidl and fdepl files validation without generating any code."
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
            "List of generators to use, separated by comma. If empty, all available generators are used. Available generators: ${GeneratorSuite.generatorShortNames().joinToString(
                ","
            )}\n"
        ).apply {
            valueSeparator = ','
            setOptionalArg(true)
            args = Option.UNLIMITED_VALUES
        })
        addOption(
            "time",
            "time-logging",
            false,
            "Enables logging of elapsed time at INFO level. Time for Franca model loading step and for code generation step is logged separately."
        )
        addOption(
            "copyright",
            "copyright-header",
            true,
            "Specify the path for the file containing the copyright header that will be appended to" + " all the generated files."
        )
        addOption(
            "intnamespace",
            "cpp-internal-namespace",
            true,
            "C++ namespace for internal (non-API) headers."
        )
        addOption("cppnamespace", true, "C++ namespace for public (API) headers.")
    }

    @Throws(OptionReaderException::class)
    fun read(args: Array<String>): Genium.Options? {
        val options = Genium.Options()
        val parser = BasicParser()

        try {
            val cmd = parser.parse(this.options, args)

            if (cmd.hasOption("help")) {
                printUsage()
                return null
            }

            if (cmd.hasOption("input")) {
                options.inputDirs = cmd.getOptionValues("input").toList()
            }

            options.outputDir = getSingleOptionValue(cmd, "output")
            val javaPackage = getSingleOptionValue(cmd, "javapackage")
            options.javaPackages = if (javaPackage != null)
                Splitter.on(".").split(javaPackage).toList()
            else
                listOf()

            options.androidMergeManifestPath = getSingleOptionValue(cmd, "mergemanifest")

            if (cmd.hasOption("generators")) {
                val arg = cmd.getOptionValues("generators")
                // use all generators if option provided without argument
                options.generators = if (arg != null)
                    hashSetOf(*arg)
                else
                    GeneratorSuite.generatorShortNames()
            }

            options.isValidatingOnly = cmd.hasOption("validate")
            options.isDumpingToStdout = cmd.hasOption("stdout")
            options.isEnableCaching = cmd.hasOption("output") && cmd.hasOption("cache")
            options.isLoggingTimes = cmd.hasOption("time")

            val cppRootNamespaces = getSingleOptionValue(cmd, "cppnamespace")
            options.cppRootNamespace = if (cppRootNamespaces?.isNotEmpty() == true) {
                cppRootNamespaces.split(".")
            } else {
                listOf()
            }

            options.cppInternalNamespace = getSingleOptionValue(cmd, "intnamespace")

            val copyrightHeader = cmd.getOptionValue("copyright")
            if (copyrightHeader != null) {
                val contents = Files.readFileIntoString(copyrightHeader)
                options.copyrightHeaderContents = contents
            }
        } catch (e: ParseException) {
            throw OptionReaderException(e)
        }

        // Validation
        if (options.inputDirs.isEmpty()) {
            throw OptionReaderException("input option required")
        }

        return options
    }

    fun printUsage() {
        val header = "Genium - Generate APIs from Franca IDL files\n\n"
        val footer = "\nPlease report issues at /dev/null"

        HelpFormatter().printHelp("generate [input]", header, options, footer, true)
    }

    @Throws(OptionReaderException::class)
    private fun getSingleOptionValue(cmd: CommandLine, option: String): String? {
        val result = cmd.getOptionValues(option) ?: return null

        if (result.size != 1) {
            throw OptionReaderException("multiple values for option: $option")
        }
        return result[0]
    }
}
