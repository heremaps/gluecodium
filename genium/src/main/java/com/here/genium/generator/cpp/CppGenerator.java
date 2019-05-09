/*
 * Copyright (C) 2016-2019 HERE Europe B.V.
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

import com.here.genium.common.CollectionsHelper;
import com.here.genium.generator.common.GeneratedFile;
import com.here.genium.generator.common.templates.TemplateEngine;
import com.here.genium.model.common.Include;
import com.here.genium.model.cpp.CppConstant;
import com.here.genium.model.cpp.CppExternableElement;
import com.here.genium.model.cpp.CppFile;
import com.here.genium.model.cpp.CppUsing;
import java.nio.file.Paths;
import java.util.*;

public final class CppGenerator {

  private final String pathPrefix;
  private final List<String> internalNamespace;

  public CppGenerator(final String pathPrefix, final List<String> internalNamespace) {
    this.pathPrefix = pathPrefix;
    this.internalNamespace = internalNamespace;
  }

  public List<GeneratedFile> generateCode(final CppFile cppModel) {
    List<GeneratedFile> result = new LinkedList<>();

    boolean hasConstants = cppModel.getMembers().stream().anyMatch(CppConstant.class::isInstance);
    boolean hasTypedefs =
        !CollectionsHelper.getAllOfType(cppModel.getMembers(), CppUsing.class).isEmpty();
    boolean hasNonExternalElements =
        !CollectionsHelper.getStreamOfType(cppModel.getMembers(), CppExternableElement.class)
            .allMatch(CppExternableElement::isExternal);
    boolean hasErrorEnums = !cppModel.getErrorEnums().isEmpty();
    boolean hasCode = hasConstants || hasNonExternalElements || hasErrorEnums || hasTypedefs;
    if (!hasCode) {
      return result;
    }

    String relativeFilePath = cppModel.getFilename();
    String absoluteHeaderPath =
        Paths.get(pathPrefix, CppNameRules.PACKAGE_NAME_SPECIFIER_INCLUDE, relativeFilePath)
                .toString()
            + CppNameRules.HEADER_FILE_SUFFIX;
    String absoluteImplPath =
        Paths.get(pathPrefix, CppNameRules.PACKAGE_NAME_SPECIFIER_SRC, relativeFilePath).toString()
            + CppNameRules.IMPLEMENTATION_FILE_SUFFIX;

    // Filter out self-includes
    TreeSet<Include> includes = cppModel.getIncludes();
    includes.removeIf(
        include ->
            include.getFileName().equals(relativeFilePath + CppNameRules.HEADER_FILE_SUFFIX));

    CppLibraryIncludes.filterIncludes(includes, internalNamespace);

    String headerContent = TemplateEngine.INSTANCE.render("cpp/CppHeader", cppModel);
    result.add(new GeneratedFile(headerContent, absoluteHeaderPath));

    cppModel.setHeaderInclude(
        Include.Companion.createInternalInclude(
            relativeFilePath + CppNameRules.HEADER_FILE_SUFFIX));

    String implementationContent =
        TemplateEngine.INSTANCE.render("cpp/CppImplementation", cppModel);
    result.add(new GeneratedFile(implementationContent, absoluteImplPath));

    return result;
  }

  public GeneratedFile generateHelperHeader(final String headerName) {
    Map<String, Object> values = new HashMap<>();
    values.put("internalNamespace", internalNamespace);
    return generateHelperHeader(headerName, values);
  }

  public GeneratedFile generateHelperHeader(final String headerName, final Object extraInfo) {
    String content = TemplateEngine.INSTANCE.render("cpp/" + headerName, extraInfo);
    String resultFileName =
        Paths.get(
                pathPrefix,
                CppNameRules.PACKAGE_NAME_SPECIFIER_INCLUDE,
                String.join("/", internalNamespace),
                headerName)
            + CppNameRules.HEADER_FILE_SUFFIX;
    return new GeneratedFile(content, resultFileName);
  }
}
