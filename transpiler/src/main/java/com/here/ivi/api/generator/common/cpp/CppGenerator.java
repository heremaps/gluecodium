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

package com.here.ivi.api.generator.common.cpp;

import com.here.ivi.api.generator.common.GeneratedFile;
import com.here.ivi.api.generator.common.cpp.templates.CppCommentHeaderTemplate;
import com.here.ivi.api.generator.common.cpp.templates.CppDelegatorTemplate;
import com.here.ivi.api.model.cppmodel.CppIncludeResolver;
import com.here.ivi.api.model.cppmodel.CppNamespace;

public class CppGenerator {

  private final CppIncludeResolver includeResolver;

  public CppGenerator(CppIncludeResolver includeResolver) {
    this.includeResolver = includeResolver;
  }

  public GeneratedFile generateCode(
      CppNamespace cppModel, String outputFileName, CharSequence copyrightNotice) {

    if (cppModel == null || cppModel.isEmpty()) {
      return null;
    }

    // find included files and resolve relative to generated path
    includeResolver.resolveLazyIncludes(cppModel, outputFileName);

    CharSequence headerContent = CppCommentHeaderTemplate.generate(copyrightNotice);
    CharSequence innerContent = CppDelegatorTemplate.generate(new CppTemplateDelegator(), cppModel);

    return new GeneratedFile(headerContent.toString() + innerContent.toString(), outputFileName);
  }
}
