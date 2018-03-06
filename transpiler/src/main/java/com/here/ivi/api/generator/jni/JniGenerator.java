/*
 * Copyright (c) 2016-2018 HERE Europe B.V.
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

package com.here.ivi.api.generator.jni;

import com.here.ivi.api.generator.common.AbstractGenerator;
import com.here.ivi.api.generator.common.modelbuilder.FrancaTreeWalker;
import com.here.ivi.api.generator.cpp.CppModelBuilder;
import com.here.ivi.api.generator.cpp.CppNameRules;
import com.here.ivi.api.generator.cpp.CppTypeMapper;
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
  private final String internalNamespace;

  public JniGenerator(
      final FrancaDeploymentModel deploymentModel,
      final List<String> packageList,
      final List<String> additionalIncludes,
      final boolean enableAndroidFeatures,
      final String internalNamespace) {
    super(packageList);
    this.deploymentModel = deploymentModel;
    this.additionalIncludes = additionalIncludes;
    this.enableAndroidFeatures = enableAndroidFeatures;
    this.internalNamespace = internalNamespace;
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

    CppTypeMapper typeMapper = new CppTypeMapper(new CppIncludeResolver(), internalNamespace);
    CppModelBuilder cppBuilder = new CppModelBuilder(deploymentModel, typeMapper);
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
      includes.add(JniNameRules.getHeaderFileName(JniNameRules.getJniClassFileName(jniContainer)));
    }

    includes.addAll(additionalIncludes);

    return includes.stream().map(Include::createInternalInclude).collect(Collectors.toList());
  }
}
