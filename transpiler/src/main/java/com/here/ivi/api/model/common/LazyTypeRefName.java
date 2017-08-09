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

package com.here.ivi.api.model.common;

import java.util.LinkedList;
import java.util.List;

/**
 * This class holds the information for lazy name resolving of type references. In order to
 * calculate a type reference's name, the nested-name-specifier (namespace and outer class names) of
 * the type itself (aka the type definition) and the scope (namespace and class scope) of the type
 * reference are required.
 */
public class LazyTypeRefName {
  public final List<String> typeDefNestedNameSpecifier;
  public final List<String> typeRefScope;
  public final String unqualifiedTypeName;

  public LazyTypeRefName(
      final String unqualifiedTypeName, final List<String> typeDefNestedNameSpecifier) {
    this.typeDefNestedNameSpecifier = typeDefNestedNameSpecifier;
    typeRefScope = new LinkedList<>();
    this.unqualifiedTypeName = unqualifiedTypeName;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }

    LazyTypeRefName that = (LazyTypeRefName) o;

    if (typeDefNestedNameSpecifier != null
        ? !typeDefNestedNameSpecifier.equals(that.typeDefNestedNameSpecifier)
        : that.typeDefNestedNameSpecifier != null) {
      return false;
    }
    if (typeRefScope != null
        ? !typeRefScope.equals(that.typeRefScope)
        : that.typeRefScope != null) {
      return false;
    }
    return unqualifiedTypeName != null
        ? unqualifiedTypeName.equals(that.unqualifiedTypeName)
        : that.unqualifiedTypeName == null;
  }

  @Override
  public int hashCode() {
    int result = typeDefNestedNameSpecifier != null ? typeDefNestedNameSpecifier.hashCode() : 0;
    result = 31 * result + (typeRefScope != null ? typeRefScope.hashCode() : 0);
    result = 31 * result + (unqualifiedTypeName != null ? unqualifiedTypeName.hashCode() : 0);
    return result;
  }
}
