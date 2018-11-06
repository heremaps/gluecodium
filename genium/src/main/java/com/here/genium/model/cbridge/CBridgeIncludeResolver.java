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

import com.here.genium.generator.cbridge.CBridgeNameRules;
import com.here.genium.model.common.Include;
import com.here.genium.model.franca.DefinedBy;
import java.io.File;
import java.util.*;
import org.franca.core.franca.FModelElement;
import org.franca.core.franca.FTypeCollection;

public class CBridgeIncludeResolver {

  private final Map<FTypeCollection, Include> resolvedIncludes = new HashMap<>();
  private final List<String> rootNamespace;

  public CBridgeIncludeResolver(final List<String> rootNamespace) {
    this.rootNamespace = rootNamespace;
  }

  public Include resolveInclude(final FModelElement modelElement) {

    FTypeCollection typeCollection = DefinedBy.findDefiningTypeCollection(modelElement);
    Include include = resolvedIncludes.get(typeCollection);

    if (include == null) {
      String includeName = getHeaderFileNameWithPath(typeCollection);
      include = Include.Companion.createInternalInclude(includeName);
      resolvedIncludes.put(typeCollection, include);
    }

    return include;
  }

  public String getHeaderFileNameWithPath(final FTypeCollection francaTypeCollection) {
    return getPathComponents(
        francaTypeCollection, CBridgeNameRules.INCLUDE_DIR, CBridgeNameRules.PUBLIC_HEADER_SUFFIX);
  }

  public String getImplementationFileNameWithPath(final FTypeCollection francaTypeCollection) {
    return getPathComponents(
        francaTypeCollection, CBridgeNameRules.SRC_DIR, CBridgeNameRules.IMPL_SUFFIX);
  }

  private String getPathComponents(
      final FTypeCollection francaTypeCollection, final String subfolder, final String suffix) {

    List<String> pathComponents = new LinkedList<>();
    pathComponents.add(CBridgeNameRules.CBRIDGE_PUBLIC);
    pathComponents.add(subfolder);
    pathComponents.addAll(rootNamespace);
    pathComponents.addAll(DefinedBy.getPackages(francaTypeCollection));
    pathComponents.add(
        CBridgeNameRules.CBRIDGE_PREFIX + CBridgeNameRules.getName(francaTypeCollection) + suffix);

    return String.join(File.separator, pathComponents);
  }
}
