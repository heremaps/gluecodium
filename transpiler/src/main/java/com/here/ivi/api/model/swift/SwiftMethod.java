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

import java.util.LinkedList;
import java.util.List;
import java.util.stream.Collectors;

public final class SwiftMethod extends SwiftModelElement {

  public SwiftType returnType;
  public final List<SwiftParameter> parameters;
  public boolean isStatic;
  public String cBaseName;
  public final List<SwiftGenericParameter> genericParameters = new LinkedList<>();

  public boolean forceReturnValueUnwrapping;

  public SwiftMethod(String methodName) {
    this(methodName, new LinkedList<>());
  }

  public SwiftMethod(String methodName, List<SwiftParameter> parameters) {
    super(methodName);
    this.returnType = VOID;
    this.parameters = parameters;
    this.cBaseName = "";
    this.forceReturnValueUnwrapping = false;
  }

  @SuppressWarnings("unused")
  public List<SwiftGenericParameter.Constraint> getGenericConstraints() {
    return genericParameters
        .stream()
        .flatMap(parameter -> parameter.constraints.stream())
        .collect(Collectors.toList());
  }
}
