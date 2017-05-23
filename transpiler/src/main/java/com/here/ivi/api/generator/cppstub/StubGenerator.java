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
import com.here.ivi.api.generator.common.*;
import com.here.ivi.api.generator.common.cpp.*;
import com.here.ivi.api.generator.common.cpp.templates.CppCommentHeaderTemplate;
import com.here.ivi.api.generator.common.cpp.templates.CppDelegatorTemplate;
import com.here.ivi.api.generator.cppstub.templates.EmptyBodyTemplate;
import com.here.ivi.api.generator.cppstub.templates.NotifierBodyTemplate;
import com.here.ivi.api.model.DefinedBy;
import com.here.ivi.api.model.FrancaModel;
import com.here.ivi.api.model.Includes;
import com.here.ivi.api.model.Interface;
import com.here.ivi.api.model.cppmodel.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Set;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import navigation.CppStubSpec;
import org.franca.core.franca.*;

/**
 * This generator will create the stub interfaces that will then be used by the other generators.
 */
public class StubGenerator {

  private final GeneratorSuite suite;
  private final FrancaModel<?, ?> coreModel;
  private final CppNameRules nameRules;

  private final Interface<?> iface;
  private final CppModelAccessor<? extends CppStubSpec.InterfacePropertyAccessor> rootModel;

  private static Logger logger = java.util.logging.Logger.getLogger(StubGenerator.class.getName());

  public <IA extends CppStubSpec.InterfacePropertyAccessor> StubGenerator(
      GeneratorSuite suite, FrancaModel<IA, ?> coreModel, CppNameRules rules, Interface<IA> iface) {
    this.nameRules = rules;
    this.suite = suite;
    this.coreModel = coreModel;
    this.iface = iface;

    // this is the main type of the file, all namespaces and includes have to be resolved relative to it
    rootModel = new CppModelAccessor<>(iface, nameRules);
  }

  public GeneratedFile generate() {
    CppNamespace model = buildCppModel();

    if (model.isEmpty()) {
      return null;
    }

    String outputFile = nameRules.getHeaderPath(iface);

    // find included files and resolve relative to generated path
    CppIncludeResolver resolver = new CppIncludeResolver(coreModel, outputFile);
    resolver.resolveLazyIncludes(model);

    CharSequence generatorNotice =
        CppGeneratorHelper.generateGeneratorNotice(suite, iface, outputFile);
    CharSequence innerContent = CppDelegatorTemplate.generate(new CppTemplateDelegator(), model);
    String fileContent =
        CppCommentHeaderTemplate.generate(generatorNotice, innerContent).toString();

    return new GeneratedFile(fileContent, outputFile);
  }

  private CppNamespace buildCppModel() {
    List<CppNamespace> packageNs = CppGeneratorHelper.packageToCppNamespace(iface.getPackage());

    // add to innermost namespace
    CppNamespace innermostNs = Iterables.getLast(packageNs);

    CppClass stubClass = new CppClass(nameRules.getClassName(iface.getFrancaInterface()));
    AbstractFrancaCommentParser.Comments comment =
        StubCommentParser.parse(iface.getFrancaInterface());
    stubClass.comment = comment.getMainBodyText();

    CppClass stubListenerClass =
        new CppClass(CppStubNameRules.getListenerName(iface.getFrancaInterface()));
    stubListenerClass.comment =
        "The listener for @ref "
            + stubClass.name
            + ". Implement to receive broadcasts and attribute change notifications.";

    // allow creating a shared pointer from within this class
    CppType sharedFromThis = new CppType("std::enable_shared_from_this< " + stubClass.name + " >");
    sharedFromThis.setIncludes(CppLibraryIncludes.MEMORY);
    stubClass.inheritances.add(new CppInheritance(sharedFromThis, CppInheritance.Type.Public));

    // TODO reuse TypeCollectionGenerator to generate types in interface definition

    for (FMethod method : iface.getFrancaInterface().getMethods()) {
      appendMethodElements(stubClass, method);
    }

    for (FBroadcast broadcast : iface.getFrancaInterface().getBroadcasts()) {
      appendNotifierElements(stubClass, stubListenerClass, broadcast);
    }

    for (FAttribute attribute : iface.getFrancaInterface().getAttributes()) {
      appendAttributeAccessorElements(stubClass, stubListenerClass, attribute);
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

  private void appendMethodElements(CppClass stubClass, FMethod method) {
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

      // create struct for multiple out arguments
      if (method.getOutArgs().size() > 1) {
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
                        if (isCreator(method)) {
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
      }
      // take first & only argument
      else {
        FArgument argument = method.getOutArgs().get(0);
        CppType type = CppTypeMapper.map(rootModel, argument);
        if (type.info == CppElements.TypeInfo.InterfaceInstance) {
          if (isCreator(method)) {
            type = CppTypeMapper.wrapUniquePtr(type, nameRules);
          } else {
            type = CppTypeMapper.wrapSharedPtr(type, nameRules);
          }
        }

        // document return type and append value information to type documentation
        returnComment =
            "The result type, containing either an error or the " + type.name + " value.";
        if (!errorComment.isEmpty()) {
          typeComment += StubCommentParser.FORMATTER.formatWithTag("@argument Value", argument);
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
    CppMethod cppMethod = buildStubMethod(method, returnType);
    if (!returnComment.isEmpty()) {
      cppMethod.comment += StubCommentParser.FORMATTER.formatTag("@return", returnComment);
    }
    stubClass.methods.add(cppMethod);
  }

  private void appendAttributeAccessorElements(
      CppClass stubClass, CppClass stubListenerClass, FAttribute attribute) {
    // getter
    stubClass.methods.add(buildAttributeAccessor(rootModel, attribute, AttributeAccessorMode.GET));
    // setter if not readonly
    if (!attribute.isReadonly()) {
      stubClass.methods.add(
          buildAttributeAccessor(rootModel, attribute, AttributeAccessorMode.SET));
    }
    // notifier if not subscriptions disabled
    if (!attribute.isNoSubscriptions()) {
      appendNotifierElements(stubClass, stubListenerClass, attribute);
    }
  }

  private void appendNotifierElements(
      CppClass stubClass, CppClass stubListenerClass, FAttribute attribute) {
    String uniqueNotifierName = attribute.getName() + "Changed";

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
      CppClass stubClass, CppClass stubListenerClass, FBroadcast broadcast) {
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

  private CppMethod buildStubMethod(FMethod m, CppType returnTypeName) {
    CppMethod method = new CppMethod();

    method.name = m.getName() + NameHelper.toUpperCamelCase(m.getSelector());
    method.returnType = returnTypeName;

    if (rootModel.getAccessor().getStatic(m)) {
      method.specifiers.add(CppMethod.Specifier.STATIC);
    } else {
      if (iface.getPropertyAccessor().getConst(m)) {
        // const needs to be before = 0; This smells more than the = 0 below
        method.qualifiers.add(CppMethod.Qualifier.CONST);
      }
      method.specifiers.add(CppMethod.Specifier.VIRTUAL);
      method.qualifiers.add(CppMethod.Qualifier.PURE_VIRTUAL);
    }

    for (FArgument inArg : m.getInArgs()) {
      CppParameter param = new CppParameter();
      param.name = inArg.getName();
      param.mode = CppParameter.Mode.Input;

      param.type = CppTypeMapper.map(rootModel, inArg.getType());
      if (param.type.info == CppElements.TypeInfo.InterfaceInstance) {
        param.type = CppTypeMapper.wrapSharedPtr(param.type, nameRules);
      }

      method.inParameters.add(param);
    }

    AbstractFrancaCommentParser.Comments comment = StubCommentParser.parse(m);
    method.comment = comment.getMainBodyText();

    return method;
  }

  private static final Includes.SystemInclude EXPECTED_INCLUDE =
      new Includes.SystemInclude("cpp/internal/expected.h");

  private CppMethod buildAttributeAccessor(
      CppModelAccessor<? extends CppStubSpec.InterfacePropertyAccessor> rootType,
      FAttribute attribute,
      AttributeAccessorMode mode) {
    CppMethod m = new CppMethod();
    m.specifiers.add(CppMethod.Specifier.VIRTUAL);

    CppType type = CppTypeMapper.map(rootType, attribute);
    if (type.info == CppElements.TypeInfo.InterfaceInstance) {
      type = CppTypeMapper.wrapSharedPtr(type, nameRules);
    }

    String attributeName = nameRules.getFieldName(attribute.getName());

    switch (mode) {
      case GET:
        {
          m.name = "get" + NameHelper.toUpperCamelCase(attributeName);
          m.qualifiers.add(CppMethod.Qualifier.CONST);
          m.returnType = type;
          m.comment =
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

          m.name = "set" + NameHelper.toUpperCamelCase(attributeName);
          m.inParameters.add(param);
          m.returnType = CppType.Void;
          m.comment =
              "Sets the "
                  + attributeName
                  + " attribute.\n*"
                  + StubCommentParser.FORMATTER.formatWithTag("@param " + param.name, attribute);
          break;
        }
    }

    m.qualifiers.add(CppMethod.Qualifier.PURE_VIRTUAL);

    return m;
  }

  private boolean isCreator(final FMethod m) {
    return rootModel.getAccessor().getCreates(m) != null;
  }
}
