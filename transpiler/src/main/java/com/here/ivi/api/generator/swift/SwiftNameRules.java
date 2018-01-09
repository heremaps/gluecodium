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
import com.here.ivi.api.model.franca.DefinedBy;
import com.here.ivi.api.model.franca.FrancaDeploymentModel;
import com.here.ivi.api.model.swift.SwiftType;
import java.io.File;
import org.franca.core.franca.*;

public final class SwiftNameRules {

  public static final String TARGET_DIRECTORY = "swift" + File.separator;

  private SwiftNameRules() {}

  public static String getImplementationFileName(final FTypeCollection francaTypeCollection) {
    return TARGET_DIRECTORY
        + String.join(File.separator, DefinedBy.getPackages(francaTypeCollection))
        + File.separator
        + getFileName(francaTypeCollection)
        + ".swift";
  }

  private static String getFileName(final FTypeCollection francaTypeCollection) {
    if (francaTypeCollection instanceof FInterface) {
      return SwiftNameRules.getClassName(francaTypeCollection.getName());
    } else {
      return getTypeCollectionName(francaTypeCollection);
    }
  }

  public static String getMethodName(final FMethod method) {
    return NameHelper.toLowerCamelCase(method.getName());
  }

  public static String getParameterName(final FArgument argument) {
    return NameHelper.toLowerCamelCase(argument.getName());
  }

  public static String getClassName(final String name) {
    return NameHelper.toUpperCamelCase(name);
  }

  public static String getStructName(
      final FStructType structName, final FrancaDeploymentModel deploymentModel) {
    return getTypeName(structName, deploymentModel);
  }

  private static String getTypeName(
      final FModelElement element, final FrancaDeploymentModel deploymentModel) {
    return getNamespacePrefix(element, deploymentModel)
        + NameHelper.toUpperCamelCase(element.getName());
  }

  private static String getNamespacePrefix(
      FModelElement elem, FrancaDeploymentModel deploymentModel) {
    FTypeCollection definingTypeCollection = DefinedBy.findDefiningTypeCollection(elem);
    if (definingTypeCollection instanceof FInterface) {
      FInterface iface = (FInterface) definingTypeCollection;
      if (elem instanceof FTypeDef || !deploymentModel.isInterface(iface)) {
        return getClassName(definingTypeCollection.getName()) + ".";
      }
    }
    return "";
  }

  public static String getFieldName(final String fieldName) {
    return NameHelper.toLowerCamelCase(fieldName);
  }

  private static String getTypeCollectionName(final FTypeCollection base) {
    return NameHelper.toUpperCamelCase(base.getName());
  }

  public static String getEnumTypeName(
      FModelElement francaEnumerator, FrancaDeploymentModel deploymentModel) {
    return getTypeName(francaEnumerator, deploymentModel);
  }

  public static String getEnumItemName(FEnumerator francaEnumerator) {
    return getEnumItemName(francaEnumerator.getName());
  }

  public static String getEnumItemName(final String enumItemName) {
    return NameHelper.toLowerCamelCase(enumItemName);
  }

  public static String getPropertyName(FAttribute name) {
    return NameHelper.toLowerCamelCase(name.getName());
  }

  public static String getArrayName(SwiftType innerType) {
    String name =
        innerType.implementingClass != null
            ? innerType.implementingClass
            : innerType.getSimpleName();
    name = SwiftNameRules.getClassName(name.replace("_", ""));
    return name + "List";
  }

  public static String getTypeDefName(
      FTypeDef francaTypeDef, FrancaDeploymentModel deploymentModel) {
    return getTypeName(francaTypeDef, deploymentModel);
  }
}
