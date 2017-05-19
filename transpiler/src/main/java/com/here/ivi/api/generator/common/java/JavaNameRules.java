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

package com.here.ivi.api.generator.common.java;

import com.here.ivi.api.generator.common.NameHelper;
import com.here.ivi.api.model.javamodel.JavaClass;
import java.io.File;
import org.franca.core.franca.FType;
import org.franca.core.franca.FTypeCollection;

public final class JavaNameRules {
  private static final String JAVA_FILE_ENDING = ".java";
  private static final String JAVA_PACKAGE_SEPARATOR = ".";

  // TODO: Fetch package root from AndroidSpec later on:
  private static final String JAVA_PACKAGE_ROOT = "com.here.ivi";

  private JavaNameRules() {}

  public static String getFileName(final JavaClass javaClass, final String namespace) {
    return namespace
        + File.separator
        + JAVA_PACKAGE_ROOT.replace(JAVA_PACKAGE_SEPARATOR, File.separator)
        + File.separator
        + javaClass.name
        + JAVA_FILE_ENDING;
  }

  public static String getTypename(final FType type) {
    return type.getName();
  }

  public static String getClassName(final FTypeCollection base) {
    return NameHelper.toUpperCamelCase(base.getName());
  }

  public static String getMethodName(final String base) {
    return NameHelper.toLowerCamelCase(base);
  }

  public static String getArgumentName(final String base) {
    return NameHelper.toLowerCamelCase(base);
  }

  public static String getConstantName(final String base) {
    return NameHelper.toUpperSnakeCase(base);
  }

  public static String getEnumName(final String base) {
    return NameHelper.toLowerCamelCase(base);
  }

  public static String getEnumEntryName(final String base) {
    return NameHelper.toLowerCamelCase(base);
  }

  public static String getFieldName(final String base) {
    return NameHelper.toLowerCamelCase(base);
  }
}
