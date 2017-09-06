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
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
public class CppInheritance extends CppElement {

  public enum Type {
    Public("public"),
    Protected("protected"),
    Private("private");

    private final String value;

    Type(final String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return value;
    }
  }

  public final CppTypeRef parent;
  public final Type visibility;

  public CppInheritance(CppTypeRef parent, Type type) {
    super(null);
    this.parent = parent;
    this.visibility = type;
  }

  @Override
  public Stream<? extends CppElement> stream() {
    return Stream.of(parent);
  }
}
