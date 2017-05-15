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
import com.here.ivi.api.generator.common.ClangFormatter;
import com.here.ivi.api.generator.common.ConditionalExecutor;
import com.here.ivi.api.generator.common.FileTool;
import com.here.ivi.api.generator.common.GeneratedFile;
import com.here.ivi.api.generator.common.Version;
import com.here.ivi.api.generator.common.cpp.StructWithMethodsGenerator;
import com.here.ivi.api.generator.common.cpp.TypeCollectionGenerator;
import com.here.ivi.api.loader.FrancaModelLoader;
import com.here.ivi.api.loader.SpecAccessorFactory;
import com.here.ivi.api.loader.cppstub.CppStubSpecAccessorFactory;
import com.here.ivi.api.model.FrancaModel;
import com.here.ivi.api.model.ModelHelper;
import com.here.ivi.api.model.rules.StructMethodRules;
import com.here.ivi.api.validator.common.BasicValidator;
import com.here.ivi.api.validator.cppstub.CppStubValidator;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.Charset;
import java.util.Arrays;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import navigation.CppStubSpec.InterfacePropertyAccessor;
import navigation.CppStubSpec.TypeCollectionPropertyAccessor;
import org.apache.commons.io.IOUtils;
import org.eclipse.emf.ecore.resource.ResourceSet;

/**
 * This generator will build all the CppStubs that will have to be implemented on the client
 * side @ref StubGenerator as well as the data used by this stubs @ref TypeCollectionGenerator.
 *
 * <p>It is the underlying generator, that all others depend on, as they will invoke the actual
 * implementation through the Stub interfaces.
 */
public class CppStubGeneratorSuite extends AbstractGeneratorSuite {

  private final SpecAccessorFactory<InterfacePropertyAccessor, TypeCollectionPropertyAccessor>
      specAccessorFactory;
  private final CppStubValidator validator = new CppStubValidator();
  private FrancaModel<InterfacePropertyAccessor, TypeCollectionPropertyAccessor> model;
  private FrancaModelLoader<InterfacePropertyAccessor, TypeCollectionPropertyAccessor> fml;
  private Collection<File> currentFiles;

  public CppStubGeneratorSuite(Transpiler tp) {
    super(tp);
    specAccessorFactory = new CppStubSpecAccessorFactory();
  }

  @Override
  public List<GeneratedFile> generateFiles() {
    // TODO add model null check

    CppStubNameRules nameRules = new CppStubNameRules(model);

    StructWithMethodsGenerator structGenerator =
        new StructWithMethodsGenerator(this, nameRules, model);

    // partition model into ifaces, typecollections and structWithMethods and generate files from that
    Stream<GeneratedFile> generatorStreams =
        StructMethodRules.partitionModel(
            model,
            iface -> {
              StubGenerator generator = new StubGenerator(this, model, nameRules, iface);
              List<GeneratedFile> files = new LinkedList<>();
              files.add(generator.generate());
              return files;
            },
            typeCollection -> {
              TypeCollectionGenerator generator =
                  new TypeCollectionGenerator(this, model, nameRules, typeCollection);
              return generator.generate();
            },
            structMethodPair ->
                structGenerator.generate(structMethodPair.iface, structMethodPair.type));

    List<GeneratedFile> list =
        generatorStreams.filter(Objects::nonNull).collect(Collectors.toList());
    final String targetDir = "src/";
    list.add(copyTarget("here/internal/AsyncAPI.h", targetDir));
    list.add(copyTarget("here/internal/AsyncAPI.cpp", targetDir));
    list.add(copyTarget("here/internal/expected.h", targetDir));
    list.add(copyTarget("here/internal/ListenerVector.h", targetDir));

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
    ResourceSet rs = fml.getResourceSetProvider().get();
    return BasicValidator.validate(rs, currentFiles) && validator.validate(model);
  }

  @Override
  protected List<FileTool> registerTools() {
    List<FileTool> tools = new LinkedList<>();
    try {
      tools.add(
          new ConditionalExecutor(
              ConditionalExecutor.fileExtensionFilter(Arrays.asList("cpp", "h")),
              new ClangFormatter("cpp_style/.clang-format", ClangFormatter.Language.CPP)));
    } catch (IOException e) {
      throw new TranspilerExecutionException("Registering tools failed with error:", e);
    }
    return tools;
  }
}
