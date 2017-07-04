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
import com.here.ivi.api.generator.baseapi.BaseApiGeneratorSuite;
import com.here.ivi.api.generator.common.GeneratedFile;
import com.here.ivi.api.generator.common.GeneratorSuite;
import com.here.ivi.api.loader.FrancaModelLoader;
import com.here.ivi.api.loader.SpecAccessorFactory;
import com.here.ivi.api.loader.java.AndroidSpecAccessorFactory;
import com.here.ivi.api.model.cppmodel.CppIncludeResolver;
import com.here.ivi.api.model.franca.FrancaModel;
import com.here.ivi.api.model.franca.ModelHelper;
import com.here.ivi.api.validator.android.AndroidValidator;
import com.here.ivi.api.validator.common.ResourceValidator;
import java.io.File;
import java.util.Collection;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import navigation.BaseApiSpec.InterfacePropertyAccessor;
import navigation.BaseApiSpec.TypeCollectionPropertyAccessor;
import org.eclipse.emf.ecore.resource.ResourceSet;

public final class AndroidGeneratorSuite implements GeneratorSuite {
  public static final String GENERATOR_NAMESPACE = "android";
  public static final String CONVERSION_UTILS_HEADER = "android/jni/JniCppConversionUtils.h";
  private static final String CONVERSION_UTILS_CPP = "android/jni/JniCppConversionUtils.cpp";
  private static final String CONVERSION_UTILS_TARGET_DIR = "";

  private final OptionReader.TranspilerOptions transpilerOptions;
  private final SpecAccessorFactory<InterfacePropertyAccessor, TypeCollectionPropertyAccessor>
      specAccessorFactory;
  private FrancaModel<InterfacePropertyAccessor, TypeCollectionPropertyAccessor> model;
  private final FrancaModelLoader<InterfacePropertyAccessor, TypeCollectionPropertyAccessor>
      francaModelLoader;
  private Collection<File> currentFiles;
  private final AndroidValidator validator;

  public AndroidGeneratorSuite(OptionReader.TranspilerOptions transpilerOptions) {
    this.specAccessorFactory = new AndroidSpecAccessorFactory();
    this.validator = new AndroidValidator();
    this.francaModelLoader = new FrancaModelLoader<>(specAccessorFactory);
    this.transpilerOptions = transpilerOptions;
  }

  @Override
  public String getName() {
    return "com.here.AndroidGenerator";
  }

  @Override
  public String getSpecPath() {
    return specAccessorFactory.getSpecPath();
  }

  @Override
  public boolean validate() {
    ResourceSet resources = francaModelLoader.getResourceSetProvider().get();
    return ResourceValidator.validate(resources, currentFiles) && validator.validate(model);
  }

  @Override
  public void buildModel(String inputPath) {
    ModelHelper.getFdeplInjector().injectMembers(francaModelLoader);
    currentFiles = FrancaModelLoader.listFilesRecursively(new File(inputPath));
    model = francaModelLoader.load(specAccessorFactory.getSpecPath(), currentFiles);
  }

  @Override
  public List<GeneratedFile> generate() {
    CppIncludeResolver cppIncludeResolver = new CppIncludeResolver(model);

    // Java generator needs:
    // - java name rules
    JavaGenerator javaGenerator = new JavaGenerator(transpilerOptions.getJavaPackageList());

    // JNI header generator will need:
    // - java name rules
    // - java to jni type conversion
    //   Object subclasses -> jobject
    //   pojo clases like "long" -> jlong
    // JNI impl generator will need:
    // - cpp name rules
    // - java to jni type conversion (see above)
    // - jni to cpp type converter
    //   jlong to long
    JavaNativeInterfacesGenerator jniGenerator =
        new JavaNativeInterfacesGenerator(transpilerOptions.getJavaPackageList());

    // This generator is special in that it generates only one file
    // At the moment it does not need to iterate over all interfaces
    AndroidManifestGenerator androidManifestGenerator =
        new AndroidManifestGenerator(transpilerOptions.getJavaPackageList());

    Stream<GeneratedFile> interfacesFileStream =
        model
            .getInterfaces()
            .stream()
            .map(
                iface -> {
                  List<GeneratedFile> files = javaGenerator.generateFiles(iface);
                  files.addAll(jniGenerator.generateFiles(iface));
                  return files;
                })
            .flatMap(Collection::stream);

    Stream<GeneratedFile> typeCollectionsFileStream =
        model
            .getTypeCollections()
            .stream()
            .map(
                typeCollection -> {
                  List<GeneratedFile> files = javaGenerator.generateFiles(typeCollection);
                  // Currently no JNI files to be generated for type collections
                  return files;
                })
            .flatMap(Collection::stream);

    List<GeneratedFile> additionalFiles = androidManifestGenerator.generate();
    additionalFiles.add(
        BaseApiGeneratorSuite.copyTarget(CONVERSION_UTILS_HEADER, CONVERSION_UTILS_TARGET_DIR));
    additionalFiles.add(
        BaseApiGeneratorSuite.copyTarget(CONVERSION_UTILS_CPP, CONVERSION_UTILS_TARGET_DIR));

    Stream<GeneratedFile> generatorStream =
        Stream.concat(
            Stream.concat(interfacesFileStream, typeCollectionsFileStream),
            additionalFiles.stream());
    return generatorStream.filter(Objects::nonNull).collect(Collectors.toList());
  }
}
