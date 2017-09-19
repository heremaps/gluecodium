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

import java.util.List;
import java.util.stream.Collectors;
import lombok.Builder;
import lombok.Singular;

public class CFunctionPointer extends CType {

  public final CType returnType;
  public final List<CParameter> parameters;

  @Builder
  public CFunctionPointer(CType returnType, @Singular List<CParameter> parameters) {
    super("");
    this.returnType = returnType;
    this.parameters = parameters;
  }

  @Override
  public String declareBegin() {
    return returnType.toString() + "(*";
  }

  @Override
  public String declareEnd() {
    return ")("
        + String.join(
            ", ", parameters.stream().map(CParameter::toString).collect(Collectors.toList()))
        + ")";
  }
}
