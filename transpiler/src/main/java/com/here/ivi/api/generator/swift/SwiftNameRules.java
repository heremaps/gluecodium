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

package com.here.ivi.api.generator.swift;

import com.here.ivi.api.generator.common.NameHelper;
import com.here.ivi.api.model.franca.FrancaElement;
import com.here.ivi.api.model.franca.Interface;
import java.io.File;
import org.franca.core.franca.FArgument;
import org.franca.core.franca.FEnumerator;
import org.franca.core.franca.FMethod;
import org.franca.core.franca.FModelElement;
import org.franca.core.franca.FTypeCollection;

public final class SwiftNameRules {

  public static final String TARGET_DIRECTORY = "swift" + File.separator;

  private SwiftNameRules() {}

  public static String getImplementationFileName(final FrancaElement francaElement) {
    return TARGET_DIRECTORY
        + String.join(File.separator, francaElement.getPackageNames())
        + File.separator
        + getFileName(francaElement)
        + ".swift";
  }

  private static String getFileName(final FrancaElement francaElement) {
    String switchResult;
    if (francaElement instanceof Interface) {
      switchResult =
          SwiftNameRules.computeClassName(((Interface) francaElement).getFrancaInterface());
    } else {
      switchResult = getTypeCollectionName(francaElement.getFrancaTypeCollection());
    }
    return switchResult;
  }

  public static String getMethodName(final FMethod method) {
    return method.getName();
  }

  public static String getParameterName(final FArgument argument) {
    return argument.getName();
  }

  public static String getClassName(final FTypeCollection base) {
    return SwiftNameRules.computeClassName(base);
  }

  public static String getStructName(final String structName) {
    return NameHelper.toUpperCamelCase(structName);
  }

  public static String getTypeCollectionName(final FTypeCollection base) {
    return NameHelper.toUpperCamelCase(base.getName());
  }

  public static String computeClassName(final FTypeCollection base) {
    return NameHelper.toUpperCamelCase(base.getName());
  }

  public static String getEnumTypeName(FModelElement francaEnumerator) {
    return NameHelper.toUpperCamelCase(francaEnumerator.getName());
  }

  public static String getEnumItemName(FEnumerator francaEnumerator) {
    return NameHelper.toLowerCamelCase(francaEnumerator.getName());
  }
}
