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

package com.here.ivi.api.model.swift;

import java.util.LinkedList;
import java.util.List;
import lombok.AllArgsConstructor;

/**
 * Represents a parameter in Swift "generic" declaration, e.g.:
 *
 * <p>func methodFoo&lt;parameterName: parameterTypeName>() -> typeBar<br>
 * where parameterName.constraintName == constraintTypeName
 */
public final class SwiftGenericParameter extends SwiftModelElement {

  public final String typeName;
  public final List<Constraint> constraints = new LinkedList<>();

  public SwiftGenericParameter(final String name, final String typeName) {
    super(name);
    this.typeName = typeName;
  }

  @AllArgsConstructor
  public static final class Constraint {
    public final String name;
    public final String typeName;
    public final boolean isProtocol;
  }
}
