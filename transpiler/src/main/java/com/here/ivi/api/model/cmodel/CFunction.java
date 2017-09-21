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
  public final Set<Include> delegateCallInclude;
  public String functionName;
  public CInParameter selfParameter;

  public List<CParameter.SimpleParameter> getSignatureParameters() {
    Stream<? extends CParameter> stream =
        selfParameter == null
            ? parameters.stream()
            : Stream.concat(Stream.of(selfParameter), parameters.stream());
    return stream
        .flatMap(parameter -> parameter.getSignatureParameters().stream())
        .collect(Collectors.toList());
  }

  @SuppressWarnings({"ParameterNumber"})
  public CFunction(
      String name,
      List<? extends CParameter> parameters,
      CppTypeInfo returnType,
      String delegateCall,
      Set<Include> delegateCallInclude) {
    super(name);
    this.parameters = parameters;
    this.returnType = returnType;
    this.delegateCall = delegateCall;
    this.delegateCallInclude = delegateCallInclude;
  }

  @SuppressWarnings("PMD.AvoidFieldNameMatchingMethodName")
  public static class Builder {
    private final String name;
    private List<? extends CParameter> parameters = emptyList();
    private CppTypeInfo returnType = new CppTypeInfo(CType.VOID);
    private String delegateCall = "";
    private Set<Include> delegateCallInclude = new LinkedHashSet<>();

    public Builder(String name) {
      this.name = name;
    }

    public CFunction.Builder parameters(List<? extends CParameter> params) {
      this.parameters = params;
      return this;
    }

    public CFunction.Builder returnType(CppTypeInfo returnTypeParam) {
      this.returnType = returnTypeParam;
      return this;
    }

    public CFunction.Builder delegate(String template) {
      this.delegateCall = template;
      return this;
    }

    public CFunction.Builder delegateCallIncludes(Set<Include> includes) {
      this.delegateCallInclude = includes;
      return this;
    }

    public CFunction build() {
      return new CFunction(
          this.name, this.parameters, this.returnType, this.delegateCall, this.delegateCallInclude);
    }
  }
}
