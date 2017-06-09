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

import com.here.ivi.api.Transpiler;
import com.here.ivi.api.generator.baseapi.CppStubNameRules;
import com.here.ivi.api.generator.common.AbstractGeneratorSuite;
import com.here.ivi.api.generator.common.GeneratedFile;
import com.here.ivi.api.generator.common.Version;
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
import navigation.CppStubSpec.InterfacePropertyAccessor;
import navigation.CppStubSpec.TypeCollectionPropertyAccessor;

public final class AndroidGeneratorSuite extends AbstractGeneratorSuite {
  public static final String GENERATOR_NAMESPACE = "android";

  private final SpecAccessorFactory<InterfacePropertyAccessor, TypeCollectionPropertyAccessor>
      specAccessorFactory;
  private FrancaModel<InterfacePropertyAccessor, TypeCollectionPropertyAccessor> model;
  private FrancaModelLoader<InterfacePropertyAccessor, TypeCollectionPropertyAccessor> fml;
  private Collection<File> currentFiles;
  private final AndroidValidator validator;

  public AndroidGeneratorSuite(final Transpiler transpiler) {
    this(transpiler, new AndroidSpecAccessorFactory(), new AndroidValidator());
  }

  public AndroidGeneratorSuite(
      final Transpiler transpiler,
      final AndroidSpecAccessorFactory specAccessorFactory,
      final AndroidValidator validator) {
    super(transpiler);
    this.specAccessorFactory = specAccessorFactory;
    this.validator = validator;
  }

  @Override
  public Version getVersion() {
    return new Version(0, 0, 1);
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
    ResourceValidator resourceValidator = new ResourceValidator(fml.getResourceSetProvider().get());
    return resourceValidator.validate(currentFiles) && validator.validate(model);
  }

  @Override
  public void buildModel(String inputPath) {
    fml = new FrancaModelLoader<>(specAccessorFactory);

    ModelHelper.getFdeplInjector().injectMembers(fml);
    currentFiles = FrancaModelLoader.listFilesRecursively(new File(inputPath));
    model = fml.load(specAccessorFactory.getSpecPath(), currentFiles);
  }

  @Override
  public List<GeneratedFile> generateFiles() {
    CppNameRules cppNameRules = new CppStubNameRules(model);
    CppIncludeResolver cppIncludeResolver = new CppIncludeResolver(model);

    // Java generator needs:
    // - java name rules
    JavaGenerator javaGenerator = new JavaGenerator(this);

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
    JavaNativeInterfacesGenerator jniGenerator = new JavaNativeInterfacesGenerator();

    Stream<GeneratedFile> generatorStream =
        model
            .getInterfaces()
            .stream()
            .filter(
                iface ->
                    iface.getPropertyAccessor().getIsMethodContainer(iface.getFrancaInterface())
                            == null
                        || !iface
                            .getPropertyAccessor()
                            .getIsMethodContainer(iface.getFrancaInterface()))
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
