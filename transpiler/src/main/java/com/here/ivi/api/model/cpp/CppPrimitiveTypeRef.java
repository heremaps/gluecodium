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

package com.here.ivi.api.model.cpp;

import com.here.ivi.api.generator.cpp.CppLibraryIncludes;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
public final class CppPrimitiveTypeRef extends CppTypeRef {

  public static final CppPrimitiveTypeRef VOID = new CppPrimitiveTypeRef(Type.VOID);
  public static final CppPrimitiveTypeRef BOOL = new CppPrimitiveTypeRef(Type.BOOL);
  public static final CppPrimitiveTypeRef FLOAT = new CppPrimitiveTypeRef(Type.FLOAT);
  public static final CppPrimitiveTypeRef DOUBLE = new CppPrimitiveTypeRef(Type.DOUBLE);
  public static final CppPrimitiveTypeRef INT8 = new CppPrimitiveTypeRef(Type.INT8);
  public static final CppPrimitiveTypeRef INT16 = new CppPrimitiveTypeRef(Type.INT16);
  public static final CppPrimitiveTypeRef INT32 = new CppPrimitiveTypeRef(Type.INT32);
  public static final CppPrimitiveTypeRef INT64 = new CppPrimitiveTypeRef(Type.INT64);
  public static final CppPrimitiveTypeRef UINT8 = new CppPrimitiveTypeRef(Type.UINT8);
  public static final CppPrimitiveTypeRef UINT16 = new CppPrimitiveTypeRef(Type.UINT16);
  public static final CppPrimitiveTypeRef UINT32 = new CppPrimitiveTypeRef(Type.UINT32);
  public static final CppPrimitiveTypeRef UINT64 = new CppPrimitiveTypeRef(Type.UINT64);
  public static final CppPrimitiveTypeRef CHAR = new CppPrimitiveTypeRef(Type.CHAR);

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
    UINT64("uint64_t", true),
    CHAR("char", false);

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
  public boolean refersToValueType() {
    return true;
  }
}
