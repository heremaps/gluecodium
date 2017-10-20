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

import com.here.ivi.api.common.CollectionsHelper;
import com.here.ivi.api.generator.common.GeneratedFile;
import com.here.ivi.api.generator.common.TemplateEngine;
import com.here.ivi.api.model.cppmodel.CppClass;
import com.here.ivi.api.model.cppmodel.CppFile;
import java.io.File;
import java.util.*;

public class CppGenerator {

  public List<GeneratedFile> generateCode(
      final CppFile cppModel, final String outputFilePath, final String pathPrefix) {

    if (cppModel == null || cppModel.isEmpty()) {
      return Collections.emptyList();
    }

    String headerIncludePath = outputFilePath + CppNameRules.HEADER_FILE_SUFFIX;
    String headerOutputFilePath = pathPrefix + File.separator + headerIncludePath;
    String implementationOutputFilePath =
        pathPrefix + File.separator + outputFilePath + CppNameRules.IMPLEMENTATION_FILE_SUFFIX;

    // Filter out self-includes
    cppModel.includes.removeIf(include -> include.fileName.equals(headerIncludePath));

    String commentHeader = TemplateEngine.render("cpp/CppCommentHeader", null);

    List<GeneratedFile> result = new LinkedList<>();
    String headerContent = TemplateEngine.render("cpp/CppHeader", cppModel);
    result.add(new GeneratedFile(commentHeader + headerContent, headerOutputFilePath));

    boolean hasInstantiableClasses =
        CollectionsHelper.getStreamOfType(cppModel.members, CppClass.class)
            .anyMatch(CppClass::hasInstanceMethods);
    if (hasInstantiableClasses) {
      String headerInclude = "\n#include \"" + headerIncludePath + "\"";
      String implementationContent = TemplateEngine.render("cpp/CppImplementation", cppModel);
      result.add(
          new GeneratedFile(
              commentHeader + headerInclude + implementationContent, implementationOutputFilePath));
    }

    return result;
  }
}
