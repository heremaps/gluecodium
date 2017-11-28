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
import java.util.LinkedList;
import java.util.List;

public final class SwiftProperty extends SwiftModelElement {
  public final SwiftType type;
  public final boolean readonly;
  public final List<SwiftMethod> propertyAccessors = new LinkedList<>();

  public SwiftProperty(String propertyName, SwiftType type, boolean readonly, String delegateName) {
    super(propertyName);
    this.type = type;
    this.readonly = readonly;

    propertyAccessors.add(createGetterBody(delegateName));
    if (!readonly) {
      propertyAccessors.add(createSetterBody(delegateName));
    }
  }

  private SwiftMethod createGetterBody(String delegateName) {
    return SwiftMethod.builder("")
        .cBaseName(SwiftNameRules.getPropertyGetterName(delegateName))
        .returnType(type)
        .forceReturnValueUnwrapping(true)
        .build();
  }

  private SwiftMethod createSetterBody(String delegateName) {
    SwiftMethod swiftMethod =
        SwiftMethod.builder("")
            .cBaseName(SwiftNameRules.getPropertySetterName(delegateName))
            .returnType(SwiftType.VOID)
            .build();
    swiftMethod.parameters.add(new SwiftParameter("newValue", type));
    return swiftMethod;
  }
}
