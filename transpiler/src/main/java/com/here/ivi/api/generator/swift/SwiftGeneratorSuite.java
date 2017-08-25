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

package com.here.ivi.api.generator.swift;

import static java.util.stream.Collectors.toList;
import static java.util.stream.Stream.concat;

import com.here.ivi.api.generator.cbridge.CBridgeGenerator;
import com.here.ivi.api.generator.cbridge.CBridgeNameRules;
import com.here.ivi.api.generator.common.GeneratedFile;
import com.here.ivi.api.generator.common.GeneratorSuite;
import com.here.ivi.api.loader.FrancaModelLoader;
import com.here.ivi.api.loader.baseapi.BaseApiSpecAccessorFactory;
import com.here.ivi.api.model.franca.FrancaModel;
import com.here.ivi.api.model.franca.ModelHelper;
import com.here.ivi.api.validator.common.ResourceValidator;
import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Objects;
import java.util.stream.Stream;
import navigation.BaseApiSpec;
import org.eclipse.emf.ecore.resource.ResourceSet;

public final class SwiftGeneratorSuite implements GeneratorSuite {
  // TODO: APIGEN-173 - Deal with multiple deployment specificiations and use different accessor factory
  private final BaseApiSpecAccessorFactory specAccessorFactory;
  private FrancaModel<
          BaseApiSpec.InterfacePropertyAccessor, BaseApiSpec.TypeCollectionPropertyAccessor>
      model;
  private final FrancaModelLoader<
          BaseApiSpec.InterfacePropertyAccessor, BaseApiSpec.TypeCollectionPropertyAccessor>
      modelLoader;
  private Collection<File> currentFiles;

  public SwiftGeneratorSuite() {
    specAccessorFactory = new BaseApiSpecAccessorFactory();
    modelLoader = new FrancaModelLoader<>(specAccessorFactory);
    currentFiles = new ArrayList<>();
  }

  @Override
  public List<GeneratedFile> generate() {
    SwiftNameRules swiftNameRules = new SwiftNameRules();
    CBridgeNameRules cBridgeNameRules = new CBridgeNameRules();

    // TODO: APIGEN-108 Add all other possible generators and call them here

    SwiftGenerator swiftGenerator = new SwiftGenerator(swiftNameRules);
    CBridgeGenerator cBridgeGenerator = new CBridgeGenerator(cBridgeNameRules);

    Stream<GeneratedFile> swiftStream =
        model.getInterfaces().stream().map(swiftGenerator::generate).flatMap(Collection::stream);
    Stream<GeneratedFile> cBridgeStream =
        model.getInterfaces().stream().map(cBridgeGenerator::generate).flatMap(Collection::stream);
    cBridgeStream = concat(cBridgeStream, cBridgeGenerator.STATIC_FILES.stream());

    return concat(swiftStream, cBridgeStream).filter(Objects::nonNull).collect(toList());
  }

  @Override
  public String getSpecPath() {
    return specAccessorFactory.getSpecPath();
  }

  @Override
  public String getName() {
    return "com.here.SwiftGenerator";
  }

  @Override
  public boolean validate() {
    ResourceSet resourceSet = modelLoader.getResourceSetProvider().get();
    return ResourceValidator.validate(resourceSet, currentFiles);
  }

  @Override
  public void buildModel(String inputPath) {
    ModelHelper.getFdeplInjector().injectMembers(modelLoader);
    currentFiles = FrancaModelLoader.listFilesRecursively(new File(inputPath));
    model = modelLoader.load(specAccessorFactory.getSpecPath(), currentFiles);
  }
}
