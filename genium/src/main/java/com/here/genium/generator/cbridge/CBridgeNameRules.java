/*
 * Copyright (C) 2016-2018 HERE Europe B.V.
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

package com.here.genium.generator.cbridge;

import com.here.genium.generator.common.NameHelper;
import com.here.genium.generator.cpp.CppNameRules;
import com.here.genium.model.franca.DefinedBy;
import java.io.File;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import org.franca.core.franca.*;

public final class CBridgeNameRules {

  public static final String CBRIDGE_PUBLIC = "cbridge";
  public static final String CBRIDGE_INTERNAL = "cbridge_internal";
  public static final String INCLUDE_DIR = "include";

  public static final String STRING_HANDLE_FILE =
      Paths.get(CBRIDGE_PUBLIC, INCLUDE_DIR, "StringHandle.h").toString();
  public static final String BASE_HANDLE_IMPL_FILE =
      Paths.get(CBRIDGE_INTERNAL, INCLUDE_DIR, "BaseHandleImpl.h").toString();
  public static final String BASE_HANDLE_FILE =
      Paths.get(CBRIDGE_PUBLIC, INCLUDE_DIR, "BaseHandle.h").toString();
  public static final String SRC_DIR = "src";

  public static final String BASE_REF_NAME = "_baseRef";

  public static final String UNDERSCORE_DELIMITER = "_";
  private static final String CPP_NAMESPACE_DELIMITER = "::";
  private static final String PUBLIC_HEADER_SUFFIX = ".h";
  private static final String IMPL_SUFFIX = ".cpp";

  private CBridgeNameRules() {}

  public static String getHeaderFileNameWithPath(final FTypeCollection francaTypeCollection) {
    return getPathComponents(
        francaTypeCollection, CBRIDGE_PUBLIC, INCLUDE_DIR, PUBLIC_HEADER_SUFFIX);
  }

  public static String getImplementationFileNameWithPath(
      final FTypeCollection francaTypeCollection) {
    return getPathComponents(francaTypeCollection, CBRIDGE_PUBLIC, SRC_DIR, IMPL_SUFFIX);
  }

  private static String getPathComponents(
      final FTypeCollection francaTypeCollection,
      final String prefix,
      final String subfolder,
      final String suffix) {
    ArrayList<String> pathComponents = new ArrayList<>();
    pathComponents.add(prefix);
    pathComponents.add(subfolder);
    pathComponents.addAll(DefinedBy.getPackages(francaTypeCollection));
    pathComponents.add(getName(francaTypeCollection) + suffix);
    return String.join(File.separator, pathComponents);
  }

  private static String getName(final FTypeCollection francaTypeCollection) {
    return NameHelper.toUpperCamelCase(francaTypeCollection.getName());
  }

  public static String getFunctionTableName(FInterface francaInterface) {
    return getInterfaceName(francaInterface) + "_FunctionTable";
  }

  public static String getInterfaceName(FInterface francaInterface) {
    return String.join(UNDERSCORE_DELIMITER, getNestedNameSpecifier(francaInterface));
  }

  public static String getShortMethodName(final FMethod method) {
    if (method.getSelector() != null && !method.getSelector().isEmpty()) {
      return NameHelper.toLowerCamelCase(method.getName())
          + UNDERSCORE_DELIMITER
          + method.getSelector();
    } else {
      return NameHelper.toLowerCamelCase(method.getName());
    }
  }

  public static String getStructBaseName(final FModelElement francaElement) {
    return fullyQualifiedName(
        getNestedNameSpecifier(francaElement),
        NameHelper.toUpperCamelCase(francaElement.getName()),
        UNDERSCORE_DELIMITER);
  }

  public static String getInstanceBaseName(final FModelElement francaElement) {
    return String.join(UNDERSCORE_DELIMITER, getNestedNameSpecifier(francaElement));
  }

  public static String getBaseApiInstanceName(final FModelElement francaModel) {
    return String.join(CPP_NAMESPACE_DELIMITER, getNestedNameSpecifier(francaModel));
  }

  public static String getBaseApiStructName(FModelElement struct) {
    return fullyQualifiedName(
        CppNameRules.getNestedNameSpecifier(struct),
        CppNameRules.getStructName(struct.getName()),
        CPP_NAMESPACE_DELIMITER);
  }

  public static String getBaseApiEnumName(FEnumerationType francaEnum) {
    return fullyQualifiedName(
        CppNameRules.getNestedNameSpecifier(francaEnum),
        CppNameRules.getEnumName(francaEnum.getName()),
        CPP_NAMESPACE_DELIMITER);
  }

  public static String fullyQualifiedName(
      List<String> nameSpecifier, String name, String delimiter) {
    List<String> names = new LinkedList<>(nameSpecifier);
    names.add(name);
    return String.join(delimiter, names);
  }

  private static List<String> getNestedNameSpecifier(final FModelElement modelElement) {

    FTypeCollection typeCollection = DefinedBy.findDefiningTypeCollection(modelElement);
    List<String> result = DefinedBy.getPackages(typeCollection);
    result.add(NameHelper.toUpperCamelCase(typeCollection.getName()));

    return result;
  }

  public static String getNestedSpecifierString(final FModelElement modelElement) {
    List<String> nestedNameSpecifier = getNestedNameSpecifier(modelElement);
    return String.join(UNDERSCORE_DELIMITER, nestedNameSpecifier);
  }

  public static String getEnumItemName(FEnumerator francaEnumItem) {
    return fullyQualifiedName(
        getNestedNameSpecifier(francaEnumItem),
        francaEnumItem.getName().toLowerCase(),
        UNDERSCORE_DELIMITER);
  }

  public static String getEnumName(FModelElement francaEnumerator) {
    return fullyQualifiedName(
        getNestedNameSpecifier(francaEnumerator),
        NameHelper.toUpperCamelCase(francaEnumerator.getName()),
        UNDERSCORE_DELIMITER);
  }

  public static String getBaseApiCall(
      final CppTypeInfo.TypeCategory category, final String baseAPIName) {
    switch (category) {
      case CLASS:
        return "std::shared_ptr<" + baseAPIName + ">";
      case STRUCT:
        return baseAPIName;
    }
    return null;
  }

  public static String getBaseApiName(
      final FModelElement elementType, final CppTypeInfo.TypeCategory category) {
    if (category == CppTypeInfo.TypeCategory.CLASS) {
      return CBridgeNameRules.getBaseApiInstanceName(elementType);
    } else {
      return CBridgeNameRules.getBaseApiStructName(elementType);
    }
  }

  public static String getPropertySetterName(final FAttribute attribute) {
    return NameHelper.toLowerCamelCase(attribute.getName()) + "_set";
  }

  public static String getPropertyGetterName(final FAttribute attribute) {
    return NameHelper.toLowerCamelCase(attribute.getName()) + "_get";
  }

  public static String getMapName(final FModelElement francaElement) {
    return fullyQualifiedName(
        getNestedNameSpecifier(francaElement),
        NameHelper.toUpperCamelCase(francaElement.getName()),
        UNDERSCORE_DELIMITER);
  }
}
