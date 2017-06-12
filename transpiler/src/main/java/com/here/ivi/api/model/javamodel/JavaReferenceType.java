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

import java.util.Collection;
import java.util.EnumSet;

public class JavaReferenceType extends JavaElementWithImports implements JavaType {
  public static final EnumSet<Type> TYPES = EnumSet.allOf(Type.class);

  public enum Type {
    OBJECT("Object"), // All java objects
    CLASS("Class"), // java.lang.Class objects
    STRING("String"), // java.lang.String objects
    OBJECT_ARRAY("Object[]"),
    BOOLEAN_ARRAY("boolean[]"),
    BYTE_ARRAY("byte[]"),
    CHAR_ARRAY("char[]"),
    SHORT_ARRAY("short[]"),
    INT_ARRAY("int[]"),
    LONG_ARRAY("long[]"),
    FLOAT_ARRAY("float[]"),
    DOUBLE_ARRAY("double[]"),
    THROWABLE("Throwable"); // java.lang.Throwable objects

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
    super(type.getValue());
    this.type = type;
  }

  /**
   * Package local constructor for sub-classes with imports. Pre-defined reference types have no
   * explicit imports (as java.lang.* is implicit).
   */
  JavaReferenceType(final Type type, final Collection<JavaImport> imports) {
    super(type.getValue(), imports);
    this.type = type;
  }

  @Override
  public String getName() {
    return type.getValue();
  }

  @Override
  public boolean isValid() {
    return true;
  }
}
