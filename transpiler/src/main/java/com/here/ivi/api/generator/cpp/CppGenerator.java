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
import com.here.ivi.api.model.cppmodel.CppNamespace;
import java.util.HashMap;
import java.util.Map;

public class CppGenerator {

  public GeneratedFile generateCode(
      CppNamespace cppModel, String outputFileName, CharSequence copyrightNotice) {

    if (cppModel == null || cppModel.isEmpty()) {
      return null;
    }

    // Filter out self-includes
    cppModel.includes.removeIf(include -> include.fileName.equals(outputFileName));

    String commentHeader = generateCommentHeader(copyrightNotice);
    String mainContent = TemplateEngine.render("cpp/CppNamespace", cppModel);

    return new GeneratedFile(commentHeader + mainContent, outputFileName);
  }

  private static String generateCommentHeader(final CharSequence generatorNotice) {

    Map<String, Object> dataObject = new HashMap<>();
    dataObject.put("generatorNotice", generatorNotice);
    return TemplateEngine.render("cpp/CppCommentHeader", dataObject);
  }
}
