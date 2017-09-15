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

package com.here.ivi.api.generator.baseapi;

import com.google.common.annotations.VisibleForTesting;
import com.here.ivi.api.generator.common.FrancaTreeWalker;
import com.here.ivi.api.generator.common.GeneratedFile;
import com.here.ivi.api.generator.common.GeneratorSuite;
import com.here.ivi.api.generator.common.TemplateEngine;
import com.here.ivi.api.generator.cpp.CppGenerator;
import com.here.ivi.api.generator.cpp.CppNameRules;
import com.here.ivi.api.loader.FrancaModelLoader;
import com.here.ivi.api.model.common.Include;
import com.here.ivi.api.model.cppmodel.CppElementWithIncludes;
import com.here.ivi.api.model.cppmodel.CppFile;
import com.here.ivi.api.model.cppmodel.CppIncludeResolver;
import com.here.ivi.api.model.franca.FrancaElement;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 * This generator will build all the BaseApis that will have to be implemented on the client
 * side @ref CppMapper as well as the data used by @ref TypeCollectionMapper.
 *
 * <p>It is the underlying generator, that all others depend on, as they will invoke the actual
 * implementation through the C++ interfaces.
 */
public final class BaseApiGeneratorSuite extends GeneratorSuite {

  public static final String GENERATOR_NAME = "cpp";

  private CppIncludeResolver includeResolver;

  public BaseApiGeneratorSuite() {
    this(new FrancaModelLoader());
  }

  @VisibleForTesting
  BaseApiGeneratorSuite(final FrancaModelLoader francaModelLoader) {
    super(francaModelLoader);
  }

  public List<GeneratedFile> generate() {

    CppGenerator generator = new CppGenerator();

    List<GeneratedFile> generatedFiles =
        Stream.concat(model.getInterfaces().stream(), model.getTypeCollections().stream())
            .flatMap(iface -> generateFromFrancaElement(iface, generator))
            .filter(Objects::nonNull)
            .collect(Collectors.toList());

    generatedFiles.add(GeneratorSuite.copyTarget("cpp/internal/expected.h", ""));

    return generatedFiles;
  }

  @Override
  public String getName() {
    return "com.here.BaseApiGenerator";
  }

  private Stream<GeneratedFile> generateFromFrancaElement(
      final FrancaElement francaElement, final CppGenerator generator) {

    CppFile cppModel = mapFrancaElementToCppModel(francaElement);
    String outputFilePath = CppNameRules.getOutputFilePath(francaElement);
    String copyRightNotice = generateGeneratorNotice(francaElement);

    return generator.generateCode(cppModel, outputFilePath, copyRightNotice).stream();
  }

  @Override
  public void buildModel(String inputPath) {
    super.buildModel(inputPath);
    includeResolver = new CppIncludeResolver(model);
  }

  private String generateGeneratorNotice(FrancaElement element) {

    Map<String, String> generatorNoticeData = new HashMap<>();
    generatorNoticeData.put("generatorName", getName());
    generatorNoticeData.put("elementName", element.getName());
    generatorNoticeData.put("elementVersion", element.getVersion().toString());
    generatorNoticeData.put("date", new SimpleDateFormat("dd.MM.YYYY").format(new Date()));

    return TemplateEngine.render("common/GeneratorNotice", generatorNoticeData);
  }

  private CppFile mapFrancaElementToCppModel(final FrancaElement francaElement) {

    List<String> namespaceElements =
        CppNameRules.getNamespace(francaElement.getFrancaTypeCollection());

    CppModelBuilder builder = new CppModelBuilder(francaElement, includeResolver);
    FrancaTreeWalker treeWalker = new FrancaTreeWalker(Collections.singletonList(builder));

    treeWalker.walk(francaElement);

    CppFile cppModel = new CppFile(namespaceElements);
    cppModel.members.addAll(builder.getResults());
    cppModel.includes.addAll(collectIncludes(cppModel));

    return cppModel;
  }

  private static List<Include> collectIncludes(final CppFile cppModel) {
    return cppModel
        .streamRecursive()
        .filter(element -> element instanceof CppElementWithIncludes)
        .map(CppElementWithIncludes.class::cast)
        .map(elementWithIncludes -> elementWithIncludes.includes)
        .flatMap(Set::stream)
        .collect(Collectors.toList());
  }
}
