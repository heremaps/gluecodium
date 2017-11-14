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

package com.here.ivi.api.model.swift;

import com.here.ivi.api.generator.swift.SwiftNameRules;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public final class SwiftProperty extends SwiftModelElement {
  public final SwiftType type;
  public final boolean readonly;
  public final List<SwiftMethod> propertyAccessors;

  public SwiftProperty(String propertyName, SwiftType type, boolean readonly, String delegateName) {
    super(propertyName);
    this.type = type;
    this.readonly = readonly;

    propertyAccessors = new ArrayList<>();

    propertyAccessors.add(createGetterBody(delegateName));
    if (!this.readonly) {
      propertyAccessors.add(createSetterBody(delegateName));
    }
  }

  private SwiftMethod createGetterBody(String delegateName) {
    SwiftMethod getter = new SwiftMethod("", Collections.emptyList());
    getter.cBaseName = SwiftNameRules.getPropertyGetterName(delegateName);
    getter.returnType = type;
    getter.forceReturnValueUnwrapping = true;
    return getter;
  }

  private SwiftMethod createSetterBody(String delegateName) {
    SwiftMethod setter =
        new SwiftMethod("", Collections.singletonList(new SwiftParameter("newValue", this.type)));
    setter.cBaseName = SwiftNameRules.getPropertySetterName(delegateName);
    setter.returnType = SwiftType.VOID;
    return setter;
  }
}
