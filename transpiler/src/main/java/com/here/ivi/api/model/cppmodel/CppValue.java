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

import static java.util.Arrays.asList;

import com.here.ivi.api.model.Includes;
import java.util.Collection;

public class CppValue extends CppElementWithIncludes {

  public CppValue() {
    super(null);
  }

  public CppValue(String value) {
    super(value);
  }

  public CppValue(String value, Includes.Include... includes) {
    super(value, asList(includes));
  }

  public CppValue(String value, Collection<Includes.Include> includes) {
    super(value, includes);
  }

  public boolean isValid() {
    return name != null;
  }
}
