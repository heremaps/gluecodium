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

import com.here.ivi.api.generator.common.FrancaTreeWalker;
import com.here.ivi.api.generator.common.GeneratedFile;
import com.here.ivi.api.generator.common.GeneratorSuite;
import com.here.ivi.api.generator.common.TemplateEngine;
import com.here.ivi.api.generator.cpp.CppModelBuilder;
import com.here.ivi.api.generator.swift.SwiftModelBuilder;
import com.here.ivi.api.model.cmodel.CInterface;
import com.here.ivi.api.model.cmodel.IncludeResolver;
import com.here.ivi.api.model.common.Include;
import com.here.ivi.api.model.cppmodel.CppIncludeResolver;
import com.here.ivi.api.model.franca.FrancaDeploymentModel;
import java.util.*;
import java.util.stream.Stream;
import org.franca.core.franca.FTypeCollection;

public class CBridgeGenerator {

  private final FrancaDeploymentModel deploymentModel;
  private final IncludeResolver resolver;

  public CArrayGenerator arrayGenerator = new CArrayGenerator();

  public static final List<GeneratedFile> STATIC_FILES =
      Arrays.asList(
          GeneratorSuite.copyTarget("cbridge/StringHandle.h", ""),
          GeneratorSuite.copyTarget("cbridge/StringHandle.cpp", ""),
          GeneratorSuite.copyTarget("cbridge_internal/StringHandleImpl.h", ""),
          GeneratorSuite.copyTarget("cbridge/ByteArrayHandle.h", ""),
          GeneratorSuite.copyTarget("cbridge/ByteArrayHandle.cpp", ""),
          GeneratorSuite.copyTarget("cbridge_internal/ByteArrayHandleImpl.h", ""));

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
        .filter(file -> file.content.length() > 0);
  }

  public static String generatePrivateHeaderContent(CInterface model) {
    return model.hasPrivateHeaderContent()
        ? generateFileHeader() + TemplateEngine.render("cbridge/PrivateHeader", model)
        : "";
  }

  public static String generateHeaderContent(CInterface model) {
    return generateFileHeader() + TemplateEngine.render("cbridge/Header", model);
  }

  public static String generateImplementationContent(CInterface model) {
    return generateFileHeader() + TemplateEngine.render("cbridge/Implementation", model);
  }

  private static String generateFileHeader() {
    return TemplateEngine.render("cbridge/FileHeader", null);
  }

  public CInterface buildCBridgeModel(final FTypeCollection francaTypeCollection) {
    CppModelBuilder cppBuilder = new CppModelBuilder(deploymentModel, new CppIncludeResolver());
    SwiftModelBuilder swiftBuilder = new SwiftModelBuilder(deploymentModel);
    CModelBuilder modelBuilder =
        new CModelBuilder(deploymentModel, resolver, cppBuilder, swiftBuilder);
    FrancaTreeWalker treeWalker =
        new FrancaTreeWalker(Arrays.asList(cppBuilder, swiftBuilder, modelBuilder));

    treeWalker.walkTree(francaTypeCollection);
    CInterface cModel = modelBuilder.getFinalResult(CInterface.class);

    removeRedundantIncludes(francaTypeCollection, cModel);
    this.arrayGenerator.collect(modelBuilder.arraysCollector);
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
