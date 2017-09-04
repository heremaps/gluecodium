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
import com.here.ivi.api.generator.cpp.CppNameRules;
import com.here.ivi.api.model.franca.FrancaElement;
import com.here.ivi.api.model.franca.Interface;
import java.nio.file.Paths;
import java.util.LinkedList;
import java.util.List;
import org.franca.core.franca.FMethod;
import org.franca.core.franca.FStructType;

public class CBridgeNameRules {

  public static final String SOURCE_FOLDER = "cbridge";
  private static final String INTERNAL_SOURCE_FOLDER = "cbridge_internal";

  private static final String CPP_NAMESPACE_DELIMITER = "::";
  private static final String UNDERSCORE_DELIMITER = "_";

  public String getHeaderFileNameWithPath(final FrancaElement francaElement) {
    return Paths.get(
            getPublicDirectoryName(francaElement.getPackageNames()),
            getHeaderFileName(getName(francaElement)))
        .toString();
  }

  public String getPrivateHeaderFileNameWithPath(final FrancaElement francaElement) {
    return Paths.get(
            getPrivateDirectoryName(francaElement.getPackageNames()),
            getPrivateHeaderFileName(getName(francaElement)))
        .toString();
  }

  public String getImplementationFileNameWithPath(final FrancaElement francaElement) {
    return Paths.get(
            getPublicDirectoryName(francaElement.getPackageNames()),
            getImplementationFileName(getName(francaElement)))
        .toString();
  }

  private String getHeaderFileName(final String elementName) {
    return elementName + ".h";
  }

  private String getPrivateHeaderFileName(final String elementName) {
    return elementName + "Impl.h";
  }

  private String getImplementationFileName(final String elementName) {
    return elementName + ".cpp";
  }

  private String getDirectoryName(final List<String> packages, final String rootFolder) {
    return Paths.get(rootFolder, packages.toArray(new String[packages.size()])).toString();
  }

  private String getPublicDirectoryName(final List<String> packages) {
    return getDirectoryName(packages, SOURCE_FOLDER);
  }

  private String getPrivateDirectoryName(final List<String> packages) {
    return getDirectoryName(packages, INTERNAL_SOURCE_FOLDER);
  }

  private String getName(final FrancaElement francaElement) {
    return francaElement instanceof Interface
        ? computeClassName(francaElement.getName())
        : getTypeCollectionName(francaElement.getName());
  }

  public String getDelegateMethodName(final Interface iface, final FMethod method) {
    return fullyQualifiedName(
        iface.getPackageNames(),
        CppNameRules.getClassName(iface.getName()),
        CppNameRules.getMethodName(method.getName()),
        CPP_NAMESPACE_DELIMITER);
  }

  public String getMethodName(final Interface iface, final FMethod method) {
    return fullyQualifiedName(
        iface.getPackageNames(), iface.getName(), method.getName(), UNDERSCORE_DELIMITER);
  }

  public String getStructRefType(
      final FrancaElement francaElement, final String francaElementName) {
    return getStructBaseName(francaElement, francaElementName) + "Ref";
  }

  public String getStructBaseName(
      final FrancaElement francaElement, final String francaElementName) {
    return fullyQualifiedName(
        francaElement.getPackageNames(),
        getName(francaElement),
        NameHelper.toUpperCamelCase(francaElementName),
        UNDERSCORE_DELIMITER);
  }

  private String getTypeCollectionName(final String name) {
    return NameHelper.toUpperCamelCase(name);
  }

  private String computeClassName(final String name) {
    return NameHelper.toUpperCamelCase(name);
  }

  public String getBaseApiStructName(FrancaElement francaElement, FStructType struct) {
    return fullyQualifiedName(
        francaElement.getPackageNames(),
        CppNameRules.getClassName(francaElement.getName()),
        CppNameRules.getStructName(struct.getName()),
        CPP_NAMESPACE_DELIMITER);
  }

  private static String fullyQualifiedName(
      List<String> packages, String ifaceName, String name, String delimiter) {
    List<String> names = new LinkedList<>(packages);
    names.add(ifaceName);
    names.add(name);
    return String.join(delimiter, names);
  }
}
