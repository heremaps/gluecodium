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

import static java.util.Collections.emptyList;

import com.here.ivi.api.generator.cbridge.CppTypeInfo;
import com.here.ivi.api.model.common.Include;
import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public final class CFunction extends CElement {

  public final List<? extends CParameter> parameters;
  public final CppTypeInfo returnType;
  public final String delegateCall;
  public final Set<Include> delegateCallIncludes;
  public final String functionName;
  public final CInParameter selfParameter;

  public List<CParameter.SimpleParameter> getSignatureParameters() {
    Stream<? extends CParameter> stream =
        selfParameter == null
            ? parameters.stream()
            : Stream.concat(Stream.of(selfParameter), parameters.stream());
    return stream
        .flatMap(parameter -> parameter.getSignatureParameters().stream())
        .collect(Collectors.toList());
  }

  public static CFunctionBuilder builder(String name) {
    return new CFunctionBuilder().name(name);
  }

  @lombok.Builder
  protected CFunction(
      String name,
      List<? extends CParameter> parameters,
      CppTypeInfo returnType,
      String delegateCall,
      Set<Include> delegateCallIncludes,
      String functionName,
      CInParameter selfParameter) {
    super(name);
    this.parameters = parameters != null ? parameters : emptyList();
    this.returnType = returnType != null ? returnType : new CppTypeInfo(CType.VOID);
    this.delegateCall = delegateCall != null ? delegateCall : "";
    this.delegateCallIncludes =
        delegateCallIncludes != null ? delegateCallIncludes : new LinkedHashSet<>();
    this.functionName = functionName;
    this.selfParameter = selfParameter;
  }
}
