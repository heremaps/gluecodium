/*
 * Copyright (C) 2016-2019 HERE Europe B.V.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
 * License-Filename: LICENSE
 */

package com.here.genium.generator.swift;

import com.here.genium.generator.common.NameHelper;
import com.here.genium.model.franca.DefinedBy;
import com.here.genium.model.franca.FrancaDeploymentModel;
import com.here.genium.model.swift.SwiftType;
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

  public static String getTypeName(
      final FModelElement element, final FrancaDeploymentModel deploymentModel) {
    return getNamespacePrefix(element, deploymentModel)
        + NameHelper.toUpperCamelCase(element.getName());
  }

  private static String getNamespacePrefix(
      FModelElement elem, FrancaDeploymentModel deploymentModel) {
    FTypeCollection definingTypeCollection = DefinedBy.findDefiningTypeCollection(elem);
    if (definingTypeCollection instanceof FInterface) {
      FInterface iface = (FInterface) definingTypeCollection;
      if (elem instanceof FTypeDef
          || elem instanceof FMapType
          || !deploymentModel.isInterface(iface)) {
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

  public static String getConstantName(final String name) {
    return NameHelper.toLowerCamelCase(name);
  }

  public static String getPropertyName(final String name, final SwiftType swiftType) {
    return swiftType == SwiftType.BOOL
        ? "is" + NameHelper.toUpperCamelCase(name)
        : NameHelper.toLowerCamelCase(name);
  }

  public static String getTypeDefName(
      final FModelElement francaModelElement, final FrancaDeploymentModel deploymentModel) {
    return getTypeName(francaModelElement, deploymentModel);
  }

  public static String getMapName(
      final FModelElement francaModelElement, final FrancaDeploymentModel deploymentModel) {
    return getTypeName(francaModelElement, deploymentModel).replace('.', '_');
  }
}
