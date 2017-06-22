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

import static java.util.Collections.singletonList;

import com.here.ivi.api.model.Includes;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/** Base class for all C types */
public class CType {
  private static final Includes.SystemInclude FIXED_WIDTH_INTEGERS_INCLUDE =
      new Includes.SystemInclude("stdint.h");

  public static final CType VOID = new CType("void");
  public static final CType CHAR = new CType("char");
  public static final CType INT8 = new CType("int8_t", singletonList(FIXED_WIDTH_INTEGERS_INCLUDE));
  public static final CType UINT8 =
      new CType("uint8_t", singletonList(FIXED_WIDTH_INTEGERS_INCLUDE));
  public static final CType INT16 =
      new CType("int16_t", singletonList(FIXED_WIDTH_INTEGERS_INCLUDE));
  public static final CType UINT16 =
      new CType("uint16_t", singletonList(FIXED_WIDTH_INTEGERS_INCLUDE));
  public static final CType INT32 =
      new CType("int32_t", singletonList(FIXED_WIDTH_INTEGERS_INCLUDE));
  public static final CType UINT32 =
      new CType("uint32_t", singletonList(FIXED_WIDTH_INTEGERS_INCLUDE));
  public static final CType INT64 =
      new CType("int64_t", singletonList(FIXED_WIDTH_INTEGERS_INCLUDE));
  public static final CType UINT64 =
      new CType("uint64_t", singletonList(FIXED_WIDTH_INTEGERS_INCLUDE));
  public static final CType BOOL = new CType("bool");
  public static final CType FLOAT = new CType("float");
  public static final CType DOUBLE = new CType("double");

  public final String name;
  public Boolean isConst = false;
  public Set<Includes.Include> includes = Collections.emptySet();

  protected CType(String name) {
    this.name = name;
  }

  protected CType(String name, List<Includes.Include> includes) {
    this.name = name;
    this.includes = new HashSet<>(includes);
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;

    CType that = (CType) o;
    return name.equals(that.name) && isConst == that.isConst;
  }

  @Override
  public String toString() {
    return isConst ? "const " + name : name;
  }
}
