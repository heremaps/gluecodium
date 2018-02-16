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

package com.here.ivi.api.platform.swift;

import static java.util.stream.Collectors.toList;

import com.here.ivi.api.cli.OptionReader;
import com.here.ivi.api.generator.cbridge.CBridgeGenerator;
import com.here.ivi.api.generator.common.GeneratedFile;
import com.here.ivi.api.generator.swift.SwiftGenerator;
import com.here.ivi.api.model.cbridge.IncludeResolver;
import com.here.ivi.api.model.franca.FrancaDeploymentModel;
import com.here.ivi.api.platform.common.GeneratorSuite;
import java.util.List;
import java.util.Objects;
import java.util.function.Function;
import java.util.stream.Stream;
import org.franca.core.franca.FTypeCollection;

/**
 * Combines {@link SwiftGenerator} and {@link CBridgeGenerator} to generate Swift bindings on top of
 * BaseAPI.
 *
 * <p>The bindings are used to build a framework for iOS, Mac and a Swift module for Linux.
 */
public final class SwiftGeneratorSuite extends GeneratorSuite {

  public static final String GENERATOR_NAME = "swift";

  private final String internalNamespace;

  public SwiftGeneratorSuite(final OptionReader.TranspilerOptions transpilerOptions) {
    super();
    internalNamespace =
        transpilerOptions != null ? transpilerOptions.getCppInternalNamespace() : null;
  }

  @Override
  public List<GeneratedFile> generate(
      final FrancaDeploymentModel deploymentModel, final List<FTypeCollection> typeCollections) {

    SwiftGenerator swiftGenerator = new SwiftGenerator(deploymentModel);
    CBridgeGenerator cBridgeGenerator =
        new CBridgeGenerator(deploymentModel, new IncludeResolver(), internalNamespace);

    Stream<GeneratedFile> swiftStream = typeCollections.stream().map(swiftGenerator::generate);
    Stream<GeneratedFile> cBridgeStream =
        typeCollections.stream().map(cBridgeGenerator::generate).flatMap(Function.identity());

    List<GeneratedFile> result = Stream.concat(swiftStream, cBridgeStream).collect(toList());
    result.addAll(CBridgeGenerator.STATIC_FILES);
    result.addAll(SwiftGenerator.STATIC_FILES);
    result.addAll(cBridgeGenerator.arrayGenerator.generate());
    result.addAll(swiftGenerator.arrayGenerator.generate());
    result.add(swiftGenerator.generateErrors());

    return result.stream().filter(Objects::nonNull).collect(toList());
  }

  @Override
  public String getName() {
    return "com.here.SwiftGenerator";
  }
}
