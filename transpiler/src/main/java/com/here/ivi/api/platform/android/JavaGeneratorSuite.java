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

package com.here.ivi.api.platform.android;

import com.here.ivi.api.cli.OptionReader;
import com.here.ivi.api.common.CollectionsHelper;
import com.here.ivi.api.generator.androidmanifest.AndroidManifestGenerator;
import com.here.ivi.api.generator.common.GeneratedFile;
import com.here.ivi.api.generator.java.JavaTemplates;
import com.here.ivi.api.generator.jni.JniGenerator;
import com.here.ivi.api.generator.jni.JniTemplates;
import com.here.ivi.api.model.common.ModelElement;
import com.here.ivi.api.model.franca.FrancaDeploymentModel;
import com.here.ivi.api.model.java.JavaElement;
import com.here.ivi.api.model.java.JavaExceptionClass;
import com.here.ivi.api.model.java.JavaPackage;
import com.here.ivi.api.model.jni.JniContainer;
import com.here.ivi.api.platform.common.GeneratorSuite;
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

  private static final String CONVERSION_UTILS_HEADER = "android/jni/JniCppConversionUtils.h";
  private static final String CONVERSION_UTILS_CPP = "android/jni/JniCppConversionUtils.cpp";

  private static final String CPP_PROXY_BASE_HEADER = "android/jni/CppProxyBase.h";
  private static final String CPP_PROXY_BASE_IMPLEMENTATION = "android/jni/CppProxyBase.cpp";

  private static final String JNI_BASE_HEADER = "android/jni/JniBase.h";
  private static final String JNI_BASE_IMPLEMENTATION = "android/jni/JniBase.cpp";

  private static final String NATIVE_BASE_JAVA = "NativeBase.java";
  public static final String FIELD_ACCESS_UTILS_HEADER = "android/jni/FieldAccessMethods.h";

  private static final String ARRAY_UTILS_HEADER = "android/jni/ArrayConversionUtils.h";
  private static final String ARRAY_UTILS_IMPLEMENTATION = "android/jni/ArrayConversionUtils.cpp";

  private static final String CONVERSION_UTILS_TARGET_DIR = "";

  private final OptionReader.TranspilerOptions transpilerOptions;
  private final boolean enableAndroidFeatures;
  private final String internalNamespace;

  public JavaGeneratorSuite(final OptionReader.TranspilerOptions transpilerOptions) {
    this(transpilerOptions, false);
  }

  protected JavaGeneratorSuite(
      final OptionReader.TranspilerOptions transpilerOptions, final boolean enableAndroidFeatures) {
    super();
    this.transpilerOptions = transpilerOptions;
    this.enableAndroidFeatures = enableAndroidFeatures;
    internalNamespace =
        transpilerOptions != null ? transpilerOptions.getCppInternalNamespace() : null;
  }

  @Override
  public String getName() {
    return "com.here.JavaGeneratorSuite";
  }

  @Override
  public List<GeneratedFile> generate(
      final FrancaDeploymentModel deploymentModel, final List<FTypeCollection> typeCollections) {

    List<String> rootPackage = transpilerOptions.getJavaPackageList();
    List<String> javaPackageList =
        rootPackage != null && !rootPackage.isEmpty()
            ? rootPackage
            : JavaPackage.DEFAULT_PACKAGE_NAMES;

    Map<String, JavaExceptionClass> exceptionsCollector = new HashMap<>();
    JniGenerator jniGenerator =
        new JniGenerator(
            deploymentModel,
            javaPackageList,
            Arrays.asList(
                CONVERSION_UTILS_HEADER,
                FIELD_ACCESS_UTILS_HEADER,
                CPP_PROXY_BASE_HEADER,
                JNI_BASE_HEADER),
            enableAndroidFeatures,
            internalNamespace);

    Collection<ModelElement> model =
        typeCollections
            .stream()
            .map(typeCollection -> jniGenerator.generateModel(typeCollection, exceptionsCollector))
            .flatMap(Collection::stream)
            .collect(Collectors.toList());
    List<JavaElement> javaModel = CollectionsHelper.getAllOfType(model, JavaElement.class);
    List<JniContainer> jniModel = CollectionsHelper.getAllOfType(model, JniContainer.class);

    List<GeneratedFile> javaFiles = JavaTemplates.generateFiles(javaModel);
    javaFiles.addAll(JavaTemplates.generateFilesForExceptions(exceptionsCollector.values()));

    List<String> nativeBasePath = new LinkedList<>();
    nativeBasePath.add(getGeneratorName());
    nativeBasePath.addAll(javaPackageList);
    nativeBasePath.add(NATIVE_BASE_JAVA);
    javaFiles.add(
        JavaTemplates.generateNativeBase(String.join("/", nativeBasePath), javaPackageList));

    JniTemplates jniTemplates = new JniTemplates(javaPackageList);
    Stream<List<GeneratedFile>> jniFilesStream =
        Stream.concat(
            jniModel
                .stream()
                .filter(jniContainer -> jniContainer.isFrancaInterface)
                .map(JniTemplates::generateFiles),
            Stream.of(jniTemplates.generateConversionFiles(jniModel)));

    List<GeneratedFile> results = new LinkedList<>();

    if (enableAndroidFeatures) {
      // This generator is special in that it generates only one file
      // At the moment it does not need to iterate over all interfaces
      AndroidManifestGenerator androidManifestGenerator =
          new AndroidManifestGenerator(javaPackageList);
      results.add(androidManifestGenerator.generate());
    }

    results.add(copyTarget(ARRAY_UTILS_HEADER, CONVERSION_UTILS_TARGET_DIR));
    results.add(copyTarget(ARRAY_UTILS_IMPLEMENTATION, CONVERSION_UTILS_TARGET_DIR));
    results.add(copyTarget(CONVERSION_UTILS_HEADER, CONVERSION_UTILS_TARGET_DIR));
    results.add(copyTarget(CONVERSION_UTILS_CPP, CONVERSION_UTILS_TARGET_DIR));
    results.add(copyTarget(CPP_PROXY_BASE_HEADER, CONVERSION_UTILS_TARGET_DIR));
    results.add(copyTarget(CPP_PROXY_BASE_IMPLEMENTATION, CONVERSION_UTILS_TARGET_DIR));
    results.add(copyTarget(FIELD_ACCESS_UTILS_HEADER, CONVERSION_UTILS_TARGET_DIR));
    results.add(copyTarget(JNI_BASE_HEADER, CONVERSION_UTILS_TARGET_DIR));
    results.add(copyTarget(JNI_BASE_IMPLEMENTATION, CONVERSION_UTILS_TARGET_DIR));
    results.addAll(javaFiles);
    results.addAll(jniFilesStream.flatMap(Collection::stream).collect(Collectors.toList()));

    return results;
  }

  protected String getGeneratorName() {
    return GENERATOR_NAME;
  }
}
