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

package com.here.ivi.api.model.cppmodel;

import com.here.ivi.api.model.common.Include;
import java.util.Arrays;
import java.util.Collection;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
public class CppComplexTypeRef extends CppTypeRef {

  public static final String STRING_TYPE_NAME = "::std::string";

  public final CppTypeInfo info;

  protected CppComplexTypeRef(
      final String fullyQualifiedName,
      final Collection<Include> includes,
      final CppTypeInfo typeInfo) {
    super(fullyQualifiedName, includes);
    info = typeInfo != null ? typeInfo : CppTypeInfo.Complex;
  }

  @Override
  public boolean refersToValueType() {
    return info == CppTypeInfo.Enumeration;
  }

  @SuppressWarnings("unused")
  public String getShortName() {
    String[] splitName = name.split("::");
    return splitName[splitName.length - 1];
  }

  @SuppressWarnings({"PMD.AvoidFieldNameMatchingMethodName"})
  public static class Builder {
    private final String fullyQualifiedName;
    private Collection<Include> includes;
    private CppTypeInfo typeInfo;

    public Builder(final String fullyQualifiedName) {
      this.fullyQualifiedName = fullyQualifiedName;
    }

    public Builder includes(final Collection<Include> includesParam) {
      this.includes = includesParam;
      return this;
    }

    public Builder includes(final Include... typeInfoParam) {
      return includes(Arrays.asList(typeInfoParam));
    }

    public Builder typeInfo(final CppTypeInfo typeInfoParam) {
      this.typeInfo = typeInfoParam;
      return this;
    }

    public CppComplexTypeRef build() {
      return new CppComplexTypeRef(this.fullyQualifiedName, this.includes, this.typeInfo);
    }
  }
}
