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

import static java.util.Collections.emptyList;

import java.util.List;

public class SwiftMethod extends SwiftModelElement {

  public SwiftMethod(String methodName) {
    this(methodName, emptyList());
  }

  public SwiftMethod(String methodName, List<SwiftParameter> parameters) {
    super(methodName);
    this.returnType = SwiftType.VOID;
    this.parameters = parameters;
    this.comment = "";
    this.cBaseName = "";
  }

  enum Visibility {
    Public,
    Private
  }

  public String comment;
  public SwiftType returnType;
  public final List<SwiftParameter> parameters;
  public boolean isStatic;
  public boolean isConst;
  public String cBaseName;
}
