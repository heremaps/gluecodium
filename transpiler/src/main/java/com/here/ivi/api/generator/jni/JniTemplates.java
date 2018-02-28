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

import com.google.common.annotations.VisibleForTesting;
import com.here.ivi.api.generator.common.GeneratedFile;
import com.here.ivi.api.generator.common.TemplateEngine;
import com.here.ivi.api.generator.cpp.CppLibraryIncludes;
import com.here.ivi.api.model.common.Include;
import com.here.ivi.api.model.jni.JniContainer;
import com.here.ivi.api.platform.android.AndroidGeneratorSuite;
import java.util.*;
import java.util.stream.Collectors;

public final class JniTemplates {

  @VisibleForTesting public static final String INCLUDES_NAME = "includes";
  @VisibleForTesting public static final String MODELS_NAME = "models";
  private static final String BASE_PACKAGES_NAME = "basePackages";

  private static final String JNI_UTILS_TEMPLATE_PREFIX = "jni/utils/";
  private static final String HEADER_TEMPLATE_SUFFIX = "Header";
  private static final String IMPL_TEMPLATE_SUFFIX = "Implementation";

  private final List<String> basePackages;

  public JniTemplates(final List<String> basePackages) {
    this.basePackages = basePackages;
  }

  public static List<GeneratedFile> generateFiles(final JniContainer jniContainer) {

    List<GeneratedFile> results = new LinkedList<>();
    if (jniContainer == null) {
      return results;
    }

    results.add(
        generateFile("jni/Header", jniContainer, JniNameRules.getHeaderFileName(jniContainer)));
    results.add(
        generateFile(
            "jni/Implementation",
            jniContainer,
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

  public GeneratedFile generateConversionUtilsHeaderFile(final String fileName) {
    return generateFile(
        JNI_UTILS_TEMPLATE_PREFIX + fileName + HEADER_TEMPLATE_SUFFIX,
        null,
        JniNameRules.getHeaderFilePath(fileName));
  }

  public GeneratedFile generateConversionUtilsImplementationFile(final String fileName) {
    return generateFile(
        JNI_UTILS_TEMPLATE_PREFIX + fileName + IMPL_TEMPLATE_SUFFIX,
        null,
        JniNameRules.getImplementationFilePath(fileName));
  }

  private void addStructConversionFiles(
      List<JniContainer> jniContainers, List<GeneratedFile> results) {
    final Set<Include> includes = new LinkedHashSet<>();
    jniContainers.forEach(model -> includes.addAll(model.includes));

    Map<String, Iterable<?>> mustacheData = new HashMap<>();
    mustacheData.put(INCLUDES_NAME, includes);
    mustacheData.put(MODELS_NAME, jniContainers);

    results.add(
        generateFile(
            "jni/StructConversionHeader",
            mustacheData,
            JniNameRules.getStructConversionHeaderFileName()));

    mustacheData.put(
        INCLUDES_NAME,
        Arrays.asList(
            Include.createInternalInclude(JniNameRules.getStructConversionHeaderFileName()),
            CppLibraryIncludes.INT_TYPES,
            CppLibraryIncludes.VECTOR,
            Include.createInternalInclude(
                JniNameRules.getHeaderFilePath(AndroidGeneratorSuite.FIELD_ACCESS_UTILS)),
            Include.createInternalInclude(JniNameRules.getEnumConversionHeaderFileName())));

    results.add(
        generateFile(
            "jni/StructConversionImplementation",
            mustacheData,
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
        generateFile(
            "jni/EnumConversionHeader",
            mustacheData,
            JniNameRules.getEnumConversionHeaderFileName()));

    mustacheData.put(
        INCLUDES_NAME,
        Collections.singletonList(
            Include.createInternalInclude(JniNameRules.getEnumConversionHeaderFileName())));

    results.add(
        generateFile(
            "jni/EnumConversionImplementation",
            mustacheData,
            JniNameRules.getEnumConversionImplementationFileName()));
  }

  private void addInstanceConversionFiles(
      List<JniContainer> jniContainers, List<GeneratedFile> results) {

    List<JniContainer> instanceContainers =
        jniContainers
            .stream()
            .filter(container -> container.isFrancaInterface)
            .collect(Collectors.toList());

    Map<String, Iterable<?>> instanceData = new HashMap<>();
    final Set<Include> instanceIncludes = new LinkedHashSet<>();
    instanceIncludes.add(CppLibraryIncludes.MEMORY);
    instanceIncludes.add(CppLibraryIncludes.NEW);
    instanceContainers.forEach(container -> instanceIncludes.addAll(container.includes));
    instanceData.put(INCLUDES_NAME, instanceIncludes);
    instanceData.put(MODELS_NAME, instanceContainers);
    instanceData.put(BASE_PACKAGES_NAME, basePackages);

    results.add(
        generateFile(
            "jni/InstanceConversionHeader",
            instanceData,
            JniNameRules.getInstanceConversionHeaderFileName()));

    instanceIncludes.add(
        Include.createInternalInclude(JniNameRules.getInstanceConversionHeaderFileName()));

    results.add(
        generateFile(
            "jni/InstanceConversionImplementation",
            instanceData,
            JniNameRules.getInstanceConversionImplementationFileName()));
  }

  private void addCppProxyFiles(
      final List<JniContainer> jniContainers, final List<GeneratedFile> results) {

    List<JniContainer> listeners =
        jniContainers.stream().filter(JniTemplates::isListener).collect(Collectors.toList());

    List<Include> proxyIncludes = new LinkedList<>();

    for (JniContainer jniContainer : listeners) {

      results.add(
          generateFile(
              "jni/CppProxyHeader",
              jniContainer,
              JniNameRules.getCppProxyHeaderFileName(jniContainer)));

      Include headerInclude =
          Include.createInternalInclude(JniNameRules.getCppProxyHeaderFileName(jniContainer));

      proxyIncludes.add(headerInclude);

      Map<String, Object> containerData = new HashMap<>();
      containerData.put("headerInclude", headerInclude);
      containerData.put("container", jniContainer);

      results.add(
          generateFile(
              "jni/CppProxyImplementation",
              containerData,
              JniNameRules.getCppProxyImplementationFileName(jniContainer)));
    }

    Map<String, Iterable<?>> mustacheData = new HashMap<>();
    mustacheData.put(INCLUDES_NAME, proxyIncludes);
    mustacheData.put(MODELS_NAME, listeners);

    results.add(
        generateFile(
            "jni/ProxyGeneratorHeader",
            mustacheData,
            JniNameRules.getProxyConversionHeaderFileName()));
  }

  private static boolean isListener(final JniContainer jniContainer) {

    return jniContainer.isInterface
        && jniContainer.methods.stream().allMatch(method -> method.returnType == null);
  }

  private static GeneratedFile generateFile(
      final String templateName, final Object data, final String fileName) {
    return new GeneratedFile(TemplateEngine.render(templateName, data), fileName);
  }
}
