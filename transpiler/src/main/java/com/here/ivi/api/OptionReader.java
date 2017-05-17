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

package com.here.ivi.api;

import com.here.ivi.api.generator.common.GeneratorSuite;
import java.lang.reflect.InvocationTargetException;
import java.util.Arrays;
import java.util.List;
import org.apache.commons.cli.*;

public class OptionReader {

  public static class TranspilerOptions {
    public String getInputDir() {
      return inputDir;
    }

    public String getOutputDir() {
      return outputDir;
    }

    public boolean dumpToStdout() {
      return stdoutDump;
    }

    public List<String> getGenerators() {
      return generators;
    }

    public boolean validateOnly() {
      return validateOnly;
    }

    protected String inputDir;

    protected String outputDir;
    protected boolean stdoutDump;
    protected boolean validateOnly = false;

    protected List<String> generators;
  }

  public OptionReader() {
    this.options = new Options();

    options.addOption("input", true, "The path or the file to use for generation");
    options.addOption("output", true, "Generated files output destination");
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
  }

  public TranspilerOptions read(final String[] args) throws OptionReaderException {
    TranspilerOptions res = new TranspilerOptions();
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

      String[] remainingArgs = cmd.getArgs();
      if (remainingArgs.length > 1) {
        throw new OptionReaderException("too many arguments");
      }

      if (cmd.hasOption("input")) {
        res.inputDir = cmd.getOptionValue("input");
      } else if (remainingArgs.length == 1) {
        res.inputDir = remainingArgs[0];
      }

      if (cmd.hasOption("output")) {
        res.outputDir = cmd.getOptionValue("output");

      } else {
        res.outputDir = null;
      }

      if (cmd.hasOption("generators")) {
        String[] arg = cmd.getOptionValues("generators");
        // use all generators if option provided without argument
        if (arg == null) {
          res.generators = GeneratorSuite.generatorShortNames();
        } else {
          res.generators = Arrays.asList(arg);
        }
      }

      if (cmd.hasOption("validateOnly")) {
        res.validateOnly = true;
      }

      res.stdoutDump = !cmd.hasOption("nostdout");

    } catch (ParseException e) {
      throw new OptionReaderException(e.getMessage());
    }

    if (res.inputDir == null) {
      throw new OptionReaderException("input option required");
    }

    return res;
  }

  private void printGenerators() {
    System.out.println("Available generators: \n");
    //logger.log(Level.INFO, "Available generators:");

    for (String sn : GeneratorSuite.generatorShortNames()) {
      System.out.println("  Found generator " + sn);
      //logger.log(Level.INFO, " Found generator ");

      try {
        GeneratorSuite gen = GeneratorSuite.instantiateByShortName(sn, null);
        System.out.println("   DefinedIn:  " + gen.getClass().getName());
        System.out.println("   Name:       " + gen.getName());
        System.out.println("   Version:    " + gen.getVersion());
      } catch (NoSuchMethodException
          | IllegalAccessException
          | InvocationTargetException
          | InstantiationException e) {
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

  private final Options options;
}
