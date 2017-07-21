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

import static org.apache.commons.lang3.ArrayUtils.addAll;

import com.here.ivi.api.generator.common.NameHelper;
import com.here.ivi.api.generator.common.cpp.CppNameRules;
import com.here.ivi.api.model.franca.FrancaElement;
import com.here.ivi.api.model.franca.Interface;
import java.nio.file.Paths;
import java.util.List;
import org.franca.core.franca.FArgument;
import org.franca.core.franca.FMethod;
import org.franca.core.franca.FStructType;
import org.franca.core.franca.FTypeCollection;

public class CBridgeNameRules {

  public static final String CPP_NAMESPACE_DELIMITER = "::";
  public static final String UNDERSCORE_DELIMITER = "_";

  public String getHeaderFileNameWithPath(final FrancaElement<?> francaElement) {
    return Paths.get(getDirectoryName(francaElement), getHeaderFileName(francaElement)).toString();
  }

  public String getImplementationFileNameWithPath(final FrancaElement<?> francaElement) {
    return Paths.get(getDirectoryName(francaElement), getImplementationFileName(francaElement))
        .toString();
  }

  public String getHeaderFileName(final FrancaElement<?> francaElement) {
    return getFileName(francaElement) + ".h";
  }

  public String getImplementationFileName(final FrancaElement<?> francaElement) {
    return getFileName(francaElement) + ".cpp";
  }

  private String getDirectoryName(final FrancaElement<?> francaElement) {

    return Paths.get(
            "cbridge", francaElement.getModelInfo().getPackageNames().toArray(new String[0]))
        .toString();
  }

  private String getFileName(final FrancaElement<?> francaElement) {
    if (francaElement instanceof Interface) {
      return computeClassName(((Interface<?>) francaElement).getFrancaInterface());
    }
    return this.getTypeCollectionName(francaElement.getFrancaTypeCollection());
  }

  public String getDelegateMethodName(final Interface<?> iface, final FMethod method) {
    return fullyQualifiedName(
        iface.getModelInfo().getPackageNames(),
        CppNameRules.getClassName(iface.getFrancaTypeCollection().getName()),
        CppNameRules.getMethodName(method.getName()),
        CPP_NAMESPACE_DELIMITER);
  }

  private static String fullyQualifiedName(
      List<String> packages, String ifaceName, String name, String delimiter) {
    return String.join(
        delimiter, (String[]) addAll(packages.toArray(new String[0]), ifaceName, name));
  }

  public String getMethodName(final Interface<?> iface, final FMethod method) {
    return fullyQualifiedName(
        iface.getModelInfo().getPackageNames(),
        iface.getName(),
        method.getName(),
        UNDERSCORE_DELIMITER);
  }

  public String getParameterName(final FArgument argument) {
    return argument.getName();
  }

  public String getClassName(final FTypeCollection base) {
    return com.here.ivi.api.generator.swift.SwiftNameRules.computeClassName(base);
  }

  public String getHandleName(final Interface<?> iface, final FStructType francaStructType) {
    return fullyQualifiedName(
        iface.getModelInfo().getPackageNames(),
        iface.getName(),
        NameHelper.toUpperCamelCase(francaStructType.getName()) + "Ref",
        UNDERSCORE_DELIMITER);
  }

  public String getTypeCollectionName(final FTypeCollection base) {
    return NameHelper.toUpperCamelCase(base.getName());
  }

  public static String computeClassName(final FTypeCollection base) {
    return NameHelper.toUpperCamelCase(base.getName());
  }
}
