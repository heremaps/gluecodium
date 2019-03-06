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

package com.here.genium.generator.java;

import com.here.genium.common.CollectionsHelper;
import com.here.genium.generator.common.GeneratedFile;
import com.here.genium.generator.common.templates.TemplateEngine;
import com.here.genium.model.java.*;
import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public final class JavaTemplates {

  private final JavaNameRules javaNameRules;

  public JavaTemplates(final String generatorName) {
    this.javaNameRules = new JavaNameRules(generatorName);
  }

  public List<GeneratedFile> generateFiles(final List<JavaElement> javaModel) {

    Stream<GeneratedFile> classFiles =
        CollectionsHelper.getStreamOfType(javaModel, JavaClass.class)
            .map(javaClass -> generateFileForElement("java/ClassHeader", javaClass));
    Stream<GeneratedFile> interfaceFiles =
        CollectionsHelper.getStreamOfType(javaModel, JavaInterface.class)
            .map(javaInterface -> generateFileForElement("java/Interface", javaInterface));
    Stream<GeneratedFile> enumFiles =
        CollectionsHelper.getStreamOfType(javaModel, JavaEnum.class)
            .map(javaEnum -> generateFileForElement("java/EnumHeader", javaEnum));
    Stream<GeneratedFile> exceptionFiles =
        CollectionsHelper.getStreamOfType(javaModel, JavaExceptionClass.class)
            .map(javaException -> generateFileForElement("java/ExceptionFile", javaException));

    return Stream.of(classFiles, interfaceFiles, enumFiles, exceptionFiles)
        .flatMap(Function.identity())
        .collect(Collectors.toList());
  }

  public static GeneratedFile generateNativeBase(
      final String fileName, final List<String> packageList) {
    String fileContent = TemplateEngine.INSTANCE.render("java/NativeBase", packageList);
    return new GeneratedFile(fileContent, fileName);
  }

  private GeneratedFile generateFileForElement(
      final String templateName, final JavaTopLevelElement javaElement) {

    String fileContent = TemplateEngine.INSTANCE.render(templateName, javaElement);
    String fileName = javaNameRules.getFileName(javaElement);

    return new GeneratedFile(fileContent, fileName);
  }
}
