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

package com.here.ivi.api.generator.common.java;

import com.here.ivi.api.generator.common.NameHelper;
import org.franca.core.franca.FType;
import org.franca.core.franca.FTypeCollection;

public class JavaDefaultNameRules implements JavaNameRules {

  @Override
  public String getTypename(FType type) {
    return type.getName();
  }

  @Override
  public String getClassName(FTypeCollection base) {
    return NameHelper.toLowerCamelCase(base.getName());
  }

  @Override
  public String getMethodName(String base) {
    return NameHelper.toLowerCamelCase(base);
  }

  @Override
  public String getArgumentName(String base) {
    return NameHelper.toLowerCamelCase(base);
  }

  @Override
  public String getConstantName(String base) {
    return NameHelper.toUpperSnakeCase(base);
  }

  @Override
  public String getEnumName(String base) {
    return NameHelper.toLowerCamelCase(base);
  }

  @Override
  public String getEnumEntryName(String base) {
    return NameHelper.toLowerCamelCase(base);
  }

  @Override
  public String getFieldName(String base) {
    return NameHelper.toLowerCamelCase(base);
  }
}
