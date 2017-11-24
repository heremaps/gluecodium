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

import com.here.ivi.api.generator.cbridge.CppTypeInfo;
import java.util.LinkedList;
import java.util.List;

public final class CStruct extends CType {

  public final String baseApiName;
  public final CppTypeInfo mappedType;
  public final List<CField> fields = new LinkedList<>();

  public CStruct(String name, String baseApiName, CppTypeInfo mappedType) {
    super(name);
    this.baseApiName = baseApiName;
    this.mappedType = mappedType;
  }

  public String getType() {
    return mappedType.functionReturnType.toString();
  }
}
