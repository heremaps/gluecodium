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

package com.here.ivi.api.model.swift;

public class SwiftType extends SwiftModelElement {

  public enum TypeCategory {
    BUILTIN_SIMPLE,
    BUILTIN_STRING,
    BUILTIN_BYTEBUFFER,
    STRUCT,
    ENUM,
    CLASS,
  }

  public static final SwiftType VOID = new SwiftType("Void");
  public static final SwiftType STRING = new SwiftType("String", TypeCategory.BUILTIN_STRING);
  public static final SwiftType DATA = new SwiftType("Data", TypeCategory.BUILTIN_BYTEBUFFER);

  public boolean optional;
  public final TypeCategory category;
  public String implementingClass;
  private final String typealiasName;

  public SwiftType(String name) {
    this(name, TypeCategory.BUILTIN_SIMPLE, false);
  }

  public SwiftType(String name, TypeCategory category) {
    this(name, category, false);
  }

  public SwiftType(String name, TypeCategory category, boolean optional) {
    this(name, category, optional, null, null);
  }

  public SwiftType(
      final String name,
      final TypeCategory category,
      final boolean optional,
      final String implementingClass,
      final String typealiasName) {
    super(name);
    this.optional = optional;
    this.category = category;
    this.implementingClass = implementingClass;
    this.typealiasName = typealiasName;
  }

  public SwiftType createAlias(final String aliasName) {
    return new SwiftType(name, category, optional, implementingClass, aliasName);
  }

  @SuppressWarnings("unused")
  public String getPublicName() {
    return typealiasName != null ? typealiasName : name;
  }
}
