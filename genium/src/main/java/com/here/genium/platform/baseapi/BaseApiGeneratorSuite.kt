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

package com.here.genium.platform.baseapi;

import com.google.common.annotations.VisibleForTesting;
import com.here.genium.Genium;
import com.here.genium.common.CollectionsHelper;
import com.here.genium.common.FrancaTypeHelper;
import com.here.genium.generator.common.GeneratedFile;
import com.here.genium.generator.common.modelbuilder.FrancaTreeWalker;
import com.here.genium.generator.cpp.*;
import com.here.genium.model.common.Include;
import com.here.genium.model.common.Streamable;
import com.here.genium.model.cpp.*;
import com.here.genium.model.franca.DefinedBy;
import com.here.genium.model.franca.FrancaDeploymentModel;
import com.here.genium.platform.common.GeneratorSuite;
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
  static final List<String> ADDITIONAL_HEADERS = Arrays.asList("EnumHash", "Return");

  private final String internalNamespace;
  private final List<String> rootNamespace;
  private final FrancaDeploymentModel deploymentModel;
  private final CppIncludeResolver includeResolver;
  private final CppNameResolver nameResolver;
  private final String exportName;

  public BaseApiGeneratorSuite(
      final Genium.Options options, final FrancaDeploymentModel deploymentModel) {
    super();
    this.internalNamespace = options.getCppInternalNamespace();
    this.rootNamespace = options.getCppRootNamespace();
    this.exportName = options.getCppExport();
    this.deploymentModel = deploymentModel;
    this.includeResolver = new CppIncludeResolver(deploymentModel, rootNamespace);
    this.nameResolver = new CppNameResolver(deploymentModel, rootNamespace);
  }

  @Override
  public String getName() {
    return "com.here.BaseApiGenerator";
  }

  @Override
  public List<GeneratedFile> generate(final List<FTypeCollection> typeCollections) {

    CppTypeMapper typeMapper =
        new CppTypeMapper(includeResolver, nameResolver, internalNamespace, deploymentModel);
    CppGenerator generator =
        new CppGenerator(BaseApiGeneratorSuite.GENERATOR_NAME, internalNamespace);

    Set<String> allErrorEnums =
        typeCollections
            .stream()
            .flatMap(FrancaTypeHelper::getAllErrorEnums)
            .map(nameResolver::getFullyQualifiedName)
            .collect(Collectors.toSet());

    List<GeneratedFile> generatedFiles = new LinkedList<>();
    for (final FTypeCollection francaTypeCollection : typeCollections) {

      CppFile cppModel =
          mapFrancaTypeCollectionToCppModel(typeMapper, francaTypeCollection, allErrorEnums);
      String outputFilePathHeader = includeResolver.getOutputFilePath(francaTypeCollection);
      String outputFilePathImpl = includeResolver.getOutputFilePath(francaTypeCollection);

      generatedFiles.addAll(
          generator.generateCode(cppModel, outputFilePathHeader, outputFilePathImpl));
    }

    for (String header : ADDITIONAL_HEADERS) {
      generatedFiles.add(generator.generateHelperHeader(header));
    }

    if (exportName != null) {
      generatedFiles.add(generator.generateHelperHeader("Export", exportName));
    }

    return generatedFiles;
  }

  private CppFile mapFrancaTypeCollectionToCppModel(
      final CppTypeMapper typeMapper,
      final FTypeCollection francaTypeCollection,
      final Set<String> allErrorEnums) {

    CppModelBuilder builder =
        new CppModelBuilder(
            deploymentModel,
            typeMapper,
            new CppValueMapper(deploymentModel, nameResolver),
            nameResolver);
    FrancaTreeWalker treeWalker = new FrancaTreeWalker(Collections.singletonList(builder));

    treeWalker.walkTree(francaTypeCollection);

    LinkedList<String> namespaces = new LinkedList<>(rootNamespace);
    namespaces.addAll(DefinedBy.getPackages(francaTypeCollection));

    List<CppElement> finalResults = builder.getFinalResults();
    List<Include> includes = collectIncludes(finalResults);
    if (exportName != null) {
      includes.add(
          Include.Companion.createInternalInclude("Export" + CppNameRules.HEADER_FILE_SUFFIX));
    }

    List<CppEnum> errorEnums =
        collectEnums(finalResults)
            .stream()
            .filter(cppEnum -> allErrorEnums.contains(cppEnum.fullyQualifiedName))
            .sorted(Comparator.comparing(cppEnum -> cppEnum.fullyQualifiedName))
            .collect(Collectors.toList());
    if (!errorEnums.isEmpty()) {
      includes.add(CppLibraryIncludes.SYSTEM_ERROR);
    }

    return new CppFile(
        namespaces,
        finalResults,
        includes,
        collectForwardDeclarations(finalResults),
        errorEnums,
        null,
        exportName);
  }

  private static List<Include> collectIncludes(final List<CppElement> members) {
    Stream<Streamable> allElementsStream = members.stream().flatMap(CppElement::streamRecursive);
    return CollectionsHelper.getStreamOfType(allElementsStream, CppElementWithIncludes.class)
        .map(elementWithIncludes -> elementWithIncludes.includes)
        .flatMap(List::stream)
        .collect(Collectors.toList());
  }

  private static List<CppForwardDeclaration> collectForwardDeclarations(
      final List<CppElement> members) {
    Stream<Streamable> allElementsStream = members.stream().flatMap(CppElement::streamRecursive);
    return CollectionsHelper.getStreamOfType(allElementsStream, CppInstanceTypeRef.class)
        .filter(instanceTypeRef -> !instanceTypeRef.getRefersToExternalType())
        .map(instanceTypeRef -> instanceTypeRef.name)
        .map(CppForwardDeclaration::new)
        .collect(Collectors.toList());
  }

  private static Set<CppEnum> collectEnums(final List<CppElement> members) {
    Stream<Streamable> allElementsStream = members.stream().flatMap(CppElement::streamRecursive);
    return CollectionsHelper.getStreamOfType(allElementsStream, CppEnum.class)
        .filter(cppEnum -> !cppEnum.isExternal())
        .collect(Collectors.toSet());
  }
}
