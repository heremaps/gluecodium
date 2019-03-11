/*
 * Copyright (C) 2016-2018 HERE Europe B.V.
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

package com.here.genium.generator.cbridge;

import com.here.genium.model.cbridge.CType;
import com.here.genium.model.common.Include;
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
