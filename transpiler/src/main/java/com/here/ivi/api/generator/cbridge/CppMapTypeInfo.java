/*
 * Copyright (c) 2016-2018 HERE Europe B.V.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
 * License-Filename: LICENSE
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
