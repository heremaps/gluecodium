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

public final class SwiftArray extends SwiftType {

  public final SwiftType underlyingType;
  public final SwiftGenericParameter genericParameter;
  public String refName;

  public SwiftArray(final SwiftType underlyingType) {
    this(null, getImplName(underlyingType), false, underlyingType);
  }

  public SwiftArray(final SwiftType underlyingType, final String implementingClass) {
    this(implementingClass, getImplName(underlyingType), false, underlyingType);
  }

  private SwiftArray(
      final String implementingClass,
      final String publicName,
      final boolean optional,
      final SwiftType underlyingType) {
    super(getImplName(underlyingType), TypeCategory.ARRAY, implementingClass, publicName, optional);
    this.underlyingType = underlyingType;
    this.genericParameter = new SwiftGenericParameter(null, this);
  }

  @SuppressWarnings("unused")
  public String getSwiftArrayConversion() {
    return swiftRecursiveTransformation(underlyingType);
  }

  @SuppressWarnings("unused")
  public boolean isNested() {
    return (underlyingType.category == TypeCategory.ARRAY);
  }

  @SuppressWarnings("unused")
  public String getPrivateInnerType() {
    return underlyingType.implementingClass;
  }

  @Override
  public SwiftType createAlias(String aliasName) {
    SwiftArray alias = new SwiftArray(implementingClass, aliasName, optional, underlyingType);
    alias.refName = refName;
    return alias;
  }

  private static String getImplName(SwiftType underlyingType) {
    return "CollectionOf<" + underlyingType.name + ">";
  }

  private String swiftRecursiveTransformation(final SwiftType type) {
    if (type.category == TypeCategory.ARRAY) {
      SwiftArray arrayType = (SwiftArray) type;
      return "[" + swiftRecursiveTransformation(arrayType.underlyingType) + "]";
    } else {
      return type.name;
    }
  }
}
