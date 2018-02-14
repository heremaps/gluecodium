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

import com.here.ivi.api.cli.TranspilerExecutionException;
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

  /**
   * Wrap primitive types since generic templates don't apply to them
   *
   * @param primitiveType a primitive type
   * @return custom type wrapper of the primitive type
   */
  public static JavaReferenceType boxPrimitiveType(JavaPrimitiveType primitiveType) {
    if (primitiveType == JavaPrimitiveType.BOOL) {
      return new JavaReferenceType(JavaReferenceType.Type.BOOL);
    } else if (primitiveType == JavaPrimitiveType.CHAR) {
      return new JavaReferenceType(JavaReferenceType.Type.CHAR);
    } else if (primitiveType == JavaPrimitiveType.INT) {
      return new JavaReferenceType(JavaReferenceType.Type.INT);
    } else if (primitiveType == JavaPrimitiveType.FLOAT) {
      return new JavaReferenceType(JavaReferenceType.Type.FLOAT);
    } else if (primitiveType == JavaPrimitiveType.DOUBLE) {
      return new JavaReferenceType(JavaReferenceType.Type.DOUBLE);
    } else if (primitiveType == JavaPrimitiveType.BYTE) {
      return new JavaReferenceType(JavaReferenceType.Type.BYTE);
    } else if (primitiveType == JavaPrimitiveType.SHORT) {
      return new JavaReferenceType(JavaReferenceType.Type.SHORT);
    } else if (primitiveType == JavaPrimitiveType.LONG) {
      return new JavaReferenceType(JavaReferenceType.Type.LONG);
    } else {
      // No array for void type
      throw new TranspilerExecutionException("Can not wrap primitive type " + primitiveType.name);
    }
  }
}
