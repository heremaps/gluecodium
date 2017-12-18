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

package com.here.ivi.api.model.java;

public enum JavaVisibility {
  PACKAGE(""),
  PUBLIC("public"),
  PROTECTED("protected"),
  PRIVATE("private");

  private final String value;

  JavaVisibility(final String value) {
    this.value = value;
  }

  @Override
  public String toString() {
    return value;
  }
}
