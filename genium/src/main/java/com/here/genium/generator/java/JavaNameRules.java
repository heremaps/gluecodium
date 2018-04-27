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

package com.here.genium.generator.java;

import com.here.genium.generator.common.NameHelper;
import com.here.genium.model.java.JavaPrimitiveType;
import com.here.genium.model.java.JavaTopLevelElement;
import com.here.genium.model.java.JavaType;
import java.io.File;
import java.util.List;

public final class JavaNameRules {

  private static final String JAVA_FILE_SUFFIX = ".java";

  private final String generatorName;

  public JavaNameRules(final String generatorName) {
    this.generatorName = generatorName;
  }

  private static String formatPackageName(List<String> packageNames) {
    return packageNames.isEmpty() ? "" : String.join(File.separator, packageNames) + File.separator;
  }

  public String getFileName(final JavaTopLevelElement javaElement) {
    return generatorName
        + File.separator
        + formatPackageName(javaElement.javaPackage.packageNames)
        + javaElement.name
        + JAVA_FILE_SUFFIX;
  }

  public static String getClassName(String base) {
    return NameHelper.toUpperCamelCase(base);
  }

  public static String getImplementationClassName(String base) {
    return getClassName(base) + "Impl";
  }

  public static String getMethodName(final String base, final String selector) {
    return NameHelper.toLowerCamelCase(base) + NameHelper.toUpperCamelCase(selector);
  }

  public static String getGetterName(final String base, final JavaType javaType) {
    final String prefix = javaType == JavaPrimitiveType.BOOL ? "is" : "get";
    return prefix + NameHelper.toUpperCamelCase(base);
  }

  public static String getSetterName(final String base) {
    return "set" + NameHelper.toUpperCamelCase(base);
  }

  public static String getArgumentName(final String base) {
    return NameHelper.toLowerCamelCase(base);
  }

  public static String getConstantName(final String base) {
    return NameHelper.toUpperSnakeCase(base);
  }

  public static String getFieldName(final String base) {
    return NameHelper.toLowerCamelCase(base);
  }

  public static String getExceptionName(final String base) {
    return base + "Exception";
  }

  public static String getPackageName(final String base) {
    return base.replace("_", "");
  }
}
