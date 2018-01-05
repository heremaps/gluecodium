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

import com.here.ivi.api.generator.cbridge.CBridgeNameRules;
import com.here.ivi.api.generator.common.NameHelper;
import java.util.LinkedList;
import java.util.List;
import java.util.stream.Collectors;

public final class SwiftMethod extends SwiftModelElement {

  public final SwiftType returnType;
  public final List<SwiftParameter> parameters;
  public final boolean isStatic;
  public final String cNestedSpecifier;
  public final String cShortName;
  public final List<SwiftGenericParameter> genericParameters;
  public final boolean forceReturnValueUnwrapping;
  public final SwiftEnum error;

  @SuppressWarnings({"ParameterNumber", "PMD.ExcessiveParameterList"})
  @lombok.Builder(builderClassName = "Builder")
  private SwiftMethod(
      final String name,
      final String comment,
      final SwiftType returnType,
      final boolean isStatic,
      final String cNestedSpecifier,
      final String cShortName,
      final boolean forceReturnValueUnwrapping,
      final SwiftEnum error,
      final List<SwiftParameter> parameters,
      final List<SwiftGenericParameter> genericParameters) {
    super(name);
    this.comment = comment;
    this.returnType = returnType != null ? returnType : SwiftType.VOID;
    this.isStatic = isStatic;
    this.cNestedSpecifier = cNestedSpecifier != null ? cNestedSpecifier : "";
    this.cShortName = cShortName != null ? cShortName : "";
    this.forceReturnValueUnwrapping = forceReturnValueUnwrapping;
    this.error = error;
    this.parameters = parameters != null ? parameters : new LinkedList<>();
    this.genericParameters = genericParameters != null ? genericParameters : new LinkedList<>();
  }

  @SuppressWarnings("unused")
  public boolean isReturningVoid() {
    return returnType.equals(SwiftType.VOID);
  }

  @SuppressWarnings("unused")
  public List<SwiftGenericParameter.Constraint> getGenericConstraints() {
    return genericParameters
        .stream()
        .flatMap(parameter -> parameter.constraints.stream())
        .collect(Collectors.toList());
  }

  @SuppressWarnings("unused")
  public String getcBaseName() {
    return NameHelper.joinNames(
        cNestedSpecifier, cShortName, CBridgeNameRules.UNDERSCORE_DELIMITER);
  }

  public static Builder builder(final String name) {
    return new Builder().name(name);
  }
}
