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
import com.here.ivi.api.generator.cpp.CppLibraryIncludes;
import com.here.ivi.api.generator.cpp.CppNameRules;
import com.here.ivi.api.generator.java.JavaModelBuilder;
import com.here.ivi.api.generator.jni.JniModelBuilder;
import com.here.ivi.api.generator.jni.JniNameRules;
import com.here.ivi.api.model.common.Include;
import com.here.ivi.api.model.cppmodel.CppIncludeResolver;
import com.here.ivi.api.model.franca.FrancaElement;
import com.here.ivi.api.model.jni.JniContainer;
import java.util.*;
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

    CppModelBuilder cppBuilder = new CppModelBuilder(francaElement, new CppIncludeResolver(null));
    JniModelBuilder jniBuilder = new JniModelBuilder(francaElement, javaBuilder, cppBuilder);

    FrancaTreeWalker treeWalker =
        new FrancaTreeWalker(Arrays.asList(javaBuilder, cppBuilder, jniBuilder));
    treeWalker.walk(francaElement);

    JniContainer jniContainer = jniBuilder.getFinalResult(JniContainer.class);
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

    addStructConversionFiles(jniContainers, results);

    addInstanceConversionFiles(jniContainers, results);

    addEnumConversionFiles(jniContainers, results);

    addCppProxyFiles(jniContainers, results);

    return results;
  }

  private void addStructConversionFiles(
      List<JniContainer> jniContainers, List<GeneratedFile> results) {
    final Set<Include> includes = new LinkedHashSet<>();
    jniContainers.forEach(model -> includes.addAll(model.includes));

    Map<String, Iterable<?>> mustacheData = new HashMap<>();
    mustacheData.put(INCLUDES_NAME, includes);
    mustacheData.put(MODELS_NAME, jniContainers);

    results.add(
        new GeneratedFile(
            TemplateEngine.render("jni/StructConversionHeader", mustacheData),
            JniNameRules.getStructConversionHeaderFileName()));

    mustacheData.put(
        INCLUDES_NAME,
        Arrays.asList(
            Include.createInternalInclude(JniNameRules.getStructConversionHeaderFileName()),
            CppLibraryIncludes.INT_TYPES,
            CppLibraryIncludes.VECTOR,
            Include.createInternalInclude(AndroidGeneratorSuite.FIELD_ACCESS_UTILS_HEADER),
            Include.createInternalInclude(JniNameRules.getEnumConversionHeaderFileName())));

    results.add(
        new GeneratedFile(
            TemplateEngine.render("jni/StructConversionImplementation", mustacheData),
            JniNameRules.getStructConversionImplementationFileName()));
  }

  private void addEnumConversionFiles(
      List<JniContainer> jniContainers, List<GeneratedFile> results) {
    final Set<Include> includes = new LinkedHashSet<>();
    jniContainers.forEach(model -> includes.addAll(model.includes));

    Map<String, Iterable<?>> mustacheData = new HashMap<>();
    mustacheData.put(INCLUDES_NAME, includes);
    mustacheData.put(MODELS_NAME, jniContainers);

    results.add(
        new GeneratedFile(
            TemplateEngine.render("jni/EnumConversionHeader", mustacheData),
            JniNameRules.getEnumConversionHeaderFileName()));

    mustacheData.put(
        INCLUDES_NAME,
        Collections.singletonList(
            Include.createInternalInclude(JniNameRules.getEnumConversionHeaderFileName())));

    results.add(
        new GeneratedFile(
            TemplateEngine.render("jni/EnumConversionImplementation", mustacheData),
            JniNameRules.getEnumConversionImplementationFileName()));
  }

  private void addInstanceConversionFiles(
      List<JniContainer> jniContainers, List<GeneratedFile> results) {
    List<JniContainer> instanceContainersList =
        jniContainers
            .stream()
            .filter(container -> container.isInstantiable)
            .collect(Collectors.toCollection(ArrayList::new));

    Map<String, Iterable<?>> instanceData = new HashMap<>();
    final Set<Include> instanceIncludes = new LinkedHashSet<>();
    instanceIncludes.add(CppLibraryIncludes.MEMORY);
    instanceContainersList
        .stream()
        .forEach(container -> instanceIncludes.addAll(container.includes));
    instanceData.put(INCLUDES_NAME, instanceIncludes);
    instanceData.put(MODELS_NAME, instanceContainersList);

    results.add(
        new GeneratedFile(
            TemplateEngine.render("jni/InstanceConversionHeader", instanceData),
            JniNameRules.getInstanceConversionHeaderFileName()));

    instanceIncludes.add(
        Include.createInternalInclude(JniNameRules.getInstanceConversionHeaderFileName()));
    results.add(
        new GeneratedFile(
            TemplateEngine.render("jni/InstanceConversionImplementation", instanceData),
            JniNameRules.getInstanceConversionImplementationFileName()));
  }

  private void addCppProxyFiles(
      final List<JniContainer> jniContainers, final List<GeneratedFile> results) {

    //TODO APIGEN-759: remove this filter when support for non listener classes is added
    List<JniContainer> listeners =
        jniContainers
            .stream()
            .filter(container -> isListenerTakingPrimitiveTypesOnly(container))
            .collect(Collectors.toCollection(ArrayList::new));

    List<String> proxyIncludes = new LinkedList<>();

    for (JniContainer jniContainer : listeners) {
      results.add(
          new GeneratedFile(
              TemplateEngine.render("jni/CppProxyHeader", jniContainer),
              JniNameRules.getCppProxyHeaderFileName(jniContainer)));

      String headerInclude =
          "\n#include \"" + JniNameRules.getCppProxyHeaderFileName(jniContainer) + "\"\n";

      proxyIncludes.add(headerInclude);

      results.add(
          new GeneratedFile(
              headerInclude + TemplateEngine.render("jni/CppProxyImplementation", jniContainer),
              JniNameRules.getCppProxyImplementationFileName(jniContainer)));
    }

    Map<String, Iterable<?>> mustacheData = new HashMap<>();
    mustacheData.put(INCLUDES_NAME, proxyIncludes);
    mustacheData.put(MODELS_NAME, listeners);

    results.add(
        new GeneratedFile(
            TemplateEngine.render("jni/ProxyGeneratorHeader", mustacheData),
            JniNameRules.getProxyConversionHeaderFileName()));
  }

  private static boolean isListenerTakingPrimitiveTypesOnly(final JniContainer jniContainer) {

    return jniContainer.isInstantiable
        && jniContainer
            .methods
            .stream()
            .allMatch(
                method ->
                    method.returnType == null
                        && method.parameters.stream().noneMatch(param -> param.type.isComplex));
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
