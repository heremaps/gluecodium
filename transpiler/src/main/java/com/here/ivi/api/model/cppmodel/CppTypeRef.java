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
import java.util.Arrays;
import java.util.Collection;

public abstract class CppTypeRef extends CppElementWithIncludes {

  public CppTypeRef(String typeName) {
    super(typeName);
  }

  public CppTypeRef(String typeName, Include... includes) {
    this(typeName, Arrays.asList(includes));
  }

  public CppTypeRef(String typeName, final Collection<Include> includes) {
    super(typeName, includes);
  }

  public boolean refersToValueType() {
    return false;
  }

  public String getShortName() {
    String[] splitName = name.split("::");
    return splitName[splitName.length - 1];
  }
}
