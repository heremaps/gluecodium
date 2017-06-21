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

import com.here.ivi.api.generator.baseapi.BaseApiNameRules;
import com.here.ivi.api.generator.common.GeneratedFile;
import com.here.ivi.api.generator.common.GeneratorSuite;
import com.here.ivi.api.generator.common.cpp.CppNameRules;
import com.here.ivi.api.loader.FrancaModelLoader;
import com.here.ivi.api.loader.SpecAccessorFactory;
import com.here.ivi.api.loader.java.AndroidSpecAccessorFactory;
import com.here.ivi.api.model.FrancaModel;
import com.here.ivi.api.model.ModelHelper;
import com.here.ivi.api.model.cppmodel.CppIncludeResolver;
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

  private final SpecAccessorFactory<InterfacePropertyAccessor, TypeCollectionPropertyAccessor>
      specAccessorFactory;
  private FrancaModel<InterfacePropertyAccessor, TypeCollectionPropertyAccessor> model;
  private final FrancaModelLoader<InterfacePropertyAccessor, TypeCollectionPropertyAccessor>
      francaModelLoader;
  private Collection<File> currentFiles;
  private final AndroidValidator validator;

  public AndroidGeneratorSuite() {
    this.specAccessorFactory = new AndroidSpecAccessorFactory();
    this.validator = new AndroidValidator();
    this.francaModelLoader = new FrancaModelLoader<>(specAccessorFactory);
  }

  public AndroidGeneratorSuite(
      final AndroidSpecAccessorFactory specAccessorFactory,
      final AndroidValidator validator,
      final FrancaModelLoader<InterfacePropertyAccessor, TypeCollectionPropertyAccessor>
          francaModelLoader) {
    this.specAccessorFactory = specAccessorFactory;
    this.validator = validator;
    this.francaModelLoader = francaModelLoader;
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
    CppNameRules cppNameRules = new BaseApiNameRules();
    CppIncludeResolver cppIncludeResolver = new CppIncludeResolver(model);

    // Java generator needs:
    // - java name rules
    JavaGenerator javaGenerator = new JavaGenerator();

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
    JavaNativeInterfacesGenerator jniGenerator = new JavaNativeInterfacesGenerator(cppNameRules);

    Stream<GeneratedFile> generatorStream =
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

    return generatorStream.filter(Objects::nonNull).collect(Collectors.toList());
  }
}
