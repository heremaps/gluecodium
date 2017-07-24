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

import com.here.ivi.api.generator.common.cpp.CppLibraryIncludes;
import java.util.EnumSet;

public class CppPrimitiveType extends CppType {

  public static final EnumSet<CppPrimitiveType.Type> TYPES =
      EnumSet.allOf(CppPrimitiveType.Type.class);

  public static final CppPrimitiveType VOID_TYPE = new CppPrimitiveType(Type.VOID);

  public enum Type {
    VOID("void"),
    BOOL("bool"),
    FLOAT("float"),
    DOUBLE("double"),
    INT8("int8_t"),
    INT16("int16_t"),
    INT32("int32_t"),
    INT64("int64_t"),
    UINT8("uint8_t"),
    UINT16("uint16_t"),
    UINT32("uint32_t"),
    UINT64("uint64_t");

    private final String value;

    Type(final String value) {
      this.value = value;
    }

    public String getValue() {
      return value;
    }
  }

  public final Type type;

  public CppPrimitiveType(final Type type) {
    super(type.getValue());
    this.type = type;
    addIncludes();
  }

  private void addIncludes() {
    //add includes for integer types
    switch (this.type) {
      case INT8:
      case INT16:
      case INT32:
      case INT64:
      case UINT8:
      case UINT16:
      case UINT32:
      case UINT64:
        this.includes.add(CppLibraryIncludes.INT_TYPES);
    }
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;
    if (!super.equals(o)) return false;

    CppPrimitiveType that = (CppPrimitiveType) o;

    return type == that.type;
  }

  @Override
  public int hashCode() {
    int result = super.hashCode();
    result = 31 * result + (type != null ? type.hashCode() : 0);
    return result;
  }

  @Override
  public boolean isValueType() {
    return true;
  }
}
