/*
 * Copyright (C) 2018 HERE Global B.V. and its affiliate(s). All rights reserved.
 *
 * This software, including documentation, is protected by copyright controlled by
 * HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
 * adapting or translating, any or all of this material requires the prior written
 * consent of HERE Global B.V. This material also contains confidential information,
 * which may not be disclosed to others without prior written consent of HERE Global B.V.
 *
 */

package com.here.ivi.api.model.cpp;

import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
public abstract class CppElementWithComment extends CppElement {

  public String comment;

  protected CppElementWithComment(final String name) {
    this(name, name, null);
  }

  protected CppElementWithComment(final String name, final String fullyQualifiedName) {
    this(name, fullyQualifiedName, null);
  }

  protected CppElementWithComment(
      final String name, final String fullyQualifiedName, final String comment) {
    super(name, fullyQualifiedName);
    this.comment = comment;
  }
}
