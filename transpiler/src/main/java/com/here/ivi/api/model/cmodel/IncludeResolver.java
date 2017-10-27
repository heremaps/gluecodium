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

import com.here.ivi.api.generator.cbridge.CBridgeNameRules;
import com.here.ivi.api.generator.cpp.CppNameRules;
import com.here.ivi.api.model.common.Include;
import com.here.ivi.api.model.franca.DefinedBy;
import java.util.HashMap;
import java.util.Map;
import lombok.EqualsAndHashCode;
import org.franca.core.franca.FModelElement;
import org.franca.core.franca.FTypeCollection;

public class IncludeResolver {

  private final Map<CacheKey, Include> resolvedIncludes = new HashMap<>();

  public enum HeaderType {
    BASE_API_HEADER,
    CBRIDGE_PUBLIC_HEADER,
    CBRIDGE_PRIVATE_HEADER
  }

  @EqualsAndHashCode
  private static class CacheKey {
    private final FTypeCollection typeCollection;
    private final HeaderType headerType;

    CacheKey(FTypeCollection typeCollection, HeaderType headerType) {
      this.typeCollection = typeCollection;
      this.headerType = headerType;
    }
  }

  public Include resolveInclude(final FModelElement modelElement, HeaderType headerType) {

    FTypeCollection typeCollection = DefinedBy.findDefiningTypeCollection(modelElement);
    CacheKey key = new CacheKey(typeCollection, headerType);

    Include resolvedInclude = resolvedIncludes.get(key);
    if (resolvedInclude != null) {
      return resolvedInclude;
    }

    resolvedInclude = Include.createInternalInclude(resolveIncludeName(typeCollection, headerType));
    resolvedIncludes.put(key, resolvedInclude);
    return resolvedInclude;
  }

  private String resolveIncludeName(
      final FTypeCollection francaTypeCollection, final HeaderType headerType) {
    switch (headerType) {
      case BASE_API_HEADER:
        return CppNameRules.getHeaderPath(francaTypeCollection);
      case CBRIDGE_PUBLIC_HEADER:
        return CBridgeNameRules.getHeaderFileNameWithPath(francaTypeCollection);
      default:
        return CBridgeNameRules.getPrivateHeaderFileNameWithPath(francaTypeCollection);
    }
  }
}
