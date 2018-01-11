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

package com.here.ivi.api.generator.cbridge;

import static com.here.ivi.api.generator.cbridge.CBridgeNameRules.CBRIDGE_INTERNAL;
import static com.here.ivi.api.generator.cbridge.CBridgeNameRules.CBRIDGE_PUBLIC;
import static com.here.ivi.api.generator.cbridge.CBridgeNameRules.INCLUDE_DIR;
import static com.here.ivi.api.generator.cbridge.CBridgeNameRules.SRC_DIR;

import com.google.common.annotations.VisibleForTesting;
import com.here.ivi.api.generator.common.GeneratedFile;
import com.here.ivi.api.generator.common.TemplateEngine;
import com.here.ivi.api.generator.common.modelbuilder.FrancaTreeWalker;
import com.here.ivi.api.generator.cpp.CppModelBuilder;
import com.here.ivi.api.generator.swift.SwiftModelBuilder;
import com.here.ivi.api.model.cbridge.CInterface;
import com.here.ivi.api.model.cbridge.IncludeResolver;
import com.here.ivi.api.model.common.Include;
import com.here.ivi.api.model.cpp.CppIncludeResolver;
import com.here.ivi.api.model.franca.FrancaDeploymentModel;
import com.here.ivi.api.platform.common.GeneratorSuite;
import java.nio.file.Paths;
import java.util.*;
import java.util.stream.Stream;
import org.franca.core.franca.FTypeCollection;

public class CBridgeGenerator {

  private final FrancaDeploymentModel deploymentModel;
  private final IncludeResolver resolver;

  public final CArrayGenerator arrayGenerator = new CArrayGenerator();

  public static final String BASE_HANDLE_FILE =
      Paths.get(CBRIDGE_PUBLIC, INCLUDE_DIR, "BaseHandle.h").toString();
  public static final String BASE_HANDLE_IMPL_FILE =
      Paths.get(CBRIDGE_INTERNAL, INCLUDE_DIR, "BaseHandleImpl.h").toString();
  public static final String STRING_HANDLE_FILE =
      Paths.get(CBRIDGE_PUBLIC, INCLUDE_DIR, "StringHandle.h").toString();

  public static final List<GeneratedFile> STATIC_FILES =
      Arrays.asList(
          GeneratorSuite.copyTarget(BASE_HANDLE_FILE, ""),
          GeneratorSuite.copyTarget(BASE_HANDLE_IMPL_FILE, ""),
          GeneratorSuite.copyTarget(STRING_HANDLE_FILE, ""),
          GeneratorSuite.copyTarget(
              Paths.get(CBRIDGE_PUBLIC, SRC_DIR, "StringHandle.cpp").toString(), ""),
          GeneratorSuite.copyTarget(
              Paths.get(CBRIDGE_PUBLIC, INCLUDE_DIR, "ByteArrayHandle.h").toString(), ""),
          GeneratorSuite.copyTarget(
              Paths.get(CBRIDGE_PUBLIC, SRC_DIR, "ByteArrayHandle.cpp").toString(), ""),
          GeneratorSuite.copyTarget(CBridgeComponents.PROXY_CACHE_FILENAME, ""));

  public CBridgeGenerator(
      final FrancaDeploymentModel deploymentModel, final IncludeResolver includeResolver) {
    this.deploymentModel = deploymentModel;
    this.resolver = includeResolver;
  }

  public Stream<GeneratedFile> generate(final FTypeCollection francaTypeCollection) {
    CInterface cModel = buildCBridgeModel(francaTypeCollection);
    return Stream.of(
            new GeneratedFile(
                generatePrivateHeaderContent(cModel),
                CBridgeNameRules.getPrivateHeaderFileNameWithPath(francaTypeCollection)),
            new GeneratedFile(
                generateHeaderContent(cModel),
                CBridgeNameRules.getHeaderFileNameWithPath(francaTypeCollection)),
            new GeneratedFile(
                generateImplementationContent(cModel),
                CBridgeNameRules.getImplementationFileNameWithPath(francaTypeCollection)))
        .filter(file -> !file.content.isEmpty());
  }

  @VisibleForTesting
  public static String generatePrivateHeaderContent(CInterface model) {
    return model.hasPrivateHeaderContent()
        ? TemplateEngine.render("cbridge/PrivateHeader", model)
        : "";
  }

  @VisibleForTesting
  public static String generateHeaderContent(CInterface model) {
    return TemplateEngine.render("cbridge/Header", model);
  }

  @VisibleForTesting
  public static String generateImplementationContent(CInterface model) {
    return TemplateEngine.render("cbridge/Implementation", model);
  }

  public CInterface buildCBridgeModel(final FTypeCollection francaTypeCollection) {
    CppModelBuilder cppBuilder = new CppModelBuilder(deploymentModel, new CppIncludeResolver());
    SwiftModelBuilder swiftBuilder = new SwiftModelBuilder(deploymentModel);
    CBridgeModelBuilder modelBuilder =
        new CBridgeModelBuilder(deploymentModel, resolver, cppBuilder, swiftBuilder);
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
    cModel.privateHeaderIncludes.remove(
        Include.createInternalInclude(
            CBridgeNameRules.getPrivateHeaderFileNameWithPath(francaTypeCollection)));
    cModel.headerIncludes.remove(
        Include.createInternalInclude(
            CBridgeNameRules.getHeaderFileNameWithPath(francaTypeCollection)));
    cModel.implementationIncludes.removeAll(cModel.headerIncludes);
    cModel.privateHeaderIncludes.removeAll(cModel.headerIncludes);
  }
}
