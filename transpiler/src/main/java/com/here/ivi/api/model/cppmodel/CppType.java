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

import com.here.ivi.api.model.common.Includes;
import com.here.ivi.api.model.franca.DefinedBy;
import java.util.Collection;
import java.util.Collections;

public abstract class CppType extends CppElementWithIncludes {

  public DefinedBy definedIn;

  public CppType(String typeName) {
    super(typeName);
  }

  public CppType(DefinedBy def, String typeName) {
    this(def, typeName, Collections.emptyList());
  }

  public CppType(String typeName, final Collection<Includes.Include> includes) {
    super(typeName, includes);
  }

  public CppType(DefinedBy def, String typeName, final Collection<Includes.Include> includes) {
    super(typeName, includes);
    this.definedIn = def;
  }

  public abstract boolean isValid();
}
