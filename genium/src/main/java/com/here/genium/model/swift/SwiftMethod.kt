/*
 * Copyright (C) 2016-2018 HERE Europe B.V.
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

import com.here.genium.generator.cbridge.CBridgeNameRules;
import com.here.genium.generator.common.NameHelper;
import java.util.LinkedList;
import java.util.List;
import java.util.stream.Collectors;

public final class SwiftMethod extends SwiftModelElement {

  public final SwiftType returnType;
  public final String returnComment;
  public final List<SwiftParameter> parameters;
  public final boolean isStatic;
  public final String cNestedSpecifier;
  public final String cShortName;
  public final List<SwiftGenericParameter> genericParameters;
  public final SwiftEnum error;

  @SuppressWarnings({"ParameterNumber", "PMD.ExcessiveParameterList"})
  @lombok.Builder(builderClassName = "Builder")
  private SwiftMethod(
      final String name,
      final SwiftVisibility visibility,
      final String comment,
      final SwiftType returnType,
      final String returnComment,
      final boolean isStatic,
      final String cNestedSpecifier,
      final String cShortName,
      final SwiftEnum error,
      final List<SwiftParameter> parameters,
      final List<SwiftGenericParameter> genericParameters) {
    super(name, visibility);
    this.comment = comment;
    this.returnType = returnType != null ? returnType : SwiftType.VOID;
    this.returnComment = returnComment != null ? returnComment : "";
    this.isStatic = isStatic;
    this.cNestedSpecifier = cNestedSpecifier != null ? cNestedSpecifier : "";
    this.cShortName = cShortName != null ? cShortName : "";
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
