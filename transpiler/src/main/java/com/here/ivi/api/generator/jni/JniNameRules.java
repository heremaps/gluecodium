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

package com.here.ivi.api.generator.jni;

import com.here.ivi.api.generator.android.AndroidGeneratorSuite;
import com.here.ivi.api.model.javamodel.JavaCustomType;
import com.here.ivi.api.model.jni.JniContainer;
import java.io.File;
import java.util.List;

public final class JniNameRules {

  private static final String JNI_HEADER_FILE_SUFFIX = ".h";
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

  public static String getStructConversionHeaderFileName() {
    return getJniPathPrefix() + JNI_STRUCT_CONVERSION_NAME + JNI_HEADER_FILE_SUFFIX;
  }

  public static String getProxyConversionHeaderFileName() {
    return getJniPathPrefix() + JNI_PROXY_CONVERSION_NAME + JNI_HEADER_FILE_SUFFIX;
  }

  public static String getEnumConversionHeaderFileName() {
    return getJniPathPrefix() + JNI_ENUM_CONVERSION_NAME + JNI_HEADER_FILE_SUFFIX;
  }

  public static String getEnumConversionImplementationFileName() {
    return getJniPathPrefix() + JNI_ENUM_CONVERSION_NAME + JNI_IMPLEMENTATION_FILE_SUFFIX;
  }

  public static String getStructConversionImplementationFileName() {
    return getJniPathPrefix() + JNI_STRUCT_CONVERSION_NAME + JNI_IMPLEMENTATION_FILE_SUFFIX;
  }

  public static String getInstanceConversionHeaderFileName() {
    return getJniPathPrefix() + JNI_INSTANCE_CONVERSION_NAME + JNI_HEADER_FILE_SUFFIX;
  }

  public static String getInstanceConversionImplementationFileName() {
    return getJniPathPrefix() + JNI_INSTANCE_CONVERSION_NAME + JNI_IMPLEMENTATION_FILE_SUFFIX;
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

  private static String getJniPathPrefix() {
    return AndroidGeneratorSuite.GENERATOR_NAME + File.separator + "jni" + File.separator;
  }
}
