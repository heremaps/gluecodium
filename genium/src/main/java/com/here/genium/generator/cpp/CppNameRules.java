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

package com.here.genium.generator.cpp;

import com.here.genium.generator.common.NameHelper;
import com.here.genium.model.common.InstanceRules;
import com.here.genium.model.cpp.CppPrimitiveTypeRef;
import com.here.genium.model.cpp.CppTypeRef;
import com.here.genium.model.franca.DefinedBy;
import java.io.File;
import java.util.List;
import org.franca.core.franca.*;

public final class CppNameRules {
  public static final String HEADER_FILE_SUFFIX = ".h";
  public static final String IMPLEMENTATION_FILE_SUFFIX = ".cpp";
  public static final String PACKAGE_NAME_SPECIFIER_INCLUDE = "include";
  public static final String PACKAGE_NAME_SPECIFIER_SRC = "src";

  private CppNameRules() {}

  public static String getMethodName(String base) {
    return NameHelper.toLowerSnakeCase(base); // do_my_stuff
  }

  public static String getGetterName(final String base, final CppTypeRef cppTypeRef) {
    final String prefix =
        cppTypeRef != null && cppTypeRef.getActualType() == CppPrimitiveTypeRef.BOOL
            ? "is_"
            : "get_";
    return prefix + NameHelper.toLowerSnakeCase(base); // get_my_value
  }

  public static String getSetterName(String base) {
    return "set_" + NameHelper.toLowerSnakeCase(base); // set_my_value
  }

  public static String getEnumName(String base) {
    return NameHelper.toUpperCamelCase(base); // MyEnum
  }

  public static String getStructName(String base) {
    return NameHelper.toUpperCamelCase(base); // MyStruct
  }

  public static String getTypedefName(String base) {
    return NameHelper.toUpperCamelCase(base); // MyTypedef
  }

  public static List<String> getNestedNameSpecifier(final FModelElement modelElement) {

    FTypeCollection typeCollection = DefinedBy.findDefiningTypeCollection(modelElement);
    List<String> result = DefinedBy.getPackages(typeCollection);
    // special type for types defined in interfaces ...
    if (typeCollection instanceof FInterface) {
      result.add(getClassName(typeCollection.getName()));
    }

    return result;
  }

  public static String getFullyQualifiedName(List<String> nestedNameSpecifier, String name) {
    return nestedNameSpecifier.isEmpty()
        ? "::" + name
        : "::" + String.join("::", nestedNameSpecifier) + (name.isEmpty() ? "" : "::" + name);
  }

  public static String getConstantFullyQualifiedName(FConstantDef francaConstant) {
    List<String> nestedNameSpecifier = getNestedNameSpecifier(francaConstant);
    String constantName = getConstantName(francaConstant.getName());

    return getFullyQualifiedName(nestedNameSpecifier, constantName);
  }

  public static String getFullyQualifiedName(final FModelElement francaElement) {
    List<String> nestedNameSpecifier = getNestedNameSpecifier(francaElement);
    String typeName = "";

    if (francaElement instanceof FCompoundType) {
      typeName = getStructName(francaElement.getName());
    } else if (francaElement instanceof FEnumerationType) {
      typeName = getEnumName(francaElement.getName());
    } else if (francaElement instanceof FTypeDef) {
      FTypeDef typedef = (FTypeDef) francaElement;
      if (!InstanceRules.isInstanceId(typedef)) {
        typeName = getTypedefName(francaElement.getName());
      }
    } else if (francaElement instanceof FConstantDef) {
      typeName = getConstantName(francaElement.getName());
    } else if (francaElement instanceof FArrayType || francaElement instanceof FMapType) {
      // Franca maps and explicit arrays resolve into a "using" directive in C++
      typeName = getTypedefName(francaElement.getName());
    }

    return getFullyQualifiedName(nestedNameSpecifier, typeName);
  }

  public static String getClassName(String typeCollectionName) {
    return NameHelper.toUpperCamelCase(typeCollectionName);
  }

  public static String getEnumEntryName(String base) {
    return NameHelper.toUpperSnakeCase(base); // MY_ENUM_ENTRY
  }

  public static String getFieldName(String base) {
    return NameHelper.toLowerSnakeCase(base); // my_field
  }

  public static String getConstantName(String base) {
    return NameHelper.toUpperSnakeCase(base); // MY_CONSTANT
  }

  public static String getParameterName(final String base) {
    return NameHelper.toLowerSnakeCase(base); // my_parameter
  }

  public static String getHeaderPath(final FTypeCollection francaTypeCollection) {
    return getOutputFilePath(francaTypeCollection) + HEADER_FILE_SUFFIX;
  }

  public static String getOutputFilePath(final FTypeCollection francaTypeCollection) {
    return String.join(File.separator, DefinedBy.getPackages(francaTypeCollection))
        + File.separator
        + (francaTypeCollection instanceof FInterface
            ? getClassName(francaTypeCollection.getName())
            : francaTypeCollection.getName());
  }
}
