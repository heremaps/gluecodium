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

public class CParameter extends CElement {

  public final CppTypeInfo mappedType;

  public static class SimpleParameter {
    public final String name;
    public final CType type;

    public SimpleParameter(String name, CType type) {
      this.name = name;
      this.type = type;
    }

    @Override
    public String toString() {
      return type + " " + name;
    }
  }

  public CParameter(final String name, final CppTypeInfo mappedType) {
    super(name);
    this.mappedType = mappedType;
  }

  public List<Include> getSignatureIncludes() {
    List<Include> includes = new ArrayList<>();
    includes.addAll(mappedType.functionReturnType.includes);
    for (CType signatureType : mappedType.cTypesNeededByConstructor) {
      includes.addAll(signatureType.includes);
    }
    return includes;
  }

  public List<SimpleParameter> getSignatureParameters() {
    List<SimpleParameter> parameters = new ArrayList<>();
    for (int i = 0; i < mappedType.cTypesNeededByConstructor.size(); ++i) {
      parameters.add(
          new SimpleParameter(
              name + mappedType.paramSuffixes.get(i), mappedType.cTypesNeededByConstructor.get(i)));
    }
    return parameters;
  }

  @Override
  public String toString() {
    return mappedType.functionReturnType + " " + name;
  }
}
