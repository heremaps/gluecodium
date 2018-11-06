/*
 * Copyright (C) 2016-2018 HERE Europe B.V.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
 * License-Filename: LICENSE
 */

package com.here.genium.generator.cpp;

import com.here.genium.generator.common.GeneratedFile;
import com.here.genium.generator.common.templates.TemplateEngine;
import com.here.genium.model.common.Include;
import com.here.genium.model.cpp.CppFile;
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

    String absoluteHeaderPath =
        Paths.get(pathPrefix, CppNameRules.PACKAGE_NAME_SPECIFIER_INCLUDE, relativeHeaderPath)
                .toString()
            + CppNameRules.HEADER_FILE_SUFFIX;
    String absoluteImplPath =
        Paths.get(pathPrefix, CppNameRules.PACKAGE_NAME_SPECIFIER_SRC, relativeImplPath).toString()
            + CppNameRules.IMPLEMENTATION_FILE_SUFFIX;

    // Filter out self-includes
    cppModel.includes.removeIf(
        include ->
            include.getFileName().equals(relativeHeaderPath + CppNameRules.HEADER_FILE_SUFFIX));

    List<GeneratedFile> result = new LinkedList<>();
    String headerContent = TemplateEngine.render("cpp/CppHeader", cppModel);
    result.add(new GeneratedFile(headerContent, absoluteHeaderPath));

    cppModel.headerInclude =
        Include.Companion.createInternalInclude(
            relativeHeaderPath + CppNameRules.HEADER_FILE_SUFFIX);

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
