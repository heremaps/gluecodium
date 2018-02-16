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

package com.here.ivi.api.generator.cpp;

import com.here.ivi.api.generator.common.GeneratedFile;
import com.here.ivi.api.generator.common.TemplateEngine;
import com.here.ivi.api.model.common.Include;
import com.here.ivi.api.model.cpp.CppFile;
import java.nio.file.Paths;
import java.util.*;

public final class CppGenerator {

  private final String pathPrefix;
  private final String internalNamespace;

  public CppGenerator(final String pathPrefix, final String internalNamespace) {
    this.pathPrefix = pathPrefix;
    this.internalNamespace = internalNamespace;
  }

  public List<GeneratedFile> generateCode(
      final CppFile cppModel, final String relativeHeaderPath, final String relativeImplPath) {

    if (cppModel == null || cppModel.isEmpty()) {
      return Collections.emptyList();
    }

    String absoluteHeaderPath =
        Paths.get(pathPrefix, CppNameRules.PACKAGE_NAME_SPECIFIER_INCLUDE, relativeHeaderPath)
                .toString()
            + CppNameRules.HEADER_FILE_SUFFIX;
    String absoluteImplPath =
        Paths.get(pathPrefix, CppNameRules.PACKAGE_NAME_SPECIFIER_SRC, relativeImplPath).toString()
            + CppNameRules.IMPLEMENTATION_FILE_SUFFIX;

    // Filter out self-includes
    cppModel.includes.removeIf(
        include -> include.fileName.equals(relativeHeaderPath + CppNameRules.HEADER_FILE_SUFFIX));

    List<GeneratedFile> result = new LinkedList<>();
    String headerContent = TemplateEngine.render("cpp/CppHeader", cppModel);
    result.add(new GeneratedFile(headerContent, absoluteHeaderPath));

    cppModel.headerInclude =
        Include.createInternalInclude(relativeHeaderPath + CppNameRules.HEADER_FILE_SUFFIX);

    String implementationContent = TemplateEngine.render("cpp/CppImplementation", cppModel);
    result.add(new GeneratedFile(implementationContent, absoluteImplPath));

    return result;
  }

  public GeneratedFile generateHelperHeader(final String headerName) {
    String content = TemplateEngine.render("cpp/" + headerName, internalNamespace);
    String resultFileName =
        Paths.get(pathPrefix, CppNameRules.PACKAGE_NAME_SPECIFIER_INCLUDE, headerName)
            + CppNameRules.HEADER_FILE_SUFFIX;
    return new GeneratedFile(content, resultFileName);
  }
}
