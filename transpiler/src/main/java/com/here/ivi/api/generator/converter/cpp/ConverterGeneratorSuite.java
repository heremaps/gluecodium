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

package com.here.ivi.api.generator.converter.cpp;

import com.here.ivi.api.Transpiler;
import com.here.ivi.api.generator.baseapi.BaseApiNameRules;
import com.here.ivi.api.generator.legacy.LegacyNameRules;
import com.here.ivi.api.generator.common.AbstractGeneratorSuite;
import com.here.ivi.api.generator.common.GeneratedFile;
import com.here.ivi.api.generator.common.Version;
import com.here.ivi.api.loader.FrancaModelLoader;
import com.here.ivi.api.loader.SpecAccessorFactory;
import com.here.ivi.api.loader.legacy.LegacySpecAccessorFactory;
import com.here.ivi.api.model.FrancaModel;
import com.here.ivi.api.model.ModelHelper;
import com.here.ivi.api.model.cppmodel.CppIncludeResolver;
import com.here.ivi.api.model.cppmodel.CppModelAccessor;
import com.here.ivi.api.validator.legacy.LegacyModelValidator;
import com.here.ivi.api.validator.common.ResourceValidator;
import java.io.File;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import navigation.LegacySpec.InterfacePropertyAccessor;
import navigation.LegacySpec.TypeCollectionPropertyAccessor;

public class ConverterGeneratorSuite extends AbstractGeneratorSuite {

  private final SpecAccessorFactory<InterfacePropertyAccessor, TypeCollectionPropertyAccessor>
      specAccessorFactory;
  private final LegacyModelValidator validator = new LegacyModelValidator();
  private FrancaModel<InterfacePropertyAccessor, TypeCollectionPropertyAccessor> model;
  private FrancaModelLoader<InterfacePropertyAccessor, TypeCollectionPropertyAccessor>
      francaModelLoader;
  private Collection<File> currentFiles;

  public ConverterGeneratorSuite(Transpiler transpiler) {
    super(transpiler);
    specAccessorFactory = new LegacySpecAccessorFactory();
  }

  @Override
  public Version getVersion() {
    return new Version(0, 0, 1);
  }

  @Override
  public String getName() {
    return "com.here.ConverterGenerator";
  }

  @Override
  public String getSpecPath() {
    return specAccessorFactory.getSpecPath();
  }

  @Override
  public List<GeneratedFile> generateFiles() {

    //we need to inject root models namespace
    LegacyNameRules nameRulesFirst =
        new LegacyNameRules() {
          public List<String> getNamespace(CppModelAccessor<?> modelAccessor) {
            List<String> result = new LinkedList<>();
            result.add(ConverterGenerator.conversionNamespaceName);
            return result;
          }
        };

    BaseApiNameRules nameRulesSecond =
        new BaseApiNameRules() {
          public List<String> getNamespace(CppModelAccessor<?> modelAccessor) {
            List<String> result = new LinkedList<>();
            result.add(ConverterGenerator.conversionNamespaceName);
            return result;
          }
        };

    CppIncludeResolver includeResolver = new CppIncludeResolver(model);

    ConverterGenerator converterGenerator =
        new ConverterGenerator(this, nameRulesFirst, nameRulesSecond, model, includeResolver);

    // partition model into interfaces, type-collections and structWithMethods and generate files from that
    Stream<GeneratedFile> generatorStreams =
        model.getTypeCollections().stream().map(converterGenerator::generate);

    return generatorStreams.filter(Objects::nonNull).collect(Collectors.toList());
  }

  @Override
  public void buildModel(String inputPath) {
    // load model
    francaModelLoader = new FrancaModelLoader<>(specAccessorFactory);

    ModelHelper.getFdeplInjector().injectMembers(francaModelLoader);
    currentFiles = FrancaModelLoader.listFilesRecursively(new File(inputPath));
    model = francaModelLoader.load(specAccessorFactory.getSpecPath(), currentFiles);
  }

  @Override
  public boolean validate() {
    ResourceValidator resourceValidator =
        new ResourceValidator(francaModelLoader.getResourceSetProvider().get());
    return resourceValidator.validate(currentFiles) && validator.validate(model);
  }
}
