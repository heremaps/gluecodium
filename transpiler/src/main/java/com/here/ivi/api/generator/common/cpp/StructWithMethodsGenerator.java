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

package com.here.ivi.api.generator.common.cpp;

import com.google.common.collect.Iterables;
import com.here.ivi.api.TranspilerExecutionException;
import com.here.ivi.api.generator.common.GeneratedFile;
import com.here.ivi.api.generator.common.GeneratorSuite;
import com.here.ivi.api.generator.common.cpp.templates.CppCommentHeaderTemplate;
import com.here.ivi.api.generator.common.cpp.templates.CppDelegatorTemplate;
import com.here.ivi.api.generator.common.cpp.templates.CppStructWithMethodsTemplate;
import com.here.ivi.api.generator.cppstub.StubCommentParser;
import com.here.ivi.api.generator.cppstub.templates.StructCtor;
import com.here.ivi.api.model.*;
import com.here.ivi.api.model.cppmodel.*;
import com.here.ivi.api.model.rules.DefaultValuesRules;
import com.here.ivi.api.model.rules.StructMethodRules;
import java.util.List;
import java.util.logging.Logger;
import navigation.CppStubSpec;
import org.franca.core.franca.*;

public class StructWithMethodsGenerator extends AbstractCppGenerator {

  private static final Logger logger = Logger.getLogger(StructWithMethodsGenerator.class.getName());

  public StructWithMethodsGenerator(
      GeneratorSuite suite, CppNameRules nameRules, CppIncludeResolver includeResolver) {

    super(suite, nameRules, includeResolver);
  }

  public GeneratedFile generate(
      final Interface<?> methods, final TypeCollection<?> typeCollection) {

    CppNamespace ns = generateCppModel(methods, typeCollection);
    String outputFile = nameRules.getHeaderPath(typeCollection);

    includeResolver.resolveLazyIncludes(ns, outputFile);

    CharSequence generatorNotice = getGeneratorNotice(typeCollection, outputFile);
    CharSequence innerContent =
        CppDelegatorTemplate.generate(
            new CppTemplateDelegator() {
              public CharSequence generate(CppClass cppClass) {
                return CppStructWithMethodsTemplate.generate(this, cppClass);
              }
            },
            ns);
    String fileContent =
        CppCommentHeaderTemplate.generate(generatorNotice, innerContent).toString();

    return new GeneratedFile(fileContent, outputFile);
  }

  private CppNamespace generateCppModel(Interface<?> methods, TypeCollection<?> typeCollection) {

    List<CppNamespace> packageNs =
        CppGeneratorHelper.packageToCppNamespace(
            nameRules.getNamespace(DefinedBy.createFromFrancaElement(typeCollection)));

    CppClass newClass = generateClass(methods, typeCollection);

    // add to innermost namespace
    Iterables.getLast(packageNs).members.add(newClass);

    // return outermost namespace
    return Iterables.getFirst(packageNs, null);
  }

  private CppClass generateClass(
      final Interface<?> methods, final TypeCollection<?> typeCollection) {

    String newClassName = nameRules.getStructName(typeCollection.getName());
    CppClass.Builder newClassBuilder = new CppClass.Builder(newClassName);
    // find member struct ///////////////////////////
    FStructType memberStruct = StructMethodRules.findStructType(typeCollection);
    if (memberStruct == null) {
      logger.warning("Failed to find type struct! ");
      return newClassBuilder.build();
    }

    CppClass newClass =
        newClassBuilder.comment(StubCommentParser.parse(memberStruct).getMainBodyText()).build();

    // nested enums //////////////////////////
    for (FType type : typeCollection.getFrancaTypeCollection().getTypes()) {
      if (type instanceof FEnumerationType) {
        newClass.enums.add(
            TypeGenerationHelper.buildCppEnumClass(nameRules, (FEnumerationType) type));
      }
    }

    // default values of members //////////////////////////

    FCompoundInitializer defaultInitializer = null;
    for (FConstantDef constantDef : typeCollection.getFrancaTypeCollection().getConstants()) {
      // only structs of the same type as belonging interface with correct name will be checked
      if (DefaultValuesRules.isStructDefaultValueConstant(constantDef)
          && StructMethodRules.isBelongingStruct(constantDef)) {
        // is valid as constantDef was parsed as a struct ...
        defaultInitializer = (FCompoundInitializer) constantDef.getRhs();
        break;
      }
    }

    // generate fields /////////////////////////////////
    CppModelAccessor<?> rootType = new CppModelAccessor<>(typeCollection, nameRules);
    newClass.fields.addAll(
        TypeGenerationHelper.buildCppFields(rootType, memberStruct, defaultInitializer));

    // methods ////////////////////////////
    //////////////////////////////////////

    // default constructor is added via xtend template ...
    generateNonDefaultConstructors(newClass, methods);

    // constants
    for (FConstantDef constantDef : typeCollection.getFrancaTypeCollection().getConstants()) {

      // skip all default values in the generation
      if (DefaultValuesRules.isStructDefaultValueConstant(constantDef)) {
        continue;
      }

      CppConstant constant = TypeGenerationHelper.buildCppConstant(rootType, constantDef);
      if (constant.isValid()) {
        constant.comment = StubCommentParser.parse(constantDef).getMainBodyText();
        newClass.constants.add(constant);
      } else {
        throw new TranspilerExecutionException(
            String.format(
                "Failed generating constant! %s %s.",
                constantDef.getName(), constantDef.getRhs().getClass()));
      }
    }

    return newClass;
  }

  private void generateNonDefaultConstructors(CppClass newClass, Interface<?> methods) {

    if (methods == null) {
      return;
    }

    CppModelAccessor<? extends CppStubSpec.InterfacePropertyAccessor> rootModelIf =
        new CppModelAccessor<>(methods, nameRules);

    // non default-constructors ...
    StructCtor templateCtor = new StructCtor();
    methods
        .getFrancaInterface()
        .getMethods()
        .stream()
        .filter(StructMethodRules::isStructInitializer)
        .forEach(
            method -> {
              CppMethod nonDefaultCtor = new CppMethod();
              nonDefaultCtor.bodyTemplate = templateCtor;
              nonDefaultCtor.name = newClass.name;
              nonDefaultCtor.returnType = CppType.None;

              final List<FArgument> inArgs = method.getInArgs();
              if (inArgs.size() == 1) {
                nonDefaultCtor.specifiers.add(CppMethod.Specifier.EXPLICIT);
              }

              nonDefaultCtor.comment = StubCommentParser.parse(method).getMainBodyText();

              for (FArgument argument : method.getInArgs()) {
                CppParameter param = new CppParameter();
                param.name = nameRules.getArgumentName(argument.getName());
                param.type = CppTypeMapper.map(rootModelIf, argument);
                param.mode = CppParameter.Mode.Input;
                nonDefaultCtor.inParameters.add(param);
              }

              newClass.methods.add(nonDefaultCtor);
            });
  }
}
