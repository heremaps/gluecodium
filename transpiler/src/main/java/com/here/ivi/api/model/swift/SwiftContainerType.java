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

public class SwiftContainerType extends SwiftType {
  public List<SwiftField> fields;
  public String cPrefix;
  public String cType;

  public SwiftContainerType(String name) {
    this(name, TypeCategory.STRUCT);
  }

  public SwiftContainerType(String name, TypeCategory category) {
    this(name, null, false, category);
  }

  public SwiftContainerType(
      String name, String typealias, Boolean optional, TypeCategory category) {
    super(name, category, optional, null, typealias);
    fields = emptyList();
    cPrefix = "";
    cType = "";
  }

  public SwiftType createAlias(final String aliasName) {
    SwiftContainerType container = new SwiftContainerType(name, aliasName, optional, category);
    container.comment = this.comment;
    container.fields = this.fields;
    container.cPrefix = this.cPrefix;
    container.cType = this.cType;
    container.implementingClass = this.implementingClass;
    return container;
  }
}
