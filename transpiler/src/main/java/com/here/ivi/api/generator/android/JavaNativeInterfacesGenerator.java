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

import com.here.ivi.api.generator.baseapi.StubModelBuilder;
import com.here.ivi.api.generator.common.FrancaTreeWalker;
import com.here.ivi.api.generator.common.GeneratedFile;
import com.here.ivi.api.generator.common.TemplateEngine;
import com.here.ivi.api.generator.common.cpp.CppNameRules;
import com.here.ivi.api.generator.common.java.JavaModelBuilder;
import com.here.ivi.api.generator.common.jni.JniModel;
import com.here.ivi.api.generator.common.jni.JniModelBuilder;
import com.here.ivi.api.generator.common.jni.JniNameRules;
import com.here.ivi.api.generator.common.jni.JniStruct;
import com.here.ivi.api.generator.common.jni.templates.JniHeaderTemplate;
import com.here.ivi.api.generator.common.jni.templates.JniImplementationTemplate;
import com.here.ivi.api.model.common.Include;
import com.here.ivi.api.model.franca.Interface;
import com.here.ivi.api.model.franca.TypeCollection;
import com.here.ivi.api.model.javamodel.JavaClass;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.LinkedList;
import java.util.List;
import java.util.stream.Collectors;
import navigation.BaseApiSpec;

public class JavaNativeInterfacesGenerator extends AbstractAndroidGenerator {

  private final List<String> additionalIncludes;

  public JavaNativeInterfacesGenerator(
      final List<String> packageList, final List<String> additionalIncludes) {
    super(packageList);
    this.additionalIncludes = additionalIncludes;
  }

  public List<GeneratedFile> generateFiles(final Interface<?> anInterface) {

    JavaModelBuilder javaBuilder = new JavaModelBuilder(basePackage, anInterface);

    StubModelBuilder stubBuilder = new StubModelBuilder(anInterface);
    JniModelBuilder jniBuilder = new JniModelBuilder(javaBuilder, stubBuilder);

    FrancaTreeWalker treeWalker =
        new FrancaTreeWalker(Arrays.asList(javaBuilder, stubBuilder, jniBuilder));
    treeWalker.walk(anInterface);

    JniModel jniModel = jniBuilder.getFirstResult(JniModel.class);
    JavaClass javaClass = javaBuilder.getFirstResult(JavaClass.class);

    GeneratedFile jniHeader =
        new GeneratedFile(
            JniHeaderTemplate.generate(jniModel), JniNameRules.getHeaderFileName(javaClass));

    GeneratedFile jniImplementation =
        new GeneratedFile(
            JniImplementationTemplate.generate(jniModel, getIncludes(anInterface, javaClass)),
            JniNameRules.getImplementationFileName(javaClass));

    List<GeneratedFile> results = new ArrayList<>(Arrays.asList(jniHeader, jniImplementation));

    for (JniStruct jniStruct : jniModel.structs) {
      results.add(
          new GeneratedFile(
              TemplateEngine.render("jni/StructConversionHeader", jniStruct),
              JniNameRules.getConversionHeaderFileName(javaClass, jniStruct.javaClass)));
      results.add(
          new GeneratedFile(
              TemplateEngine.render("jni/StructConversionImplementation", jniStruct),
              JniNameRules.getConversionImplementationFileName(javaClass, jniStruct.javaClass)));
    }

    return results;
  }

  public List<GeneratedFile> generateFiles(
      @SuppressWarnings("unused")
          TypeCollection<BaseApiSpec.TypeCollectionPropertyAccessor> typeCollection) {

    // Currently no JNI files to be generated for type collections
    return Collections.emptyList();
  }

  private List<Include> getIncludes(final Interface<?> anInterface, final JavaClass javaClass) {

    String jniHeaderInclude = JniNameRules.getHeaderFileName(javaClass);
    String baseApiHeaderInclude = CppNameRules.getHeaderPath(anInterface);

    List<String> includes = new LinkedList<>(Arrays.asList(jniHeaderInclude, baseApiHeaderInclude));
    includes.addAll(additionalIncludes);

    return includes.stream().map(Include::createInternalInclude).collect(Collectors.toList());
  }
}
