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
import com.here.ivi.api.generator.androidmanifest.AndroidManifestGenerator;
import com.here.ivi.api.generator.common.GeneratedFile;
import com.here.ivi.api.generator.java.JavaGenerator;
import com.here.ivi.api.generator.jni.JniGenerator;
import com.here.ivi.api.model.franca.FrancaDeploymentModel;
import com.here.ivi.api.model.java.JavaPackage;
import com.here.ivi.api.model.jni.JniContainer;
import com.here.ivi.api.platform.common.GeneratorSuite;
import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FTypeCollection;

/**
 * Combines generators {@link AndroidManifestGenerator}, {@link JniGenerator} and {@link
 * JavaGenerator} to generate Java code and bindings to BaseAPI layer for Android.
 */
public final class AndroidGeneratorSuite extends GeneratorSuite {
  public static final String GENERATOR_NAME = "android";
  private static final String CONVERSION_UTILS_HEADER = "android/jni/JniCppConversionUtils.h";
  private static final String CONVERSION_UTILS_CPP = "android/jni/JniCppConversionUtils.cpp";

  private static final String CPP_PROXY_BASE_HEADER = "android/jni/CppProxyBase.h";
  private static final String CPP_PROXY_BASE_IMPLEMENTATION = "android/jni/CppProxyBase.cpp";

  private static final String JNI_BASE_HEADER = "android/jni/JniBase.h";
  private static final String JNI_BASE_IMPLEMENTATION = "android/jni/JniBase.cpp";

  private static final String NATIVE_BASE_JAVA = "android/java/NativeBase.java";
  public static final String FIELD_ACCESS_UTILS_HEADER = "android/jni/FieldAccessMethods.h";

  private static final String ARRAY_UTILS_HEADER = "android/jni/ArrayConversionUtils.h";
  private static final String ARRAY_UTILS_IMPLEMENTATION = "android/jni/ArrayConversionUtils.cpp";

  private static final String CONVERSION_UTILS_TARGET_DIR = "";
  private static final String NATIVE_BASE_JAVA_TARGET_DIR = "android/com/here/android";

  private final OptionReader.TranspilerOptions transpilerOptions;

  public AndroidGeneratorSuite(final OptionReader.TranspilerOptions transpilerOptions) {
    super();
    this.transpilerOptions = transpilerOptions;
  }

  @Override
  public String getName() {
    return "com.here.AndroidGenerator";
  }

  @Override
  public List<GeneratedFile> generate(
      final FrancaDeploymentModel deploymentModel, final List<FTypeCollection> typeCollections) {

    List<String> rootPackage = transpilerOptions.getJavaPackageList();
    List<String> javaPackageList =
        rootPackage != null && !rootPackage.isEmpty()
            ? rootPackage
            : JavaPackage.DEFAULT_PACKAGE_NAMES;

    // Generate Java files
    JavaGenerator javaGenerator = new JavaGenerator(deploymentModel, javaPackageList);

    // Do not stream, Java models need to be built as they are required to generate Exception files
    List<GeneratedFile> javaFiles =
        typeCollections
            .stream()
            .map(
                francaTypeCollection ->
                    (francaTypeCollection instanceof FInterface)
                        ? javaGenerator.generateFilesForInterface((FInterface) francaTypeCollection)
                        : javaGenerator.generateFiles(francaTypeCollection))
            .flatMap(Collection::stream)
            .collect(Collectors.toList());
    javaFiles.addAll(javaGenerator.generateFilesForExceptions());

    // Generate JNI files
    JniGenerator jniGenerator =
        new JniGenerator(
            deploymentModel,
            javaPackageList,
            Arrays.asList(
                CONVERSION_UTILS_HEADER,
                FIELD_ACCESS_UTILS_HEADER,
                CPP_PROXY_BASE_HEADER,
                JNI_BASE_HEADER));

    //jni models need to be built first as they are required to generate conversion util file
    List<JniContainer> jniContainers =
        typeCollections.stream().map(jniGenerator::generateModel).collect(Collectors.toList());

    Stream<List<GeneratedFile>> jniFilesStream =
        Stream.concat(
            jniContainers
                .stream()
                .filter(jniContainer -> jniContainer.isFrancaInterface)
                .map(jniGenerator::generateFiles),
            Stream.of(jniGenerator.generateConversionFiles(jniContainers)));

    // This generator is special in that it generates only one file
    // At the moment it does not need to iterate over all interfaces
    AndroidManifestGenerator androidManifestGenerator =
        new AndroidManifestGenerator(javaPackageList);

    List<GeneratedFile> results = new LinkedList<>();
    results.add(androidManifestGenerator.generate());
    results.add(copyTarget(ARRAY_UTILS_HEADER, CONVERSION_UTILS_TARGET_DIR));
    results.add(copyTarget(ARRAY_UTILS_IMPLEMENTATION, CONVERSION_UTILS_TARGET_DIR));
    results.add(copyTarget(CONVERSION_UTILS_HEADER, CONVERSION_UTILS_TARGET_DIR));
    results.add(copyTarget(CONVERSION_UTILS_CPP, CONVERSION_UTILS_TARGET_DIR));
    results.add(copyTarget(CPP_PROXY_BASE_HEADER, CONVERSION_UTILS_TARGET_DIR));
    results.add(copyTarget(CPP_PROXY_BASE_IMPLEMENTATION, CONVERSION_UTILS_TARGET_DIR));
    results.add(copyTarget(FIELD_ACCESS_UTILS_HEADER, CONVERSION_UTILS_TARGET_DIR));
    results.add(copyTarget(JNI_BASE_HEADER, CONVERSION_UTILS_TARGET_DIR));
    results.add(copyTarget(JNI_BASE_IMPLEMENTATION, CONVERSION_UTILS_TARGET_DIR));
    results.add(copyTarget(NATIVE_BASE_JAVA, NATIVE_BASE_JAVA_TARGET_DIR));
    results.addAll(javaFiles);
    results.addAll(jniFilesStream.flatMap(Collection::stream).collect(Collectors.toList()));

    return results;
  }
}
