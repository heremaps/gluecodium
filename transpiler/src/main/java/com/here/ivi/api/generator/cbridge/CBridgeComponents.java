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

package com.here.ivi.api.generator.cbridge;

import static com.here.ivi.api.generator.cbridge.CBridgeNameRules.CBRIDGE_INTERNAL;
import static com.here.ivi.api.generator.cbridge.CBridgeNameRules.INCLUDE_DIR;

import com.here.ivi.api.model.cmodel.*;
import com.here.ivi.api.model.common.Include;
import java.nio.file.Paths;
import java.util.*;

public final class CBridgeComponents {

  public static final String PROXY_CACHE_FILENAME =
      Paths.get(CBRIDGE_INTERNAL, INCLUDE_DIR, "CachedProxyBase.h").toString();

  public static Collection<Include> collectImplementationIncludes(CInterface cInterface) {
    Collection<Include> includes = new LinkedList<>();
    for (CFunction function : cInterface.functions) {
      includes.addAll(collectFunctionBodyIncludes(function));
    }
    for (CStruct struct : cInterface.structs) {
      includes.addAll(struct.mappedType.includes);
      for (CField field : struct.fields) {
        includes.addAll(field.type.includes);
      }
    }
    if (cInterface.selfType != null) {
      includes.addAll(cInterface.selfType.includes);
    }

    for (CArray array : cInterface.arrays) {
      includes.addAll(array.includes());
    }
    return includes;
  }

  public static Collection<Include> collectPrivateHeaderIncludes(CInterface cInterface) {
    Collection<Include> includes = new LinkedList<>();
    for (CStruct struct : cInterface.structs) {
      includes.addAll(struct.mappedType.includes);
    }
    for (CArray array : cInterface.arrays) {
      includes.addAll(array.includes());
    }
    if (cInterface.selfType != null) {
      includes.addAll(cInterface.selfType.includes);
    }
    return includes;
  }

  public static Collection<Include> collectHeaderIncludes(CInterface cInterface) {
    Collection<Include> includes = new LinkedList<>();
    for (CFunction function : cInterface.functions) {
      includes.addAll(collectFunctionSignatureIncludes(function));
    }
    for (CStruct struct : cInterface.structs) {
      for (CField field : struct.fields) {
        includes.addAll(field.type.functionReturnType.includes);
        for (CType type : field.type.cTypesNeededByConstructor) {
          includes.addAll(type.includes);
        }
      }
    }
    for (CEnum enumType : cInterface.enumerators) {
      includes.addAll(enumType.includes);
    }

    for (CArray array : cInterface.arrays) {
      includes.addAll(array.returnTypeIncludes());
    }
    return includes;
  }

  private static Collection<Include> collectFunctionSignatureIncludes(CFunction function) {
    Collection<Include> includes = new LinkedList<>();
    for (CParameter parameter : function.parameters) {
      includes.addAll(parameter.getSignatureIncludes());
    }
    includes.addAll(function.returnType.functionReturnType.includes);
    return includes;
  }

  private static Collection<Include> collectFunctionBodyIncludes(CFunction function) {
    Collection<Include> includes = new LinkedList<>();
    for (CParameter parameter : function.parameters) {
      includes.addAll(parameter.mappedType.includes);
    }
    includes.addAll(function.returnType.includes);
    includes.addAll(function.delegateCallIncludes);
    if (function.selfParameter != null) {
      includes.addAll(function.selfParameter.mappedType.includes);
    }
    return includes;
  }
}
