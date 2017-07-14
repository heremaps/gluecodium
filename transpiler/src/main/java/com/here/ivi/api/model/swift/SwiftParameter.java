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

import java.util.Objects;

public class SwiftParameter extends SwiftModelElement {
  public final SwiftType type;
  public final String variableName;
  public final boolean differentInterfaceAndVariableName;

  public SwiftParameter(String interfaceName, SwiftType type) {
    this(interfaceName, type, null);
  }

  public SwiftParameter(String interfaceName, SwiftType type, String variableName) {
    super(interfaceName);
    this.type = type;
    this.variableName = variableName != null ? variableName : interfaceName;
    this.differentInterfaceAndVariableName =
        variableName != null && !Objects.equals(interfaceName, variableName);
  }
}
