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

package com.here.ivi.api.platform.baseapi;

import com.google.common.annotations.VisibleForTesting;
import com.here.ivi.api.common.CollectionsHelper;
import com.here.ivi.api.generator.common.GeneratedFile;
import com.here.ivi.api.generator.common.modelbuilder.FrancaTreeWalker;
import com.here.ivi.api.generator.cpp.CppGenerator;
import com.here.ivi.api.generator.cpp.CppModelBuilder;
import com.here.ivi.api.generator.cpp.CppNameRules;
import com.here.ivi.api.model.common.Include;
import com.here.ivi.api.model.common.Streamable;
import com.here.ivi.api.model.cpp.*;
import com.here.ivi.api.model.franca.DefinedBy;
import com.here.ivi.api.model.franca.FrancaDeploymentModel;
import com.here.ivi.api.platform.common.GeneratorSuite;
import java.io.File;
import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import org.franca.core.franca.FTypeCollection;

/**
 * This generator will build all the BaseApis that will have to be implemented on the client
 * side @ref CppMapper as well as the data used by @ref TypeCollectionMapper.
 *
 * <p>It is the underlying generator, that all others depend on, as they will invoke the actual
 * implementation through the C++ interfaces.
 */
public final class BaseApiGeneratorSuite extends GeneratorSuite {

  public static final String GENERATOR_NAME = "cpp";

  @VisibleForTesting
  static final List<String> ADDITIONAL_HEADERS = Arrays.asList("enum_hash.h", "Return.h");

  private final CppIncludeResolver includeResolver;

  public BaseApiGeneratorSuite() {
    super();
    includeResolver = new CppIncludeResolver();
  }

  public List<GeneratedFile> generate(
      final FrancaDeploymentModel deploymentModel, final List<FTypeCollection> typeCollections) {
    CppGenerator generator = new CppGenerator();

    List<GeneratedFile> generatedFiles =
        typeCollections
            .stream()
            .flatMap(
                francaTypeCollection ->
                    generateFromFrancaTypeCollection(
                        deploymentModel, francaTypeCollection, generator))
            .collect(Collectors.toList());

    for (String header : ADDITIONAL_HEADERS) {
      generatedFiles.add(
          copyTarget(
              GENERATOR_NAME
                  + File.separator
                  + CppNameRules.PACKAGE_NAME_SPECIFIER_INCLUDE
                  + File.separator
                  + header,
              ""));
    }

    return generatedFiles;
  }

  @Override
  public String getName() {
    return "com.here.BaseApiGenerator";
  }

  private Stream<GeneratedFile> generateFromFrancaTypeCollection(
      final FrancaDeploymentModel deploymentModel,
      final FTypeCollection francaTypeCollection,
      final CppGenerator generator) {

    CppFile cppModel = mapFrancaTypeCollectionToCppModel(deploymentModel, francaTypeCollection);
    String outputFilePathHeader = CppNameRules.getOutputFilePath(francaTypeCollection);
    String outputFilePathImpl = CppNameRules.getOutputFilePath(francaTypeCollection);

    return generator
        .generateCode(
            cppModel,
            outputFilePathHeader,
            outputFilePathImpl,
            BaseApiGeneratorSuite.GENERATOR_NAME)
        .stream();
  }

  private CppFile mapFrancaTypeCollectionToCppModel(
      final FrancaDeploymentModel deploymentModel, final FTypeCollection francaTypeCollection) {
    CppModelBuilder builder = new CppModelBuilder(deploymentModel, includeResolver);
    FrancaTreeWalker treeWalker = new FrancaTreeWalker(Collections.singletonList(builder));

    treeWalker.walkTree(francaTypeCollection);

    CppFile cppModel = new CppFile(DefinedBy.getPackages(francaTypeCollection));
    cppModel.members.addAll(builder.getFinalResults());
    cppModel.includes.addAll(collectIncludes(cppModel));
    cppModel.forwardDeclarations.addAll(collectForwardDeclarations(cppModel));

    return cppModel;
  }

  private static List<Include> collectIncludes(final CppFile cppModel) {
    Stream<Streamable> allElementsStream =
        cppModel.members.stream().flatMap(CppElement::streamRecursive);
    return CollectionsHelper.getStreamOfType(allElementsStream, CppElementWithIncludes.class)
        .map(elementWithIncludes -> elementWithIncludes.includes)
        .flatMap(Set::stream)
        .collect(Collectors.toList());
  }

  private static List<CppForwardDeclaration> collectForwardDeclarations(final CppFile cppModel) {
    Stream<Streamable> allElementsStream =
        cppModel.members.stream().flatMap(CppElement::streamRecursive);
    return CollectionsHelper.getStreamOfType(allElementsStream, CppInstanceTypeRef.class)
        .map(instanceTypeRef -> instanceTypeRef.name)
        .map(CppForwardDeclaration::new)
        .collect(Collectors.toList());
  }
}
