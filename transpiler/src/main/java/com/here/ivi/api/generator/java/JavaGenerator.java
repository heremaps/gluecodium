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
import com.here.ivi.api.generator.android.AbstractAndroidGenerator;
import com.here.ivi.api.generator.common.FrancaTreeWalker;
import com.here.ivi.api.generator.common.GeneratedFile;
import com.here.ivi.api.generator.common.TemplateEngine;
import com.here.ivi.api.model.franca.DefinedBy;
import com.here.ivi.api.model.franca.FrancaDeploymentModel;
import com.here.ivi.api.model.java.JavaClass;
import com.here.ivi.api.model.java.JavaEnum;
import com.here.ivi.api.model.java.JavaExceptionClass;
import com.here.ivi.api.model.java.JavaInterface;
import com.here.ivi.api.model.java.JavaTopLevelElement;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FTypeCollection;

public class JavaGenerator extends AbstractAndroidGenerator {

  private final FrancaDeploymentModel deploymentModel;
  private final Map<String, JavaExceptionClass> exceptionClasses = new HashMap<>();

  public JavaGenerator(
      final FrancaDeploymentModel deploymentModel, final List<String> packageList) {
    super(packageList);
    this.deploymentModel = deploymentModel;
  }

  public List<GeneratedFile> generateFilesForInterface(final FInterface francaInterface) {

    JavaModelBuilder modelBuilder =
        new JavaModelBuilder(
            deploymentModel,
            basePackage.createChildPackage(DefinedBy.getPackages(francaInterface)),
            new JavaTypeMapper(basePackage));
    FrancaTreeWalker treeWalker = new FrancaTreeWalker(Collections.singletonList(modelBuilder));

    treeWalker.walkTree(francaInterface);

    List<GeneratedFile> results = new LinkedList<>();

    JavaClass javaClass = modelBuilder.getFinalResult(JavaClass.class);
    results.add(generateFileForElement("java/ClassHeader", javaClass));

    JavaInterface javaInterface = modelBuilder.getFinalResult(JavaInterface.class);
    if (javaInterface != null) {
      results.add(generateFileForElement("java/Interface", javaInterface));
    }

    exceptionClasses.putAll(modelBuilder.exceptionClasses);

    return results;
  }

  public List<GeneratedFile> generateFiles(final FTypeCollection francaTypeCollection) {

    JavaModelBuilder modelBuilder =
        new JavaModelBuilder(
            deploymentModel,
            basePackage.createChildPackage(DefinedBy.getPackages(francaTypeCollection)),
            new JavaTypeMapper(basePackage));
    FrancaTreeWalker treeWalker = new FrancaTreeWalker(Collections.singletonList(modelBuilder));

    treeWalker.walkTree(francaTypeCollection);

    return Stream.concat(
            CollectionsHelper.getStreamOfType(modelBuilder.getFinalResults(), JavaClass.class)
                .map(javaClass -> generateFileForElement("java/ClassHeader", javaClass)),
            CollectionsHelper.getStreamOfType(modelBuilder.getFinalResults(), JavaEnum.class)
                .map(javaEnum -> generateFileForElement("java/EnumHeader", javaEnum)))
        .collect(Collectors.toList());
  }

  public List<GeneratedFile> generateFilesForExceptions() {
    return exceptionClasses
        .entrySet()
        .stream()
        .map(
            exceptionEntry ->
                new GeneratedFile(
                    TemplateEngine.render("java/ExceptionDefinition", exceptionEntry.getValue()),
                    JavaNameRules.getFileName(exceptionEntry.getValue())))
        .collect(Collectors.toList());
  }

  private static GeneratedFile generateFileForElement(
      final String templateName, final JavaTopLevelElement javaElement) {

    String fileContent = TemplateEngine.render(templateName, javaElement);
    String fileName = JavaNameRules.getFileName(javaElement);

    return new GeneratedFile(fileContent, fileName);
  }
}
