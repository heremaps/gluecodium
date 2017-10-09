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

import com.google.common.base.CaseFormat;

public class NameHelper {
  private static final String UNDERSCORE = "_";

  public static String toUpperSnakeCase(String input) {
    if (input == null) {
      return "";
    }
    if (input.contains(UNDERSCORE)) {
      return CaseFormat.LOWER_UNDERSCORE.to(CaseFormat.UPPER_UNDERSCORE, input);
    } else {
      return CaseFormat.UPPER_CAMEL.to(CaseFormat.UPPER_UNDERSCORE, input);
    }
  }

  public static String toUpperCamelCase(String input) {
    if (input == null) {
      return "";
    }
    if (input.contains(UNDERSCORE)) {
      return CaseFormat.LOWER_UNDERSCORE.to(CaseFormat.UPPER_CAMEL, input);
    } else {
      return CaseFormat.LOWER_CAMEL.to(CaseFormat.UPPER_CAMEL, input);
    }
  }

  public static String toLowerCamelCase(String input) {
    if (input == null) {
      return "";
    }
    if (input.contains(UNDERSCORE)) {
      return CaseFormat.LOWER_UNDERSCORE.to(CaseFormat.LOWER_CAMEL, input);
    } else {
      return CaseFormat.UPPER_CAMEL.to(CaseFormat.LOWER_CAMEL, input);
    }
  }
}
