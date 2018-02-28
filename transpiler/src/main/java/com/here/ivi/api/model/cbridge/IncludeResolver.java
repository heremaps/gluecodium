/*
 * Copyright (c) 2016-2018 HERE Europe B.V.
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

package com.here.ivi.api.model.cbridge;

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
        return CBridgeNameRules.BASE_HANDLE_IMPL_FILE;
    }
  }
}
