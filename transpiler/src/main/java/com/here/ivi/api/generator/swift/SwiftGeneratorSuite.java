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

import com.here.ivi.api.generator.cbridge.CBridgeGenerator;
import com.here.ivi.api.generator.common.GeneratedFile;
import com.here.ivi.api.generator.common.GeneratorSuite;
import com.here.ivi.api.loader.FrancaModelLoader;
import com.here.ivi.api.model.cmodel.IncludeResolver;
import java.util.List;
import java.util.Objects;
import java.util.function.Function;
import java.util.stream.Stream;

public final class SwiftGeneratorSuite extends GeneratorSuite {
  public static final String GENERATOR_NAME = "swift";

  public SwiftGeneratorSuite() {
    super(new FrancaModelLoader());
  }

  @Override
  public List<GeneratedFile> generate() {

    SwiftGenerator swiftGenerator = new SwiftGenerator(deploymentModel);
    CBridgeGenerator cBridgeGenerator =
        new CBridgeGenerator(deploymentModel, new IncludeResolver());

    Stream<GeneratedFile> swiftStream = typeCollections.stream().map(swiftGenerator::generate);
    Stream<GeneratedFile> cBridgeStream =
        typeCollections.stream().map(cBridgeGenerator::generate).flatMap(Function.identity());

    List<GeneratedFile> result =
        Stream.concat(swiftStream, cBridgeStream).filter(Objects::nonNull).collect(toList());
    result.addAll(CBridgeGenerator.STATIC_FILES);
    result.addAll(SwiftGenerator.STATIC_FILES);
    result.addAll(cBridgeGenerator.arrayGenerator.generate());
    result.addAll(swiftGenerator.arrayGenerator.generate());

    return result;
  }

  @Override
  public String getName() {
    return "com.here.SwiftGenerator";
  }
}
