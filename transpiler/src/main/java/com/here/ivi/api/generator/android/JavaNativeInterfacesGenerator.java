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

import com.here.ivi.api.generator.baseapi.CppModelBuilder;
import com.here.ivi.api.generator.common.FrancaTreeWalker;
import com.here.ivi.api.generator.common.GeneratedFile;
import com.here.ivi.api.generator.common.TemplateEngine;
import com.here.ivi.api.generator.common.java.JavaModelBuilder;
import com.here.ivi.api.generator.common.jni.JniModelBuilder;
import com.here.ivi.api.generator.common.jni.JniNameRules;
import com.here.ivi.api.generator.cpp.CppLibraryIncludes;
import com.here.ivi.api.generator.cpp.CppNameRules;
import com.here.ivi.api.model.common.Include;
import com.here.ivi.api.model.franca.FrancaElement;
import com.here.ivi.api.model.jni.JniContainer;
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

  public JniContainer generateModel(final FrancaElement francaElement) {

    JavaModelBuilder javaBuilder = new JavaModelBuilder(basePackage, francaElement);

    CppModelBuilder cppBuilder = new CppModelBuilder(francaElement);
    JniModelBuilder jniBuilder = new JniModelBuilder(francaElement, javaBuilder, cppBuilder);

    FrancaTreeWalker treeWalker =
        new FrancaTreeWalker(Arrays.asList(javaBuilder, cppBuilder, jniBuilder));
    treeWalker.walk(francaElement);

    JniContainer jniContainer = jniBuilder.getFirstResult(JniContainer.class);
    jniContainer.includes.addAll(getIncludes(francaElement, jniContainer));

    return jniContainer;
  }

  public List<GeneratedFile> generateFiles(final JniContainer jniContainer) {

    List<GeneratedFile> results = new LinkedList<>();
    if (jniContainer == null) {
      return results;
    }

    results.add(
        new GeneratedFile(
            TemplateEngine.render("jni/Header", jniContainer),
            JniNameRules.getHeaderFileName(jniContainer)));
    results.add(
        new GeneratedFile(
            TemplateEngine.render("jni/Implementation", jniContainer),
            JniNameRules.getImplementationFileName(jniContainer)));

    return results;
  }

  public List<GeneratedFile> generateConversionFiles(final List<JniContainer> jniContainers) {

    List<GeneratedFile> results = new LinkedList<>();

    if (jniContainers == null || jniContainers.isEmpty()) {
      return results;
    }

    //memorize all includes
    Set<Include> includes = new HashSet<>();
    jniContainers.forEach(model -> includes.addAll(model.includes));

    Map<String, Iterable<?>> mustacheData = new HashMap<>();
    mustacheData.put(INCLUDES_NAME, includes);
    mustacheData.put(MODELS_NAME, jniContainers);

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
      final FrancaElement francaElement, final JniContainer jniContainer) {

    String baseApiHeaderInclude = CppNameRules.getHeaderPath(francaElement);

    List<String> includes = new LinkedList<>(Collections.singletonList(baseApiHeaderInclude));
    if (jniContainer.isInterface) {
      includes.add(JniNameRules.getHeaderFileName(jniContainer));
    }

    includes.addAll(additionalIncludes);

    return includes.stream().map(Include::createInternalInclude).collect(Collectors.toList());
  }
}
