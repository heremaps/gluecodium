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

package com.here.ivi.api.generator.common.cpp;

import com.here.ivi.api.generator.common.GeneratorSuite;
import com.here.ivi.api.model.FrancaElement;
import com.here.ivi.api.model.FrancaModel;
import com.here.ivi.api.model.cppmodel.CppIncludeResolver;

public abstract class AbstractCppGenerator {

  private final GeneratorSuite suite;
  protected final CppNameRules nameRules;
  private final FrancaModel<?, ?> coreModel;

  public AbstractCppGenerator(
      GeneratorSuite suite, CppNameRules nameRules, FrancaModel<?, ?> coreModel) {
    this.suite = suite;
    this.nameRules = nameRules;
    this.coreModel = coreModel;
  }

  protected CharSequence getGeneratorNotice(FrancaElement<?> element, String fileName) {
    return CppGeneratorHelper.generateGeneratorNotice(suite, element, fileName);
  }

  protected CppIncludeResolver getIncludeResolver(String fileName) {
    return new CppIncludeResolver(coreModel, fileName);
  }
}
