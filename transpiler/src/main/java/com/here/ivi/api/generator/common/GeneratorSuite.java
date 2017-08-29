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
import com.here.ivi.api.generator.android.AndroidGeneratorSuite;
import com.here.ivi.api.generator.baseapi.BaseApiGeneratorSuite;
import com.here.ivi.api.generator.swift.SwiftGeneratorSuite;
import com.here.ivi.api.model.franca.FDHelper;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Set;
import java.util.logging.Logger;
import org.franca.deploymodel.dsl.fDeploy.FDModel;

/** The interface for all the generators. */
public interface GeneratorSuite {
  /** @return the path to specification used by generator */
  String getSpecPath();

  /** @return the human readable name of this generator */
  String getName();

  /**
   * Triggers the generation
   *
   * @return a list of generated files with their relative destination paths
   */
  List<GeneratedFile> generate();

  /**
   * Uses the internal validator to validate the model.
   *
   * @return boolean True if the model is valid, false otherwise.
   */
  boolean validate();

  /**
   * Uses the FrancaModelLoader to keep a copy of the model.
   *
   * @param inputPath The root directory of the fidl/fdepl files.
   */
  void buildModel(String inputPath);

  /** Creates a new instance of a generator suite by its short identifier */
  static GeneratorSuite instantiateByShortName(
      String shortName, OptionReader.TranspilerOptions options)
      throws InvocationTargetException, NoSuchMethodException, InstantiationException,
          IllegalAccessException {
    switch (shortName) {
      case "android":
        return new AndroidGeneratorSuite(options);
        // TODO: APIGEN-253: change value to "baseApi"
      case "stub":
        return new BaseApiGeneratorSuite();
      case "swift":
        return new SwiftGeneratorSuite();
    }

    throw new InstantiationException();
  }

  /** @return all available generators */
  static List<String> generatorShortNames() {
    // TODO: APIGEN-253: change second value to "baseApi"
    return Arrays.asList("android", "stub", "swift");
  }

  /**
   * Construct list of generators needed to process provided fidl/fdepl files.
   *
   * @return List of generators needed to process provided files
   */
  static List<String> generatorsFromFdepl(OptionReader.TranspilerOptions options)
      throws NoSuchMethodException, InstantiationException, IllegalAccessException,
          InvocationTargetException {
    String inputPath = options.getInputDir();
    Set<String> specNames = FDHelper.findSpecificationNames(inputPath);
    List<String> generators = new ArrayList<>();
    for (String sn : generatorShortNames()) {
      GeneratorSuite generator = instantiateByShortName(sn, options);
      FDModel model = FDHelper.loadModel(generator.getSpecPath());
      if (!model.getSpecifications().isEmpty()) {
        String generatorSpecName = model.getSpecifications().get(0).getName();
        if (specNames.contains(generatorSpecName)) {
          Logger logger = Logger.getLogger(GeneratorSuite.class.getName());
          logger.info(
              String.format("Adding generator %1$s needed for %2$s", sn, generatorSpecName));
          generators.add(sn);
        }
      }
    }
    return generators;
  }
}
