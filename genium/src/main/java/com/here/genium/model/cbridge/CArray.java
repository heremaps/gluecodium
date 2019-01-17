/*
 * Copyright (C) 2016-2019 HERE Europe B.V.
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

package com.here.genium.model.cbridge;

import com.here.genium.generator.cbridge.CppArrayTypeInfo;
import com.here.genium.generator.cbridge.CppTypeInfo;
import com.here.genium.model.common.Include;
import java.util.ArrayList;
import java.util.List;

public final class CArray extends CElement {

  public final CppTypeInfo arrayType;
  public final CppTypeInfo underlyingType;

  public CArray(final String name, final CppArrayTypeInfo typeInfo) {
    super(name);
    this.arrayType = typeInfo;
    this.underlyingType = typeInfo.getInnerType();
  }

  public String getType() {
    return arrayType.functionReturnType.toString();
  }

  public String getInnerType() {
    return underlyingType.functionReturnType.toString();
  }

  @SuppressWarnings("unused")
  public String innerBaseApi() {
    return underlyingType.name;
  }

  @SuppressWarnings("unused")
  public String getArgument() {
    return underlyingType.cType.toString();
  }

  public List<Include> returnTypeIncludes() {
    List<Include> includes = new ArrayList<>();
    includes.addAll(getLastType(underlyingType).functionReturnType.includes);
    includes.addAll(arrayType.functionReturnType.includes);
    return includes;
  }

  public List<Include> includes() {
    List<Include> includes = new ArrayList<>();
    includes.addAll(getLastType(underlyingType).includes);
    includes.addAll(arrayType.includes);
    return includes;
  }

  private CppTypeInfo getLastType(final CppTypeInfo typeInfo) {
    CppTypeInfo lastType = typeInfo;
    if (typeInfo instanceof CppArrayTypeInfo) {
      CppTypeInfo innerInnerType = ((CppArrayTypeInfo) typeInfo).getInnerType();
      if (innerInnerType != null) {
        lastType = getLastType(innerInnerType);
      }
    }
    return lastType;
  }
}
