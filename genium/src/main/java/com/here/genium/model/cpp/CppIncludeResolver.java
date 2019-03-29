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

package com.here.genium.model.cpp;

import com.here.genium.common.FrancaTypeHelper;
import com.here.genium.generator.cpp.CppNameRules;
import com.here.genium.model.common.Include;
import com.here.genium.model.franca.DefinedBy;
import com.here.genium.model.franca.FrancaDeploymentModel;
import java.io.File;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import org.franca.core.franca.FModelElement;
import org.franca.core.franca.FTypeCollection;

public class CppIncludeResolver {

  private final Map<String, List<Include>> resolvedIncludes = new HashMap<>();
  private final FrancaDeploymentModel deploymentModel;
  private final List<String> rootNamespace;

  public CppIncludeResolver(
      final FrancaDeploymentModel deploymentModel, final List<String> rootNamespace) {
    this.deploymentModel = deploymentModel;
    this.rootNamespace = rootNamespace;
  }

  public List<Include> resolveIncludes(final FModelElement modelElement) {

    String cacheKey = FrancaTypeHelper.getFullName(modelElement);
    List<Include> includes = resolvedIncludes.get(cacheKey);
    if (includes != null) {
      return includes;
    }

    String externalType = deploymentModel.getExternalType(modelElement);
    if (externalType != null) {
      includes =
          Arrays.stream(externalType.split(","))
              .map(fileName -> Include.Companion.createInternalInclude(fileName.trim()))
              .collect(Collectors.toList());
    } else if (modelElement instanceof FTypeCollection) {
      String includeName =
          getOutputFilePath((FTypeCollection) modelElement) + CppNameRules.HEADER_FILE_SUFFIX;
      includes = Collections.singletonList(Include.Companion.createInternalInclude(includeName));
    } else {
      FTypeCollection typeCollection = DefinedBy.findDefiningTypeCollection(modelElement);
      includes = resolveIncludes(typeCollection);
    }

    resolvedIncludes.put(cacheKey, includes);

    return includes;
  }

  public String getOutputFilePath(final FTypeCollection typeCollection) {

    LinkedList<String> pathComponents = new LinkedList<>(rootNamespace);
    pathComponents.addAll(DefinedBy.getPackages(typeCollection));
    pathComponents.add(CppNameRules.INSTANCE.getTypeName(typeCollection.getName()));

    return String.join(File.separator, pathComponents);
  }
}
