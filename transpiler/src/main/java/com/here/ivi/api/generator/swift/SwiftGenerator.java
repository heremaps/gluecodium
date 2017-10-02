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

import static java.util.Collections.emptyList;
import static java.util.Collections.singletonList;

import com.google.common.annotations.VisibleForTesting;
import com.here.ivi.api.generator.cbridge.CBridgeNameRules;
import com.here.ivi.api.generator.common.FrancaTreeWalker;
import com.here.ivi.api.generator.common.GeneratedFile;
import com.here.ivi.api.generator.common.GeneratorSuite;
import com.here.ivi.api.generator.common.TemplateEngine;
import com.here.ivi.api.model.franca.FrancaElement;
import com.here.ivi.api.model.swift.SwiftFile;
import java.util.*;
import java.util.stream.Collectors;

public class SwiftGenerator {

  @VisibleForTesting
  static final List<String> STATIC_FILES = Arrays.asList("swift/RefHolder.swift");

  private final CBridgeNameRules cBridgeNameRules;
  private final Set<String> modules = new HashSet<>();

  public SwiftGenerator(CBridgeNameRules bridgeNameRules) {
    cBridgeNameRules = bridgeNameRules;
  }

  public List<GeneratedFile> generate(FrancaElement francaElement) {
    SwiftFile file = buildSwiftModel(francaElement);
    if (file.isEmpty()) {
      return emptyList();
    } else {
      List<GeneratedFile> generated = new ArrayList<>();
      String moduleName =
          francaElement.getPackageNames().isEmpty()
              ? ""
              : francaElement.getPackageNames().get(0) + "/";
      if (!modules.contains(moduleName)) {
        modules.add(moduleName);
        generated.addAll(
            STATIC_FILES
                .stream()
                .map(
                    staticFile ->
                        GeneratorSuite.copyTarget(
                            staticFile, SwiftNameRules.TARGET_DIRECTORY + moduleName))
                .collect(Collectors.toList()));
      }
      generated.add(
          new GeneratedFile(
              TemplateEngine.render("swift/File", file),
              SwiftNameRules.getImplementationFileName(francaElement)));
      return generated;
    }
  }

  protected SwiftFile buildSwiftModel(FrancaElement francaElement) {
    SwiftModelBuilder modelBuilder = new SwiftModelBuilder(francaElement, cBridgeNameRules);
    FrancaTreeWalker treeWalker = new FrancaTreeWalker(singletonList(modelBuilder));

    treeWalker.walk(francaElement);

    return modelBuilder.getFirstResult(SwiftFile.class);
  }
}
