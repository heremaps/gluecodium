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

package com.here.ivi.api.generator.common;

import static org.apache.commons.text.WordUtils.capitalizeFully;

import com.google.common.base.CaseFormat;
import com.google.common.base.CharMatcher;
import com.google.common.base.Strings;

public final class NameHelper {

  private static final String UNDERSCORE = "_";

  public static String toUpperSnakeCase(String input) {
    if (input == null) {
      return "";
    }
    if (input.contains(UNDERSCORE)) {
      return CaseFormat.LOWER_UNDERSCORE.to(CaseFormat.UPPER_UNDERSCORE, input);
    } else if (CharMatcher.JAVA_LOWER_CASE.matchesAnyOf(input)
        && CharMatcher.JAVA_UPPER_CASE.matchesAnyOf(input)) {
      return CaseFormat.UPPER_CAMEL.to(CaseFormat.UPPER_UNDERSCORE, input);
    } else {
      return input.toUpperCase();
    }
  }

  public static String toLowerSnakeCase(String input) {
    if (input == null) {
      return "";
    }
    if (input.contains(UNDERSCORE)) {
      return CaseFormat.UPPER_UNDERSCORE.to(CaseFormat.LOWER_UNDERSCORE, input);
    } else if (CharMatcher.JAVA_LOWER_CASE.matchesAnyOf(input)
        && CharMatcher.JAVA_UPPER_CASE.matchesAnyOf(input)) {
      return CaseFormat.UPPER_CAMEL.to(CaseFormat.LOWER_UNDERSCORE, input);
    } else {
      return input.toLowerCase();
    }
  }

  public static String toUpperCamelCase(String input) {
    if (input == null) {
      return "";
    }
    if (input.contains(UNDERSCORE)) {
      return CaseFormat.LOWER_UNDERSCORE.to(CaseFormat.UPPER_CAMEL, input);
    } else if (CharMatcher.JAVA_LOWER_CASE.matchesAnyOf(input)
        && CharMatcher.JAVA_UPPER_CASE.matchesAnyOf(input)) {
      return CaseFormat.LOWER_CAMEL.to(CaseFormat.UPPER_CAMEL, input);
    } else {
      // Capitalize first character and lower rest
      return capitalizeFully(input);
    }
  }

  public static String toLowerCamelCase(String input) {
    if (input == null) {
      return "";
    }
    if (input.contains(UNDERSCORE)) {
      return CaseFormat.LOWER_UNDERSCORE.to(CaseFormat.LOWER_CAMEL, input);
    } else if (CharMatcher.JAVA_LOWER_CASE.matchesAnyOf(input)
        && CharMatcher.JAVA_UPPER_CASE.matchesAnyOf(input)) {
      return CaseFormat.UPPER_CAMEL.to(CaseFormat.LOWER_CAMEL, input);
    } else {
      return input.toLowerCase();
    }
  }

  public static String joinNames(
      final String firstString, final String secondString, final String delimiter) {
    if (Strings.isNullOrEmpty(firstString)) {
      return secondString;
    } else if (Strings.isNullOrEmpty(secondString)) {
      return firstString;
    } else {
      return firstString + delimiter + secondString;
    }
  }
}
