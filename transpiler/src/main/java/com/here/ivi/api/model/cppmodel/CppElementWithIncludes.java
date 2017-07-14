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
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

public class CppElementWithIncludes extends CppElement {
  public Set<Include> includes = Collections.emptySet();

  public CppElementWithIncludes(final String name) {
    super(name);
    this.includes = new HashSet<>();
  }

  public CppElementWithIncludes() {
    super();
    this.includes = new HashSet<>();
  }

  public CppElementWithIncludes(final String name, final Collection<Include> includes) {
    super(name);
    this.includes = new HashSet<>(includes);
  }
}
