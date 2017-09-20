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

import com.here.ivi.api.OptionReader;
import com.here.ivi.api.generator.common.GeneratedFile;
import com.here.ivi.api.generator.common.GeneratorSuite;
import com.here.ivi.api.loader.FrancaModelLoader;
import com.here.ivi.api.model.jni.JniContainer;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public final class AndroidGeneratorSuite extends GeneratorSuite {
  public static final String GENERATOR_NAME = "android";
  private static final String CONVERSION_UTILS_HEADER = "android/jni/JniCppConversionUtils.h";
  private static final String CONVERSION_UTILS_CPP = "android/jni/JniCppConversionUtils.cpp";

  private static final String CPP_PROXY_BASE_HEADER = "android/jni/CppProxyBase.h";
  private static final String CPP_PROXY_BASE_IMPLEMENTATION = "android/jni/CppProxyBase.cpp";

  private static final String NATIVE_BASE_JAVA = "android/java/NativeBase.java";
  public static final String FIELD_ACCESS_UTILS_HEADER = "android/jni/FieldAccessMethods.h";

  private static final String CONVERSION_UTILS_TARGET_DIR = "";
  private static final String NATIVE_BASE_JAVA_TARGET_DIR = "android/com/here/android";

  private final OptionReader.TranspilerOptions transpilerOptions;

  public AndroidGeneratorSuite(OptionReader.TranspilerOptions transpilerOptions) {
    super(new FrancaModelLoader());
    this.transpilerOptions = transpilerOptions;
  }

  @Override
  public String getName() {
    return "com.here.AndroidGenerator";
  }

  @Override
  public List<GeneratedFile> generate() {

    // Generate Java files
    JavaGenerator javaGenerator = new JavaGenerator(transpilerOptions.getJavaPackageList());
    Stream<List<GeneratedFile>> javaFilesStream =
        Stream.concat(
            model.getInterfaces().stream().map(javaGenerator::generateFiles),
            model.getTypeCollections().stream().map(javaGenerator::generateFiles));

    // Generate JNI files
    JavaNativeInterfacesGenerator jniGenerator =
        new JavaNativeInterfacesGenerator(
            transpilerOptions.getJavaPackageList(),
            Arrays.asList(
                CONVERSION_UTILS_HEADER, FIELD_ACCESS_UTILS_HEADER, CPP_PROXY_BASE_HEADER));

    //jni models need to be built first as they are required to generate conversion util file
    List<JniContainer> jniContainers =
        model
            .getInterfaces()
            .stream()
            .map(jniGenerator::generateModel)
            .collect(Collectors.toList());

    jniContainers.addAll(
        model
            .getTypeCollections()
            .stream()
            .map(jniGenerator::generateModel)
            .collect(Collectors.toList()));

    Stream<List<GeneratedFile>> jniFilesStream =
        Stream.concat(
            jniContainers
                .stream()
                .filter(jniContainer -> jniContainer.isInterface)
                .map(jniGenerator::generateFiles),
            Stream.of(jniGenerator.generateConversionFiles(jniContainers)));

    // This generator is special in that it generates only one file
    // At the moment it does not need to iterate over all interfaces
    AndroidManifestGenerator androidManifestGenerator =
        new AndroidManifestGenerator(transpilerOptions.getJavaPackageList());

    List<GeneratedFile> results = androidManifestGenerator.generate();
    results.add(GeneratorSuite.copyTarget(CONVERSION_UTILS_HEADER, CONVERSION_UTILS_TARGET_DIR));
    results.add(GeneratorSuite.copyTarget(CONVERSION_UTILS_CPP, CONVERSION_UTILS_TARGET_DIR));
    results.add(GeneratorSuite.copyTarget(CPP_PROXY_BASE_HEADER, CONVERSION_UTILS_TARGET_DIR));
    results.add(
        GeneratorSuite.copyTarget(CPP_PROXY_BASE_IMPLEMENTATION, CONVERSION_UTILS_TARGET_DIR));
    results.add(GeneratorSuite.copyTarget(FIELD_ACCESS_UTILS_HEADER, CONVERSION_UTILS_TARGET_DIR));
    results.add(GeneratorSuite.copyTarget(NATIVE_BASE_JAVA, NATIVE_BASE_JAVA_TARGET_DIR));
    results.addAll(
        Stream.concat(javaFilesStream, jniFilesStream)
            .flatMap(Collection::stream)
            .collect(Collectors.toList()));

    return results;
  }
}
