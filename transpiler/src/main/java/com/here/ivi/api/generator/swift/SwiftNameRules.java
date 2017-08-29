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
import org.franca.core.franca.FMethod;
import org.franca.core.franca.FTypeCollection;

public class SwiftNameRules {
  public String getImplementationFileName(final FrancaElement<?> francaElement) {
    return "swift"
        + File.separator
        + String.join(File.separator, francaElement.getModelInfo().getPackageNames())
        + File.separator
        + getFileName(francaElement)
        + ".swift";
  }

  private String getFileName(final FrancaElement<?> francaElement) {
    String switchResult = null;
    if (francaElement instanceof Interface) {
      switchResult =
          SwiftNameRules.computeClassName(((Interface<?>) francaElement).getFrancaInterface());
    } else {
      switchResult = this.getTypeCollectionName(francaElement.getFrancaTypeCollection());
    }
    return switchResult;
  }

  public String getMethodName(final FMethod method) {
    return method.getName();
  }

  public String getParameterName(final FArgument argument) {
    return argument.getName();
  }

  public String getClassName(final FTypeCollection base) {
    return SwiftNameRules.computeClassName(base);
  }

  public static String getStructName(final String structName) {
    return NameHelper.toUpperCamelCase(structName);
  }

  public String getTypeCollectionName(final FTypeCollection base) {
    return NameHelper.toUpperCamelCase(base.getName());
  }

  public static String computeClassName(final FTypeCollection base) {
    return NameHelper.toUpperCamelCase(base.getName());
  }
}
