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

package com.here.ivi.api.platform.common;

import com.here.ivi.api.cli.OptionReader;
import com.here.ivi.api.cli.TranspilerExecutionException;
import com.here.ivi.api.generator.common.GeneratedFile;
import com.here.ivi.api.model.franca.FrancaDeploymentModel;
import com.here.ivi.api.platform.android.AndroidGeneratorSuite;
import com.here.ivi.api.platform.android.JavaGeneratorSuite;
import com.here.ivi.api.platform.baseapi.BaseApiGeneratorSuite;
import com.here.ivi.api.platform.swift.SwiftGeneratorSuite;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.Charset;
import java.util.*;
import org.apache.commons.io.IOUtils;
import org.franca.core.franca.FTypeCollection;

/** The base interface for all the generators. */
public abstract class GeneratorSuite {

  /** @return the human readable name of this generator */
  public abstract String getName();

  /**
   * Triggers the generation. The model is assumed to be valid.
   *
   * @param deploymentModel model containing deployment specification definitions
   * @param typeCollections type collections and interfaces (interfaces are type collection as well)
   * @return a list of generated files with their relative destination paths
   */
  public abstract List<GeneratedFile> generate(
      FrancaDeploymentModel deploymentModel, List<FTypeCollection> typeCollections);

  public static String getSpecPath() {
    return "classpath:/TranspilerExtensions.fdepl";
  }

  /** Creates a new instance of a generator suite by its short identifier */
  public static GeneratorSuite instantiateByShortName(
      String shortName, OptionReader.TranspilerOptions options) {

    switch (shortName) {
      case AndroidGeneratorSuite.GENERATOR_NAME:
        return new AndroidGeneratorSuite(options);
      case JavaGeneratorSuite.GENERATOR_NAME:
        return new JavaGeneratorSuite(options);
      case BaseApiGeneratorSuite.GENERATOR_NAME:
        return new BaseApiGeneratorSuite(options);
      case SwiftGeneratorSuite.GENERATOR_NAME:
        return new SwiftGeneratorSuite(options);
    }

    return null;
  }

  /** @return all available generators */
  public static Set<String> generatorShortNames() {
    return new HashSet<>(
        Arrays.asList(
            AndroidGeneratorSuite.GENERATOR_NAME,
            JavaGeneratorSuite.GENERATOR_NAME,
            BaseApiGeneratorSuite.GENERATOR_NAME,
            SwiftGeneratorSuite.GENERATOR_NAME));
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
