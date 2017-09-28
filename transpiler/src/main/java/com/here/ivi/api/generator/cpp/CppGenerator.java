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
import java.util.*;

public class CppGenerator {

  public List<GeneratedFile> generateCode(CppFile cppModel, String outputFilePath) {

    if (cppModel == null || cppModel.isEmpty()) {
      return Collections.emptyList();
    }

    String headerFilePath = outputFilePath + CppNameRules.HEADER_FILE_SUFFIX;
    String implementationFilePath = outputFilePath + CppNameRules.IMPLEMENTATION_FILE_SUFFIX;

    // Filter out self-includes
    cppModel.includes.removeIf(include -> include.fileName.equals(headerFilePath));

    String commentHeader = TemplateEngine.render("cpp/CppCommentHeader", null);

    List<GeneratedFile> result = new LinkedList<>();
    String headerContent = TemplateEngine.render("cpp/CppHeader", cppModel);
    result.add(new GeneratedFile(commentHeader + headerContent, headerFilePath));

    boolean hasInstantiableClasses =
        CollectionsHelper.getStreamOfType(cppModel.members, CppClass.class)
            .anyMatch(CppClass::hasInstanceMethods);
    if (hasInstantiableClasses) {
      String headerInclude = "\n#include \"" + headerFilePath + "\"";
      String implementationContent = TemplateEngine.render("cpp/CppImplementation", cppModel);
      result.add(
          new GeneratedFile(
              commentHeader + headerInclude + implementationContent, implementationFilePath));
    }

    return result;
  }
}
