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
import java.lang.reflect.InvocationTargetException;
import java.net.URI;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Transpiler {

  private static final Logger logger = Logger.getLogger(Transpiler.class.getName());

  public static void main(final String[] args) {

    OptionReader or = new OptionReader();
    int status = 1;
    try {
      OptionReader.TranspilerOptions options = or.read(args);
      status = (options == null || new Transpiler(options).execute()) ? 0 : 1;
    } catch (TranspilerExecutionException e) {
      logger.log(Level.SEVERE, "Running Transpiler failed!", e);
    } catch (OptionReaderException e) {
      logger.severe("Failed reading options: " + e.getMessage());
      or.printUsage();
    }

    System.exit(status);
  }

  private Transpiler(OptionReader.TranspilerOptions options) {
    this.options = options;
    TranspilerLogger.initialize("com/here/ivi/api/logger/logging.properties");
  }

  private boolean execute() {

    //Generation
    List<String> generators = discoverGenerators();
    boolean succeeded = true;

    for (String sn : generators) {
      logger.info("Using generator " + sn);

      try {

        GeneratorSuite generator = GeneratorSuite.instantiateByShortName(sn, this);
        logger.info("Instantiated generator " + generator.getName() + " " + generator.getVersion());

        generator.buildModel(options.getInputDir());
        logger.info("Built franca model");

        boolean valid = generator.validate();
        logger.info(valid ? "Validation Succeeded" : "Validation Failed");

        if (options.validateOnly()) {
          succeeded = succeeded && valid;
          continue;
        }

        if (valid) {
          List<GeneratedFile> outputFiles = generator.generate();
          output(outputFiles);
        }

        succeeded = succeeded && valid;
      } catch (IllegalAccessException
          | InstantiationException
          | NoSuchMethodException
          | InvocationTargetException e) {
        logger.severe("Failed instantiation of generator '" + sn + "'");
        succeeded = false;
      }
    }

    return succeeded;
  }

  private List<String> discoverGenerators() {
    List<String> generators = options.getGenerators();
    if (generators != null) {
      logger.info("Following generators were specified on command line: " + generators);
      return generators;
    }
    logger.info("No generators specified, using auto-discovery");
    List<String> availableGenerators = GeneratorSuite.generatorShortNames();
    try {
      generators = GeneratorSuite.generatorsFromFdepl(options.getInputDir(), this);
      if (generators.isEmpty()) {
        logger.info(
            "No generators discovered, switching to use all available: " + availableGenerators);
      }
    } catch (NoSuchMethodException
        | InstantiationException
        | IllegalAccessException
        | InvocationTargetException e) {
      logger.warning(
          "Auto-discovery failed, using all available generators: " + availableGenerators);
    }
    if (generators == null || generators.isEmpty()) {
      generators = availableGenerators;
    }
    return generators;
  }

  public void output(List<GeneratedFile> files) {
    // handle output options
    if (options.dumpToStdout()) {
      try {
        ConsoleOutput co = new ConsoleOutput();
        co.output(files);
      } catch (IOException ignored) {
      }
    }

    String outdir = options.getOutputDir();
    if (outdir != null) {
      try {
        FileOutput fo = new FileOutput(new File(outdir));
        fo.output(files);
      } catch (IOException ignored) {
      }
    }
  }

  public Version getVersion() {
    return new Version(0, 0, 1);
  }

  public String getName() {
    return "com.here.Transpiler";
  }

  public String resolveRelativeToRootPath(String other) throws IOException {
    File rootFile = new File(options.getInputDir());
    if (rootFile.isFile()) {
      rootFile = rootFile.getParentFile();
    }
    final URI parentURI = URI.create(rootFile.getCanonicalPath());
    final URI childURI = URI.create(other);
    return parentURI.relativize(childURI).toString();
  }

  private final OptionReader.TranspilerOptions options;
}
