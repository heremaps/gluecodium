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

package com.here.genium.generator.cpp;

import com.here.genium.generator.common.NameHelper;
import com.here.genium.generator.common.NameRules;
import java.util.List;

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

  public static String getGetterPrefix(final boolean isBoolean) {
    return isBoolean ? "is_" : "get_";
  }

  public static String getSetterPrefix() {
    return "set_";
  }

  public static String joinFullyQualifiedName(final List<String> nameList) {
    return "::" + String.join("::", nameList);
  }

  public static String joinFullyQualifiedName(final List<String> namespace, final String name) {
    return "::" + String.join("::", namespace) + "::" + name;
  }

  public static String joinFullyQualifiedName(final String namespace, final String name) {
    if (namespace.startsWith("::")) {
      return namespace + "::" + name;
    } else {
      return "::" + namespace + "::" + name;
    }
  }
}
