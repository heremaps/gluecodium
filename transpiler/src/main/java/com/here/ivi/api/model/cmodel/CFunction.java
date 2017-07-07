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
import static java.util.stream.Collectors.toList;

import com.here.ivi.api.generator.cbridge.TypeConverter;
import java.util.List;
import java.util.Objects;

public class CFunction extends CElement {
  public final List<? extends CParameter> parameters;
  public final List<TypeConverter.TypeConversion> conversions;
  public final CType returnType;
  public final TypeConverter.TypeConversion returnConversion;
  public final String delegateCall;

  private CFunction(Builder builder) {
    super(builder.name);
    parameters = builder.parameters;
    conversions = builder.conversions;
    returnType = builder.returnType;
    returnConversion = builder.returnConversion;
    delegateCall = builder.delegateCall;
  }

  public static class Builder {
    String name;
    private List<? extends CParameter> parameters = emptyList();
    private List<TypeConverter.TypeConversion> conversions = emptyList();
    private CType returnType = CType.VOID;
    private TypeConverter.TypeConversion returnConversion;
    private String delegateCall = "";

    public Builder(String name) {
      this.name = name;
    }

    public CFunction.Builder parameters(List<? extends CParameter> params) {
      this.parameters = params;
      return this;
    }

    public CFunction.Builder returnType(CType returnType) {
      this.returnType = returnType;
      return this;
    }

    public CFunction.Builder returnConversion(TypeConverter.TypeConversion returnConversion) {
      this.returnConversion = returnConversion;
      return this;
    }

    public CFunction.Builder delegateCallTemplate(String template) {
      this.delegateCall = template;
      return this;
    }

    public CFunction build() {
      if (!parameters.isEmpty()) {
        conversions =
            parameters
                .stream()
                .map(param -> param.conversion)
                .filter(Objects::nonNull)
                .collect(toList());
      }
      if (conversions.isEmpty() && !parameters.isEmpty()) {
        conversions = parameters.stream().map(TypeConverter::identity).collect(toList());
      }
      if (!conversions.isEmpty() && !delegateCall.isEmpty()) {
        delegateCall =
            String.format(delegateCall, conversions.stream().map(it -> it.name).toArray());
      }
      if (returnType != CType.VOID && returnConversion == null) {
        returnConversion = new TypeConverter.TypeConversion("result");
      }
      return new CFunction(this);
    }
  }
}
