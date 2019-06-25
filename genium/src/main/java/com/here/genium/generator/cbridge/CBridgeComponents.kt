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

package com.here.genium.generator.cbridge;

import com.here.genium.model.cbridge.CArray;
import com.here.genium.model.cbridge.CEnum;
import com.here.genium.model.cbridge.CField;
import com.here.genium.model.cbridge.CFunction;
import com.here.genium.model.cbridge.CInterface;
import com.here.genium.model.cbridge.CMap;
import com.here.genium.model.cbridge.CParameter;
import com.here.genium.model.cbridge.CSet;
import com.here.genium.model.cbridge.CStruct;
import com.here.genium.model.cbridge.CType;
import com.here.genium.model.common.Include;
import java.nio.file.Paths;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;
import java.util.stream.Collectors;

public final class CBridgeComponents {

  public static final String PROXY_CACHE_FILENAME =
      Paths.get(
              CBridgeNameRules.CBRIDGE_INTERNAL, CBridgeNameRules.INCLUDE_DIR, "CachedProxyBase.h")
          .toString();

  @SuppressWarnings("OperatorWrap")
  public static Collection<Include> collectImplementationIncludes(CInterface cInterface) {

    Collection<Include> includes = new LinkedList<>();

    List<CFunction> functions = new LinkedList<>();
    functions.addAll(cInterface.getFunctions());
    functions.addAll(cInterface.getInheritedFunctions());
    for (CFunction function : functions) {
      includes.addAll(collectFunctionBodyIncludes(function));
    }
    for (CStruct struct : cInterface.getStructs()) {
      includes.addAll(struct.getMappedType().getIncludes());
      for (CField field : struct.getFields()) {
        includes.addAll(field.getType().getIncludes());
      }
      for (CFunction function : struct.getMethods()) {
        includes.addAll(collectFunctionBodyIncludes(function));
      }
    }
    if (cInterface.getSelfType() != null) {
      includes.addAll(cInterface.getSelfType().getIncludes());
    }
    for (CMap map : cInterface.getMaps()) {
      includes.add(map.include);
    }
    for (CSet set : cInterface.getSets()) {
      includes.add(set.getInclude());
    }
    for (final CEnum enumeration : cInterface.getEnums()) {
      includes.addAll(enumeration.mappedType.getIncludes());
    }

    return includes;
  }

  public static Collection<Include> collectPrivateHeaderIncludes(CInterface cInterface) {
    Collection<Include> includes = new LinkedList<>();
    for (CStruct struct : cInterface.getStructs()) {
      includes.addAll(struct.getMappedType().getIncludes());
    }
    if (cInterface.getSelfType() != null) {
      includes.addAll(cInterface.getSelfType().getIncludes());
    }
    return includes;
  }

  public static Collection<Include> collectHeaderIncludes(CInterface cInterface) {

    Collection<Include> includes = new LinkedList<>();

    for (CFunction function : cInterface.getFunctions()) {
      includes.addAll(collectFunctionSignatureIncludes(function));
    }
    for (CStruct struct : cInterface.getStructs()) {
      for (CField field : struct.getFields()) {
        includes.addAll(field.getType().getFunctionReturnType().includes);
        includes.addAll(field.getType().getCType().includes);
      }
      for (CFunction function : struct.getMethods()) {
        includes.addAll(collectFunctionSignatureIncludes(function));
      }
    }
    for (CEnum enumType : cInterface.getEnums()) {
      includes.addAll(enumType.includes);
    }
    for (final CMap map : cInterface.getMaps()) {
      includes.addAll(map.keyType.getFunctionReturnType().includes);
      includes.addAll(map.valueType.getFunctionReturnType().includes);
    }
    for (final CSet set : cInterface.getSets()) {
      includes.addAll(set.getElementType().getFunctionReturnType().includes);
    }
    if (!cInterface.getMaps().isEmpty() || cInterface.getHasEquatableType()) {
      includes.add(CType.BOOL_INCLUDE);
    }

    return includes;
  }

  public static Collection<Include> collectImplementationIncludes(final Collection<CArray> arrays) {
    return arrays.stream().flatMap(array -> array.includes().stream()).collect(Collectors.toList());
  }

  public static Collection<Include> collectHeaderIncludes(final Collection<CArray> arrays) {
    return arrays
        .stream()
        .flatMap(array -> array.returnTypeIncludes().stream())
        .collect(Collectors.toList());
  }

  private static Collection<Include> collectFunctionSignatureIncludes(CFunction function) {
    Collection<Include> includes = new LinkedList<>();
    for (CParameter parameter : function.getParameters()) {
      includes.addAll(parameter.getSignatureIncludes());
    }
    includes.addAll(function.getReturnType().getFunctionReturnType().includes);
    if (function.getError() != null) {
      includes.addAll(function.getError().getFunctionReturnType().includes);
    }
    return includes;
  }

  private static Collection<Include> collectFunctionBodyIncludes(CFunction function) {
    Collection<Include> includes = new LinkedList<>();
    for (CParameter parameter : function.getParameters()) {
      includes.addAll(parameter.mappedType.getIncludes());
    }
    includes.addAll(function.getReturnType().getIncludes());
    includes.addAll(function.getDelegateCallIncludes());
    if (function.getSelfParameter() != null) {
      includes.addAll(function.getSelfParameter().mappedType.getIncludes());
    }
    if (function.getError() != null) {
      includes.addAll(function.getError().getIncludes());
    }
    return includes;
  }
}
