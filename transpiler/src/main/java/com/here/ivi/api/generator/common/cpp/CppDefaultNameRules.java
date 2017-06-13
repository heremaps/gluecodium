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

import com.here.ivi.api.generator.common.NameHelper;
import org.franca.core.franca.FType;
import org.franca.core.franca.FTypeCollection;

public abstract class CppDefaultNameRules implements CppNameRules {

  public String getCppTypename(FType type) {
    return type.getName();
  }

  public String getTypeCollectionName(FTypeCollection base) {
    return NameHelper.toUpperCamelCase(base.getName()); // MyTypeCollection
  }

  public String getMethodName(String base) {
    return NameHelper.toLowerCamelCase(base); // doStuff
  }

  public String getArgumentName(String base) {
    return NameHelper.toLowerCamelCase(base); // myArg
  }

  public String getEnumName(String base) {
    return NameHelper.toUpperCamelCase(base); // MyEnum
  }

  public String getStructName(String base) {
    return NameHelper.toUpperCamelCase(base); // MyStruct
  }

  public String getTypedefName(String base) {
    return NameHelper.toUpperCamelCase(base); // MyTypedef
  }

  public String getHeaderFileSuffix() {
    return ".h";
  }
}
