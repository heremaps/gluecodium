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

import static java.util.Collections.emptyList;

import java.util.List;

public final class SwiftContainerType extends SwiftType {

  public List<SwiftField> fields;
  public String cPrefix;
  public String cType;

  public SwiftContainerType(final String name) {
    this(name, TypeCategory.STRUCT, null);
  }

  public SwiftContainerType(
      final String name, final TypeCategory category, final String implementingClass) {
    this(name, category, implementingClass, name, false);
  }

  private SwiftContainerType(
      final String name,
      final TypeCategory category,
      final String implementingClass,
      final String publicName,
      final boolean optional) {
    super(name, category, implementingClass, publicName, optional);
    fields = emptyList();
    cPrefix = "";
    cType = "";
  }

  @Override
  public SwiftType createAlias(final String aliasName) {
    SwiftContainerType container =
        new SwiftContainerType(name, category, implementingClass, aliasName, optional);
    container.comment = this.comment;
    container.fields = this.fields;
    container.cPrefix = this.cPrefix;
    container.cType = this.cType;
    return container;
  }

  @Override
  public SwiftType createOptionalType() {
    SwiftContainerType container =
        new SwiftContainerType(name, category, implementingClass, publicName, true);
    container.comment = this.comment;
    container.fields = this.fields;
    container.cPrefix = this.cPrefix;
    container.cType = this.cType;
    return container;
  }
}
