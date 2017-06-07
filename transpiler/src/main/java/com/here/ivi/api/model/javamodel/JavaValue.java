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

package com.here.ivi.api.model.javamodel;

import static java.util.Arrays.asList;

import com.here.ivi.api.model.Includes;
import java.util.Collection;

// TODO: Currently has a 'name' due to inheritance from JavaElement, should have a 'value' instead.
public final class JavaValue extends JavaElementWithIncludes {
  public JavaValue(final String value) {
    super(value);
  }

  public JavaValue(final String value, final Includes.Include... includes) {
    super(value, asList(includes));
  }

  public JavaValue(final String value, final Collection<Includes.Include> includes) {
    super(value, includes);
  }

  public boolean isValid() {
    return name != null;
  }
}
