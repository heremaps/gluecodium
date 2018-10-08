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

package com.here.genium.cli;

import com.google.common.base.Splitter;
import com.google.common.collect.Lists;
import com.here.genium.Genium;
import com.here.genium.platform.common.GeneratorSuite;
import java.util.*;
import org.apache.commons.cli.*;
import org.apache.commons.lang3.StringUtils;
import org.eclipse.xtext.util.Files;

public final class OptionReader {

  private final Options allOptions;

  public OptionReader() {
    this.allOptions = new Options();

    allOptions.addOption("input", true, "The path or the file to use for generation");
    allOptions.addOption("output", true, "Generated files output destination");
    allOptions.addOption("javapackage", true, "Java package name");
    allOptions.addOption(
        "mergemanifest",
        "android-merge-manifest",
        true,
        "A second AndroidManifest.xml that will be merged with the generated AndroidManifest.xml");
    allOptions.addOption("stdout", false, "Echo generated files to stdout");
    allOptions.addOption("help", false, "Shows this help and exits.");
    allOptions.addOption(
        "validate",
        "validate-only",
        false,
        "Perform fidl and fdepl files validation without generating any code.");
    allOptions.addOption(
        "cache",
        "enable-caching",
        false,
        "enable caching of output files, only available if output destination is set");
    Option generatorsOpt =
        new Option(
            "generators",
            true,
            String.join(
                "\n",
                "List of generators to use, separated by comma. "
                    + "If empty, all available generators are used. Available generators: "
                    + String.join(",", GeneratorSuite.generatorShortNames())));
    generatorsOpt.setValueSeparator(',');
    generatorsOpt.setOptionalArg(true);
    generatorsOpt.setArgs(Option.UNLIMITED_VALUES);
    allOptions.addOption(generatorsOpt);
    allOptions.addOption(
        "time",
        "time-logging",
        false,
        "Enables logging of elapsed time at INFO level. "
            + "Time for Franca model loading step and for code generation step is logged separately.");
    allOptions.addOption(
        "copyright",
        "copyright-header",
        true,
        "Specify the path for the file containing the copyright header that will be appended to"
            + " all the generated files.");
    allOptions.addOption(
        "intnamespace",
        "cpp-internal-namespace",
        true,
        "C++ namespace for internal (non-API) headers.");
    allOptions.addOption("cppnamespace", true, "C++ namespace for public (API) headers.");

    allOptions.addOption("androidMergeManifest", true, "DEPRECATED");
    allOptions.addOption("copyrightHeader", true, "DEPRECATED");
    allOptions.addOption("cppInternalNamespace", true, "DEPRECATED");
    allOptions.addOption("enableCaching", false, "DEPRECATED");
    allOptions.addOption("nostdout", false, "DEPRECATED");
    allOptions.addOption("timeLogging", false, "DEPRECATED");
    allOptions.addOption("validateOnly", false, "DEPRECATED");
  }

  @SuppressWarnings("PMD.ModifiedCyclomaticComplexity")
  public Genium.Options read(final String[] args) throws OptionReaderException {
    Genium.Options.Builder builder = Genium.Options.builder();
    CommandLineParser parser = new BasicParser();

    try {
      CommandLine cmd = parser.parse(allOptions, args);

      if (cmd.hasOption("help")) {
        printUsage();
        return null;
      }

      if (cmd.hasOption("input")) {
        builder.inputDirs(cmd.getOptionValues("input"));
      }

      builder.outputDir(getSingleOptionValue(cmd, "output"));
      String javaPackage = getSingleOptionValue(cmd, "javapackage");
      builder.javaPackageList(
          javaPackage != null
              ? Lists.newArrayList(Splitter.on(".").split(javaPackage))
              : Collections.emptyList());

      String mergeManifestPath = getSingleOptionValue(cmd, "mergemanifest");
      if (mergeManifestPath == null) {
        mergeManifestPath = getSingleOptionValue(cmd, "androidMergeManifest");
      }
      builder.androidMergeManifestPath(mergeManifestPath);

      if (cmd.hasOption("generators")) {
        String[] arg = cmd.getOptionValues("generators");
        // use all generators if option provided without argument
        builder.generators(
            arg != null ? new HashSet<>(Arrays.asList(arg)) : GeneratorSuite.generatorShortNames());
      }

      builder.validatingOnly(cmd.hasOption("validate") || cmd.hasOption("validateOnly"));
      builder.dumpingToStdout(cmd.hasOption("stdout"));
      builder.enableCaching(
          cmd.hasOption("output") && (cmd.hasOption("cache") || cmd.hasOption("enableCaching")));

      builder.logTimes(cmd.hasOption("time") || cmd.hasOption("timeLogging"));

      String cppRootNamespaces = getSingleOptionValue(cmd, "cppnamespace");
      builder.cppRootNamespace(
          !StringUtils.isEmpty(cppRootNamespaces)
              ? Arrays.asList(cppRootNamespaces.split("."))
              : Collections.emptyList());

      String cppInternalNamespace = getSingleOptionValue(cmd, "intnamespace");
      if (cppInternalNamespace == null) {
        cppInternalNamespace =
            cmd.getOptionValue("cppInternalNamespace", Genium.DEFAULT_INTERNAL_NAMESPACE);
      }
      builder.cppInternalNamespace(cppInternalNamespace);

      String copyrightHeader = cmd.getOptionValue("copyright");
      if (copyrightHeader == null) {
        copyrightHeader = cmd.getOptionValue("copyrightHeader");
      }
      if (copyrightHeader != null) {
        String copyrightHeaderFile = cmd.getOptionValue("copyrightHeader");
        String contents = Files.readFileIntoString(copyrightHeaderFile);
        builder.copyrightHeaderContents(contents);
      }
    } catch (ParseException e) {
      throw new OptionReaderException(e);
    }

    // Validation
    Genium.Options options = builder.build();
    if (options.getInputDirs() == null || options.getInputDirs().length == 0) {
      throw new OptionReaderException("input option required");
    }

    return options;
  }

  public void printUsage() {
    String header = "Genium - Generate APIs from Franca IDL files\n\n";
    String footer = "\nPlease report issues at /dev/null";

    HelpFormatter formatter = new HelpFormatter();
    formatter.printHelp("generate [input]", header, allOptions, footer, true);
  }

  private static String getSingleOptionValue(final CommandLine cmd, final String option)
      throws OptionReaderException {
    String[] result = cmd.getOptionValues(option);

    if (result == null) {
      return null;
    }
    if (result.length != 1) {
      throw new OptionReaderException("multiple values for option: " + option);
    }
    return result[0];
  }
}
