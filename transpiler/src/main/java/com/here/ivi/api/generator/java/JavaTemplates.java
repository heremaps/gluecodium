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

package com.here.ivi.api.generator.java;

import com.here.ivi.api.common.CollectionsHelper;
import com.here.ivi.api.generator.common.GeneratedFile;
import com.here.ivi.api.generator.common.TemplateEngine;
import com.here.ivi.api.model.java.*;
import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public final class JavaTemplates {

  public static List<GeneratedFile> generateFiles(final List<JavaElement> javaModel) {

    Stream<GeneratedFile> classFiles =
        CollectionsHelper.getStreamOfType(javaModel, JavaClass.class)
            .map(javaClass -> generateFileForElement("java/ClassHeader", javaClass));
    Stream<GeneratedFile> interfaceFiles =
        CollectionsHelper.getStreamOfType(javaModel, JavaInterface.class)
            .map(javaInterface -> generateFileForElement("java/Interface", javaInterface));
    Stream<GeneratedFile> enumFiles =
        CollectionsHelper.getStreamOfType(javaModel, JavaEnum.class)
            .map(javaEnum -> generateFileForElement("java/EnumHeader", javaEnum));

    return Stream.of(classFiles, interfaceFiles, enumFiles)
        .flatMap(Function.identity())
        .collect(Collectors.toList());
  }

  public static List<GeneratedFile> generateFilesForExceptions(
      final Collection<JavaExceptionClass> exceptions) {
    return exceptions
        .stream()
        .map(
            exceptionClass ->
                new GeneratedFile(
                    TemplateEngine.render("java/ExceptionDefinition", exceptionClass),
                    JavaNameRules.getFileName(exceptionClass)))
        .collect(Collectors.toList());
  }

  public static GeneratedFile generateNativeBase(
      final String fileName, final List<String> packageList) {
    String fileContent = TemplateEngine.render("java/NativeBase", packageList);
    return new GeneratedFile(fileContent, fileName);
  }

  private static GeneratedFile generateFileForElement(
      final String templateName, final JavaTopLevelElement javaElement) {

    String fileContent = TemplateEngine.render(templateName, javaElement);
    String fileName = JavaNameRules.getFileName(javaElement);

    return new GeneratedFile(fileContent, fileName);
  }
}
