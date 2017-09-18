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
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
public class CppTypeDefRef extends CppTypeRef {

  public final CppTypeRef actualType;

  public CppTypeDefRef(String name, CppTypeRef type, Include... includes) {
    super(name, includes);
    actualType = type;
  }

  @Override
  public boolean refersToValueType() {
    return actualType.refersToValueType();
  }
}
