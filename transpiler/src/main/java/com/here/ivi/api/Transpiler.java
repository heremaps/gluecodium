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

import com.here.ivi.api.generator.common.GeneratedFile;
import com.here.ivi.api.generator.common.GeneratorSuite;
import com.here.ivi.api.generator.common.Version;
import com.here.ivi.api.logger.TranspilerLogger;
import com.here.ivi.api.output.ConsoleOutput;
import com.here.ivi.api.output.FileOutput;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

public final class Transpiler {

  private static final Logger LOGGER = Logger.getLogger(Transpiler.class.getName());

  private final OptionReader.TranspilerOptions options;
  private final Version version;

  private Transpiler(final OptionReader.TranspilerOptions options) {
    this.options = options;
    TranspilerLogger.initialize("logging.properties");
    version = parseVersion();
  }

  private Version parseVersion() {

    Properties prop = new Properties();
    try {
      InputStream stream =
          this.getClass().getClassLoader().getResourceAsStream("version.properties");
      prop.load(stream);
    } catch (IOException ex) {
      ex.printStackTrace();
    }

    return Version.createFromString(prop.getProperty("version", "0.0.1"));
  }

  private static boolean checkForFileNameCollisions(
      Map<String, String> fileNamesCache, List<GeneratedFile> files, String generatorName) {
    boolean succeeded = true;
    for (GeneratedFile file : files) {
      String path = file.targetFile.getPath();
      String previousEntry = fileNamesCache.get(path);
      if (previousEntry == null) {
        fileNamesCache.put(path, generatorName);
      } else {
        LOGGER.severe(
            String.format(
                "Generator '%s' is overwriting file %s created already by '%s' ",
                generatorName, path, previousEntry));
        succeeded = false;
      }
    }
    return succeeded;
  }

  private boolean execute() {
    //Generation
    List<String> generators = discoverGenerators();
    boolean succeeded = true;
    Map<String, String> fileNamesCache = new HashMap<>();

    LOGGER.info("Version: " + version);
    for (String sn : generators) {
      LOGGER.info("Using generator " + sn);

      try {
        GeneratorSuite generator = GeneratorSuite.instantiateByShortName(sn, options);
        LOGGER.info("Instantiated generator " + generator.getName());

        generator.buildModel(options.getInputDir());
        LOGGER.info("Built franca model");

        boolean valid = generator.validate();
        LOGGER.info(valid ? "Validation Succeeded" : "Validation Failed");

        if (options.isValidatingOnly()) {
          succeeded = succeeded && valid;
          continue;
        }

        if (valid) {
          List<GeneratedFile> outputFiles = generator.generate();
          boolean processedWithoutCollisions =
              checkForFileNameCollisions(fileNamesCache, outputFiles, sn);
          succeeded = succeeded && processedWithoutCollisions && output(outputFiles);
        }

        succeeded = succeeded && valid;
      } catch (IllegalAccessException
          | InstantiationException
          | NoSuchMethodException
          | InvocationTargetException e) {
        LOGGER.severe("Failed instantiation of generator '" + sn + "'");
        succeeded = false;
      }
    }

    return succeeded;
  }

  private List<String> discoverGenerators() {
    List<String> generators = options.getGenerators();
    if (generators != null) {
      LOGGER.info("Following generators were specified on command line: " + generators);
      return generators;
    }
    LOGGER.info("No generators specified, using auto-discovery");
    List<String> availableGenerators = GeneratorSuite.generatorShortNames();
    try {
      generators = GeneratorSuite.generatorsFromFdepl(options);
      if (generators.isEmpty()) {
        LOGGER.info(
            "No generators discovered, switching to use all available: " + availableGenerators);
      }
    } catch (NoSuchMethodException
        | InstantiationException
        | IllegalAccessException
        | InvocationTargetException e) {
      LOGGER.warning(
          "Auto-discovery failed, using all available generators: " + availableGenerators);
    }
    if (generators == null || generators.isEmpty()) {
      generators = availableGenerators;
    }
    return generators;
  }

  public boolean output(List<GeneratedFile> files) {
    // handle output options
    if (options.isDumpingToStdout()) {
      try {
        ConsoleOutput co = new ConsoleOutput();
        co.output(files);
      } catch (IOException ignored) {
        LOGGER.severe("Cannot open console for output");
        return false;
      }
    }

    String outdir = options.getOutputDir();
    if (outdir != null) {
      try {
        FileOutput fo = new FileOutput(new File(outdir));
        fo.output(files);
      } catch (IOException ignored) {
        LOGGER.severe("Cannot open output directory " + outdir + " for writing");
        return false;
      }
    }
    return true;
  }

  public Version getVersion() {
    return version;
  }

  public String getName() {
    return "com.here.Transpiler";
  }

  public static void main(final String[] args) {
    OptionReader or = new OptionReader();
    int status = 1;
    try {
      OptionReader.TranspilerOptions options = or.read(args);
      status = (options == null || new Transpiler(options).execute()) ? 0 : 1;
    } catch (TranspilerExecutionException e) {
      LOGGER.log(Level.SEVERE, "Running Transpiler failed!", e);
    } catch (OptionReaderException e) {
      LOGGER.severe("Failed reading options: " + e.getMessage());
      or.printUsage();
    }

    System.exit(status);
  }
}
