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

package com.here.genium.model.cbridge;

import static java.util.Collections.emptyList;

import com.here.genium.generator.cbridge.CBridgeNameRules;
import com.here.genium.generator.cbridge.CppTypeInfo;
import com.here.genium.generator.common.NameHelper;
import com.here.genium.model.common.Include;
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
  public final CppTypeInfo error;
  public final String nestedSpecifier;
  public final String shortName;

  public List<CParameter.SimpleParameter> getSignatureParameters() {
    Stream<? extends CParameter> stream =
        selfParameter == null
            ? parameters.stream()
            : Stream.concat(Stream.of(selfParameter), parameters.stream());
    return stream
        .flatMap(parameter -> parameter.getSignatureParameters().stream())
        .collect(Collectors.toList());
  }

  public boolean isReturningVoid() {
    return returnType.functionReturnType.equals(CType.VOID);
  }

  public static CFunctionBuilder builder(final String shortName) {
    return new CFunctionBuilder().shortName(shortName);
  }

  @SuppressWarnings("ParameterNumber")
  @lombok.Builder
  private CFunction(
      List<? extends CParameter> parameters,
      CppTypeInfo returnType,
      String delegateCall,
      Set<Include> delegateCallIncludes,
      String functionName,
      CInParameter selfParameter,
      CppTypeInfo error,
      String nestedSpecifier,
      String shortName) {
    super(NameHelper.joinNames(nestedSpecifier, shortName, CBridgeNameRules.UNDERSCORE_DELIMITER));
    this.parameters = parameters != null ? parameters : emptyList();
    this.returnType = returnType != null ? returnType : new CppTypeInfo(CType.VOID);
    this.delegateCall = delegateCall != null ? delegateCall : "";
    this.delegateCallIncludes =
        delegateCallIncludes != null ? delegateCallIncludes : new LinkedHashSet<>();
    this.functionName = functionName;
    this.selfParameter = selfParameter;
    this.error = error;
    this.nestedSpecifier = nestedSpecifier;
    this.shortName = shortName;
  }
}
