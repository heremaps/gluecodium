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
import com.here.genium.model.franca.DefinedBy;
import java.nio.file.Paths;
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
  public static final String PUBLIC_HEADER_SUFFIX = ".h";
  public static final String IMPL_SUFFIX = ".cpp";

  private CBridgeNameRules() {}

  public static String getName(final FTypeCollection francaTypeCollection) {
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
    return joinQualifiedName(
        getNestedNameSpecifier(francaElement),
        NameHelper.toUpperCamelCase(francaElement.getName()));
  }

  public static String getInstanceBaseName(final FModelElement francaElement) {
    return String.join(UNDERSCORE_DELIMITER, getNestedNameSpecifier(francaElement));
  }

  private static String joinQualifiedName(final List<String> nameSpecifier, final String name) {
    List<String> names = new LinkedList<>(nameSpecifier);
    names.add(name);
    return String.join(UNDERSCORE_DELIMITER, names);
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
    return joinQualifiedName(
        getNestedNameSpecifier(francaEnumItem), francaEnumItem.getName().toLowerCase());
  }

  public static String getEnumName(FModelElement francaEnumerator) {
    return joinQualifiedName(
        getNestedNameSpecifier(francaEnumerator),
        NameHelper.toUpperCamelCase(francaEnumerator.getName()));
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

  public static String getPropertySetterName(final FAttribute attribute) {
    return NameHelper.toLowerCamelCase(attribute.getName()) + "_set";
  }

  public static String getPropertyGetterName(final FAttribute attribute) {
    return NameHelper.toLowerCamelCase(attribute.getName()) + "_get";
  }

  public static String getMapName(final FModelElement francaElement) {
    return joinQualifiedName(
        getNestedNameSpecifier(francaElement),
        NameHelper.toUpperCamelCase(francaElement.getName()));
  }
}
