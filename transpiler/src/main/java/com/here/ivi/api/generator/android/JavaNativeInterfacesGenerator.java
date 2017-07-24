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
import com.here.ivi.api.model.franca.FrancaElement;
import com.here.ivi.api.model.franca.Interface;
import com.here.ivi.api.model.javamodel.JavaClass;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;
import java.util.stream.Collectors;

public class JavaNativeInterfacesGenerator extends AbstractAndroidGenerator {

  private final List<String> additionalIncludes;

  public JavaNativeInterfacesGenerator(
      final List<String> packageList, final List<String> additionalIncludes) {
    super(packageList);
    this.additionalIncludes = additionalIncludes;
  }

  public JniModel generateModel(final Interface<?> francaElement) {

    JavaModelBuilder javaBuilder = new JavaModelBuilder(basePackage, francaElement);

    StubModelBuilder stubBuilder = new StubModelBuilder(francaElement);
    JniModelBuilder jniBuilder = new JniModelBuilder(francaElement, javaBuilder, stubBuilder);

    FrancaTreeWalker treeWalker =
        new FrancaTreeWalker(Arrays.asList(javaBuilder, stubBuilder, jniBuilder));
    treeWalker.walk(francaElement);

    JniModel jniModel = jniBuilder.getFirstResult(JniModel.class);
    jniModel.includes.addAll(getIncludes(francaElement, jniModel.javaClass));

    return jniModel;
  }

  public List<GeneratedFile> generateFiles(final JniModel jniModel) {

    List<GeneratedFile> results = new LinkedList<>();

    results.add(
        new GeneratedFile(
            JniHeaderTemplate.generate(jniModel),
            JniNameRules.getHeaderFileName(jniModel.javaClass)));
    results.add(
        new GeneratedFile(
            JniImplementationTemplate.generate(jniModel),
            JniNameRules.getImplementationFileName(jniModel.javaClass)));

    for (JniStruct jniStruct : jniModel.structs) {
      results.add(
          new GeneratedFile(
              TemplateEngine.render("jni/StructConversionHeader", jniStruct),
              JniNameRules.getConversionHeaderFileName(jniModel.javaClass, jniStruct.javaClass)));
      results.add(
          new GeneratedFile(
              TemplateEngine.render("jni/StructConversionImplementation", jniStruct),
              JniNameRules.getConversionImplementationFileName(
                  jniModel.javaClass, jniStruct.javaClass)));
    }

    return results;
  }

  private List<Include> getIncludes(
      final FrancaElement<?> francaElement, final JavaClass javaClass) {

    String jniHeaderInclude = JniNameRules.getHeaderFileName(javaClass);
    String baseApiHeaderInclude = CppNameRules.getHeaderPath(francaElement);

    List<String> includes = new LinkedList<>(Arrays.asList(jniHeaderInclude, baseApiHeaderInclude));
    includes.addAll(additionalIncludes);

    return includes.stream().map(Include::createInternalInclude).collect(Collectors.toList());
  }
}
