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
import java.util.List;

/**
 * The base for all the generators that runs additional tools on each file generated.
 *
 * <p>Actual file generation is delegated to {@link AbstractGeneratorSuite#generateFiles} method.
 */
public abstract class AbstractGeneratorSuite implements GeneratorSuite {

  private final Transpiler tool;

  public AbstractGeneratorSuite(Transpiler transpiler) {
    tool = transpiler;
  }

  @Override
  public Transpiler getTool() {
    return tool;
  }

  /**
   * Triggers generation of files
   *
   * @return a list of generated files
   */
  @Override
  public final List<GeneratedFile> generate() {
    return generateFiles();
  }

  /**
   * Triggers generation of files. This method should be implemented by classes inheriting from
   * {@link AbstractGeneratorSuite}
   *
   * @return a list of generated files with their relative destination paths
   */
  public abstract List<GeneratedFile> generateFiles();
}
