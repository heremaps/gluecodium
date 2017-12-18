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

import com.here.ivi.api.model.common.Streamable;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = false)
public abstract class CppElement extends Streamable<CppElement> {

  public final String name;
  public final String fullyQualifiedName; // Currently used for dependency analysis only
  public String comment;

  public CppElement(final String name) {
    this(name, name);
  }

  public CppElement(final String name, final String fullyQualifiedName) {
    super();
    this.name = name;
    this.fullyQualifiedName = fullyQualifiedName;
  }

  @Override
  public String toString() {
    return this.getClass().getSimpleName() + "::" + name;
  }
}
