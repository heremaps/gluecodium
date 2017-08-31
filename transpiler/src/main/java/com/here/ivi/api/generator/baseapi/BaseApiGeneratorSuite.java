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
import com.here.ivi.api.generator.common.FrancaTreeWalker;
import com.here.ivi.api.generator.common.GeneratedFile;
import com.here.ivi.api.generator.common.GeneratorSuite;
import com.here.ivi.api.generator.common.TemplateEngine;
import com.here.ivi.api.generator.cpp.CppGenerator;
import com.here.ivi.api.generator.cpp.CppNameRules;
import com.here.ivi.api.loader.FrancaModelLoader;
import com.here.ivi.api.loader.baseapi.BaseApiSpecAccessorFactory;
import com.here.ivi.api.model.cppmodel.CppIncludeResolver;
import com.here.ivi.api.model.cppmodel.CppNamespace;
import com.here.ivi.api.model.franca.DefinedBy;
import com.here.ivi.api.model.franca.FrancaElement;
import com.here.ivi.api.model.franca.FrancaModel;
import com.here.ivi.api.model.franca.Interface;
import com.here.ivi.api.model.franca.ModelHelper;
import com.here.ivi.api.model.franca.TypeCollection;
import com.here.ivi.api.validator.baseapi.BaseApiModelValidator;
import com.here.ivi.api.validator.common.ResourceValidator;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.Charset;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import org.apache.commons.io.IOUtils;
import org.eclipse.emf.ecore.resource.ResourceSet;

/**
 * This generator will build all the BaseApis that will have to be implemented on the client
 * side @ref CppMapper as well as the data used by @ref TypeCollectionMapper.
 *
 * <p>It is the underlying generator, that all others depend on, as they will invoke the actual
 * implementation through the C++ interfaces.
 */
public final class BaseApiGeneratorSuite implements GeneratorSuite {

  private final BaseApiModelValidator validator;
  private FrancaModel model;
  private final FrancaModelLoader francaModelLoader;
  private Collection<File> currentFiles;

  @SuppressWarnings("unused")
  public BaseApiGeneratorSuite() {
    this(new BaseApiModelValidator(), new FrancaModelLoader());
  }

  public BaseApiGeneratorSuite(
      final BaseApiModelValidator validator, final FrancaModelLoader francaModelLoader) {
    this.validator = validator;
    this.francaModelLoader = francaModelLoader;
  }

  public List<GeneratedFile> generate() {

    if (model == null) {
      return Collections.emptyList();
    }

    CppGenerator generator = new CppGenerator(new CppIncludeResolver(model));

    List<GeneratedFile> generatedFiles =
        Stream.concat(model.getInterfaces().stream(), model.getTypeCollections().stream())
            .map(iface -> generateFromFrancaElement(iface, generator))
            .filter(Objects::nonNull)
            .collect(Collectors.toList());

    generatedFiles.add(copyTarget("cpp/internal/expected.h", "src/"));

    return generatedFiles;
  }

  public static GeneratedFile copyTarget(String fileName, String targetDir) {
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
    return BaseApiSpecAccessorFactory.getSpecPath();
  }

  @Override
  public void buildModel(String inputPath) {
    ModelHelper.getFdeplInjector().injectMembers(francaModelLoader);
    currentFiles = FrancaModelLoader.listFilesRecursively(new File(inputPath));

    model = francaModelLoader.load(getSpecPath(), currentFiles);
  }

  @Override
  public boolean validate() {
    if (model == null) {
      return false;
    }

    ResourceSet resources = francaModelLoader.getResourceSetProvider().get();
    return ResourceValidator.validate(resources, currentFiles) && validator.validate(model);
  }

  public FrancaModel getModel() {
    return model;
  }

  public Collection<File> getCurrentFiles() {
    return currentFiles;
  }

  private GeneratedFile generateFromFrancaElement(
      FrancaElement francaElement, CppGenerator generator) {

    CppNamespace cppModel = mapFrancaModelToCppModel(francaElement);
    String fileName = CppNameRules.getHeaderPath(francaElement);
    CharSequence copyRightNotice = generateGeneratorNotice(francaElement, fileName);
    return generator.generateCode(cppModel, fileName, copyRightNotice);
  }

  private CharSequence generateGeneratorNotice(FrancaElement element, String outputTarget) {

    Map<String, String> generatorNoticeData = new HashMap<>();
    generatorNoticeData.put("generatorName", getName());
    generatorNoticeData.put("outputFile", outputTarget);
    generatorNoticeData.put("elementName", element.getName());
    generatorNoticeData.put("elementVersion", element.getVersion().toString());
    generatorNoticeData.put("date", new SimpleDateFormat("dd.MM.YYYY").format(new Date()));

    return TemplateEngine.render("common/GeneratorNotice", generatorNoticeData);
  }

  private static CppNamespace mapFrancaModelToCppModel(FrancaElement francaElement) {

    if (francaElement instanceof Interface) {
      return mapFrancaInterfaceToCppModel((Interface) francaElement);
    }
    if (francaElement instanceof TypeCollection) {
      return mapFrancaTypeCollectionToCppModel((TypeCollection) francaElement);
    }
    return null;
  }

  private static CppNamespace mapFrancaInterfaceToCppModel(Interface anInterface) {

    List<String> outmostQualifier = anInterface.getModelInfo().getPackageNames();

    CppModelBuilder builder = new CppModelBuilder(anInterface);
    FrancaTreeWalker treeWalker = new FrancaTreeWalker(Collections.singletonList(builder));

    treeWalker.walk(anInterface);

    CppNamespace namespace = new CppNamespace(outmostQualifier);
    namespace.members.addAll(builder.getResults());

    return namespace;
  }

  private static CppNamespace mapFrancaTypeCollectionToCppModel(TypeCollection typeCollection) {

    List<String> outmostQualifier =
        CppNameRules.getNamespace(DefinedBy.createFromFrancaElement(typeCollection));

    outmostQualifier.add(
        CppNameRules.getTypeCollectionName(typeCollection.getFrancaTypeCollection().getName()));

    CppModelBuilder builder = new CppModelBuilder(typeCollection);
    FrancaTreeWalker treeWalker = new FrancaTreeWalker(Collections.singletonList(builder));

    treeWalker.walk(typeCollection);

    CppNamespace namespace = new CppNamespace(outmostQualifier);
    namespace.members.addAll(builder.getResults());

    return namespace;
  }
}
