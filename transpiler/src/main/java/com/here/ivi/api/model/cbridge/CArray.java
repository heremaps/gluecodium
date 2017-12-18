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

package com.here.ivi.api.model.cbridge;

import com.here.ivi.api.generator.cbridge.CppTypeInfo;
import com.here.ivi.api.model.common.Include;
import java.util.ArrayList;
import java.util.List;

public final class CArray extends CElement {

  public final CppTypeInfo arrayType;
  public final CppTypeInfo underlyingType;

  public CArray(final CppTypeInfo typeInfo) {
    super(typeInfo.cTypesNeededByConstructor.get(0).name);
    this.arrayType = typeInfo;
    this.underlyingType = typeInfo.innerType;
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
    return underlyingType.cTypesNeededByConstructor.get(0).toString();
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

  private CppTypeInfo getLastType(CppTypeInfo uType) {
    CppTypeInfo lastType = uType;
    if (uType.innerType != null) {
      lastType = getLastType(uType.innerType);
    }
    return lastType;
  }
}
