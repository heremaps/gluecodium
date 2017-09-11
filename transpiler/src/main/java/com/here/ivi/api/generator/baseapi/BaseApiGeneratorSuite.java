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
import com.here.ivi.api.model.cppmodel.CppIncludeResolver;
import com.here.ivi.api.model.cppmodel.CppNamespace;
import com.here.ivi.api.model.franca.DefinedBy;
import com.here.ivi.api.model.franca.FrancaElement;
import com.here.ivi.api.model.franca.Interface;
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
            .map(iface -> generateFromFrancaElement(iface, generator))
            .filter(Objects::nonNull)
            .collect(Collectors.toList());

    generatedFiles.add(GeneratorSuite.copyTarget("cpp/internal/expected.h", ""));

    return generatedFiles;
  }

  @Override
  public String getName() {
    return "com.here.BaseApiGenerator";
  }

  private GeneratedFile generateFromFrancaElement(
      final FrancaElement francaElement, final CppGenerator generator) {

    CppNamespace cppModel = mapFrancaElementToCppModel(francaElement);

    String fileName = CppNameRules.getHeaderPath(francaElement);
    CharSequence copyRightNotice = generateGeneratorNotice(francaElement, fileName);

    return generator.generateCode(cppModel, fileName, copyRightNotice);
  }

  @Override
  public void buildModel(String inputPath) {
    super.buildModel(inputPath);
    includeResolver = new CppIncludeResolver(model);
  }

  private CharSequence generateGeneratorNotice(FrancaElement element, String outputTarget) {

    Map<String, String> generatorNoticeData = new HashMap<>();
    generatorNoticeData.put("generatorName", getName());
    generatorNoticeData.put("outputFile", outputTarget);
    generatorNoticeData.put("elementName", element.getName());
    generatorNoticeData.put("elementVersion", element.getVersion().toString());
    generatorNoticeData.put("date", new SimpleDateFormat("dd.MM.YYYY").format(new Date()));

    return TemplateEngine.render("common/GeneratorNotice", generatorNoticeData);
  }

  private CppNamespace mapFrancaElementToCppModel(final FrancaElement francaElement) {

    List<String> outermostQualifier;
    if (francaElement instanceof Interface) {
      outermostQualifier = francaElement.getPackageNames();
    } else {
      outermostQualifier = DefinedBy.getPackages(francaElement.getFrancaTypeCollection());
      outermostQualifier.add(
          CppNameRules.getTypeCollectionName(francaElement.getFrancaTypeCollection().getName()));
    }

    CppModelBuilder builder = new CppModelBuilder(francaElement, includeResolver);
    FrancaTreeWalker treeWalker = new FrancaTreeWalker(Collections.singletonList(builder));

    treeWalker.walk(francaElement);

    CppNamespace namespace = new CppNamespace(outermostQualifier);
    namespace.members.addAll(builder.getResults());
    namespace.includes.addAll(collectIncludes(namespace));

    return namespace;
  }

  private static List<Include> collectIncludes(final CppNamespace namespace) {
    return namespace
        .streamRecursive()
        .filter(element -> element instanceof CppElementWithIncludes)
        .map(CppElementWithIncludes.class::cast)
        .map(elementWithIncludes -> elementWithIncludes.includes)
        .flatMap(Set::stream)
        .collect(Collectors.toList());
  }
}
