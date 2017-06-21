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

package com.here.ivi.api.generator.cbridge;

import com.here.ivi.api.generator.common.NameHelper;
import com.here.ivi.api.model.FrancaElement;
import com.here.ivi.api.model.Interface;
import java.io.File;
import org.franca.core.franca.FArgument;
import org.franca.core.franca.FMethod;
import org.franca.core.franca.FTypeCollection;

public class CBridgeNameRules {
  public String getHeaderFileName(final FrancaElement<?> francaElement) {
    return getDirectoryName(francaElement) + getFileName(francaElement) + ".h";
  }

  public String getImplementationFileName(final FrancaElement<?> francaElement) {
    return getDirectoryName(francaElement) + getFileName(francaElement) + ".cpp";
  }

  private String getDirectoryName(final FrancaElement<?> francaElement) {
    StringBuilder path = new StringBuilder();
    path.append("cbridge");
    path.append(File.separator);
    path.append(String.join(File.separator, francaElement.getPackage()));
    path.append(File.separator);
    return path.toString();
  }

  private String getFileName(final FrancaElement<?> francaElement) {
    if (francaElement instanceof Interface) {
      return computeClassName(((Interface<?>) francaElement).getFrancaInterface());
    }
    return this.getTypeCollectionName(francaElement.getFrancaTypeCollection());
  }

  public String getDelegateMethodName(final Interface<?> iface, final FMethod method) {
    return String.join("::", iface.getPackage()) + "::" + iface.getName() + "::" + method.getName();
  }

  public String getMethodName(final Interface<?> iface, final FMethod method) {
    return String.join("_", iface.getPackage()) + "_" + iface.getName() + "_" + method.getName();
  }

  public String getParameterName(final FArgument argument) {
    return argument.getName();
  }

  public String getClassName(final FTypeCollection base) {
    return com.here.ivi.api.generator.swift.SwiftNameRules.computeClassName(base);
  }

  public String getTypeCollectionName(final FTypeCollection base) {
    return NameHelper.toUpperCamelCase(base.getName());
  }

  public static String computeClassName(final FTypeCollection base) {
    return NameHelper.toUpperCamelCase(base.getName());
  }
}
