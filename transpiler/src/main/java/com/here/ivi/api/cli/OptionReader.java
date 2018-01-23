/*
 * Copyright (C) 2017 HERE Global B.V. and its affiliate(s). All rights reserved.
 *
 * This software, including documentation, is protected by copyright controlled by
 * HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
 * adapting or translating, any or all of this material requires the prior written
 * consent of HERE Global B.V. This material also contains confidential information,
 * which may not be disclosed to others without prior written consent of HERE Global B.V.
 *
 */

package com.here.ivi.api.cli;

import com.google.common.base.Splitter;
import com.google.common.collect.Lists;
import com.here.ivi.api.platform.common.GeneratorSuite;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import lombok.Builder;
import lombok.Value;
import org.apache.commons.cli.*;

public final class OptionReader {

  private static final TranspilerOptions DEFAULT_OPTIONS = TranspilerOptions.builder().build();

  private final Options options;

  @Value
  @Builder(builderClassName = "Builder")
  public static class TranspilerOptions {
    private String[] inputDirs;
    private String outputDir;
    private List<String> javaPackageList;
    private boolean dumpingToStdout;
    private boolean validatingOnly;
    private Set<String> generators;
    private String androidMergeManifestPath;
    private boolean logTimes;
  }

  public OptionReader() {
    this.options = new Options();

    options.addOption("input", true, "The path or the file to use for generation");
    options.addOption("output", true, "Generated files output destination");
    options.addOption("javapackage", true, "Java package name");
    options.addOption(
        "androidMergeManifest",
        true,
        "A second AndroidManifest.xml that will be merged with the generated AndroidManifest.xml");
    options.addOption("nostdout", false, "Don't dump generated files to stdout");
    options.addOption("help", false, "Shows this help and exits.");
    options.addOption("listGenerators", false, "Prints out all available generators and exits.");
    options.addOption(
        "validateOnly",
        false,
        "Perform fidl and fdepl files validation without generating any code.");
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
    options.addOption(generatorsOpt);
    options.addOption(
        "timeLogging",
        false,
        "Enables logging of transpilation- and franca model loading-times at INFO level.");
  }

  @SuppressWarnings("PMD.ModifiedCyclomaticComplexity")
  public TranspilerOptions read(final String[] args) throws OptionReaderException {
    TranspilerOptions.Builder builder = TranspilerOptions.builder();
    CommandLineParser parser = new BasicParser();

    try {
      CommandLine cmd = parser.parse(options, args);

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

      builder.outputDir(cmd.hasOption("output") ? cmd.getOptionValue("output") : null);
      builder.javaPackageList(
          cmd.hasOption("javapackage")
              ? Lists.newArrayList(Splitter.on(".").split(cmd.getOptionValue("javapackage")))
              : Collections.emptyList());

      if (cmd.hasOption("androidMergeManifest")) {
        builder.androidMergeManifestPath(cmd.getOptionValue("androidMergeManifest"));
      }
      if (cmd.hasOption("generators")) {
        String[] arg = cmd.getOptionValues("generators");
        // use all generators if option provided without argument
        builder.generators(
            arg != null ? new HashSet<>(Arrays.asList(arg)) : GeneratorSuite.generatorShortNames());
      }

      builder.validatingOnly(cmd.hasOption("validateOnly"));
      builder.dumpingToStdout(!cmd.hasOption("nostdout"));

      builder.logTimes(cmd.hasOption("timeLogging"));

    } catch (ParseException e) {
      throw new OptionReaderException(e);
    }

    // Validation
    TranspilerOptions transpilerOptions = builder.build();
    if (transpilerOptions.getInputDirs() == null || transpilerOptions.getInputDirs().length == 0) {
      throw new OptionReaderException("input option required");
    }

    return transpilerOptions;
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
      System.out.println("");
    }
  }

  public void printUsage() {
    String header = "Transpiler - Generate APIs for franca files\n\n";
    String footer = "\nPlease report issues at /dev/null";

    HelpFormatter formatter = new HelpFormatter();
    formatter.printHelp("transpiler [input]", header, options, footer, true);
  }
}
