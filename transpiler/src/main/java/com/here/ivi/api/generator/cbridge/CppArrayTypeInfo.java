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

package com.here.ivi.api.generator.cbridge;

import com.here.ivi.api.model.cbridge.CType;
import com.here.ivi.api.model.common.Include;
import java.util.Collections;
import java.util.List;
import lombok.Singular;

public final class CppArrayTypeInfo extends CppTypeInfo {

  public final CppTypeInfo innerType;

  @SuppressWarnings({"PMD.ExcessiveParameterList", "ParameterNumber"})
  @lombok.Builder(builderClassName = "Builder", builderMethodName = "arrayTypeBuilder")
  private CppArrayTypeInfo(
      final String name,
      final CType constructFromCType,
      final CType functionReturnType,
      @Singular final List<Include> includes,
      final CppTypeInfo innerType) {
    super(
        name,
        Collections.singletonList(constructFromCType),
        null,
        functionReturnType,
        TypeCategory.ARRAY,
        includes);
    this.innerType = innerType;
  }

  public static Builder arrayTypeBuilder(final String name) {
    return new Builder().name(name);
  }

  @SuppressWarnings("unused")
  public String getBaseApi() {
    return arrayFindNested(innerType);
  }

  private static String arrayFindNested(final CppTypeInfo innerType) {

    String arrayName = innerType.name;

    if (innerType instanceof CppArrayTypeInfo) {
      CppTypeInfo innerInnerType = ((CppArrayTypeInfo) innerType).innerType;
      if (innerInnerType != null) {
        arrayName = arrayFindNested(innerInnerType);
      }
    }

    return "std::vector<" + arrayName + ">";
  }
}
