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

package com.here.ivi.api.generator.common.jni;

import com.here.ivi.api.generator.android.AndroidGeneratorSuite;
import com.here.ivi.api.model.javamodel.JavaClass;
import java.io.File;
import java.util.List;

public final class JniNameRules {

  private static final String JNI_HEADER_FILE_SUFFIX = ".h";
  private static final String JNI_IMPLEMENTATION_FILE_SUFFIX = ".cpp";
  private static final String JNI_CONVERSION_NAME = "StructConversion";

  public static String getHeaderFileName(final JavaClass javaClass) {
    return getJniClassFileName(javaClass) + JNI_HEADER_FILE_SUFFIX;
  }

  public static String getImplementationFileName(final JavaClass javaClass) {
    return getJniClassFileName(javaClass) + JNI_IMPLEMENTATION_FILE_SUFFIX;
  }

  public static String getConversionHeaderFileName() {
    return getJniPathPrefix() + JNI_CONVERSION_NAME + JNI_HEADER_FILE_SUFFIX;
  }

  public static String getConversionImplementationFileName() {
    return getJniPathPrefix() + JNI_CONVERSION_NAME + JNI_IMPLEMENTATION_FILE_SUFFIX;
  }

  public static String getParameterName(final String javaParameterName) {
    if (javaParameterName == null || javaParameterName.isEmpty()) {
      return "";
    }

    return "j" + javaParameterName;
  }

  public static String getNativeParameterName(final String javaParameterName) {
    if (javaParameterName == null || javaParameterName.isEmpty()) {
      return "";
    }

    return "n" + javaParameterName;
  }

  public static String getPackageName(final List<String> javaPackages) {
    if (javaPackages == null || javaPackages.isEmpty()) {
      return "";
    }

    return String.join("_", javaPackages);
  }

  private static String formatPackageName(List<String> packageNames) {
    return packageNames.isEmpty() ? "" : String.join("_", packageNames) + "_";
  }

  private static String getJniClassFileName(final JavaClass javaClass) {
    return getJniPathPrefix()
        + formatPackageName(javaClass.javaPackage.packageNames)
        + javaClass.name;
  }

  private static String getJniPathPrefix() {
    return AndroidGeneratorSuite.GENERATOR_NAMESPACE + File.separator + "jni" + File.separator;
  }
}
