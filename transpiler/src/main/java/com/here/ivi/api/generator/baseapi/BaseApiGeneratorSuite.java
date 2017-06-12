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

package com.here.ivi.api.generator.baseapi;

import com.here.ivi.api.TranspilerExecutionException;
import com.here.ivi.api.generator.common.GeneratedFile;
import com.here.ivi.api.generator.common.GeneratorSuite;
import com.here.ivi.api.generator.common.cpp.AbstractCppModelMapper;
import com.here.ivi.api.generator.common.cpp.CppGenerator;
import com.here.ivi.api.generator.common.cpp.CppNameRules;
import com.here.ivi.api.generator.common.cpp.templates.GeneratorNoticeTemplate;
import com.here.ivi.api.loader.FrancaModelLoader;
import com.here.ivi.api.loader.baseapi.BaseApiSpecAccessorFactory;
import com.here.ivi.api.model.FrancaElement;
import com.here.ivi.api.model.FrancaModel;
import com.here.ivi.api.model.ModelHelper;
import com.here.ivi.api.model.cppmodel.CppIncludeResolver;
import com.here.ivi.api.model.cppmodel.CppNamespace;
import com.here.ivi.api.validator.baseapi.BaseApiModelValidator;
import com.here.ivi.api.validator.common.ResourceValidator;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.Charset;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import navigation.BaseApiSpec.InterfacePropertyAccessor;
import navigation.BaseApiSpec.TypeCollectionPropertyAccessor;
import org.apache.commons.io.IOUtils;
import org.eclipse.emf.ecore.resource.ResourceSet;

/**
 * This generator will build all the BaseApis that will have to be implemented on the client
 * side @ref StubMapper as well as the data used by this stubs @ref TypeCollectionMapper.
 *
 * <p>It is the underlying generator, that all others depend on, as they will invoke the actual
 * implementation through the Stub interfaces.
 */
public final class BaseApiGeneratorSuite implements GeneratorSuite {
  private final BaseApiSpecAccessorFactory specAccessorFactory;
  private final BaseApiModelValidator validator;
  private FrancaModel<InterfacePropertyAccessor, TypeCollectionPropertyAccessor> model;
  private FrancaModelLoader<InterfacePropertyAccessor, TypeCollectionPropertyAccessor>
      francaModelLoader;
  private Collection<File> currentFiles;

  @SuppressWarnings("unused")
  public BaseApiGeneratorSuite() {
    this.specAccessorFactory = new BaseApiSpecAccessorFactory();
    this.validator = new BaseApiModelValidator();
    this.francaModelLoader = new FrancaModelLoader<>(specAccessorFactory);
  }

  public BaseApiGeneratorSuite(
      final BaseApiSpecAccessorFactory specAccessorFactory,
      final BaseApiModelValidator validator,
      final FrancaModelLoader<InterfacePropertyAccessor, TypeCollectionPropertyAccessor>
          francaModelLoader) {
    this.specAccessorFactory = specAccessorFactory;
    this.validator = validator;
    this.francaModelLoader = francaModelLoader;
  }

  public List<GeneratedFile> generate() {
    if (model == null) {
      return Collections.emptyList();
    }

    BaseApiNameRules nameRules = new BaseApiNameRules();
    CppIncludeResolver includeResolver = new CppIncludeResolver(model);

    CppGenerator generator = new CppGenerator(includeResolver);
    TypeCollectionMapper typeCollectionMapper = new TypeCollectionMapper(nameRules);
    StubMapper stubMapper = new StubMapper(nameRules);

    // process all interfaces and type collections
    Stream<GeneratedFile> generatorStreams =
        Stream.concat(
            model
                .getInterfaces()
                .stream()
                .map(iface -> generateFromFrancaElement(iface, nameRules, stubMapper, generator)),
            model
                .getTypeCollections()
                .stream()
                .map(
                    typeCollection ->
                        generateFromFrancaElement(
                            typeCollection, nameRules, typeCollectionMapper, generator)));

    List<GeneratedFile> generatedFiles =
        generatorStreams.filter(Objects::nonNull).collect(Collectors.toList());
    final String targetDir = "src/";
    generatedFiles.add(copyTarget("cpp/internal/expected.h", targetDir));
    generatedFiles.add(copyTarget("cpp/internal/ListenerVector.h", targetDir));

    return generatedFiles;
  }

  private GeneratedFile generateFromFrancaElement(
      FrancaElement<?> francaElement,
      CppNameRules nameRules,
      AbstractCppModelMapper mapper,
      CppGenerator generator) {
    String fileName = nameRules.getHeaderPath(francaElement);
    CppNamespace cppModel = mapper.mapFrancaModelToCppModel(francaElement);
    CharSequence copyRightNotice = generateGeneratorNotice(this, francaElement, fileName);
    return generator.generateCode(cppModel, fileName, copyRightNotice);
  }

  private static CharSequence generateGeneratorNotice(
      GeneratorSuite suite, FrancaElement<?> element, String outputTarget) {

    String inputDefinition = element.getName() + ':' + element.getVersion();
    return GeneratorNoticeTemplate.generate(suite, inputDefinition, outputTarget);
  }

  private static GeneratedFile copyTarget(String fileName, String targetDir) {
    InputStream stream = BaseApiGeneratorSuite.class.getClassLoader().getResourceAsStream(fileName);

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
  public String getName() {
    return "com.here.BaseApiGenerator";
  }

  @Override
  public String getSpecPath() {
    return specAccessorFactory.getSpecPath();
  }

  @Override
  public void buildModel(String inputPath) {
    ModelHelper.getFdeplInjector().injectMembers(francaModelLoader);
    currentFiles = FrancaModelLoader.listFilesRecursively(new File(inputPath));

    model = francaModelLoader.load(specAccessorFactory.getSpecPath(), currentFiles);
  }

  @Override
  public boolean validate() {
    if (model == null) {
      return false;
    }

    ResourceSet resources = francaModelLoader.getResourceSetProvider().get();
    return ResourceValidator.validate(resources, currentFiles) && validator.validate(model);
  }

  public FrancaModel<InterfacePropertyAccessor, TypeCollectionPropertyAccessor> getModel() {
    return model;
  }

  public Collection<File> getCurrentFiles() {
    return currentFiles;
  }
}
