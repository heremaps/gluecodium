/*
 * Copyright (C) 2016-2019 HERE Europe B.V.
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

package com.here.genium.generator.jni;

import com.here.genium.generator.common.GeneratedFile;
import com.here.genium.generator.common.templates.TemplateEngine;
import com.here.genium.generator.cpp.CppLibraryIncludes;
import com.here.genium.model.common.Include;
import com.here.genium.model.jni.JniContainer;
import com.here.genium.model.jni.JniContainer.ContainerType;
import com.here.genium.platform.android.JavaGeneratorSuite;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

public final class JniTemplates {

  private static final String INCLUDES_NAME = "includes";
  private static final String MODELS_NAME = "models";
  private static final String BASE_PACKAGES_NAME = "basePackages";
  private static final String CONTAINER_NAME = "container";
  private static final String INTERNAL_NAMESPACE_NAME = "internalNamespace";

  private static final String JNI_UTILS_TEMPLATE_PREFIX = "jni/utils/";
  private static final String HEADER_TEMPLATE_SUFFIX = "Header";
  private static final String IMPL_TEMPLATE_SUFFIX = "Implementation";

  private final List<String> basePackages;
  private final String internalNamespace;
  private final JniNameRules jniNameRules;

  public JniTemplates(
      final List<String> basePackages, final String internalNamespace, final String generatorName) {
    this.basePackages = basePackages;
    this.internalNamespace = internalNamespace;
    this.jniNameRules = new JniNameRules(generatorName);
  }

  public List<GeneratedFile> generateFiles(final JniContainer jniContainer) {

    List<GeneratedFile> results = new LinkedList<>();
    if (jniContainer == null) {
      return results;
    }

    Map<String, Object> containerData = new HashMap<>();
    containerData.put(CONTAINER_NAME, jniContainer);
    containerData.put(INTERNAL_NAMESPACE_NAME, internalNamespace);

    String fileName = JniNameRules.getJniClassFileName(jniContainer);
    results.add(
        generateFile("jni/Header", containerData, jniNameRules.getHeaderFilePath(fileName)));
    results.add(
        generateFile(
            "jni/Implementation", containerData, jniNameRules.getImplementationFilePath(fileName)));

    return results;
  }

  public List<GeneratedFile> generateConversionFiles(final List<JniContainer> jniContainers) {

    List<GeneratedFile> results = new LinkedList<>();
    addStructConversionFiles(jniContainers, results);
    addInstanceConversionFiles(jniContainers, results);
    addEnumConversionFiles(jniContainers, results);
    addCppProxyFiles(jniContainers, results);

    return results;
  }

  public GeneratedFile generateConversionUtilsHeaderFile(final String fileName) {
    return generateFile(
        JNI_UTILS_TEMPLATE_PREFIX + fileName + HEADER_TEMPLATE_SUFFIX,
        internalNamespace,
        jniNameRules.getHeaderFilePath(fileName));
  }

  public GeneratedFile generateConversionUtilsImplementationFile(final String fileName) {
    return generateFile(
        JNI_UTILS_TEMPLATE_PREFIX + fileName + IMPL_TEMPLATE_SUFFIX,
        internalNamespace,
        jniNameRules.getImplementationFilePath(fileName));
  }

  private void addStructConversionFiles(
      List<JniContainer> jniContainers, List<GeneratedFile> results) {

    final Set<Include> includes =
        jniContainers
            .stream()
            .flatMap(model -> model.getIncludes().stream())
            .collect(Collectors.toCollection(LinkedHashSet::new));

    Map<String, Object> mustacheData = new HashMap<>();
    mustacheData.put(INCLUDES_NAME, includes);
    mustacheData.put(MODELS_NAME, jniContainers);
    mustacheData.put(INTERNAL_NAMESPACE_NAME, internalNamespace);

    results.add(
        generateFile(
            "jni/StructConversionHeader",
            mustacheData,
            jniNameRules.getHeaderFilePath(JniNameRules.JNI_STRUCT_CONVERSION_NAME)));

    mustacheData.put(
        INCLUDES_NAME,
        Arrays.asList(
            Include.Companion.createInternalInclude(
                JniNameRules.getHeaderFileName(JniNameRules.JNI_STRUCT_CONVERSION_NAME)),
            CppLibraryIncludes.INT_TYPES,
            CppLibraryIncludes.VECTOR,
            Include.Companion.createInternalInclude(
                JniNameRules.getHeaderFileName(JavaGeneratorSuite.FIELD_ACCESS_UTILS)),
            Include.Companion.createInternalInclude(
                JniNameRules.getHeaderFileName(JniNameRules.JNI_ENUM_CONVERSION_NAME))));

    results.add(
        generateFile(
            "jni/StructConversionImplementation",
            mustacheData,
            jniNameRules.getImplementationFilePath(JniNameRules.JNI_STRUCT_CONVERSION_NAME)));
  }

  private void addEnumConversionFiles(
      List<JniContainer> jniContainers, List<GeneratedFile> results) {
    final Set<Include> includes = new LinkedHashSet<>();
    jniContainers.forEach(model -> includes.addAll(model.getIncludes()));

    Map<String, Object> mustacheData = new HashMap<>();
    mustacheData.put(INCLUDES_NAME, includes);
    mustacheData.put(MODELS_NAME, jniContainers);
    mustacheData.put(INTERNAL_NAMESPACE_NAME, internalNamespace);

    results.add(
        generateFile(
            "jni/EnumConversionHeader",
            mustacheData,
            jniNameRules.getHeaderFilePath(JniNameRules.JNI_ENUM_CONVERSION_NAME)));

    mustacheData.put(
        INCLUDES_NAME,
        Collections.singletonList(
            Include.Companion.createInternalInclude(
                JniNameRules.getHeaderFileName(JniNameRules.JNI_ENUM_CONVERSION_NAME))));

    results.add(
        generateFile(
            "jni/EnumConversionImplementation",
            mustacheData,
            jniNameRules.getImplementationFilePath(JniNameRules.JNI_ENUM_CONVERSION_NAME)));
  }

  private void addInstanceConversionFiles(
      List<JniContainer> jniContainers, List<GeneratedFile> results) {

    List<JniContainer> instanceContainers =
        jniContainers
            .stream()
            .filter(container -> container.getContainerType() != ContainerType.TYPE_COLLECTION)
            .collect(Collectors.toList());

    Map<String, Object> instanceData = new HashMap<>();
    final Set<Include> instanceIncludes = new LinkedHashSet<>();
    instanceIncludes.add(CppLibraryIncludes.MEMORY);
    instanceIncludes.add(CppLibraryIncludes.NEW);
    instanceContainers.forEach(container -> instanceIncludes.addAll(container.getIncludes()));
    instanceData.put(INCLUDES_NAME, instanceIncludes);
    instanceData.put(MODELS_NAME, instanceContainers);
    instanceData.put(BASE_PACKAGES_NAME, basePackages);
    instanceData.put(INTERNAL_NAMESPACE_NAME, internalNamespace);

    results.add(
        generateFile(
            "jni/InstanceConversionHeader",
            instanceData,
            jniNameRules.getHeaderFilePath(JniNameRules.JNI_INSTANCE_CONVERSION_NAME)));

    instanceIncludes.add(
        Include.Companion.createInternalInclude(
            JniNameRules.getHeaderFileName(JniNameRules.JNI_INSTANCE_CONVERSION_NAME)));

    results.add(
        generateFile(
            "jni/InstanceConversionImplementation",
            instanceData,
            jniNameRules.getImplementationFilePath(JniNameRules.JNI_INSTANCE_CONVERSION_NAME)));
  }

  private void addCppProxyFiles(
      final List<JniContainer> jniContainers, final List<GeneratedFile> results) {

    List<JniContainer> listeners =
        jniContainers
            .stream()
            .filter(container -> container.getContainerType() == ContainerType.INTERFACE)
            .collect(Collectors.toList());

    List<Include> proxyIncludes = new LinkedList<>();

    for (JniContainer jniContainer : listeners) {

      Map<String, Object> containerData = new HashMap<>();
      containerData.put(CONTAINER_NAME, jniContainer);
      containerData.put(INTERNAL_NAMESPACE_NAME, internalNamespace);

      String fileName =
          JniNameRules.getJniClassFileName(jniContainer) + JniNameRules.JNI_CPP_PROXY_SUFFIX;
      results.add(
          generateFile(
              "jni/CppProxyHeader", containerData, jniNameRules.getHeaderFilePath(fileName)));

      Include headerInclude =
          Include.Companion.createInternalInclude(JniNameRules.getHeaderFileName(fileName));

      proxyIncludes.add(headerInclude);

      containerData.put("headerInclude", headerInclude);

      results.add(
          generateFile(
              "jni/CppProxyImplementation",
              containerData,
              jniNameRules.getImplementationFilePath(fileName)));
    }

    Map<String, Object> mustacheData = new HashMap<>();
    mustacheData.put(INCLUDES_NAME, proxyIncludes);
    mustacheData.put(MODELS_NAME, listeners);
    mustacheData.put(INTERNAL_NAMESPACE_NAME, internalNamespace);

    results.add(
        generateFile(
            "jni/ProxyGeneratorHeader",
            mustacheData,
            jniNameRules.getHeaderFilePath(JniNameRules.JNI_PROXY_CONVERSION_NAME)));
  }

  private static GeneratedFile generateFile(
      final String templateName, final Object data, final String fileName) {
    return new GeneratedFile(TemplateEngine.INSTANCE.render(templateName, data), fileName);
  }
}
