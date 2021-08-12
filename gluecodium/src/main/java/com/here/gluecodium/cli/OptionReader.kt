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

package com.here.gluecodium.cli

import com.here.gluecodium.GluecodiumOptions
import com.here.gluecodium.common.CaseInsensitiveSet
import com.here.gluecodium.generator.common.Generator
import com.here.gluecodium.generator.common.GeneratorOptions
import com.natpryce.konfig.Configuration
import com.natpryce.konfig.ConfigurationProperties
import com.natpryce.konfig.Key
import com.natpryce.konfig.booleanType
import com.natpryce.konfig.listType
import com.natpryce.konfig.overriding
import com.natpryce.konfig.stringType
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
        addOption("output", true, "Generated files output directory")
        addOption(
            "commonoutput",
            "common-output-dir",
            true,
            "Common generated files output directory, defaults to be the same as output"
        )
        addOption("options", true, "Options file to load options from")
        addOption("auxinput", true, "Auxiliary IDL sources that are loaded but not generated from")
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
        addOption("help", false, "Shows this help and exits.")
        addOption("version", false, "Prints version info and exits.")
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
        addOption(
            Option(
                "generators",
                true,
                "List of generators to use, separated by comma. If empty, all available generators are used. Available generators: " +
                    Generator.allGeneratorShortNames.joinToString(", ") + "\n"
            ).apply {
                valueSeparator = ','
                setOptionalArg(true)
                args = Option.UNLIMITED_VALUES
            }
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
        addOption("cppexport", true, "C++ export macro name for explicit symbols exporting.")
        addOption("cppexportcommon", true, "C++ export macro name for exporting explicit symbols from `common` dir.")
        addOption("internalprefix", true, "Name prefix for internal conversion functions in Swift.")
        addOption("libraryname", true, "Name of the generated library for some generators (e.g. Dart).")
        addOption("dartlookuperrormessage", true, "Custom error message for when Dart FFI function lookup fails.")
        addOption(
            "werror",
            "warning-as-error",
            true,
            "Treat the specified validation warning type as an error. Possible values: " +
                listOf(
                    GeneratorOptions.WARNING_DOC_LINKS,
                    GeneratorOptions.WARNING_DEPRECATED_ATTRIBUTES,
                    GeneratorOptions.WARNING_DART_OVERLOADS
                ).joinToString()
        )
        addOption(
            "swiftexpose",
            "swift-expose-internals",
            false,
            "Expose `internal` Swift generated code as `public` for reuse across several frameworks."
        )
        addOption("tag", true, "Add a custom tag for @Skip attributes.")
        addOption("cppnamerules", true, "C++ name rules property file.")
        addOption("javanamerules", true, "Java name rules property file.")
        addOption("swiftnamerules", true, "Swift name rules property file.")
        addOption("dartnamerules", true, "Dart name rules property file.")
    }

    @Throws(OptionReaderException::class)
    fun read(args: Array<String>): Pair<GluecodiumOptions, GeneratorOptions>? {
        val cmd = try {
            DefaultParser().parse(this.options, args)
        } catch (e: ParseException) {
            throw OptionReaderException(e)
        }

        if (cmd.hasOption("help")) {
            printUsage()
            return null
        }
        if (cmd.hasOption("version")) {
            return null
        }

        val optionsConfig = when {
            cmd.hasOption("options") -> readConfigFile(cmd.getOptionValue("options"))
            else -> null
        }
        fun getStringListValue(key: String) =
            cmd.getOptionValues(key)?.toList()
                ?: optionsConfig?.getOrNull(Key(key, listType(stringType)))
        fun getStringValue(key: String) =
            cmd.getOptionValues(key)?.also {
                if (it.size > 1) {
                    throw OptionReaderException("multiple values for option: $key")
                }
            }?.get(0) ?: optionsConfig?.getOrNull(Key(key, stringType))
        fun getFlagValue(key: String) =
            cmd.hasOption(key) || optionsConfig?.getOrNull(Key(key, booleanType)) == true

        val gluecodiumOptions = GluecodiumOptions()

        gluecodiumOptions.idlSources = getStringListValue("input") ?: emptyList()
        gluecodiumOptions.outputDir = getStringValue("output") ?: ""
        gluecodiumOptions.commonOutputDir = getStringValue("commonoutput") ?: gluecodiumOptions.outputDir
        gluecodiumOptions.auxiliaryIdlSources = getStringListValue("auxinput") ?: emptyList()
        gluecodiumOptions.generators = getStringListValue("generators")?.toSet() ?: emptySet()
        gluecodiumOptions.isValidatingOnly = getFlagValue("validate")
        gluecodiumOptions.isEnableCaching = getFlagValue("output") && getFlagValue("cache")

        val generatorOptions = GeneratorOptions()

        generatorOptions.javaPackages = getStringValue("javapackage")?.split(".") ?: emptyList()
        generatorOptions.javaNonNullAnnotation = parseAnnotation(getStringValue("javanonnullannotation"))
        generatorOptions.javaNullableAnnotation = parseAnnotation(getStringValue("javanullableannotation"))
        generatorOptions.javaInternalPackages = getStringValue("intpackage")?.split(".") ?: emptyList()

        generatorOptions.cppRootNamespace = getStringValue("cppnamespace")?.split(".") ?: emptyList()
        generatorOptions.cppInternalNamespace = getStringValue("intnamespace")?.split(".") ?: emptyList()
        getStringValue("cppexport")?.let { generatorOptions.cppExport = it }
        getStringValue("cppexportcommon")?.let { generatorOptions.cppExportCommon = it }
        getStringValue("internalprefix")?.let { generatorOptions.internalPrefix = it }
        getStringValue("libraryname")?.let { generatorOptions.libraryName = it }
        getStringValue("dartlookuperrormessage")?.let { generatorOptions.dartLookupErrorMessage = it }
        getStringListValue("werror")?.let { generatorOptions.werror = it.toSet() }

        generatorOptions.swiftExposeInternals = getFlagValue("swiftexpose")

        generatorOptions.cppNameRules = readConfigFile(getStringValue("cppnamerules"), generatorOptions.cppNameRules)
        generatorOptions.javaNameRules =
            readConfigFile(getStringValue("javanamerules"), generatorOptions.javaNameRules)
        generatorOptions.swiftNameRules =
            readConfigFile(getStringValue("swiftnamerules"), generatorOptions.swiftNameRules)
        generatorOptions.dartNameRules =
            readConfigFile(getStringValue("dartnamerules"), generatorOptions.dartNameRules)

        generatorOptions.copyrightHeaderContents = getStringValue("copyright")?.let { File(it).readText() }
        getStringListValue("tag")?.let { generatorOptions.tags = CaseInsensitiveSet(it) }

        return Pair(gluecodiumOptions, generatorOptions)
    }

    fun printUsage() {
        val header = "Gluecodium - Generate APIs from LimeIDL files\n\n"
        val footer = "\nPlease report issues here: https://github.com/heremaps/gluecodium/issues"
        HelpFormatter().printHelp("generate [input]", header, options, footer, true)
    }

    @Throws(OptionReaderException::class)
    private fun readConfigFile(path: String): Configuration {
        val nameRulesFile = File(path)
        if (!nameRulesFile.exists()) {
            val currentDir = Paths.get("").toAbsolutePath()
            throw OptionReaderException("File $path does not exit in $currentDir")
        }
        return ConfigurationProperties.fromFile(nameRulesFile)
    }

    @Throws(OptionReaderException::class)
    fun readConfigFile(configFilePath: String?, defaultConfig: Configuration) =
        configFilePath?.let { readConfigFile(it) overriding defaultConfig } ?: defaultConfig

    fun parseAnnotation(argument: String?) =
        argument?.split('.')?.let { Pair(it.last(), it.dropLast(1)) }
}
