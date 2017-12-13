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

import java.util.LinkedList;
import java.util.List;

public final class SwiftContainerType extends SwiftType {

  public final List<SwiftField> fields = new LinkedList<>();
  public final SwiftContainerType parent;
  public final String cPrefix;
  public final String cType;

  @SuppressWarnings("ParameterNumber")
  @lombok.Builder(builderClassName = "Builder")
  private SwiftContainerType(
      final String name,
      final TypeCategory category,
      final String implementingClass,
      final String publicName,
      final boolean optional,
      final SwiftContainerType parent,
      final String cPrefix,
      final String cType) {
    super(
        name,
        category != null ? category : TypeCategory.STRUCT,
        implementingClass,
        publicName != null ? publicName : name,
        optional);
    this.parent = parent;
    this.cPrefix = cPrefix;
    this.cType = cType;
  }

  public static Builder builder(final String name) {
    return new Builder().name(name);
  }

  @Override
  public SwiftType createAlias(final String aliasName) {
    SwiftContainerType container =
        new SwiftContainerType(
            name, category, implementingClass, aliasName, optional, parent, cPrefix, cType);
    container.comment = this.comment;
    container.fields.addAll(fields);
    return container;
  }

  @Override
  public SwiftType createOptionalType() {
    SwiftContainerType container =
        new SwiftContainerType(
            name, category, implementingClass, publicName, true, parent, cPrefix, cType);
    container.comment = this.comment;
    container.fields.addAll(fields);
    return container;
  }
}
