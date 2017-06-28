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

import com.here.ivi.api.generator.common.NameHelper;
import com.here.ivi.api.generator.common.cpp.CppNameRules;
import com.here.ivi.api.generator.common.cpp.CppTypeMapper;
import com.here.ivi.api.model.common.Includes;
import com.here.ivi.api.model.cppmodel.*;
import com.here.ivi.api.model.franca.DefinedBy;
import com.here.ivi.api.model.franca.FrancaElement;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;
import navigation.BaseApiSpec;
import org.eclipse.emf.common.util.EList;
import org.franca.core.franca.FArgument;
import org.franca.core.franca.FMethod;

class StubMethodMapper {
  private static final Includes.SystemInclude EXPECTED_INCLUDE =
      new Includes.SystemInclude("cpp/internal/expected.h");

  static void mapMethodElements(
      CppClass stubClass,
      FMethod method,
      FrancaElement<? extends BaseApiSpec.InterfacePropertyAccessor> rootModel) {

    String uniqueMethodName =
        CppNameRules.getMethodName(method.getName())
            + NameHelper.toUpperCamelCase(method.getSelector());

    CppType errorType;
    String errorComment = "";
    if (method.getErrorEnum() != null) {
      errorType = CppTypeMapper.mapEnum(rootModel, method.getErrorEnum());
      errorComment = StubCommentParser.FORMATTER.readCleanedErrorComment(method);
    } else {
      errorType = CppType.VOID;
    }

    String returnComment;
    CppType returnType;

    EList<FArgument> outArgs = method.getOutArgs();
    if (outArgs.isEmpty()) {
      returnType = errorType;
      returnComment = errorComment;
    } else {
      // If outArgs size is 2 or more, the output has to be wrapped in a struct,
      // which is not supported yet.

      List<CppType> returnTypes = new ArrayList<>();
      // documentation for the result type
      String typeComment = "Result type for @ref " + stubClass.name + "::" + uniqueMethodName;

      if (!errorType.equals(CppType.VOID)) {
        returnTypes.add(errorType);
        if (!errorComment.isEmpty()) {
          // add error template arg documentation
          typeComment += StubCommentParser.FORMATTER.formatTag("@arg Error", errorComment);
        }
      }

      FArgument argument = outArgs.get(0);
      CppType type = mapCppType(rootModel, argument, method);

      // document return type and append value information to type documentation

      returnComment =
          errorType.equals(CppType.VOID)
              ? "The result type, containing " + type.name + " value."
              : "The result type, containing either an error or the " + type.name + " value.";
      if (!errorComment.isEmpty()) {
        typeComment += StubCommentParser.FORMATTER.formatWithTag("@arg Value", argument);
      }

      // register with model
      returnTypes.add(type);

      if (returnTypes.size() > 1) {
        // always wrap multiple out values (error + outArgs) in their own type
        List<String> names = returnTypes.stream().map(t -> t.name).collect(Collectors.toList());
        Set<Includes.Include> includes =
            returnTypes.stream().flatMap(t -> t.includes.stream()).collect(Collectors.toSet());
        includes.add(EXPECTED_INCLUDE);

        returnType =
            new CppType(
                DefinedBy.createFromFrancaElement(rootModel),
                "here::internal::Expected< " + String.join(", ", names) + " >",
                CppElements.TypeInfo.Complex,
                includes);

        // create & add using for this type with correct documentation
        String usingTypeName = NameHelper.toUpperCamelCase(uniqueMethodName) + "Expected";
        CppUsing using = new CppUsing(usingTypeName, returnType);
        using.comment = typeComment;
        stubClass.usings.add(using);
        returnType = new CppType(usingTypeName);
      } else {
        returnType = returnTypes.get(0);
      }
    }

    // create & add method, add return value documentation as this is not done in buildStubMethod
    CppMethod cppMethod = buildStubMethod(method, returnType, rootModel);
    if (!returnComment.isEmpty()) {
      cppMethod.comment += StubCommentParser.FORMATTER.formatTag("@return", returnComment);
    }
    stubClass.methods.add(cppMethod);
  }

  private static CppType mapCppType(
      FrancaElement<? extends BaseApiSpec.InterfacePropertyAccessor> rootModel,
      FArgument argument,
      FMethod method) {

    CppType type = CppTypeMapper.map(rootModel, argument);

    if (type.info != CppElements.TypeInfo.InterfaceInstance) {
      return type;
    }

    if (rootModel.getPropertyAccessor().getCreates(method) == null) {
      return CppTypeMapper.wrapSharedPtr(type);
    } else {
      return CppTypeMapper.wrapUniquePtr(type);
    }
  }

  private static CppMethod buildStubMethod(
      FMethod method,
      CppType returnType,
      FrancaElement<? extends BaseApiSpec.InterfacePropertyAccessor> rootModel) {

    CppMethod.Builder builder =
        new CppMethod.Builder(method.getName() + NameHelper.toUpperCamelCase(method.getSelector()))
            .returnType(returnType);

    if (rootModel.getPropertyAccessor().getStatic(method)) {
      builder.specifier(CppMethod.Specifier.STATIC);
    } else {
      if (rootModel.getPropertyAccessor().getConst(method)) {
        // const needs to be before "= 0" pure virtual specifier
        builder.qualifier(CppMethod.Qualifier.CONST);
      }
      builder.specifier(CppMethod.Specifier.VIRTUAL);
      builder.qualifier(CppMethod.Qualifier.PURE_VIRTUAL);
    }

    for (FArgument inArg : method.getInArgs()) {
      CppParameter param = new CppParameter();
      param.name = inArg.getName();
      param.mode = CppParameter.Mode.Input;

      param.type = CppTypeMapper.map(rootModel, inArg.getType());
      if (param.type.info == CppElements.TypeInfo.InterfaceInstance) {
        param.type = CppTypeMapper.wrapSharedPtr(param.type);
      }

      builder.inParameter(param);
    }

    builder.comment(StubCommentParser.parse(method).getMainBodyText());

    return builder.build();
  }
}
