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

package com.here.ivi.api.generator.android;

import static com.here.ivi.api.generator.common.jni.CorrespondenceBuilder.CorrespondenceTreeNode;
import static com.here.ivi.api.generator.common.jni.CorrespondenceBuilder.ElementPair;

import com.here.ivi.api.generator.baseapi.StubModelBuilder;
import com.here.ivi.api.generator.common.FrancaTreeWalker;
import com.here.ivi.api.generator.common.GeneratedFile;
import com.here.ivi.api.generator.common.cpp.CppNameRules;
import com.here.ivi.api.generator.common.java.JavaModelBuilder;
import com.here.ivi.api.generator.common.jni.CorrespondenceBuilder;
import com.here.ivi.api.generator.common.jni.JniNameRules;
import com.here.ivi.api.generator.common.jni.templates.JniHeaderTemplate;
import com.here.ivi.api.generator.common.jni.templates.JniImplementationTemplate;
import com.here.ivi.api.model.common.Includes;
import com.here.ivi.api.model.common.Includes.InternalPublicInclude;
import com.here.ivi.api.model.cppmodel.CppClass;
import com.here.ivi.api.model.franca.Interface;
import com.here.ivi.api.model.franca.TypeCollection;
import com.here.ivi.api.model.javamodel.JavaClass;
import com.here.ivi.api.model.javamodel.JavaPackage;
import java.util.Arrays;
import java.util.Collections;
import java.util.LinkedList;
import java.util.List;
import java.util.stream.Collectors;
import navigation.BaseApiSpec;
import navigation.BaseApiSpec.InterfacePropertyAccessor;

public class JavaNativeInterfacesGenerator {

  private final JavaPackage basePackage;
  private final List<String> additionalIncludes;

  public JavaNativeInterfacesGenerator(
      final List<String> javaPackageList, final List<String> additionalIncludes) {
    basePackage =
        javaPackageList == null || javaPackageList.isEmpty()
            ? JavaPackage.DEFAULT
            : new JavaPackage(javaPackageList);
    this.additionalIncludes = additionalIncludes;
  }

  private List<Includes.InternalPublicInclude> getIncludes(
      final Interface<InterfacePropertyAccessor> api, final JavaClass javaClass) {
    Includes.InternalPublicInclude jniHeaderInclude =
        new InternalPublicInclude(JniNameRules.getHeaderFileName(javaClass));
    Includes.InternalPublicInclude baseApiHeaderInclude =
        new InternalPublicInclude(CppNameRules.getHeaderPath(api));

    List<Includes.InternalPublicInclude> includes =
        new LinkedList<>(Arrays.asList(jniHeaderInclude, baseApiHeaderInclude));
    includes.addAll(
        additionalIncludes.stream().map(InternalPublicInclude::new).collect(Collectors.toList()));

    return includes;
  }

  public List<GeneratedFile> generateFiles(final Interface<InterfacePropertyAccessor> anInterface) {

    JavaModelBuilder javaBuilder =
        new JavaModelBuilder(basePackage.createChildPackage(anInterface.getPackage()), anInterface);

    StubModelBuilder stubBuilder = new StubModelBuilder(anInterface);
    CorrespondenceBuilder jniBuilder = new CorrespondenceBuilder(javaBuilder, stubBuilder);

    FrancaTreeWalker treeWalker =
        new FrancaTreeWalker(Arrays.asList(javaBuilder, stubBuilder, jniBuilder));
    treeWalker.walk(anInterface);

    CorrespondenceTreeNode correspondenceTree = jniBuilder.getResults().get(0);
    //convert data for template
    JavaClass javaClass = (JavaClass) correspondenceTree.elementPair.javaElement;
    CppClass stubClass = (CppClass) correspondenceTree.elementPair.stubElement;
    List<ElementPair> methodPairs = new LinkedList<>();
    for (CorrespondenceTreeNode node : correspondenceTree.children) {
      methodPairs.add(node.elementPair);
    }

    GeneratedFile jniHeader =
        new GeneratedFile(
            JniHeaderTemplate.generate(javaClass), JniNameRules.getHeaderFileName(javaClass));

    GeneratedFile jniImplementation =
        new GeneratedFile(
            JniImplementationTemplate.generate(
                javaClass, stubClass, methodPairs, getIncludes(anInterface, javaClass)),
            JniNameRules.getImplementationFileName(javaClass));

    return Arrays.asList(jniHeader, jniImplementation);
  }

  public List<GeneratedFile> generateFiles(
      TypeCollection<BaseApiSpec.TypeCollectionPropertyAccessor> typeCollection) {

    // Currently no JNI files to be generated for type collections
    return Collections.emptyList();
  }
}
