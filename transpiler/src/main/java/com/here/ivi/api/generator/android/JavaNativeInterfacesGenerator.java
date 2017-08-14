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
import com.here.ivi.api.generator.common.cpp.CppLibraryIncludes;
import com.here.ivi.api.generator.common.cpp.CppNameRules;
import com.here.ivi.api.generator.common.java.JavaModelBuilder;
import com.here.ivi.api.generator.common.jni.JniModel;
import com.here.ivi.api.generator.common.jni.JniModelBuilder;
import com.here.ivi.api.generator.common.jni.JniNameRules;
import com.here.ivi.api.generator.common.jni.templates.JniHeaderTemplate;
import com.here.ivi.api.generator.common.jni.templates.JniImplementationTemplate;
import com.here.ivi.api.model.common.Include;
import com.here.ivi.api.model.franca.FrancaElement;
import com.here.ivi.api.model.javamodel.JavaClass;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

public class JavaNativeInterfacesGenerator extends AbstractAndroidGenerator {

  public static final String INCLUDES_NAME = "includes";
  public static final String MODELS_NAME = "models";

  private final List<String> additionalIncludes;

  public JavaNativeInterfacesGenerator(
      final List<String> packageList, final List<String> additionalIncludes) {
    super(packageList);
    this.additionalIncludes = additionalIncludes;
  }

  public JniModel generateModel(final FrancaElement<?> francaElement) {

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

    return results;
  }

  public List<GeneratedFile> generateConversionFiles(final List<JniModel> jniModels) {

    List<GeneratedFile> results = new LinkedList<>();

    if (jniModels == null || jniModels.size() == 0) {
      return results;
    }

    //memorize all includes
    Set<Include> includes = new HashSet<>();
    jniModels.forEach(model -> includes.addAll(model.includes));

    Map<String, Iterable<?>> mustacheData = new HashMap<>();
    mustacheData.put(INCLUDES_NAME, includes);
    mustacheData.put(MODELS_NAME, jniModels);

    results.add(
        new GeneratedFile(
            TemplateEngine.render("jni/StructConversionHeader", mustacheData),
            JniNameRules.getConversionHeaderFileName()));

    mustacheData.put(
        INCLUDES_NAME,
        Arrays.asList(
            Include.createInternalInclude(JniNameRules.getConversionHeaderFileName()),
            CppLibraryIncludes.INT_TYPES,
            CppLibraryIncludes.VECTOR,
            Include.createInternalInclude(AndroidGeneratorSuite.FIELD_ACCESS_UTILS_HEADER)));

    results.add(
        new GeneratedFile(
            TemplateEngine.render("jni/StructConversionImplementation", mustacheData),
            JniNameRules.getConversionImplementationFileName()));

    return results;
  }

  private List<Include> getIncludes(
      final FrancaElement<?> francaElement, final JavaClass javaClass) {

    String baseApiHeaderInclude = CppNameRules.getHeaderPath(francaElement);

    List<String> includes = new LinkedList<>(Collections.singletonList(baseApiHeaderInclude));
    if (javaClass != null) {
      includes.add(JniNameRules.getHeaderFileName(javaClass));
    }

    includes.addAll(additionalIncludes);

    return includes.stream().map(Include::createInternalInclude).collect(Collectors.toList());
  }
}
