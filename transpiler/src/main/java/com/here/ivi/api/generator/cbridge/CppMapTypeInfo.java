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

public final class CppMapTypeInfo extends CppTypeInfo {

  public final String baseApi;

  @SuppressWarnings({"PMD.ExcessiveParameterList", "ParameterNumber"})
  @lombok.Builder(builderClassName = "Builder", builderMethodName = "mapTypeBuilder")
  private CppMapTypeInfo(
      final String name,
      final CType constructFromCType,
      final CType functionReturnType,
      @Singular final List<Include> includes,
      final CppTypeInfo keyType,
      final CppTypeInfo valueType) {
    super(
        name,
        Collections.singletonList(constructFromCType),
        null,
        functionReturnType,
        TypeCategory.MAP,
        includes);
    baseApi = createBaseApiTypeString(keyType, valueType);
  }

  public static Builder mapTypeBuilder(final String name) {
    return new Builder().name(name);
  }

  private static String createBaseApiTypeString(
      final CppTypeInfo keyType, final CppTypeInfo valueType) {

    StringBuilder stringBuilder = new StringBuilder();

    stringBuilder
        .append("std::unordered_map<")
        .append(keyType.name)
        .append(", ")
        .append(valueType.name);
    if (keyType.typeCategory == TypeCategory.ENUM) {
      stringBuilder.append(", ::transpiler::EnumHash");
    }
    stringBuilder.append('>');

    return stringBuilder.toString();
  }
}
