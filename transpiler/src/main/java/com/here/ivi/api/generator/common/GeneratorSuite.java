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

package com.here.ivi.api.generator.common;

import com.here.ivi.api.OptionReader;
import com.here.ivi.api.TranspilerExecutionException;
import com.here.ivi.api.generator.android.AndroidGeneratorSuite;
import com.here.ivi.api.generator.baseapi.BaseApiGeneratorSuite;
import com.here.ivi.api.generator.swift.SwiftGeneratorSuite;
import com.here.ivi.api.loader.FrancaModelLoader;
import com.here.ivi.api.model.franca.FrancaModel;
import com.here.ivi.api.model.franca.ModelHelper;
import com.here.ivi.api.validator.common.NameValidator;
import com.here.ivi.api.validator.common.ResourceValidator;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.Charset;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import org.apache.commons.io.IOUtils;
import org.eclipse.emf.ecore.resource.ResourceSet;

/** The base class for all the generators. */
public abstract class GeneratorSuite {

  protected FrancaModel model;
  private final FrancaModelLoader francaModelLoader;
  private Collection<File> currentFiles;

  protected GeneratorSuite(final FrancaModelLoader francaModelLoader) {
    this.francaModelLoader = francaModelLoader;
  }

  /** @return the human readable name of this generator */
  public abstract String getName();

  /**
   * Triggers the generation. The model is assumed to be valid.
   *
   * @return a list of generated files with their relative destination paths
   */
  public abstract List<GeneratedFile> generate();

  /**
   * Uses the internal validator to validate the model.
   *
   * @return boolean True if the model is valid, false otherwise.
   */
  public boolean validate() {
    if (model == null) {
      return false;
    }

    ResourceSet resources = francaModelLoader.getResourceSetProvider().get();
    return NameValidator.validate(model) && ResourceValidator.validate(resources, currentFiles);
  }

  /**
   * Uses the FrancaModelLoader to build the model.
   *
   * @param inputPaths The root directories of the fidl/fdepl files.
   */
  public void buildModels(final Collection<File> inputPaths) {
    ModelHelper.getFdeplInjector().injectMembers(francaModelLoader);
    for (File inputPath : inputPaths) {
      if (currentFiles == null) {
        currentFiles = FrancaModelLoader.listFilesRecursively(inputPath);
      } else {
        currentFiles.addAll(FrancaModelLoader.listFilesRecursively(inputPath));
      }
    }
    model = francaModelLoader.load(getSpecPath(), currentFiles);
  }

  public static String getSpecPath() {
    return "classpath:/franca/spec/BaseApiSpec.fdepl";
  }

  /** Creates a new instance of a generator suite by its short identifier */
  public static GeneratorSuite instantiateByShortName(
      String shortName, OptionReader.TranspilerOptions options) {

    switch (shortName) {
      case AndroidGeneratorSuite.GENERATOR_NAME:
        return new AndroidGeneratorSuite(options);
      case BaseApiGeneratorSuite.GENERATOR_NAME:
        return new BaseApiGeneratorSuite();
      case SwiftGeneratorSuite.GENERATOR_NAME:
        return new SwiftGeneratorSuite();
    }

    return null;
  }

  /** @return all available generators */
  public static List<String> generatorShortNames() {
    return Arrays.asList(
        AndroidGeneratorSuite.GENERATOR_NAME,
        BaseApiGeneratorSuite.GENERATOR_NAME,
        SwiftGeneratorSuite.GENERATOR_NAME);
  }

  public static GeneratedFile copyTarget(String fileName, String targetDir) {
    InputStream stream = GeneratorSuite.class.getClassLoader().getResourceAsStream(fileName);

    if (stream != null) {
      try {
        String content = IOUtils.toString(stream, Charset.defaultCharset());
        return new GeneratedFile(
            content, targetDir.isEmpty() ? fileName : targetDir + File.separator + fileName);
      } catch (IOException e) {
        throw new TranspilerExecutionException("Copying resource file failed with error:", e);
      }
    }

    throw new TranspilerExecutionException(String.format("Failed loading resource %s.", fileName));
  }
}
