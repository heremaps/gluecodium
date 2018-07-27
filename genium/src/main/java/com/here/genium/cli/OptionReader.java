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
import com.here.genium.platform.common.GeneratorSuite;
import java.util.*;
import org.apache.commons.cli.*;
import org.eclipse.xtext.util.Files;

public final class OptionReader {

  private static final String DEFAULT_INTERNAL_NAMESPACE = "genium";
  public static final GeniumOptions DEFAULT_OPTIONS =
      GeniumOptions.builder().cppInternalNamespace(DEFAULT_INTERNAL_NAMESPACE).build();

  private final Options allOptions;

  @lombok.Value
  @lombok.Builder(builderClassName = "Builder")
  public static class GeniumOptions {
    private String[] inputDirs;
    private String outputDir;
    private List<String> javaPackageList;
    private boolean dumpingToStdout;
    private boolean validatingOnly;
    private Set<String> generators;
    private boolean enableCaching;
    private String androidMergeManifestPath;
    private boolean logTimes;
    private String copyrightHeaderContents;
    private String cppInternalNamespace;
  }

  public OptionReader() {
    this.allOptions = new Options();

    allOptions.addOption("input", true, "The path or the file to use for generation");
    allOptions.addOption("output", true, "Generated files output destination");
    allOptions.addOption("javapackage", true, "Java package name");
    allOptions.addOption(
        "androidMergeManifest",
        true,
        "A second AndroidManifest.xml that will be merged with the generated AndroidManifest.xml");
    allOptions.addOption("nostdout", false, "Don't dump generated files to stdout");
    allOptions.addOption("help", false, "Shows this help and exits.");
    allOptions.addOption("listGenerators", false, "Prints out all available generators and exits.");
    allOptions.addOption(
        "validateOnly",
        false,
        "Perform fidl and fdepl files validation without generating any code.");
    allOptions.addOption(
        "enableCaching",
        false,
        "enable caching of output files, only available if output destination is set");
    Option generatorsOpt =
        new Option(
            "generators",
            true,
            String.join(
                "\n",
                "List of generators to use, separated by comma,",
                "if empty <arg> provided - uses all available generators.",
                "Default behaviour - uses automatic generator resolution based on .fdepl files provided."));
    generatorsOpt.setValueSeparator(',');
    generatorsOpt.setOptionalArg(true);
    generatorsOpt.setArgs(Option.UNLIMITED_VALUES);
    allOptions.addOption(generatorsOpt);
    allOptions.addOption(
        "timeLogging",
        false,
        "Enables logging of transpilation- and franca model loading-times at INFO level.");
    allOptions.addOption(
        "copyrightHeader",
        true,
        "Specify the path for the file containing the copyright header that will be appended to"
            + " all the generated files.");
    allOptions.addOption(
        "cppInternalNamespace", true, "C++ namespace for internal (non-API) headers.");
  }

  @SuppressWarnings("PMD.ModifiedCyclomaticComplexity")
  public GeniumOptions read(final String[] args) throws OptionReaderException {
    GeniumOptions.Builder builder = GeniumOptions.builder();
    CommandLineParser parser = new BasicParser();

    try {
      CommandLine cmd = parser.parse(allOptions, args);

      if (cmd.hasOption("listGenerators")) {
        printGenerators();
        return null;
      }

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

      builder.androidMergeManifestPath(getSingleOptionValue(cmd, "androidMergeManifest"));

      if (cmd.hasOption("generators")) {
        String[] arg = cmd.getOptionValues("generators");
        // use all generators if option provided without argument
        builder.generators(
            arg != null ? new HashSet<>(Arrays.asList(arg)) : GeneratorSuite.generatorShortNames());
      }

      builder.validatingOnly(cmd.hasOption("validateOnly"));
      builder.dumpingToStdout(!cmd.hasOption("nostdout"));
      builder.enableCaching(cmd.hasOption("output") && cmd.hasOption("enableCaching"));

      builder.logTimes(cmd.hasOption("timeLogging"));
      builder.cppInternalNamespace(
          cmd.getOptionValue("cppInternalNamespace", DEFAULT_INTERNAL_NAMESPACE));

      if (cmd.hasOption("copyrightHeader")) {
        String copyrightHeaderFile = cmd.getOptionValue("copyrightHeader");
        String contents = Files.readFileIntoString(copyrightHeaderFile);
        builder.copyrightHeaderContents(contents);
      }
    } catch (ParseException e) {
      throw new OptionReaderException(e);
    }

    // Validation
    GeniumOptions options = builder.build();
    if (options.getInputDirs() == null || options.getInputDirs().length == 0) {
      throw new OptionReaderException("input option required");
    }

    return options;
  }

  private void printGenerators() {
    System.out.println("Available generators: \n");
    for (String generatorName : GeneratorSuite.generatorShortNames()) {
      System.out.println("  Found generator " + generatorName);

      GeneratorSuite generator =
          GeneratorSuite.instantiateByShortName(generatorName, DEFAULT_OPTIONS);
      if (generator != null) {
        System.out.println("   DefinedIn:  " + generator.getClass().getName());
        System.out.println("   Name:       " + generator.getName());
      } else {
        System.err.println("   Instantiation failed!");
      }
      System.out.println();
    }
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
