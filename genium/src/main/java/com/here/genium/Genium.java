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

package com.here.genium;

import com.android.manifmerger.Merger;
import com.google.common.annotations.VisibleForTesting;
import com.here.genium.cache.CachingStrategy;
import com.here.genium.cache.CachingStrategyCreator;
import com.here.genium.cli.*;
import com.here.genium.common.TimeLogger;
import com.here.genium.generator.common.*;
import com.here.genium.generator.common.templates.TemplateEngine;
import com.here.genium.loader.FrancaModelLoader;
import com.here.genium.logger.GeniumLogger;
import com.here.genium.model.franca.FrancaDeploymentModel;
import com.here.genium.model.franca.ModelHelper;
import com.here.genium.output.ConsoleOutput;
import com.here.genium.output.FileOutput;
import com.here.genium.platform.android.AndroidGeneratorSuite;
import com.here.genium.platform.common.GeneratorSuite;
import com.here.genium.validator.*;
import com.here.genium.validator.visibility.*;
import java.io.*;
import java.nio.file.Paths;
import java.util.*;
import java.util.concurrent.TimeUnit;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import org.franca.core.franca.FTypeCollection;
import org.jetbrains.annotations.NotNull;

public class Genium {

  private static final Logger LOGGER = Logger.getLogger(Genium.class.getName());

  private final OptionReader.GeniumOptions options;
  private final Version version;
  private final CachingStrategy cacheStrategy;

  @VisibleForTesting
  Genium(final OptionReader.GeniumOptions options) {
    this.options = options;
    GeniumLogger.initialize("logging.properties");
    version = parseVersion();
    cacheStrategy =
        CachingStrategyCreator.initializeCaching(
            options.isEnableCaching(),
            options.getOutputDir(),
            GeneratorSuite.generatorShortNames());
  }

  private static Version parseVersion() {

    Properties prop = new Properties();
    try {
      InputStream stream = Genium.class.getClassLoader().getResourceAsStream("version.properties");
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

    TemplateEngine.initCopyrightHeaderContents(options.getCopyrightHeaderContents());

    Map<String, String> fileNamesCache = new HashMap<>();
    boolean executionSucceeded = false;
    try {
      executionSucceeded =
          discoverGenerators()
              .stream()
              .allMatch(
                  generatorName ->
                      executeGenerator(
                          generatorName, deploymentModel, typeCollections, fileNamesCache));
    } finally {
      // cache has to be updated in any case
      executionSucceeded = cacheStrategy.write(executionSucceeded);

      times.addLogEntry("code generation (including file output)");
    }
    if (options.isLogTimes()) {
      times.log();
    }
    return executionSucceeded;
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
        francaModelLoader.load(GeneratorSuite.SPEC_PATH, inputFiles, typeCollections);
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

    boolean outputSuccessful = output(generatorName, outputFiles);
    boolean processedWithoutCollisions =
        checkForFileNameCollisions(fileNamesCache, outputFiles, generatorName);

    if (AndroidGeneratorSuite.GENERATOR_NAME.equals(generatorName)
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
  boolean output(final String generatorName, List<GeneratedFile> files) {

    // handle output options
    if (options.isDumpingToStdout()) {
      ConsoleOutput co = new ConsoleOutput();
      co.output(files);
    }
    List<GeneratedFile> filesToBeWritten = cacheStrategy.updateCache(generatorName, files);
    return saveToDirectory(options.getOutputDir(), filesToBeWritten);
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
                new SerializationValidatorPredicate(),
                new EquatableValidatorPredicate(),
                new InterfaceVisibilityValidatorPredicate(),
                new AttributeVisibilityValidatorPredicate(),
                new MethodVisibilityValidatorPredicate(),
                new StructVisibilityValidatorPredicate(),
                new FieldVisibilityValidatorPredicate(),
                new ArrayVisibilityValidatorPredicate(),
                new ExternalFieldsValidatorPredicate(),
                new ExternalTypesValidatorPredicate()));

    boolean nameValidationResult = NameValidator.validate(typeCollections);
    boolean modelValidationResult = modelValidator.validate(deploymentModel, typeCollections);

    return nameValidationResult && modelValidationResult;
  }

  public static void main(final String[] args) {
    OptionReader or = new OptionReader();
    int status = 1;
    try {
      OptionReader.GeniumOptions options = or.read(args);
      status = (options == null || new Genium(options).execute()) ? 0 : 1;
    } catch (GeniumExecutionException e) {
      LOGGER.log(Level.SEVERE, "Running Genium failed!", e);
    } catch (OptionReaderException e) {
      LOGGER.severe("Failed reading options: " + e.getMessage());
      or.printUsage();
    }

    System.exit(status);
  }
}
