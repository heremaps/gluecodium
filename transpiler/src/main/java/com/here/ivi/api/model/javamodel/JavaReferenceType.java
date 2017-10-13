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

package com.here.ivi.api.model.javamodel;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public final class JavaReferenceType extends JavaComplexType {

  private static final List<String> JAVA_PACKAGE_NAMES = Arrays.asList("java", "lang");

  public enum Type {
    OBJECT("Object"), // All java objects
    CLASS("Class"), // java.lang.Class objects
    STRING("String"), // java.lang.String objects
    THROWABLE("Throwable"), // java.lang.Throwable objects
    BOOL("Boolean"),
    BYTE("Byte"),
    CHAR("Character"),
    SHORT("Short"),
    INT("Integer"),
    LONG("Long"),
    FLOAT("Float"),
    DOUBLE("Double");

    private final String value;

    Type(final String value) {
      this.value = value;
    }

    public String getValue() {
      return value;
    }
  }

  public final Type type;

  public JavaReferenceType(final Type type) {
    super(
        type.getValue(),
        Arrays.asList(type.getValue()),
        JAVA_PACKAGE_NAMES,
        Collections.emptyList());
    this.type = type;
  }

  @Override
  public String getLiteralName() {
    switch (type) {
      case STRING:
        return "string";
      default:
        return type.getValue();
    }
  }
}
