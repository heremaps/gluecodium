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

package com.here.ivi.api.model.cppmodel;

import com.here.ivi.api.generator.cpp.CppLibraryIncludes;

public class CppPrimitiveTypeRef extends CppTypeRef {

  public final Type type;

  public enum Type {
    VOID("void"),
    BOOL("bool"),
    FLOAT("float"),
    DOUBLE("double"),
    INT8("int8_t", true),
    INT16("int16_t", true),
    INT32("int32_t", true),
    INT64("int64_t", true),
    UINT8("uint8_t", true),
    UINT16("uint16_t", true),
    UINT32("uint32_t", true),
    UINT64("uint64_t", true);

    public final String value;
    public final boolean isIntegerType;

    Type(final String value) {
      this(value, false);
    }

    Type(final String value, final boolean isIntegerType) {
      this.value = value;
      this.isIntegerType = isIntegerType;
    }
  }

  public CppPrimitiveTypeRef(final Type type) {
    super(type.value);
    this.type = type;
    if (type.isIntegerType) {
      includes.add(CppLibraryIncludes.INT_TYPES);
    }
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    if (!super.equals(o)) {
      return false;
    }

    return type == ((CppPrimitiveTypeRef) o).type;
  }

  @Override
  public int hashCode() {
    int result = super.hashCode();
    result = 31 * result + (type != null ? type.hashCode() : 0);
    return result;
  }

  @Override
  public boolean refersToValueType() {
    return true;
  }
}
