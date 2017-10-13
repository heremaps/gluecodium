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

package com.here.ivi.api.generator.cbridge;

import com.here.ivi.api.generator.common.FrancaTreeWalker;
import com.here.ivi.api.generator.common.GeneratedFile;
import com.here.ivi.api.generator.common.GeneratorSuite;
import com.here.ivi.api.generator.common.TemplateEngine;
import com.here.ivi.api.model.cmodel.CInterface;
import com.here.ivi.api.model.cmodel.IncludeResolver;
import com.here.ivi.api.model.common.Include;
import com.here.ivi.api.model.franca.FrancaElement;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

public class CBridgeGenerator {
  private final IncludeResolver resolver;

  public static final List<GeneratedFile> STATIC_FILES =
      Arrays.asList(
          GeneratorSuite.copyTarget("cbridge/StringHandle.h", ""),
          GeneratorSuite.copyTarget("cbridge/StringHandle.cpp", ""),
          GeneratorSuite.copyTarget("cbridge_internal/StringHandleImpl.h", ""),
          GeneratorSuite.copyTarget("cbridge/ByteArrayHandle.h", ""),
          GeneratorSuite.copyTarget("cbridge/ByteArrayHandle.cpp", ""),
          GeneratorSuite.copyTarget("cbridge_internal/ByteArrayHandleImpl.h", ""));

  public CBridgeGenerator(IncludeResolver includeResolver) {
    this.resolver = includeResolver;
  }

  public List<GeneratedFile> generate(FrancaElement francaElement) {
    CInterface cModel = buildCBridgeModel(francaElement);
    return Arrays.asList(
            new GeneratedFile(
                generatePrivateHeaderContent(cModel),
                CBridgeNameRules.getPrivateHeaderFileNameWithPath(francaElement)),
            new GeneratedFile(
                generateHeaderContent(cModel),
                CBridgeNameRules.getHeaderFileNameWithPath(francaElement)),
            new GeneratedFile(
                generateImplementationContent(cModel),
                CBridgeNameRules.getImplementationFileNameWithPath(francaElement)))
        .stream()
        .filter(file -> file.content.length() > 0)
        .collect(Collectors.toList());
  }

  public static String generatePrivateHeaderContent(CInterface model) {
    return model.hasPrivateHeaderContent()
        ? generateFileHeader() + TemplateEngine.render("cbridge/PrivateHeader", model)
        : "";
  }

  public static String generateHeaderContent(CInterface model) {
    return generateFileHeader() + TemplateEngine.render("cbridge/Header", model);
  }

  public static String generateImplementationContent(CInterface model) {
    return generateFileHeader() + TemplateEngine.render("cbridge/Implementation", model);
  }

  private static String generateFileHeader() {
    return TemplateEngine.render("cbridge/FileHeader", null);
  }

  public CInterface buildCBridgeModel(FrancaElement francaElement) {
    CModelBuilder modelBuilder = new CModelBuilder(francaElement, resolver);
    FrancaTreeWalker treeWalker = new FrancaTreeWalker(Collections.singletonList(modelBuilder));

    treeWalker.walk(francaElement);
    CInterface cModel = modelBuilder.getFinalResult(CInterface.class);

    removeRedundantIncludes(francaElement, cModel);
    return cModel;
  }

  private void removeRedundantIncludes(FrancaElement francaElement, CInterface cModel) {
    cModel.privateHeaderIncludes.remove(
        Include.createInternalInclude(
            CBridgeNameRules.getPrivateHeaderFileNameWithPath(francaElement)));
    cModel.headerIncludes.remove(
        Include.createInternalInclude(CBridgeNameRules.getHeaderFileNameWithPath(francaElement)));
    cModel.implementationIncludes.removeAll(cModel.headerIncludes);
    cModel.privateHeaderIncludes.removeAll(cModel.headerIncludes);
  }
}
