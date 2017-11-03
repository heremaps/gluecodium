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

import static com.here.ivi.api.model.swift.SwiftType.VOID;
import static java.util.Collections.emptyList;

import java.util.List;

public class SwiftMethod extends SwiftModelElement {

  public SwiftType returnType;
  public List<SwiftParameter> parameters = emptyList();
  public boolean isStatic;
  public String cBaseName;

  @SuppressWarnings("unused")
  public SwiftParameter instanceParameter = new SwiftParameter("c_instance", VOID);

  public boolean forceReturnValueUnwrapping;

  public SwiftMethod(String methodName) {
    this(methodName, emptyList());
  }

  public SwiftMethod(String methodName, List<SwiftParameter> parameters) {
    super(methodName);
    this.returnType = VOID;
    this.parameters = parameters;
    this.cBaseName = "";
    this.forceReturnValueUnwrapping = false;
  }

  public boolean containsArrays() {
    return parameters.stream().anyMatch(s -> s.type instanceof SwiftArray);
  }
}
