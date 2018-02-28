/*
 * Copyright (c) 2016-2018 HERE Europe B.V.
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

package com.here.ivi.api.generator.jni;

import com.here.ivi.api.model.java.JavaCustomType;
import com.here.ivi.api.model.jni.JniContainer;
import com.here.ivi.api.platform.android.AndroidGeneratorSuite;
import java.io.File;
import java.util.List;

public final class JniNameRules {

  public static final String JNI_HEADER_FILE_SUFFIX = ".h";
  private static final String JNI_IMPLEMENTATION_FILE_SUFFIX = ".cpp";
  private static final String JNI_ENUM_CONVERSION_NAME = "EnumConversion";
  private static final String JNI_STRUCT_CONVERSION_NAME = "StructConversion";
  private static final String JNI_INSTANCE_CONVERSION_NAME = "InstanceConversion";
  private static final String JNI_PROXY_CONVERSION_NAME = "ProxyConversion";

  public static String getHeaderFileName(JniContainer jniContainer) {
    return getJniClassFileName(jniContainer) + JNI_HEADER_FILE_SUFFIX;
  }

  public static String getCppProxyHeaderFileName(JniContainer jniContainer) {
    return getJniClassFileName(jniContainer) + "CppProxy" + JNI_HEADER_FILE_SUFFIX;
  }

  public static String getCppProxyImplementationFileName(JniContainer jniContainer) {
    return getJniClassFileName(jniContainer) + "CppProxy" + JNI_IMPLEMENTATION_FILE_SUFFIX;
  }

  public static String getImplementationFileName(JniContainer jniContainer) {
    return getJniClassFileName(jniContainer) + JNI_IMPLEMENTATION_FILE_SUFFIX;
  }

  public static String getHeaderFilePath(final String fileName) {
    return getJniPathPrefix() + fileName + JNI_HEADER_FILE_SUFFIX;
  }

  public static String getImplementationFilePath(final String fileName) {
    return getJniPathPrefix() + fileName + JNI_IMPLEMENTATION_FILE_SUFFIX;
  }

  public static String getStructConversionHeaderFileName() {
    return getHeaderFilePath(JNI_STRUCT_CONVERSION_NAME);
  }

  public static String getProxyConversionHeaderFileName() {
    return getHeaderFilePath(JNI_PROXY_CONVERSION_NAME);
  }

  public static String getEnumConversionHeaderFileName() {
    return getHeaderFilePath(JNI_ENUM_CONVERSION_NAME);
  }

  public static String getEnumConversionImplementationFileName() {
    return getImplementationFilePath(JNI_ENUM_CONVERSION_NAME);
  }

  public static String getStructConversionImplementationFileName() {
    return getImplementationFilePath(JNI_STRUCT_CONVERSION_NAME);
  }

  public static String getInstanceConversionHeaderFileName() {
    return getHeaderFilePath(JNI_INSTANCE_CONVERSION_NAME);
  }

  public static String getInstanceConversionImplementationFileName() {
    return getImplementationFilePath(JNI_INSTANCE_CONVERSION_NAME);
  }

  public static String getNativeParameterName(final String javaParameterName) {
    if (javaParameterName == null || javaParameterName.isEmpty()) {
      return "";
    }

    return "n" + javaParameterName;
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
    return String.join("/", javaType.packageNames) + "/" + javaType.name;
  }

  private static String formatPackageName(List<String> packageNames) {
    return packageNames.isEmpty() ? "" : String.join("_", packageNames) + "_";
  }

  private static String getJniClassFileName(final JniContainer jniContainer) {
    return getJniPathPrefix()
        + formatPackageName(jniContainer.javaPackages)
        + jniContainer.javaName;
  }

  public static String getJniPathPrefix() {
    return AndroidGeneratorSuite.GENERATOR_NAME + File.separator + "jni" + File.separator;
  }
}
