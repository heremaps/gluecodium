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

import com.here.ivi.api.generator.cbridge.TypeConverter;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

public class CFunction extends CElement {
  public final List<CParameter> parameters;
  public final List<TypeConverter.TypeConversion> conversions;
  public final CType returnType;
  public final TypeConverter.TypeConversion returnConversion;
  public String delegateName;

  public CFunction(final String name) {
    this(name, CType.VOID, Collections.emptyList());
  }

  public CFunction(final String name, CType returnType) {
    this(name, returnType, Collections.emptyList());
  }

  public CFunction(final String name, final List<CParameter> parameters) {
    this(name, CType.VOID, parameters);
  }

  public CFunction(final String name, CType returnType, final List<CParameter> parameters) {
    super(name);
    this.returnType = returnType;
    returnConversion = TypeConverter.createReturnValueConversionRoutine(returnType);
    this.parameters = parameters;
    conversions =
        parameters
            .stream()
            .map(TypeConverter::createParamConversionRoutine)
            .collect(Collectors.toList());
  }
}
