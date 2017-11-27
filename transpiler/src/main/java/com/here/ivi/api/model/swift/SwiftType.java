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
    ARRAY,
  }

  public static final SwiftType VOID = new SwiftType("Void");
  public static final SwiftType STRING = new SwiftType("String", TypeCategory.BUILTIN_STRING);
  public static final SwiftType DATA = new SwiftType("Data", TypeCategory.BUILTIN_BYTEBUFFER);

  public final TypeCategory category;
  public final String implementingClass;
  public final String publicName;
  public final boolean optional;

  public SwiftType(final String name) {
    this(name, TypeCategory.BUILTIN_SIMPLE, null, name, false);
  }

  public SwiftType(final String name, final TypeCategory category) {
    this(name, category, null, name, false);
  }

  protected SwiftType(
      final String name,
      final TypeCategory category,
      final String implementingClass,
      final String publicName,
      final boolean optional) {
    super(name);
    this.optional = optional;
    this.category = category;
    this.implementingClass = implementingClass;
    this.publicName = publicName;
  }

  public SwiftType createAlias(final String aliasName) {
    return new SwiftType(name, category, implementingClass, aliasName, optional);
  }

  public SwiftType createOptionalType() {
    return new SwiftType(name, category, implementingClass, publicName, true);
  }
}
