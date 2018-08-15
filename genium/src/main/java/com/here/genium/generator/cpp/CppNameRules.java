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
import com.here.genium.generator.common.NameRules;
import com.here.genium.generator.common.VerbatimNameRules;
import com.here.genium.model.common.InstanceRules;
import com.here.genium.model.franca.DefinedBy;
import com.here.genium.model.franca.FrancaDeploymentModel;
import java.io.File;
import java.util.List;
import org.franca.core.franca.*;

public final class CppNameRules implements NameRules {

  public static final CppNameRules INSTANCE = new CppNameRules();

  public static final String HEADER_FILE_SUFFIX = ".h";
  public static final String IMPLEMENTATION_FILE_SUFFIX = ".cpp";
  public static final String PACKAGE_NAME_SPECIFIER_INCLUDE = "include";
  public static final String PACKAGE_NAME_SPECIFIER_SRC = "src";

  private CppNameRules() {}

  @Override
  public String getTypeName(final String base) {
    return NameHelper.toUpperCamelCase(base); // MyType
  }

  @Override
  public String getFunctionName(final String base) {
    return NameHelper.toLowerSnakeCase(base); // do_my_stuff
  }

  @Override
  public String getVariableName(final String base) {
    return NameHelper.toLowerSnakeCase(base); // my_variable
  }

  @Override
  public String getConstantName(final String base) {
    return NameHelper.toUpperSnakeCase(base); // MY_CONSTANT
  }

  @Override
  public String getGetterName(final String base, final boolean isBoolean) {
    return (isBoolean ? "is_" : "get_") + getFunctionName(base);
  }

  @Override
  public String getSetterName(final String base) {
    return "set_" + getFunctionName(base);
  }

  public List<String> getNestedNameSpecifier(final FModelElement modelElement) {

    FTypeCollection typeCollection = DefinedBy.findDefiningTypeCollection(modelElement);
    List<String> result = DefinedBy.getPackages(typeCollection);

    if (typeCollection instanceof FInterface) {
      result.add(getTypeName(typeCollection.getName()));
    }
    if (modelElement instanceof FEnumerator) {
      result.add(getTypeName(((FEnumerationType) modelElement.eContainer()).getName()));
    }

    return result;
  }

  public static String getFullyQualifiedName(List<String> nestedNameSpecifier, String name) {
    return nestedNameSpecifier.isEmpty()
        ? "::" + name
        : "::" + String.join("::", nestedNameSpecifier) + (name.isEmpty() ? "" : "::" + name);
  }

  public String getFullyQualifiedName(final FModelElement francaElement) {
    List<String> nestedNameSpecifier = getNestedNameSpecifier(francaElement);
    String typeName = "";

    if (francaElement instanceof FCompoundType) {
      typeName = getTypeName(francaElement.getName());
    } else if (francaElement instanceof FEnumerationType) {
      typeName = getTypeName(francaElement.getName());
    } else if (francaElement instanceof FTypeDef) {
      FTypeDef typedef = (FTypeDef) francaElement;
      if (!InstanceRules.isInstanceId(typedef)) {
        typeName = getTypeName(francaElement.getName());
      }
    } else if (francaElement instanceof FConstantDef) {
      typeName = getConstantName(francaElement.getName());
    } else if (francaElement instanceof FArrayType || francaElement instanceof FMapType) {
      // Franca maps and explicit arrays resolve into a "using" directive in C++
      typeName = getTypeName(francaElement.getName());
    }

    return getFullyQualifiedName(nestedNameSpecifier, typeName);
  }

  public String getFullyQualifiedName(
      final FModelElement francaElement, boolean isExternal, final String externalName) {

    if (!isExternal) {
      return getFullyQualifiedName(francaElement);
    } else if (externalName == null) {
      List<String> nestedNameSpecifier = getNestedNameSpecifier(francaElement);
      return getFullyQualifiedName(nestedNameSpecifier, francaElement.getName());
    } else {
      return externalName;
    }
  }

  public String getHeaderPath(final FTypeCollection francaTypeCollection) {
    return getOutputFilePath(francaTypeCollection) + HEADER_FILE_SUFFIX;
  }

  public String getOutputFilePath(final FTypeCollection francaTypeCollection) {
    return String.join(File.separator, DefinedBy.getPackages(francaTypeCollection))
        + File.separator
        + (francaTypeCollection instanceof FInterface
            ? getTypeName(francaTypeCollection.getName())
            : francaTypeCollection.getName());
  }

  public static NameRules selectNameRules(
      final FrancaDeploymentModel deploymentModel, final FModelElement francaModelElement) {
    return deploymentModel.isExternalType(francaModelElement)
        ? VerbatimNameRules.INSTANCE
        : CppNameRules.INSTANCE;
  }
}
