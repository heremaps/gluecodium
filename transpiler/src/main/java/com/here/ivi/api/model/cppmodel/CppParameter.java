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

public class CppParameter extends CppElement {

  public final CppType type;

  public CppParameter(final String name, final CppType type) {
    super(name);
    this.type = type;
  }

  public boolean equals(Object other) {
    if (other == null) {
      return false;
    }
    if (other == this) {
      return true;
    }
    if (!(other instanceof CppParameter)) {
      return false;
    }

    CppParameter otherParameter = (CppParameter) other;
    return super.equals(other) && type.equals(otherParameter.type);
  }

  @Override
  public Stream<CppElement> stream() {
    return Stream.of(type);
  }
}
