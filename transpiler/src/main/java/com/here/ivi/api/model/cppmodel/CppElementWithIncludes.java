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
import java.util.*;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
public abstract class CppElementWithIncludes extends CppElement {

  public final Set<Include> includes;

  public CppElementWithIncludes(final String name) {
    this(name, name, null);
  }

  protected CppElementWithIncludes(final String name, final String fullyQualifiedName) {
    this(name, fullyQualifiedName, null);
  }

  public CppElementWithIncludes(final String name, final Collection<Include> includes) {
    this(name, name, includes);
  }

  private CppElementWithIncludes(
      final String name, final String fullyQualifiedName, final Collection<Include> includes) {
    super(name, fullyQualifiedName);
    this.includes = includes != null ? new LinkedHashSet<>(includes) : new LinkedHashSet<>();
  }
}
