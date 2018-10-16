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

package com.here.genium.generator.node;

import com.google.common.annotations.VisibleForTesting;
import com.here.genium.generator.common.GeneratedFile;
import com.here.genium.generator.common.modelbuilder.FrancaTreeWalker;
import com.here.genium.generator.common.templates.TemplateEngine;
import com.here.genium.model.franca.FrancaDeploymentModel;
import com.here.genium.model.node.NodeFile;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
import org.franca.core.franca.FTypeCollection;

public class NodeGenerator {

  public final Set<String> enumsAsErrors = new HashSet<>();

  private final FrancaDeploymentModel deploymentModel;

  public NodeGenerator(final FrancaDeploymentModel deploymentModel) {
    this.deploymentModel = deploymentModel;
  }

  public GeneratedFile generate(final FTypeCollection francaTypeCollection) {
    NodeFile file = buildNodeModel(francaTypeCollection);
    if (file.isEmpty()) {
      return null;
    } else {
      return new GeneratedFile(
          TemplateEngine.render("node/File", file),
          NodeNameRules.getImplementationFileName(francaTypeCollection));
    }
  }

  public GeneratedFile generateErrors() {
    return null;
  }

  @VisibleForTesting
  NodeFile buildNodeModel(final FTypeCollection francaTypeCollection) {
    NodeModelBuilder modelBuilder = new NodeModelBuilder(deploymentModel);
    FrancaTreeWalker treeWalker = new FrancaTreeWalker(Collections.singletonList(modelBuilder));

    treeWalker.walkTree(francaTypeCollection);
    enumsAsErrors.addAll(modelBuilder.enumsAsErrors);
    return modelBuilder.getFinalResult(NodeFile.class);
  }
}
