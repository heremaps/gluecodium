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

import com.google.common.collect.Iterables;
import com.here.ivi.api.generator.baseapi.templates.EmptyBodyTemplate;
import com.here.ivi.api.generator.baseapi.templates.NotifierBodyTemplate;
import com.here.ivi.api.generator.common.CommentFormatter;
import com.here.ivi.api.generator.common.CppElementFactory;
import com.here.ivi.api.generator.common.NameHelper;
import com.here.ivi.api.generator.common.cpp.*;
import com.here.ivi.api.model.DefinedBy;
import com.here.ivi.api.model.FrancaElement;
import com.here.ivi.api.model.Includes;
import com.here.ivi.api.model.Interface;
import com.here.ivi.api.model.cppmodel.CppClass;
import com.here.ivi.api.model.cppmodel.CppElements;
import com.here.ivi.api.model.cppmodel.CppInheritance;
import com.here.ivi.api.model.cppmodel.CppMethod;
import com.here.ivi.api.model.cppmodel.CppModelAccessor;
import com.here.ivi.api.model.cppmodel.CppNamespace;
import com.here.ivi.api.model.cppmodel.CppParameter;
import com.here.ivi.api.model.cppmodel.CppType;
import com.here.ivi.api.model.cppmodel.CppUsing;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;
import navigation.BaseApiSpec;
import org.franca.core.franca.FAttribute;
import org.franca.core.franca.FBroadcast;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FMethod;
import org.franca.core.franca.FType;
import org.franca.core.franca.FTypeDef;

/**
 * This generator will create the stub interfaces that will then be used by the other generators.
 */
public class StubMapper extends AbstractCppModelMapper {
  private final StubMethodMapper methodMapper;

  StubMapper() {
    this(new StubMethodMapper());
  }

  StubMapper(StubMethodMapper methodMapper) {
    this.methodMapper = methodMapper;
  }

  public CppNamespace mapFrancaModelToCppModel(FrancaElement<?> francaElement) {

    if (!(francaElement instanceof Interface<?>)) {
      return null;
    }

    Interface<?> iface = (Interface<?>) francaElement;
    List<CppNamespace> packageNs = packageToCppNamespace(iface.getPackage());

    if (packageNs.isEmpty()) {
      return null;
    }

    String stubClassName = CppNameRules.getClassName(iface.getFrancaInterface());
    CppClass.Builder stubClassBuilder =
        new CppClass.Builder(stubClassName)
            .comment(StubCommentParser.parse(iface.getFrancaInterface()).getMainBodyText());

    String stubListenerName = CppNameRules.getListenerName(iface.getFrancaInterface());
    CppClass stubListenerClass =
        new CppClass.Builder(stubListenerName)
            .comment(
                "The listener for @ref "
                    + stubClassName
                    + ". Implement to receive broadcasts and attribute change notifications.")
            .build();

    // TODO APIGEN-126: use a builder for CppClass for fill the fields: methods, inheritances, ..

    CppModelAccessor<? extends BaseApiSpec.InterfacePropertyAccessor> rootModel =
        new CppModelAccessor<>(iface);

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

    for (FMethod method : iface.getFrancaInterface().getMethods()) {
      methodMapper.mapMethodElements(stubClass, method, rootModel);
    }

    for (FBroadcast broadcast : iface.getFrancaInterface().getBroadcasts()) {
      appendNotifierElements(stubClass, stubListenerClass, broadcast, rootModel);
    }

    for (FAttribute attribute : iface.getFrancaInterface().getAttributes()) {
      appendAttributeAccessorElements(stubClass, stubListenerClass, attribute, rootModel);
    }

    // add to innermost namespace
    CppNamespace innermostNs = Iterables.getLast(packageNs);

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
                      rootModel, baseDefinition, CppNameRules.getClassName(base)),
                  new Includes.LazyInternalInclude(
                      baseDefinition, Includes.InternalType.Interface)),
              CppInheritance.Type.Public));

      // TODO ensure that there is actually a listener for the base class (go through broadcasts & attributes)
      stubListenerClass.inheritances.add(
          new CppInheritance(
              new CppType(
                  CppNamespaceUtils.getCppTypename(
                      rootModel, baseDefinition, CppNameRules.getListenerName(base)),
                  new Includes.LazyInternalInclude(
                      baseDefinition, Includes.InternalType.Interface)),
              CppInheritance.Type.Public));
    }

    // add to innermost namespace
    innermostNs.members.add(stubClass);

    // return outermost namespace
    return Iterables.getFirst(packageNs, null);
  }

  private void appendAttributeAccessorElements(
      CppClass stubClass,
      CppClass stubListenerClass,
      FAttribute attribute,
      CppModelAccessor<? extends BaseApiSpec.InterfacePropertyAccessor> rootModel) {
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
      CppModelAccessor<? extends BaseApiSpec.InterfacePropertyAccessor> rootModel) {

    CppParameter param = new CppParameter();
    param.name = attribute.getName();
    param.mode = CppParameter.Mode.Input;
    param.type = CppTypeMapper.map(rootModel, attribute);
    if (param.type.info == CppElements.TypeInfo.InterfaceInstance) {
      param.type = CppTypeMapper.wrapSharedPtr(param.type);
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
                    param.type = CppTypeMapper.wrapSharedPtr(param.type);
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
    CppMethod.Builder builder =
        new CppMethod.Builder("notify" + NameHelper.toUpperCamelCase(baseName))
            .specifier(CppMethod.Specifier.INLINE)
            .bodyTemplate(
                new NotifierBodyTemplate(
                    stubListenerClass.name, "on" + NameHelper.toUpperCamelCase(baseName)));

    for (CppParameter parameter : parameters) {
      builder.inParameter(parameter);
    }

    return builder.build();
  }

  // they will be implemented by the next generator or other stubs
  private CppMethod buildListenerMethod(String baseName, List<CppParameter> parameters) {
    CppMethod.Builder builder =
        new CppMethod.Builder("on" + NameHelper.toUpperCamelCase(baseName))
            .specifier(CppMethod.Specifier.VIRTUAL)
            .bodyTemplate(new EmptyBodyTemplate());

    for (CppParameter parameter : parameters) {
      builder.inParameter(parameter);
    }

    return builder.build();
  }

  private CppMethod buildAttributeAccessor(
      CppModelAccessor<? extends BaseApiSpec.InterfacePropertyAccessor> rootModel,
      FAttribute attribute,
      AttributeAccessorMode mode) {

    String attributeName = CppNameRules.getFieldName(attribute.getName());
    String methodName =
        (mode == AttributeAccessorMode.GET ? "get" : "set")
            + NameHelper.toUpperCamelCase(attributeName);
    CppMethod.Builder builder = new CppMethod.Builder(methodName);
    builder.specifier(CppMethod.Specifier.VIRTUAL);

    CppType type = CppTypeMapper.map(rootModel, attribute);
    if (type.info == CppElements.TypeInfo.InterfaceInstance) {
      type = CppTypeMapper.wrapSharedPtr(type);
    }

    switch (mode) {
      case GET:
        {
          builder
              .qualifier(CppMethod.Qualifier.CONST)
              .returnType(type)
              .comment(
                  "Reads the "
                      + attributeName
                      + " attribute.\n*"
                      + StubCommentParser.FORMATTER.formatWithTag("@return", attribute));
          break;
        }
      case SET:
        {
          CppParameter param = new CppParameter();
          param.name = NameHelper.toLowerCamelCase(attributeName);
          param.mode = CppParameter.Mode.Input;
          param.type = type;

          builder
              .inParameter(param)
              .comment(
                  "Sets the "
                      + attributeName
                      + " attribute.\n*"
                      + StubCommentParser.FORMATTER.formatWithTag(
                          "@param " + param.name, attribute));
          break;
        }
    }

    builder.qualifier(CppMethod.Qualifier.PURE_VIRTUAL);
    return builder.build();
  }
}
