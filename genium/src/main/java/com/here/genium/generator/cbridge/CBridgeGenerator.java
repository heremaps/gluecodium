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

package com.here.genium.generator.cbridge;

import static com.here.genium.generator.cbridge.CBridgeNameRules.*;

import com.google.common.annotations.VisibleForTesting;
import com.here.genium.common.FrancaSignatureResolver;
import com.here.genium.generator.common.GeneratedFile;
import com.here.genium.generator.common.modelbuilder.FrancaTreeWalker;
import com.here.genium.generator.common.templates.TemplateEngine;
import com.here.genium.generator.cpp.CppModelBuilder;
import com.here.genium.generator.cpp.CppNameResolver;
import com.here.genium.generator.cpp.CppTypeMapper;
import com.here.genium.generator.cpp.CppValueMapper;
import com.here.genium.generator.swift.SwiftModelBuilder;
import com.here.genium.generator.swift.SwiftTypeMapper;
import com.here.genium.model.cbridge.CBridgeIncludeResolver;
import com.here.genium.model.cbridge.CInterface;
import com.here.genium.model.common.Include;
import com.here.genium.model.cpp.CppIncludeResolver;
import com.here.genium.model.franca.FrancaDeploymentModel;
import com.here.genium.platform.common.GeneratorSuite;
import java.nio.file.Paths;
import java.util.*;
import java.util.stream.Stream;
import org.franca.core.franca.FTypeCollection;

public class CBridgeGenerator {

  private final FrancaDeploymentModel deploymentModel;
  private final FrancaSignatureResolver signatureResolver;
  private final SwiftTypeMapper swiftTypeMapper;
  private final CppIncludeResolver cppIncludeResolver;
  private final CBridgeIncludeResolver includeResolver;
  private final CppNameResolver cppNameResolver;
  private final String internalNamespace;
  public final CArrayGenerator arrayGenerator;

  public static final List<GeneratedFile> STATIC_FILES =
      Arrays.asList(
          GeneratorSuite.copyTarget(CBridgeNameRules.BASE_HANDLE_FILE, ""),
          GeneratorSuite.copyTarget(CBridgeNameRules.STRING_HANDLE_FILE, ""),
          GeneratorSuite.copyTarget(CBridgeNameRules.EXPORT_FILE, ""),
          GeneratorSuite.copyTarget(
              Paths.get(CBRIDGE_PUBLIC, INCLUDE_DIR, "BuiltinHandle.h").toString(), ""),
          GeneratorSuite.copyTarget(
              Paths.get(CBRIDGE_PUBLIC, INCLUDE_DIR, "ByteArrayHandle.h").toString(), ""),
          GeneratorSuite.copyTarget(
              Paths.get(CBRIDGE_PUBLIC, SRC_DIR, "ByteArrayHandle.cpp").toString(), ""),
          GeneratorSuite.copyTarget(CBridgeComponents.PROXY_CACHE_FILENAME, ""));
  public static final List<String> HELPER_FILES = Arrays.asList(BASE_HANDLE_IMPL_FILE);

  public CBridgeGenerator(
      final FrancaDeploymentModel deploymentModel,
      final CppIncludeResolver cppIncludeResolver,
      final CBridgeIncludeResolver includeResolver,
      final CppNameResolver cppNameResolver,
      final String internalNamespace) {
    this.deploymentModel = deploymentModel;
    this.cppIncludeResolver = cppIncludeResolver;
    this.includeResolver = includeResolver;
    this.cppNameResolver = cppNameResolver;
    this.internalNamespace = internalNamespace;
    this.signatureResolver = new FrancaSignatureResolver();
    this.swiftTypeMapper = new SwiftTypeMapper(deploymentModel);
    this.arrayGenerator = new CArrayGenerator(internalNamespace);
  }

  public Stream<GeneratedFile> generate(final FTypeCollection francaTypeCollection) {
    CInterface cModel = buildCBridgeModel(francaTypeCollection);
    return Stream.of(
            new GeneratedFile(
                generateHeaderContent(cModel),
                includeResolver.getHeaderFileNameWithPath(francaTypeCollection)),
            new GeneratedFile(
                generateImplementationContent(cModel),
                includeResolver.getImplementationFileNameWithPath(francaTypeCollection)))
        .filter(file -> !file.getContent().isEmpty());
  }

  @VisibleForTesting
  public static String generateHeaderContent(CInterface model) {
    return TemplateEngine.INSTANCE.render("cbridge/Header", model);
  }

  @VisibleForTesting
  public static String generateImplementationContent(CInterface model) {
    return TemplateEngine.INSTANCE.render("cbridge/Implementation", model);
  }

  public List<GeneratedFile> generateHelpers() {
    return Arrays.asList(
        generateHelperContent("BaseHandleImpl", BASE_HANDLE_IMPL_FILE),
        generateHelperContent(
            "StringHandle", Paths.get(CBRIDGE_PUBLIC, SRC_DIR, "StringHandle.cpp").toString()),
        generateHelperContent(
            "BuiltinHandle", Paths.get(CBRIDGE_PUBLIC, SRC_DIR, "BuildintHandle.cpp").toString()));
  }

  private GeneratedFile generateHelperContent(String template, String path) {
    return new GeneratedFile(
        TemplateEngine.INSTANCE.render("cbridge/" + template, internalNamespace), path);
  }

  public CInterface buildCBridgeModel(final FTypeCollection francaTypeCollection) {

    CppTypeMapper cppTypeMapper =
        new CppTypeMapper(cppIncludeResolver, cppNameResolver, internalNamespace, deploymentModel);
    CppValueMapper valueMapper = new CppValueMapper(deploymentModel, cppNameResolver);
    CppModelBuilder cppBuilder =
        new CppModelBuilder(deploymentModel, cppTypeMapper, valueMapper, cppNameResolver);
    SwiftModelBuilder swiftBuilder =
        new SwiftModelBuilder(deploymentModel, signatureResolver, swiftTypeMapper);
    CBridgeTypeMapper typeMapper =
        new CBridgeTypeMapper(
            cppIncludeResolver,
            cppNameResolver,
            includeResolver,
            cppTypeMapper.getEnumHashType().name,
            cppTypeMapper.getByteBufferType().name);

    CBridgeModelBuilder modelBuilder =
        new CBridgeModelBuilder(
            deploymentModel,
            cppIncludeResolver,
            includeResolver,
            cppBuilder,
            swiftBuilder,
            typeMapper,
            internalNamespace);
    FrancaTreeWalker treeWalker =
        new FrancaTreeWalker(Arrays.asList(cppBuilder, swiftBuilder, modelBuilder));

    treeWalker.walkTree(francaTypeCollection);
    CInterface cModel = modelBuilder.getFinalResult(CInterface.class);

    removeRedundantIncludes(francaTypeCollection, cModel);
    arrayGenerator.collect(modelBuilder.arraysCollector);

    return cModel;
  }

  private void removeRedundantIncludes(
      final FTypeCollection francaTypeCollection, CInterface cModel) {
    cModel.headerIncludes.remove(
        Include.Companion.createInternalInclude(
            includeResolver.getHeaderFileNameWithPath(francaTypeCollection)));
    cModel.implementationIncludes.removeAll(cModel.headerIncludes);
    cModel.privateHeaderIncludes.removeAll(cModel.headerIncludes);
  }
}
