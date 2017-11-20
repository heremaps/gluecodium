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

import java.util.Collections;
import java.util.LinkedList;
import java.util.List;
import lombok.AllArgsConstructor;

/**
 * Represents a parameter in Swift "generic" declaration, e.g.:
 *
 * <p>func methodFoo&lt;parameterName: parameterTypeName>() -> typeBar<br>
 * where parameterName.constraintName == constraintTypeName
 */
public final class SwiftGenericParameter extends SwiftModelElement {

  public static final String COLLECTION_TYPE_NAME = "Collection";
  public static final String ELEMENT_FIELD_NAME = "Element";

  public final String typeName;
  public final List<Constraint> constraints = new LinkedList<>();

  public SwiftGenericParameter(final String name, final String typeName) {
    super(name);
    this.typeName = typeName;
  }

  @AllArgsConstructor
  public static final class Constraint {
    public final String name;
    public final String typeName;
    public final boolean isProtocol;
  }

  public SwiftGenericParameter(final String parameterName, final SwiftArray swiftArray) {
    this(parameterName, COLLECTION_TYPE_NAME);
    SwiftType elementType = swiftArray.underlyingType;
    this.constraints.addAll(createGenericConstraints(parameterName, elementType));
  }

  private static List<SwiftGenericParameter.Constraint> createGenericConstraints(
      final String parentName, final SwiftType elementType) {

    String name = (parentName != null) ? parentName + "." + ELEMENT_FIELD_NAME : ELEMENT_FIELD_NAME;
    if (elementType instanceof SwiftArray) {
      List<SwiftGenericParameter.Constraint> result = new LinkedList<>();
      result.add(new SwiftGenericParameter.Constraint(name, COLLECTION_TYPE_NAME, true));
      result.addAll(createGenericConstraints(name, ((SwiftArray) elementType).underlyingType));
      return result;
    } else {
      return Collections.singletonList(
          new SwiftGenericParameter.Constraint(name, elementType.name, false));
    }
  }
}
