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

package com.here.ivi.api.model.cmodel;

import java.util.Collections;
import java.util.List;

public class CFunction extends CElement {
  public final List<CParameter> parameters;
  public CType returnType = CType.VOID;
  public String delegateName;

  public CFunction(final String name) {
    this(name, Collections.emptyList());
  }

  public CFunction(final String name, final List<CParameter> parameters) {
    super(name);
    this.parameters = parameters;
  }
}
