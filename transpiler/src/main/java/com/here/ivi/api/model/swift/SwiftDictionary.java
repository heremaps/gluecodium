/*
 * Copyright (C) 2018 HERE Global B.V. and its affiliate(s). All rights reserved.
 *
 * This software, including documentation, is protected by copyright controlled by
 * HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
 * adapting or translating, any or all of this material requires the prior written
 * consent of HERE Global B.V. This material also contains confidential information,
 * which may not be disclosed to others without prior written consent of HERE Global B.V.
 *
 */

package com.here.ivi.api.model.swift;

public final class SwiftDictionary extends SwiftType {

  public final SwiftType keyType;
  public final SwiftType valueType;
  public final String cPrefix;

  @lombok.Builder(builderClassName = "Builder")
  private SwiftDictionary(
      final String name, final SwiftType keyType, final SwiftType valueType, final String cPrefix) {
    super(name, TypeCategory.DICTIONARY, null, createPublicName(name, keyType, valueType), false);
    this.keyType = keyType;
    this.valueType = valueType;
    this.cPrefix = cPrefix;
  }

  public static Builder builder(final String name) {
    return new Builder().name(name);
  }

  private static String createPublicName(
      final String name, final SwiftType keyType, final SwiftType valueType) {
    return name != null ? name : "[" + keyType.name + ": " + valueType.name + "]";
  }
}
