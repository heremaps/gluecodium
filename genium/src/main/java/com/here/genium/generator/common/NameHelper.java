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

package com.here.genium.generator.common;

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
