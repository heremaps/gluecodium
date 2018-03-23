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
import com.here.ivi.api.model.common.Include;
import com.here.ivi.api.model.franca.DefinedBy;
import java.util.HashMap;
import java.util.Map;
import org.franca.core.franca.FModelElement;
import org.franca.core.franca.FTypeCollection;

public class CBridgeIncludeResolver {

  private final Map<FTypeCollection, Include> resolvedIncludes = new HashMap<>();

  public Include resolveInclude(final FModelElement modelElement) {

    FTypeCollection typeCollection = DefinedBy.findDefiningTypeCollection(modelElement);
    Include include = resolvedIncludes.get(typeCollection);

    if (include == null) {
      String includeName = CBridgeNameRules.getHeaderFileNameWithPath(typeCollection);
      include = Include.createInternalInclude(includeName);
      resolvedIncludes.put(typeCollection, include);
    }

    return include;
  }
}
