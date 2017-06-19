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

import java.util.stream.Stream;

public class CppInheritance extends CppElement {

  public enum Type {
    Public,
    Protected,
    Private
  }

  public final CppType parent;
  public final Type visibility;

  public CppInheritance(CppType parent, Type type) {
    super(null);
    this.parent = parent;
    this.visibility = type;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    if (!super.equals(o)) {
      return false;
    }

    CppInheritance that = (CppInheritance) o;

    return parent.equals(that.parent);
  }

  @Override
  public int hashCode() {
    int result = super.hashCode();
    result = 31 * result + parent.hashCode();
    return result;
  }

  @Override
  public Stream<CppElement> stream() {
    return Stream.of(parent);
  }
}
