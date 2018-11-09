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

package com.here.genium.platform.node;

import static java.util.stream.Collectors.toList;

import com.here.genium.Genium;
import com.here.genium.generator.common.GeneratedFile;
import com.here.genium.generator.cpp.CppNameResolver;
import com.here.genium.generator.node.NodeGenerator;
import com.here.genium.model.franca.FrancaDeploymentModel;
import com.here.genium.platform.common.GeneratorSuite;
import java.util.List;
import java.util.Objects;
import java.util.stream.Stream;
import org.franca.core.franca.FTypeCollection;

/**
 * Uses a {@link NodeGenerator} to generate Node.js bindings written in C++ on top of BaseAPI.
 *
 * <p>The bindings are used to build a .node module that can run on IOT and server platforms.
 */
@SuppressWarnings({"PMD.UnusedPrivateField", "PMD.SingularField"})
public final class NodeGeneratorSuite extends GeneratorSuite {

  public static final String GENERATOR_NAME = "nodejs";

  private final String internalNamespace;
  private final List<String> rootNamespace;
  private final FrancaDeploymentModel deploymentModel;
  private final CppNameResolver cppNameResolver;

  public NodeGeneratorSuite(
      final Genium.Options options, final FrancaDeploymentModel deploymentModel) {
    super();
    this.internalNamespace = options.getCppInternalNamespace();
    this.rootNamespace = options.getCppRootNamespace();
    this.deploymentModel = deploymentModel;
    this.cppNameResolver = new CppNameResolver(deploymentModel, rootNamespace);
  }

  @Override
  public List<GeneratedFile> generate(final List<FTypeCollection> typeCollections) {

    NodeGenerator nodeGenerator = new NodeGenerator(deploymentModel);
    Stream<GeneratedFile> nodeStream = typeCollections.stream().map(nodeGenerator::generate);
    List<GeneratedFile> result = nodeStream.collect(toList());

    return result.stream().filter(Objects::nonNull).collect(toList());
  }

  @Override
  public String getName() {
    return "com.here.NodeGenerator";
  }
}
