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

import com.android.manifmerger.Merger;
import com.google.common.annotations.VisibleForTesting;
import com.here.ivi.api.cli.OptionReader;
import com.here.ivi.api.cli.OptionReaderException;
import com.here.ivi.api.cli.TranspilerExecutionException;
import com.here.ivi.api.common.TimeLogger;
import com.here.ivi.api.generator.common.GeneratedFile;
import com.here.ivi.api.generator.common.Version;
import com.here.ivi.api.loader.FrancaModelLoader;
import com.here.ivi.api.logger.TranspilerLogger;
import com.here.ivi.api.model.franca.FrancaDeploymentModel;
import com.here.ivi.api.model.franca.ModelHelper;
import com.here.ivi.api.output.ConsoleOutput;
import com.here.ivi.api.output.FileOutput;
import com.here.ivi.api.platform.common.GeneratorSuite;
import com.here.ivi.api.validator.*;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;
import java.util.*;
import java.util.concurrent.TimeUnit;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import org.franca.core.franca.FTypeCollection;
import org.jetbrains.annotations.NotNull;

public class Transpiler {

  private static final Logger LOGGER = Logger.getLogger(Transpiler.class.getName());

  private final OptionReader.TranspilerOptions options;
  private final Version version;

  @VisibleForTesting
  Transpiler(final OptionReader.TranspilerOptions options) {
    this.options = options;
    TranspilerLogger.initialize("logging.properties");
    version = parseVersion();
  }

  private static Version parseVersion() {

    Properties prop = new Properties();
    try {
      InputStream stream =
          Transpiler.class.getClassLoader().getResourceAsStream("version.properties");
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

  @VisibleForTesting
  boolean execute() {
    LOGGER.info("Version: " + version);

    List<File> inputDirs =
        Arrays.stream(options.getInputDirs()).map(File::new).collect(Collectors.toList());
    List<FTypeCollection> typeCollections = new LinkedList<>();
    TimeLogger times = new TimeLogger(LOGGER, TimeUnit.MILLISECONDS, Level.INFO);
    times.start();
    FrancaDeploymentModel deploymentModel = loadModel(inputDirs, typeCollections);
    times.addLogEntry("model loading");

    if (deploymentModel == null) {
      return false;
    }
    if (options.isValidatingOnly()) {
      return true;
    }

    Map<String, String> fileNamesCache = new HashMap<>();
    boolean result =
        discoverGenerators()
            .stream()
            .allMatch(
                generatorName ->
                    executeGenerator(
                        generatorName, deploymentModel, typeCollections, fileNamesCache));
    times.addLogEntry("code generation (including file output)");
    if (options.isLogTimes()) {
      times.log();
    }
    return result;
  }

  @VisibleForTesting
  FrancaDeploymentModel loadModel(
      final List<File> inputDirs, final List<FTypeCollection> typeCollections) {

    Collection<File> inputFiles = FrancaModelLoader.listFilesRecursively(inputDirs);

    FrancaModelLoader francaModelLoader = getFrancaModelLoader();
    if (!FrancaResourcesValidator.validate(
        francaModelLoader.getResourceSetProvider().get(), inputFiles)) {
      LOGGER.severe("Validation of Franca files Failed");
      return null;
    }

    FrancaDeploymentModel deploymentModel =
        francaModelLoader.load(GeneratorSuite.getSpecPath(), inputFiles, typeCollections);
    LOGGER.fine("Built franca model");

    if (!validateFrancaModel(deploymentModel, typeCollections)) {
      LOGGER.severe("Validation of Franca model Failed");
      return null;
    }

    return deploymentModel;
  }

  @VisibleForTesting
  boolean executeGenerator(
      final String generatorName,
      final FrancaDeploymentModel deploymentModel,
      final List<FTypeCollection> typeCollections,
      final Map<String, String> fileNamesCache) {

    LOGGER.fine("Using generator " + generatorName);
    GeneratorSuite generator = GeneratorSuite.instantiateByShortName(generatorName, options);
    if (generator == null) {
      LOGGER.severe("Failed instantiation of generator '" + generatorName + "'");
      return false;
    }
    LOGGER.fine("Instantiated generator " + generator.getName());

    List<GeneratedFile> outputFiles = generator.generate(deploymentModel, typeCollections);

    boolean outputSuccessful = output(outputFiles);
    boolean processedWithoutCollisions =
        checkForFileNameCollisions(fileNamesCache, outputFiles, generatorName);

    if (generatorName.equals("android")
        && options.getAndroidMergeManifestPath() != null
        && outputSuccessful
        && processedWithoutCollisions) {

      String baseManifestPath =
          Paths.get(options.getOutputDir(), "android", "AndroidManifest.xml").toString();
      return mergeAndroidManifests(
          baseManifestPath, options.getAndroidMergeManifestPath(), baseManifestPath);
    }

    return processedWithoutCollisions && outputSuccessful;
  }

  @NotNull
  @VisibleForTesting
  FrancaModelLoader getFrancaModelLoader() {
    FrancaModelLoader francaModelLoader = new FrancaModelLoader();
    ModelHelper.getFdeplInjector().injectMembers(francaModelLoader);
    return francaModelLoader;
  }

  @VisibleForTesting
  static boolean mergeAndroidManifests(
      String baseManifestPath, String appendManifestPath, String outputFilePath) {
    Merger merger = new Merger();
    String[] mergerArgs = {
      "--main", baseManifestPath,
      "--overlays", appendManifestPath,
      "--out", outputFilePath
    };
    try {
      return merger.process(mergerArgs) == 0;
    } catch (FileNotFoundException e) {
      LOGGER.severe("Could not merge base Android Manifest files: " + e.getMessage());
    }
    return false;
  }

  @VisibleForTesting
  Set<String> discoverGenerators() {
    Set<String> generators = options.getGenerators();
    if (generators != null) {
      LOGGER.fine("Following generators were specified on command line: " + generators);
    } else {
      generators = GeneratorSuite.generatorShortNames();
      LOGGER.fine("No generators specified, using all available generators: " + generators);
    }
    return generators;
  }

  @VisibleForTesting
  boolean output(List<GeneratedFile> files) {

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

    return saveToDirectory(options.getOutputDir(), files);
  }

  @VisibleForTesting
  static boolean saveToDirectory(final String outputDir, final List<GeneratedFile> files) {

    if (outputDir != null) {
      try {
        FileOutput fileOutput = new FileOutput(new File(outputDir));
        fileOutput.output(files);
      } catch (IOException ignored) {
        LOGGER.severe("Cannot open output directory '" + outputDir + "' for writing");
        return false;
      }
    }

    return true;
  }

  /**
   * Uses the internal validators to validate the model.
   *
   * @return boolean True if the model is valid, false otherwise.
   */
  @VisibleForTesting
  boolean validateFrancaModel(
      final FrancaDeploymentModel deploymentModel, final List<FTypeCollection> typeCollections) {

    FrancaModelValidator modelValidator =
        new FrancaModelValidator(
            Arrays.asList(
                new DefaultsValidatorPredicate(),
                new ExpressionValidatorPredicate(),
                new MapKeyValidatorPredicate(),
                new IntegerIntervalValidatorPredicate(),
                new StaticMethodsValidatorPredicate(),
                new ErrorEnumsValidatorPredicate(),
                new InheritanceValidatorPredicate(),
                new UnionsValidatorPredicate(),
                new SerializationValidatorPredicate()));

    boolean nameValidationResult = NameValidator.validate(typeCollections);
    boolean modelValidationResult = modelValidator.validate(deploymentModel, typeCollections);

    return nameValidationResult && modelValidationResult;
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
