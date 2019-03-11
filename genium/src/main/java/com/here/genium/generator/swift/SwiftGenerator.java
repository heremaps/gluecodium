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

package com.here.genium.generator.swift;

import static java.util.stream.Collectors.toList;

import com.google.common.annotations.VisibleForTesting;
import com.here.genium.generator.common.GeneratedFile;
import com.here.genium.generator.common.TemplateEngine;
import com.here.genium.generator.common.modelbuilder.FrancaTreeWalker;
import com.here.genium.model.franca.FrancaDeploymentModel;
import com.here.genium.model.swift.SwiftFile;
import com.here.genium.platform.common.GeneratorSuite;
import java.util.*;
import org.franca.core.franca.FTypeCollection;

public class SwiftGenerator {

  public final SwiftArrayGenerator arrayGenerator = new SwiftArrayGenerator();
  public final Set<String> enumsAsErrors = new HashSet<>();
  public static final List<GeneratedFile> STATIC_FILES =
      Arrays.asList(
          GeneratorSuite.copyTarget("swift/RefHolder.swift", ""),
          GeneratorSuite.copyTarget("swift/StringConversion.swift", ""),
          GeneratorSuite.copyTarget("swift/CollectionOf.swift", ""),
          GeneratorSuite.copyTarget("swift/NativeBase.swift", ""));

  private final FrancaDeploymentModel deploymentModel;

  public SwiftGenerator(final FrancaDeploymentModel deploymentModel) {
    this.deploymentModel = deploymentModel;
  }

  public GeneratedFile generate(final FTypeCollection francaTypeCollection) {
    SwiftFile file = buildSwiftModel(francaTypeCollection);
    if (file.isEmpty()) {
      return null;
    } else {
      return new GeneratedFile(
          TemplateEngine.render("swift/File", file),
          SwiftNameRules.getImplementationFileName(francaTypeCollection));
    }
  }

  public GeneratedFile generateErrors() {
    if (enumsAsErrors.isEmpty()) {
      return null;
    } else {
      return new GeneratedFile(
          TemplateEngine.render("swift/Errors", enumsAsErrors.stream().sorted().collect(toList())),
          SwiftNameRules.TARGET_DIRECTORY + "ErrorsExtensions.swift");
    }
  }

  @VisibleForTesting
  SwiftFile buildSwiftModel(final FTypeCollection francaTypeCollection) {
    SwiftModelBuilder modelBuilder = new SwiftModelBuilder(deploymentModel);
    FrancaTreeWalker treeWalker = new FrancaTreeWalker(Collections.singletonList(modelBuilder));

    treeWalker.walkTree(francaTypeCollection);
    arrayGenerator.collect(modelBuilder.arraysCollector);
    enumsAsErrors.addAll(modelBuilder.enumsAsErrors);
    return modelBuilder.getFinalResult(SwiftFile.class);
  }
}
