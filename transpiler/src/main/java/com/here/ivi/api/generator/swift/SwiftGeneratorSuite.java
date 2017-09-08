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
import java.util.Collection;
import java.util.List;
import java.util.Objects;
import java.util.stream.Stream;

public final class SwiftGeneratorSuite extends GeneratorSuite {
  public static final String GENERATOR_NAME = "swift";

  public SwiftGeneratorSuite() {
    super(new FrancaModelLoader());
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
    cBridgeStream = concat(cBridgeStream, CBridgeGenerator.STATIC_FILES.stream());

    return concat(swiftStream, cBridgeStream).filter(Objects::nonNull).collect(toList());
  }

  @Override
  public String getName() {
    return "com.here.SwiftGenerator";
  }
}
