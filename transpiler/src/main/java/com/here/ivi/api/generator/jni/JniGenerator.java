/*
 * Copyright (C) 2018 HERE Global B.V. and its affiliate(s). All rights reserved.
 *
 * This software, including documentation, is protected by copyright controlled by
 * HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
 * adapting or translating, any or all of this material requires the prior written
 * consent of HERE Global B.V. This material also contains confidential information,
 * which may not be disclosed to others without prior written consent of HERE Global B.V.
 *
 */

package com.here.ivi.api.generator.jni;

import com.here.ivi.api.generator.common.AbstractGenerator;
import com.here.ivi.api.generator.common.modelbuilder.FrancaTreeWalker;
import com.here.ivi.api.generator.cpp.CppModelBuilder;
import com.here.ivi.api.generator.cpp.CppNameRules;
import com.here.ivi.api.generator.java.JavaModelBuilder;
import com.here.ivi.api.generator.java.JavaTypeMapper;
import com.here.ivi.api.model.common.Include;
import com.here.ivi.api.model.common.ModelElement;
import com.here.ivi.api.model.cpp.CppIncludeResolver;
import com.here.ivi.api.model.franca.DefinedBy;
import com.here.ivi.api.model.franca.FrancaDeploymentModel;
import com.here.ivi.api.model.java.*;
import com.here.ivi.api.model.jni.JniContainer;
import java.util.*;
import java.util.stream.Collectors;
import org.franca.core.franca.FTypeCollection;

public final class JniGenerator extends AbstractGenerator {

  private static final JavaPackage ANDROID_OS_PACKAGE =
      new JavaPackage(Arrays.asList("android", "os"));
  private static final JavaType PARCELABLE =
      JavaCustomType.builder("Parcelable")
          .packageNames(ANDROID_OS_PACKAGE.packageNames)
          .javaImport(new JavaImport("Parcelable", ANDROID_OS_PACKAGE))
          .javaImport(new JavaImport("Parcel", ANDROID_OS_PACKAGE))
          .build();

  private final FrancaDeploymentModel deploymentModel;
  private final List<String> additionalIncludes;
  private final boolean enableAndroidFeatures;

  public JniGenerator(
      final FrancaDeploymentModel deploymentModel,
      final List<String> packageList,
      final List<String> additionalIncludes,
      final boolean enableAndroidFeatures) {
    super(packageList);
    this.deploymentModel = deploymentModel;
    this.additionalIncludes = additionalIncludes;
    this.enableAndroidFeatures = enableAndroidFeatures;
  }

  public Collection<ModelElement> generateModel(
      final FTypeCollection francaTypeCollection,
      final Map<String, JavaExceptionClass> exceptionsCollector) {

    JavaPackage basePackage = new JavaPackage(basePackages);
    JavaModelBuilder javaBuilder =
        new JavaModelBuilder(
            deploymentModel,
            basePackage.createChildPackage(DefinedBy.getPackages(francaTypeCollection)),
            new JavaTypeMapper(basePackage, enableAndroidFeatures ? PARCELABLE : null));

    CppModelBuilder cppBuilder = new CppModelBuilder(deploymentModel, new CppIncludeResolver());
    JniModelBuilder jniBuilder = new JniModelBuilder(deploymentModel, javaBuilder, cppBuilder);

    FrancaTreeWalker treeWalker =
        new FrancaTreeWalker(Arrays.asList(javaBuilder, cppBuilder, jniBuilder));
    treeWalker.walkTree(francaTypeCollection);

    JniContainer jniContainer = jniBuilder.getFinalResult(JniContainer.class);
    jniContainer.includes.addAll(getIncludes(francaTypeCollection, jniContainer));

    exceptionsCollector.putAll(javaBuilder.exceptionClasses);

    List<ModelElement> results = new LinkedList<>(javaBuilder.getFinalResults());
    results.add(jniContainer);

    return results;
  }

  private List<Include> getIncludes(
      final FTypeCollection francaTypeCollection, final JniContainer jniContainer) {

    String baseApiHeaderInclude = CppNameRules.getHeaderPath(francaTypeCollection);

    List<String> includes = new LinkedList<>(Collections.singletonList(baseApiHeaderInclude));
    if (jniContainer.isFrancaInterface) {
      includes.add(JniNameRules.getHeaderFileName(jniContainer));
    }

    includes.addAll(additionalIncludes);

    return includes.stream().map(Include::createInternalInclude).collect(Collectors.toList());
  }
}
