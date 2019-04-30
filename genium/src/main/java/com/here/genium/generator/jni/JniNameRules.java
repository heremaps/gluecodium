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

package com.here.genium.generator.jni;

import com.here.genium.model.java.JavaCustomType;
import com.here.genium.model.jni.JniContainer;
import com.here.genium.model.jni.JniStruct;
import java.io.File;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;

public final class JniNameRules {

  private static final String JNI_HEADER_FILE_SUFFIX = ".h";
  private static final String JNI_IMPLEMENTATION_FILE_SUFFIX = ".cpp";
  public static final String JNI_ENUM_CONVERSION_NAME = "EnumConversion";
  public static final String JNI_STRUCT_CONVERSION_NAME = "StructConversion";
  public static final String JNI_INSTANCE_CONVERSION_NAME = "InstanceConversion";
  public static final String JNI_PROXY_CONVERSION_NAME = "ProxyConversion";
  public static final String JNI_CPP_PROXY_SUFFIX = "CppProxy";

  private final String generatorName;

  public JniNameRules(final String generatorName) {
    this.generatorName = generatorName;
  }

  public String getHeaderFilePath(final String fileName) {
    return getJniPathPrefix() + getHeaderFileName(fileName);
  }

  public static String getHeaderFileName(final String fileName) {
    return fileName + JNI_HEADER_FILE_SUFFIX;
  }

  public String getImplementationFilePath(final String fileName) {
    return getJniPathPrefix() + fileName + JNI_IMPLEMENTATION_FILE_SUFFIX;
  }

  /**
   * JNI name mangling. See
   * https://docs.oracle.com/javase/7/docs/technotes/guides/jni/spec/design.html#wp641
   */
  public static String getMangledName(final String name) {
    return name.replace("_", "_1")
        .replace(";", "_2")
        .replace("[", "_3")
        .replace("$", "_00024")
        .replace("/", "_");
  }

  public static String getFullClassName(final JavaCustomType javaType) {
    return String.join("/", javaType.packageNames) + "/" + String.join("$", javaType.classNames);
  }

  private static String formatPackageName(List<String> packageNames) {
    return packageNames.isEmpty() ? "" : String.join("_", packageNames);
  }

  public static String getJniClassFileName(final JniContainer jniContainer) {
    List<String> nameComponents =
        Arrays.asList(
            formatPackageName(jniContainer.getJavaPackages()), jniContainer.getJavaName());
    return String.join("_", nameComponents);
  }

  public static String getJniStructFileName(
      final JniContainer jniContainer, final JniStruct jniStruct) {

    List<String> nameComponents = new LinkedList<>();
    nameComponents.add(formatPackageName(jniContainer.getJavaPackages()));
    if (jniContainer.getJavaName() != null) {
      nameComponents.add(jniContainer.getJavaName());
    }
    nameComponents.add(jniStruct.getJavaClass().name);

    return String.join("_", nameComponents);
  }

  private String getJniPathPrefix() {
    return generatorName + File.separator + "jni" + File.separator;
  }
}
