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

import com.here.ivi.api.generator.cbridge.CBridgeNameRules;
import com.here.ivi.api.model.common.Include;
import java.nio.file.Paths;
import java.util.Collections;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import lombok.EqualsAndHashCode;

/** Base class for all C types */
@EqualsAndHashCode(callSuper = true)
public class CType extends CElement {
  protected static final String CONST_SPECIFIER = "const";
  public static final Include FIXED_WIDTH_INTEGERS_INCLUDE =
      Include.createSystemInclude("stdint.h");
  public static final Include VECTOR_INCLUDE = Include.createSystemInclude("vector");
  private static final Include BOOL_INCLUDE = Include.createSystemInclude("stdbool.h");

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
  public static final CType BOOL = new CType("bool", singletonList(BOOL_INCLUDE));
  public static final CType FLOAT = new CType("float");
  public static final CType DOUBLE = new CType("double");
  public static final CType STRING_REF =
      new CType(
          "std_stringRef",
          singletonList(
              Include.createInternalInclude(
                  Paths.get(CBridgeNameRules.SOURCE_FOLDER, "include", "StringHandle.h")
                      .toString())));
  public static final CType BYTE_ARRAY_REF =
      new CType(
          "byteArrayRef",
          singletonList(
              Include.createInternalInclude(
                  Paths.get(CBridgeNameRules.SOURCE_FOLDER, "include", "ByteArrayHandle.h")
                      .toString())));

  public Boolean isConst = false;
  public Set<Include> includes = Collections.emptySet();

  public CType(String name) {
    super(name);
    this.includes = new LinkedHashSet<>();
  }

  public CType(String name, List<Include> includes) {
    super(name);
    this.includes = new LinkedHashSet<>(includes);
  }

  @Override
  public String toString() {
    if (isConst) {
      return CONST_SPECIFIER + " " + name;
    } else {
      return name;
    }
  }
}
