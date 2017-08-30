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
    STRUCT
  };

  public static final SwiftType VOID = new SwiftType("Void");
  public static final SwiftType String = new SwiftType("String", TypeCategory.BUILTIN_STRING);
  public static final SwiftType Data = new SwiftType("Data", TypeCategory.BUILTIN_BYTEBUFFER);

  public boolean optional;
  private final TypeCategory category;

  public SwiftType(String name) {
    this(name, TypeCategory.BUILTIN_SIMPLE, false);
  }

  public SwiftType(String name, TypeCategory category) {
    this(name, category, false);
  }

  public SwiftType(String name, TypeCategory category, boolean optional) {
    super(name);
    this.optional = optional;
    this.category = category;
  }

  public String getCategory() {
    return category.toString();
  }
}
