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

package com.here.genium.platform.android;

import com.here.genium.Genium;
import com.here.genium.common.CollectionsHelper;
import com.here.genium.common.FrancaTypeHelper;
import com.here.genium.generator.androidmanifest.AndroidManifestGenerator;
import com.here.genium.generator.common.GeneratedFile;
import com.here.genium.generator.java.JavaTemplates;
import com.here.genium.generator.jni.JniGenerator;
import com.here.genium.generator.jni.JniNameRules;
import com.here.genium.generator.jni.JniTemplates;
import com.here.genium.model.common.ModelElement;
import com.here.genium.model.franca.FrancaDeploymentModel;
import com.here.genium.model.java.JavaElement;
import com.here.genium.model.java.JavaPackage;
import com.here.genium.model.jni.JniContainer;
import com.here.genium.platform.common.GeneratorSuite;
import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import org.franca.core.franca.FTypeCollection;

/**
 * Combines generators {@link JniGenerator} and {@link JavaTemplates} to generate Java code and
 * bindings to BaseAPI layer for Java.
 */
public class JavaGeneratorSuite extends GeneratorSuite {

  public static final String GENERATOR_NAME = "java";

  private static final String ARRAY_CONVERSION_UTILS = "ArrayConversionUtils";
  private static final String CPP_PROXY_BASE = "CppProxyBase";
  public static final String FIELD_ACCESS_UTILS = "FieldAccessMethods";
  private static final String BOXING_CONVERSION_UTILS = "BoxingConversionUtils";
  private static final String JNI_BASE = "JniBase";
  private static final String JNI_CPP_CONVERSION_UTILS = "JniCppConversionUtils";
  private static final String JNI_TEMPLATE_METAINFO = "JniTemplateMetainfo";
  private static final String JNI_REFERENCE = "JniReference";
  private static final String JNI_CALL_JAVA_METHOD = "JniCallJavaMethod";

  private static final List<String> UTILS_FILES =
      Arrays.asList(
          CPP_PROXY_BASE,
          FIELD_ACCESS_UTILS,
          JNI_BASE,
          JNI_CPP_CONVERSION_UTILS,
          BOXING_CONVERSION_UTILS);
  private static final List<String> UTILS_FILES_HEADER_ONLY =
      Arrays.asList(
          JNI_TEMPLATE_METAINFO, JNI_REFERENCE, JNI_CALL_JAVA_METHOD, ARRAY_CONVERSION_UTILS);
  private static final List<String> UTILS_HEADER_INCLUDES =
      Arrays.asList(CPP_PROXY_BASE, FIELD_ACCESS_UTILS, JNI_BASE, JNI_CPP_CONVERSION_UTILS);

  private static final String NATIVE_BASE_JAVA = "NativeBase.java";

  private final List<String> rootPackage;
  private final boolean enableAndroidFeatures;
  private final String internalNamespace;
  private final List<String> rootNamespace;
  private final FrancaDeploymentModel deploymentModel;

  public JavaGeneratorSuite(
      final Genium.Options options, final FrancaDeploymentModel deploymentModel) {
    this(options, false, deploymentModel);
  }

  protected JavaGeneratorSuite(
      final Genium.Options options,
      final boolean enableAndroidFeatures,
      final FrancaDeploymentModel deploymentModel) {
    super();
    this.rootPackage = options.getJavaPackages();
    this.enableAndroidFeatures = enableAndroidFeatures;
    this.internalNamespace = options.getCppInternalNamespace();
    this.rootNamespace = options.getCppRootNamespace();
    this.deploymentModel = deploymentModel;
  }

  @Override
  public String getName() {
    return "com.here.JavaGeneratorSuite";
  }

  @Override
  public List<GeneratedFile> generate(final List<FTypeCollection> typeCollections) {

    List<String> javaPackageList =
        rootPackage != null && !rootPackage.isEmpty()
            ? rootPackage
            : JavaPackage.Companion.getDEFAULT_PACKAGE_NAMES();

    FrancaTypeHelper.ErrorEnumFilter errorEnumFilter =
        FrancaTypeHelper.getErrorEnumFilter(typeCollections);

    JniGenerator jniGenerator =
        new JniGenerator(
            deploymentModel,
            javaPackageList,
            UTILS_HEADER_INCLUDES
                .stream()
                .map(JniNameRules::getHeaderFileName)
                .collect(Collectors.toList()),
            errorEnumFilter,
            enableAndroidFeatures,
            internalNamespace,
            rootNamespace);

    Collection<ModelElement> model =
        typeCollections
            .stream()
            .map(jniGenerator::generateModel)
            .flatMap(Collection::stream)
            .collect(Collectors.toList());
    List<JavaElement> javaModel = CollectionsHelper.getAllOfType(model, JavaElement.class);
    List<JniContainer> jniModel = CollectionsHelper.getAllOfType(model, JniContainer.class);

    JavaTemplates javaTemplates = new JavaTemplates(getGeneratorName());
    List<GeneratedFile> javaFiles = javaTemplates.generateFiles(javaModel);

    List<String> nativeBasePath = new LinkedList<>();
    nativeBasePath.add(getGeneratorName());
    nativeBasePath.addAll(javaPackageList);
    nativeBasePath.add(NATIVE_BASE_JAVA);
    javaFiles.add(
        JavaTemplates.generateNativeBase(String.join("/", nativeBasePath), javaPackageList));

    JniTemplates jniTemplates =
        new JniTemplates(javaPackageList, internalNamespace, getGeneratorName());
    Stream<List<GeneratedFile>> jniFilesStream =
        Stream.concat(
            jniModel
                .stream()
                .filter(JniContainer::isFrancaInterface)
                .map(jniTemplates::generateFiles),
            Stream.of(jniTemplates.generateConversionFiles(jniModel)));

    List<GeneratedFile> results = new LinkedList<>();

    if (enableAndroidFeatures) {
      // This generator is special in that it generates only one file
      // At the moment it does not need to iterate over all interfaces
      AndroidManifestGenerator androidManifestGenerator =
          new AndroidManifestGenerator(javaPackageList);
      results.add(androidManifestGenerator.generate());
    }

    for (final String fileName : UTILS_FILES) {
      results.add(jniTemplates.generateConversionUtilsHeaderFile(fileName));
      results.add(jniTemplates.generateConversionUtilsImplementationFile(fileName));
    }
    for (final String fileName : UTILS_FILES_HEADER_ONLY) {
      results.add(jniTemplates.generateConversionUtilsHeaderFile(fileName));
    }

    results.addAll(javaFiles);
    results.addAll(jniFilesStream.flatMap(Collection::stream).collect(Collectors.toList()));

    return results;
  }

  protected String getGeneratorName() {
    return GENERATOR_NAME;
  }
}
