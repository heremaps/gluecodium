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

public final class SwiftClass extends SwiftType {

  public final boolean isInterface;
  public final String parentClass;
  public final List<String> implementsProtocols = new LinkedList<>();
  public final List<SwiftProperty> properties = new LinkedList<>();
  public final List<SwiftMethod> methods = new LinkedList<>();
  public final List<SwiftContainerType> structs = new LinkedList<>();
  public final List<SwiftEnum> enums = new LinkedList<>();
  public final String nameSpace;
  public final String cInstance;
  public final List<SwiftTypeDef> typedefs = new LinkedList<>();
  public final String functionTableName;

  @lombok.Builder(builderClassName = "Builder")
  private SwiftClass(
      final String name,
      final boolean isInterface,
      final String parentClass,
      final String nameSpace,
      final String cInstance,
      final String functionTableName) {
    super(name, TypeCategory.CLASS);
    this.isInterface = isInterface;
    this.parentClass = parentClass;
    this.nameSpace = nameSpace;
    this.cInstance = cInstance;
    this.functionTableName = functionTableName;
  }

  @SuppressWarnings("unused")
  public List<String> baseAndProtocols() {
    LinkedList<String> baseAndProtocols = new LinkedList<>(implementsProtocols);
    if (parentClass != null) {
      baseAndProtocols.addFirst(parentClass);
    }
    return baseAndProtocols;
  }

  public static Builder builder(final String name) {
    return new Builder().name(name);
  }
}
