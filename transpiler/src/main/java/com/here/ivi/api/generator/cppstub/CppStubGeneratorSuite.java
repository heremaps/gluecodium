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

package com.here.ivi.api.generator.cppstub;

import com.here.ivi.api.Transpiler;
import com.here.ivi.api.TranspilerExecutionException;
import com.here.ivi.api.generator.common.AbstractGeneratorSuite;
import com.here.ivi.api.generator.common.GeneratedFile;
import com.here.ivi.api.generator.common.Version;
import com.here.ivi.api.generator.common.cpp.StructWithMethodsGenerator;
import com.here.ivi.api.generator.common.cpp.TypeCollectionGenerator;
import com.here.ivi.api.loader.FrancaModelLoader;
import com.here.ivi.api.loader.cppstub.CppStubSpecAccessorFactory;
import com.here.ivi.api.model.FrancaModel;
import com.here.ivi.api.model.ModelHelper;
import com.here.ivi.api.model.cppmodel.CppIncludeResolver;
import com.here.ivi.api.model.rules.StructMethodRules;
import com.here.ivi.api.validator.common.ResourceValidator;
import com.here.ivi.api.validator.cppstub.CppStubModelValidator;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.Charset;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import navigation.CppStubSpec.InterfacePropertyAccessor;
import navigation.CppStubSpec.TypeCollectionPropertyAccessor;
import org.apache.commons.io.IOUtils;

/**
 * This generator will build all the CppStubs that will have to be implemented on the client
 * side @ref StubGenerator as well as the data used by this stubs @ref TypeCollectionGenerator.
 *
 * <p>It is the underlying generator, that all others depend on, as they will invoke the actual
 * implementation through the Stub interfaces.
 */
public class CppStubGeneratorSuite extends AbstractGeneratorSuite {

  private final CppStubSpecAccessorFactory specAccessorFactory;
  private final CppStubModelValidator validator;
  private FrancaModel<InterfacePropertyAccessor, TypeCollectionPropertyAccessor> model;
  private FrancaModelLoader<InterfacePropertyAccessor, TypeCollectionPropertyAccessor> fml;
  private Collection<File> currentFiles;

  public CppStubGeneratorSuite(Transpiler transpiler) {
    this(transpiler, new CppStubSpecAccessorFactory(), new CppStubModelValidator());
  }

  public CppStubGeneratorSuite(
      Transpiler transpiler,
      CppStubSpecAccessorFactory specAccessorFactory,
      CppStubModelValidator validator) {
    super(transpiler);
    this.specAccessorFactory = specAccessorFactory;
    this.validator = validator;
  }

  @Override
  public List<GeneratedFile> generateFiles() {
    // TODO add model null check

    CppStubNameRules nameRules = new CppStubNameRules(model);
    CppIncludeResolver includeResolver = new CppIncludeResolver(model);

    StubGenerator stubGenerator = new StubGenerator(this, nameRules, includeResolver);
    TypeCollectionGenerator typeCollectionGenerator =
        new TypeCollectionGenerator(this, nameRules, includeResolver);
    StructWithMethodsGenerator structGenerator =
        new StructWithMethodsGenerator(this, nameRules, includeResolver);

    // partition model into ifaces, typecollections and structWithMethods and generate files from that
    Stream<GeneratedFile> generatorStreams =
        StructMethodRules.partitionModel(
            model,
            iface -> {
              List<GeneratedFile> files = new LinkedList<>();
              files.add(stubGenerator.generate(iface));
              return files;
            },
            typeCollectionGenerator::generate,
            structMethodPair ->
                structGenerator.generate(structMethodPair.iface, structMethodPair.type));

    List<GeneratedFile> list =
        generatorStreams.filter(Objects::nonNull).collect(Collectors.toList());
    final String targetDir = "src/";
    list.add(copyTarget("cpp/internal/AsyncAPI.h", targetDir));
    list.add(copyTarget("cpp/internal/AsyncAPI.cpp", targetDir));
    list.add(copyTarget("cpp/internal/expected.h", targetDir));
    list.add(copyTarget("cpp/internal/ListenerVector.h", targetDir));

    return list;
  }

  private static GeneratedFile copyTarget(String fileName, String targetDir) {
    InputStream stream = CppStubGeneratorSuite.class.getClassLoader().getResourceAsStream(fileName);

    if (stream != null) {
      try {
        String content = IOUtils.toString(stream, Charset.defaultCharset());
        return new GeneratedFile(content, targetDir + File.separator + fileName);
      } catch (IOException e) {
        throw new TranspilerExecutionException("Copying resource file failed with error:", e);
      }
    }
    throw new TranspilerExecutionException(String.format("Failed loading resource %s.", fileName));
  }

  @Override
  public Version getVersion() {
    return new Version(0, 0, 1);
  }

  @Override
  public String getName() {
    return "com.here.CppStubGenerator";
  }

  @Override
  public String getSpecPath() {
    return specAccessorFactory.getSpecPath();
  }

  @Override
  public void buildModel(String inputPath) {
    // load model
    fml = new FrancaModelLoader<>(specAccessorFactory);

    ModelHelper.getFdeplInjector().injectMembers(fml);
    currentFiles = FrancaModelLoader.listFilesRecursively(new File(inputPath));

    model = fml.load(specAccessorFactory.getSpecPath(), currentFiles);
  }

  @Override
  public boolean validate() {
    ResourceValidator resourceValidator = new ResourceValidator(fml.getResourceSetProvider().get());
    return resourceValidator.validate(currentFiles) && validator.validate(model);
  }
}
