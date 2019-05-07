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

import com.google.common.collect.Iterables;
import com.here.genium.model.cbridge.*;
import com.here.genium.model.common.Include;
import java.nio.file.Paths;
import java.util.*;
import java.util.stream.Collectors;

public final class CBridgeComponents {

  public static final String PROXY_CACHE_FILENAME =
      Paths.get(
              CBridgeNameRules.CBRIDGE_INTERNAL, CBridgeNameRules.INCLUDE_DIR, "CachedProxyBase.h")
          .toString();

  @SuppressWarnings("OperatorWrap")
  public static Collection<Include> collectImplementationIncludes(CInterface cInterface) {

    Collection<Include> includes = new LinkedList<>();

    for (CFunction function :
        Iterables.concat(cInterface.functions, cInterface.inheritedFunctions)) {
      includes.addAll(collectFunctionBodyIncludes(function));
    }
    for (CStruct struct : cInterface.structs) {
      includes.addAll(struct.getMappedType().getIncludes());
      for (CField field : struct.getFields()) {
        includes.addAll(field.getType().getIncludes());
      }
    }
    if (cInterface.selfType != null) {
      includes.addAll(cInterface.selfType.getIncludes());
    }
    for (CMap map : cInterface.maps) {
      includes.add(map.include);
    }
    for (final CEnum enumeration : cInterface.enums) {
      includes.addAll(enumeration.mappedType.getIncludes());
    }

    return includes;
  }

  public static Collection<Include> collectPrivateHeaderIncludes(CInterface cInterface) {
    Collection<Include> includes = new LinkedList<>();
    for (CStruct struct : cInterface.structs) {
      includes.addAll(struct.getMappedType().getIncludes());
    }
    if (cInterface.selfType != null) {
      includes.addAll(cInterface.selfType.getIncludes());
    }
    return includes;
  }

  public static Collection<Include> collectHeaderIncludes(CInterface cInterface) {

    Collection<Include> includes = new LinkedList<>();

    for (CFunction function : cInterface.functions) {
      includes.addAll(collectFunctionSignatureIncludes(function));
    }
    for (CStruct struct : cInterface.structs) {
      for (CField field : struct.getFields()) {
        includes.addAll(field.getType().getFunctionReturnType().includes);
        includes.addAll(field.getType().getCType().includes);
      }
    }
    for (CEnum enumType : cInterface.enums) {
      includes.addAll(enumType.includes);
    }
    for (final CMap map : cInterface.maps) {
      includes.addAll(map.keyType.getFunctionReturnType().includes);
      includes.addAll(map.valueType.getFunctionReturnType().includes);
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
    return includes;
  }
}
