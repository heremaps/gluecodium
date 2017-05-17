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

import com.here.ivi.api.Transpiler;
import com.here.ivi.api.generator.legacy.LegacyGeneratorSuite;
import com.here.ivi.api.generator.cppstub.CppStubGeneratorSuite;
import com.here.ivi.api.model.FDHelper;
import java.lang.reflect.Constructor;
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

  /** @return the tool this generator belongs to */
  Transpiler getTool();

  /** @return the version of this generator */
  Version getVersion();

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

  /**
   * Generates a specific GeneratorSuite instance as specified by the first class parameter. You
   * have to pass in an actual class type, as during runtime it is not known.
   */
  static GeneratorSuite instantiate(Class<? extends GeneratorSuite> generatorSuite, Transpiler tool)
      throws NoSuchMethodException, IllegalAccessException, InvocationTargetException,
          InstantiationException {
    Constructor<? extends GeneratorSuite> constructor =
        generatorSuite.getConstructor(Transpiler.class);
    return constructor.newInstance(tool);
  }

  /** Creates a new instance of a generator suite by its short identifier */
  static GeneratorSuite instantiateByShortName(String shortName, Transpiler tool)
      throws InvocationTargetException, NoSuchMethodException, InstantiationException,
          IllegalAccessException {
    switch (shortName) {
      case "legacy":
        return instantiate(LegacyGeneratorSuite.class, tool);
      case "stub":
        return instantiate(CppStubGeneratorSuite.class, tool);
    }

    throw new InstantiationException();
  }

  /** @return all available generators */
  static List<String> generatorShortNames() {
    return Arrays.asList("legacy", "stub");
  }

  /**
   * Construct list of generators needed to process provided fidl/fdepl files.
   *
   * @param inputPath The root directory of the fidl/fdepl files.
   * @param tool Transpiler object used to instantiate generators
   * @return List of generators needed to process provided files
   */
  static List<String> generatorsFromFdepl(String inputPath, Transpiler tool)
      throws NoSuchMethodException, InstantiationException, IllegalAccessException,
          InvocationTargetException {
    Set<String> specNames = FDHelper.findSpecificationNames(inputPath);
    List<String> generators = new ArrayList<>();
    for (String sn : generatorShortNames()) {
      GeneratorSuite generator = instantiateByShortName(sn, tool);
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
