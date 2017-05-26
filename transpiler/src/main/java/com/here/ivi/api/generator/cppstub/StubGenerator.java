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

import com.google.common.collect.Iterables;
import com.here.ivi.api.generator.common.AbstractFrancaCommentParser;
import com.here.ivi.api.generator.common.CommentFormatter;
import com.here.ivi.api.generator.common.CppElementFactory;
import com.here.ivi.api.generator.common.GeneratedFile;
import com.here.ivi.api.generator.common.GeneratorSuite;
import com.here.ivi.api.generator.common.NameHelper;
import com.here.ivi.api.generator.common.cpp.AbstractCppGenerator;
import com.here.ivi.api.generator.common.cpp.AttributeAccessorMode;
import com.here.ivi.api.generator.common.cpp.CppGeneratorHelper;
import com.here.ivi.api.generator.common.cpp.CppLibraryIncludes;
import com.here.ivi.api.generator.common.cpp.CppNameRules;
import com.here.ivi.api.generator.common.cpp.CppNamespaceUtils;
import com.here.ivi.api.generator.common.cpp.CppTemplateDelegator;
import com.here.ivi.api.generator.common.cpp.CppTypeMapper;
import com.here.ivi.api.generator.common.cpp.templates.CppCommentHeaderTemplate;
import com.here.ivi.api.generator.common.cpp.templates.CppDelegatorTemplate;
import com.here.ivi.api.generator.cppstub.templates.EmptyBodyTemplate;
import com.here.ivi.api.generator.cppstub.templates.NotifierBodyTemplate;
import com.here.ivi.api.model.DefinedBy;
import com.here.ivi.api.model.Includes;
import com.here.ivi.api.model.Interface;
import com.here.ivi.api.model.cppmodel.CppClass;
import com.here.ivi.api.model.cppmodel.CppElements;
import com.here.ivi.api.model.cppmodel.CppField;
import com.here.ivi.api.model.cppmodel.CppIncludeResolver;
import com.here.ivi.api.model.cppmodel.CppInheritance;
import com.here.ivi.api.model.cppmodel.CppMethod;
import com.here.ivi.api.model.cppmodel.CppModelAccessor;
import com.here.ivi.api.model.cppmodel.CppNamespace;
import com.here.ivi.api.model.cppmodel.CppParameter;
import com.here.ivi.api.model.cppmodel.CppStruct;
import com.here.ivi.api.model.cppmodel.CppType;
import com.here.ivi.api.model.cppmodel.CppUsing;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Set;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import navigation.CppStubSpec;
import org.franca.core.franca.FArgument;
import org.franca.core.franca.FAttribute;
import org.franca.core.franca.FBroadcast;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FMethod;
import org.franca.core.franca.FType;
import org.franca.core.franca.FTypeDef;

/**
 * This generator will create the stub interfaces that will then be used by the other generators.
 */
public class StubGenerator extends AbstractCppGenerator {

  private static Logger logger = java.util.logging.Logger.getLogger(StubGenerator.class.getName());

  public StubGenerator(
      GeneratorSuite suite, CppNameRules nameRules, CppIncludeResolver includeResolver) {

    super(suite, nameRules, includeResolver);
  }

  public GeneratedFile generate(Interface<?> iface) {
    CppNamespace model = buildCppModel(iface);

    if (model.isEmpty()) {
      return null;
    }

    String outputFile = nameRules.getHeaderPath(iface);

    // find included files and resolve relative to generated path
    includeResolver.resolveLazyIncludes(model, outputFile);

    CharSequence generatorNotice = getGeneratorNotice(iface, outputFile);
    CharSequence innerContent = CppDelegatorTemplate.generate(new CppTemplateDelegator(), model);
    String fileContent =
        CppCommentHeaderTemplate.generate(generatorNotice, innerContent).toString();

    return new GeneratedFile(fileContent, outputFile);
  }

  private CppNamespace buildCppModel(Interface<?> iface) {
    List<CppNamespace> packageNs = CppGeneratorHelper.packageToCppNamespace(iface.getPackage());

    // add to innermost namespace
    CppNamespace innermostNs = Iterables.getLast(packageNs);
    String stubClassName = nameRules.getClassName(iface.getFrancaInterface());
    CppClass.Builder stubClassBuilder =
        new CppClass.Builder(stubClassName)
            .comment(StubCommentParser.parse(iface.getFrancaInterface()).getMainBodyText());

    String stubListenerName = CppStubNameRules.getListenerName(iface.getFrancaInterface());
    CppClass stubListenerClass =
        new CppClass.Builder(stubListenerName)
            .comment(
                "The listener for @ref "
                    + stubClassName
                    + ". Implement to receive broadcasts and attribute change notifications.")
            .build();

    // TODO APIGEN-126: use a builder for CppClass for fill the fields: methods, inheritances, ..

    CppModelAccessor<? extends CppStubSpec.InterfacePropertyAccessor> rootModel =
        new CppModelAccessor<>(iface, nameRules);

    for (FType type : iface.getFrancaInterface().getTypes()) {
      if (type instanceof FTypeDef) {
        FTypeDef typeDefinition = (FTypeDef) type;
        CppUsing cppUsing = CppElementFactory.create(rootModel, typeDefinition);
        if (cppUsing != null) {
          stubClassBuilder.using(cppUsing);
        }
      }
    }

    CppClass stubClass = stubClassBuilder.build();

    // allow creating a shared pointer from within this class
    CppType sharedFromThis = new CppType("std::enable_shared_from_this< " + stubClassName + " >");
    sharedFromThis.setIncludes(CppLibraryIncludes.MEMORY);
    stubClass.inheritances.add(new CppInheritance(sharedFromThis, CppInheritance.Type.Public));

    for (FMethod method : iface.getFrancaInterface().getMethods()) {
      appendMethodElements(stubClass, method, rootModel);
    }

    for (FBroadcast broadcast : iface.getFrancaInterface().getBroadcasts()) {
      appendNotifierElements(stubClass, stubListenerClass, broadcast, rootModel);
    }

    for (FAttribute attribute : iface.getFrancaInterface().getAttributes()) {
      appendAttributeAccessorElements(stubClass, stubListenerClass, attribute, rootModel);
    }

    // inherit from listener vector if there are any methods on the listener
    if (!stubListenerClass.methods.isEmpty()) {
      stubClass.inheritances.add(
          new CppInheritance(
              new CppType(
                  "here::internal::ListenerVector< " + stubListenerClass.name + " >",
                  new Includes.SystemInclude("cpp/internal/ListenerVector.h")),
              CppInheritance.Type.Public));

      innermostNs.members.add(stubListenerClass);
    }

    FInterface base = iface.getFrancaInterface().getBase();
    if (base != null) {
      DefinedBy baseDefinition = DefinedBy.createFromFModelElement(base);

      stubClass.inheritances.add(
          new CppInheritance(
              new CppType(
                  CppNamespaceUtils.getCppTypename(
                      rootModel, baseDefinition, nameRules.getClassName(base)),
                  new Includes.LazyInternalInclude(
                      baseDefinition, Includes.InternalType.Interface, nameRules)),
              CppInheritance.Type.Public));

      // TODO ensure that there is actually a listener for the base class (go through broadcasts & attributes)
      stubListenerClass.inheritances.add(
          new CppInheritance(
              new CppType(
                  CppNamespaceUtils.getCppTypename(
                      rootModel, baseDefinition, CppStubNameRules.getListenerName(base)),
                  new Includes.LazyInternalInclude(
                      baseDefinition, Includes.InternalType.Interface, nameRules)),
              CppInheritance.Type.Public));
    }

    // add to innermost namespace
    innermostNs.members.add(stubClass);

    // return outermost namespace
    return Iterables.getFirst(packageNs, null);
  }

  private void appendMethodElements(
      CppClass stubClass,
      FMethod method,
      CppModelAccessor<? extends CppStubSpec.InterfacePropertyAccessor> rootModel) {
    String uniqueMethodName =
        nameRules.getMethodName(method.getName())
            + NameHelper.toUpperCamelCase(method.getSelector());

    CppType errorType;
    String errorComment = "";
    if (method.getErrorEnum() != null) {
      errorType = CppTypeMapper.mapEnum(rootModel, method.getErrorEnum());
      errorComment = StubCommentParser.FORMATTER.readCleanedErrorComment(method);
    } else {
      logger.warning("Missing error type for method " + method.getName());
      errorType = CppType.Void;
    }

    String returnComment;
    CppType returnType;

    if (method.getOutArgs().isEmpty()) {
      returnType = errorType;
      returnComment = errorComment;
    } else {
      List<CppType> returnTypes = new ArrayList<>();
      returnTypes.add(errorType);

      // documentation for the result type
      String typeComment = "Result type for @ref " + stubClass.name + "::" + uniqueMethodName;
      if (!errorComment.isEmpty()) {
        // add error template arg documentation
        typeComment += StubCommentParser.FORMATTER.formatTag("@arg Error", errorComment);
      }

      final boolean isCreator = rootModel.getAccessor().getCreates(method) != null;
      if (method.getOutArgs().size() > 1) { // create struct for multiple out arguments
        CppStruct struct = new CppStruct();
        struct.name = NameHelper.toUpperCamelCase(uniqueMethodName) + "Result";
        struct.fields =
            method
                .getOutArgs()
                .stream()
                .map(
                    argument -> {
                      CppType type = CppTypeMapper.map(rootModel, argument);
                      if (type.info == CppElements.TypeInfo.InterfaceInstance) {
                        if (isCreator) {
                          type = CppTypeMapper.wrapUniquePtr(type, nameRules);
                        } else {
                          type = CppTypeMapper.wrapSharedPtr(type, nameRules);
                        }
                      }

                      CppField field =
                          new CppField(type, NameHelper.toLowerCamelCase(argument.getName()));
                      // document struct field with argument comment
                      field.comment = StubCommentParser.FORMATTER.readCleanedComment(argument);
                      return field;
                    })
                .collect(Collectors.toList());

        // document return type, struct and append value information to type documentation
        struct.comment = "Result struct for @ref " + stubClass.name + "::" + uniqueMethodName + ".";
        typeComment += "\n* @arg Value The value struct instance";
        returnComment = "The result type, containing an error and a struct of values.";

        // register with model
        stubClass.structs.add(struct);
        returnTypes.add(new CppType(struct.name));
      } else { // take first & only argument
        FArgument argument = method.getOutArgs().get(0);
        CppType type = CppTypeMapper.map(rootModel, argument);
        if (type.info == CppElements.TypeInfo.InterfaceInstance) {
          if (isCreator) {
            type = CppTypeMapper.wrapUniquePtr(type, nameRules);
          } else {
            type = CppTypeMapper.wrapSharedPtr(type, nameRules);
          }
        }

        // document return type and append value information to type documentation
        returnComment =
            "The result type, containing either an error or the " + type.name + " value.";
        if (!errorComment.isEmpty()) {
          typeComment += StubCommentParser.FORMATTER.formatWithTag("@arg Value", argument);
        }

        // register with model
        returnTypes.add(type);
      }

      // always wrap multiple out values (error + outArgs) in their own type
      List<String> names = returnTypes.stream().map(t -> t.name).collect(Collectors.toList());
      Set<Includes.Include> includes =
          returnTypes.stream().flatMap(t -> t.includes.stream()).collect(Collectors.toSet());
      includes.add(EXPECTED_INCLUDE);

      returnType =
          new CppType(
              rootModel.getDefiner(),
              "here::internal::Expected< " + String.join(", ", names) + " >",
              CppElements.TypeInfo.Complex,
              includes);

      // create & add using for this type with correct documentation
      String usingTypeName = NameHelper.toUpperCamelCase(uniqueMethodName) + "Expected";
      CppUsing using = new CppUsing(usingTypeName, returnType);
      using.comment = typeComment;
      stubClass.usings.add(using);
      returnType = new CppType(usingTypeName);
    }

    // create & add method, add return value documentation as this is not done in buildStubMethod
    CppMethod cppMethod = buildStubMethod(method, returnType, rootModel);
    if (!returnComment.isEmpty()) {
      cppMethod.comment += StubCommentParser.FORMATTER.formatTag("@return", returnComment);
    }
    stubClass.methods.add(cppMethod);
  }

  private void appendAttributeAccessorElements(
      CppClass stubClass,
      CppClass stubListenerClass,
      FAttribute attribute,
      CppModelAccessor<? extends CppStubSpec.InterfacePropertyAccessor> rootModel) {
    // getter
    stubClass.methods.add(buildAttributeAccessor(rootModel, attribute, AttributeAccessorMode.GET));
    // setter if not readonly
    if (!attribute.isReadonly()) {
      stubClass.methods.add(
          buildAttributeAccessor(rootModel, attribute, AttributeAccessorMode.SET));
    }
    // notifier if not subscriptions disabled
    if (!attribute.isNoSubscriptions()) {
      appendNotifierElements(stubClass, stubListenerClass, attribute, rootModel);
    }
  }

  private void appendNotifierElements(
      CppClass stubClass,
      CppClass stubListenerClass,
      FAttribute attribute,
      CppModelAccessor<? extends CppStubSpec.InterfacePropertyAccessor> rootModel) {

    CppParameter param = new CppParameter();
    param.name = attribute.getName();
    param.mode = CppParameter.Mode.Input;
    param.type = CppTypeMapper.map(rootModel, attribute);
    if (param.type.info == CppElements.TypeInfo.InterfaceInstance) {
      param.type = CppTypeMapper.wrapSharedPtr(param.type, nameRules);
    }

    // generate arguments as input params
    String arguments =
        StubCommentParser.generateParamDocumentation(
                StubCommentParser.FORMATTER,
                Collections.singletonList(attribute),
                CommentFormatter.ParameterType.Input)
            .toString();

    String uniqueNotifierName = attribute.getName() + "Changed";

    // listener method
    CppMethod listenerMethod =
        buildListenerMethod(uniqueNotifierName, Collections.singletonList(param));
    listenerMethod.comment = "Called when the attribute " + uniqueNotifierName + " was changed\n*";
    listenerMethod.comment += arguments;

    // notifier method (stub to api layer)
    CppMethod method =
        buildNotifierMethod(
            stubListenerClass, uniqueNotifierName, Collections.singletonList(param));
    method.comment =
        "Notifier for the attribute "
            + uniqueNotifierName
            + "\n"
            + "* Invokes @ref "
            + stubListenerClass.name
            + "::"
            + listenerMethod.name
            + " on all listeners.\n*";
    method.comment += arguments;

    // add to model
    stubListenerClass.methods.add(listenerMethod);
    stubClass.methods.add(method);
  }

  private void appendNotifierElements(
      CppClass stubClass,
      CppClass stubListenerClass,
      FBroadcast broadcast,
      CppModelAccessor<?> rootModel) {
    String uniqueNotifierName =
        broadcast.getName() + NameHelper.toUpperCamelCase(broadcast.getSelector());

    List<CppParameter> parameters =
        broadcast
            .getOutArgs()
            .stream()
            .map(
                argument -> {
                  CppParameter param = new CppParameter();
                  param.name = argument.getName();
                  param.mode = CppParameter.Mode.Input;

                  param.type = CppTypeMapper.map(rootModel, argument.getType());
                  if (param.type.info == CppElements.TypeInfo.InterfaceInstance) {
                    param.type = CppTypeMapper.wrapSharedPtr(param.type, nameRules);
                  }

                  return param;
                })
            .collect(Collectors.toList());

    // generate arguments as input parameters
    String arguments =
        StubCommentParser.generateParamDocumentation(
                StubCommentParser.FORMATTER,
                broadcast.getOutArgs(),
                CommentFormatter.ParameterType.Input)
            .toString();

    // listener method
    CppMethod listenerMethod = buildListenerMethod(uniqueNotifierName, parameters);
    listenerMethod.comment = "Called when the broadcast " + uniqueNotifierName + " is emitted\n*";
    listenerMethod.comment += arguments;

    // notifier method (stub to api layer)
    CppMethod method = buildNotifierMethod(stubListenerClass, uniqueNotifierName, parameters);
    method.comment =
        "Notifier for the broadcast "
            + uniqueNotifierName
            + "\n"
            + "* Invokes @ref "
            + stubListenerClass.name
            + "::"
            + listenerMethod.name
            + " on all listeners.\n*";
    method.comment += arguments;

    // add to model
    stubClass.methods.add(method);
    stubListenerClass.methods.add(listenerMethod);
  }

  // they will be called from the cpp implementation
  private CppMethod buildNotifierMethod(
      CppClass stubListenerClass, String baseName, List<CppParameter> parameters) {
    CppMethod method = new CppMethod();
    method.name = "notify" + NameHelper.toUpperCamelCase(baseName);
    method.specifiers.add(CppMethod.Specifier.INLINE);
    method.inParameters.addAll(parameters);
    method.bodyTemplate =
        new NotifierBodyTemplate(
            stubListenerClass.name, "on" + NameHelper.toUpperCamelCase(baseName));

    return method;
  }

  // they will be implemented by the next generator or other stubs
  private CppMethod buildListenerMethod(String baseName, List<CppParameter> parameters) {
    CppMethod method = new CppMethod();
    method.name = "on" + NameHelper.toUpperCamelCase(baseName);
    method.inParameters.addAll(parameters);
    method.bodyTemplate = new EmptyBodyTemplate();
    method.specifiers.add(CppMethod.Specifier.VIRTUAL);

    return method;
  }

  private CppMethod buildStubMethod(
      FMethod method,
      CppType returnTypeName,
      CppModelAccessor<? extends CppStubSpec.InterfacePropertyAccessor> rootModel) {

    CppMethod cppMethod = new CppMethod();
    cppMethod.name = method.getName() + NameHelper.toUpperCamelCase(method.getSelector());
    cppMethod.returnType = returnTypeName;

    if (rootModel.getAccessor().getStatic(method)) {
      cppMethod.specifiers.add(CppMethod.Specifier.STATIC);
    } else {
      if (rootModel.getAccessor().getConst(method)) {
        // const needs to be before = 0; This smells more than the = 0 below
        cppMethod.qualifiers.add(CppMethod.Qualifier.CONST);
      }
      cppMethod.specifiers.add(CppMethod.Specifier.VIRTUAL);
      cppMethod.qualifiers.add(CppMethod.Qualifier.PURE_VIRTUAL);
    }

    for (FArgument inArg : method.getInArgs()) {
      CppParameter param = new CppParameter();
      param.name = inArg.getName();
      param.mode = CppParameter.Mode.Input;

      param.type = CppTypeMapper.map(rootModel, inArg.getType());
      if (param.type.info == CppElements.TypeInfo.InterfaceInstance) {
        param.type = CppTypeMapper.wrapSharedPtr(param.type, nameRules);
      }

      cppMethod.inParameters.add(param);
    }

    AbstractFrancaCommentParser.Comments comment = StubCommentParser.parse(method);
    cppMethod.comment = comment.getMainBodyText();

    return cppMethod;
  }

  private static final Includes.SystemInclude EXPECTED_INCLUDE =
      new Includes.SystemInclude("cpp/internal/expected.h");

  private CppMethod buildAttributeAccessor(
      CppModelAccessor<? extends CppStubSpec.InterfacePropertyAccessor> rootType,
      FAttribute attribute,
      AttributeAccessorMode mode) {

    CppMethod method = new CppMethod();
    method.specifiers.add(CppMethod.Specifier.VIRTUAL);

    CppType type = CppTypeMapper.map(rootType, attribute);
    if (type.info == CppElements.TypeInfo.InterfaceInstance) {
      type = CppTypeMapper.wrapSharedPtr(type, nameRules);
    }

    String attributeName = nameRules.getFieldName(attribute.getName());

    switch (mode) {
      case GET:
        {
          method.name = "get" + NameHelper.toUpperCamelCase(attributeName);
          method.qualifiers.add(CppMethod.Qualifier.CONST);
          method.returnType = type;
          method.comment =
              "Reads the "
                  + attributeName
                  + " attribute.\n*"
                  + StubCommentParser.FORMATTER.formatWithTag("@return", attribute);
          break;
        }
      case SET:
        {
          CppParameter param = new CppParameter();
          param.name = NameHelper.toLowerCamelCase(attributeName);
          param.mode = CppParameter.Mode.Input;
          param.type = type;

          method.name = "set" + NameHelper.toUpperCamelCase(attributeName);
          method.inParameters.add(param);
          method.returnType = CppType.Void;
          method.comment =
              "Sets the "
                  + attributeName
                  + " attribute.\n*"
                  + StubCommentParser.FORMATTER.formatWithTag("@param " + param.name, attribute);
          break;
        }
    }

    method.qualifiers.add(CppMethod.Qualifier.PURE_VIRTUAL);

    return method;
  }
}
