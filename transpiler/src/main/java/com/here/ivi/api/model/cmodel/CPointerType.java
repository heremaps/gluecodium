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

package com.here.ivi.api.model.cmodel;

import java.util.ArrayList;

public class CPointerType extends CType {
  public static final CPointerType CONST_CHAR_PTR = makeConstPointer(CType.CHAR);

  public CPointerType(CType type) {
    super(type.name, new ArrayList<>(type.includes));
    isConst = type.isConst;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }

    CType that = (CType) o;
    return super.equals(that);
  }

  public static CPointerType makeConstPointer(CType type) {
    CType underlineType = new CType(type.name, new ArrayList<>(type.includes));
    underlineType.isConst = true;
    return new CPointerType(underlineType);
  }

  @Override
  public String toString() {
    return super.toString() + "*";
  }
}
