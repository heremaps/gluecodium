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

package com.here.ivi.api.model.cpp;

import com.here.ivi.api.model.common.Include;
import java.util.Collection;
import lombok.EqualsAndHashCode;
import lombok.Singular;

@EqualsAndHashCode(callSuper = true)
public class CppComplexTypeRef extends CppTypeRef {

  public final CppTypeInfo info;

  @lombok.Builder(builderClassName = "Builder")
  protected CppComplexTypeRef(
      final String fullyQualifiedName,
      @Singular final Collection<Include> includes,
      final CppTypeInfo typeInfo) {
    super(fullyQualifiedName, includes);
    info = typeInfo != null ? typeInfo : CppTypeInfo.Complex;
  }

  @Override
  public boolean refersToEnumType() {
    return info == CppTypeInfo.Enumeration;
  }

  @SuppressWarnings("unused")
  public static class Builder {
    private String fullyQualifiedName;

    Builder() {
      this(null);
    }

    public Builder(final String fullyQualifiedName) {
      this.fullyQualifiedName = fullyQualifiedName;
    }
  }
}
