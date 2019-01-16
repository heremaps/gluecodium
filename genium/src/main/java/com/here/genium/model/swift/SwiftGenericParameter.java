/*
 * Copyright (C) 2016-2019 HERE Europe B.V.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
 * License-Filename: LICENSE
 */

package com.here.genium.model.swift;

import java.util.Collections;
import java.util.LinkedList;
import java.util.List;

/**
 * Represents a parameter in Swift "generic" declaration, e.g.:
 *
 * <pre>{@code
 * func methodFoo<parameterName: parameterTypeName>() -> typeBar
 * }</pre>
 *
 * where
 *
 * <p>parameterName.constraintName == constraintTypeName
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

  public static final class Constraint {
    public final String name;
    public final String typeName;
    public final boolean isProtocol;

    public Constraint(final String name, final String typeName, final boolean isProtocol) {
      this.name = name;
      this.typeName = typeName;
      this.isProtocol = isProtocol;
    }
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
          new SwiftGenericParameter.Constraint(name, elementType.publicName, false));
    }
  }
}
