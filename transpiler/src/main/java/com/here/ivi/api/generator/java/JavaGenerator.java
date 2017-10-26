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
import com.here.ivi.api.model.franca.FrancaDeploymentModel;
import com.here.ivi.api.model.franca.FrancaElement;
import com.here.ivi.api.model.javamodel.JavaClass;
import com.here.ivi.api.model.javamodel.JavaEnum;
import com.here.ivi.api.model.javamodel.JavaInterface;
import com.here.ivi.api.model.javamodel.JavaTopLevelElement;
import java.util.Collections;
import java.util.LinkedList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class JavaGenerator extends AbstractAndroidGenerator {

  private final FrancaDeploymentModel deploymentModel;

  public JavaGenerator(
      final FrancaDeploymentModel deploymentModel, final List<String> packageList) {
    super(packageList);
    this.deploymentModel = deploymentModel;
  }

  public List<GeneratedFile> generateFilesForInterface(final FrancaElement anInterface) {

    JavaModelBuilder modelBuilder =
        new JavaModelBuilder(
            deploymentModel,
            basePackage.createChildPackage(anInterface.getPackageNames()),
            new JavaTypeMapper(basePackage));
    FrancaTreeWalker treeWalker = new FrancaTreeWalker(Collections.singletonList(modelBuilder));

    treeWalker.walk(anInterface);

    List<GeneratedFile> results = new LinkedList<>();

    JavaClass javaClass = modelBuilder.getFinalResult(JavaClass.class);
    results.add(generateFileForElement("java/ClassHeader", javaClass));

    JavaInterface javaInterface = modelBuilder.getFinalResult(JavaInterface.class);
    if (javaInterface != null) {
      results.add(generateFileForElement("java/Interface", javaInterface));
    }

    return results;
  }

  public List<GeneratedFile> generateFiles(final FrancaElement typeCollection) {

    JavaModelBuilder modelBuilder =
        new JavaModelBuilder(
            deploymentModel,
            basePackage.createChildPackage(typeCollection.getPackageNames()),
            new JavaTypeMapper(basePackage));
    FrancaTreeWalker treeWalker = new FrancaTreeWalker(Collections.singletonList(modelBuilder));

    treeWalker.walk(typeCollection);

    return Stream.concat(
            CollectionsHelper.getStreamOfType(modelBuilder.getFinalResults(), JavaClass.class)
                .map(javaClass -> generateFileForElement("java/ClassHeader", javaClass)),
            CollectionsHelper.getStreamOfType(modelBuilder.getFinalResults(), JavaEnum.class)
                .map(javaEnum -> generateFileForElement("java/EnumHeader", javaEnum)))
        .collect(Collectors.toList());
  }

  private static GeneratedFile generateFileForElement(
      final String templateName, final JavaTopLevelElement javaElement) {

    String fileContent = TemplateEngine.render(templateName, javaElement);
    String fileName = JavaNameRules.getFileName(javaElement);

    return new GeneratedFile(fileContent, fileName);
  }
}
