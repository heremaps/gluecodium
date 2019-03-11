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

package com.here.genium.model.cpp;

import com.here.genium.generator.cpp.CppNameRules;
import com.here.genium.model.common.Include;
import com.here.genium.model.franca.DefinedBy;
import com.here.genium.model.franca.FrancaDeploymentModel;
import java.util.HashMap;
import java.util.Map;
import org.franca.core.franca.FModelElement;
import org.franca.core.franca.FStructType;
import org.franca.core.franca.FTypeCollection;

public class CppIncludeResolver {

  private final Map<FTypeCollection, Include> resolvedIncludes = new HashMap<>();

  private final FrancaDeploymentModel deploymentModel;

  public CppIncludeResolver(final FrancaDeploymentModel deploymentModel) {
    this.deploymentModel = deploymentModel;
  }

  public Include resolveInclude(final FModelElement modelElement) {

    if (modelElement instanceof FStructType) {
      FStructType francaStruct = (FStructType) modelElement;
      String externalType = deploymentModel.getExternalType(francaStruct);
      if (externalType != null) {
        return Include.createInternalInclude(externalType);
      }
    }

    FTypeCollection typeCollection = DefinedBy.findDefiningTypeCollection(modelElement);
    Include include = resolvedIncludes.get(typeCollection);

    if (include == null) {
      String includeName = CppNameRules.getHeaderPath(typeCollection);
      include = Include.createInternalInclude(includeName);
      resolvedIncludes.put(typeCollection, include);
    }

    return include;
  }
}
