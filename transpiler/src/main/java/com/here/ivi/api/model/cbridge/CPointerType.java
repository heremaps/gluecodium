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

package com.here.ivi.api.model.cbridge;

public final class CPointerType extends CType {

  public static final CPointerType CONST_CHAR_PTR = makeConstPointer(CType.CHAR);

  private final CType pointedType;

  private CPointerType(CType type) {
    super("*", type.includes);
    pointedType = type;
  }

  public static CPointerType makeConstPointer(CType type) {
    CType underlyingType = new CType(type.name, type.includes);
    underlyingType.isConst = true;
    return new CPointerType(underlyingType);
  }

  @Override
  public String toString() {
    StringBuilder fullType = new StringBuilder().append(pointedType.toString()).append(name);
    if (isConst) {
      fullType.append(' ').append(CONST_SPECIFIER);
    }
    return fullType.toString();
  }
}
