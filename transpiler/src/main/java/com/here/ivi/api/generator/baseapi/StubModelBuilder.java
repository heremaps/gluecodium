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

import com.here.ivi.api.generator.common.AbstractModelBuilder;
import com.here.ivi.api.generator.common.ModelBuilderContextStack;
import com.here.ivi.api.generator.common.NameHelper;
import com.here.ivi.api.generator.common.cpp.CppNameRules;
import com.here.ivi.api.model.cppmodel.CppClass;
import com.here.ivi.api.model.cppmodel.CppElement;
import com.here.ivi.api.model.cppmodel.CppMethod;
import com.here.ivi.api.model.cppmodel.CppParameter;
import com.here.ivi.api.model.cppmodel.CppType;
import com.here.ivi.api.model.franca.FrancaElement;
import navigation.BaseApiSpec;
import org.franca.core.franca.FArgument;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FMethod;

public class StubModelBuilder extends AbstractModelBuilder<CppElement> {

  private final FrancaElement<? extends BaseApiSpec.InterfacePropertyAccessor> rootModel;

  public StubModelBuilder(
      final ModelBuilderContextStack<CppElement> contextStack,
      final FrancaElement<? extends BaseApiSpec.InterfacePropertyAccessor> rootModel) {
    super(contextStack);
    this.rootModel = rootModel;
  }

  public StubModelBuilder(
      final FrancaElement<? extends BaseApiSpec.InterfacePropertyAccessor> rootModel) {
    super(new ModelBuilderContextStack<>());
    this.rootModel = rootModel;
  }

  @Override
  public void finishBuilding(FInterface francaInterface) {

    CppClass.Builder stubClassBuilder =
        new CppClass.Builder(CppNameRules.getClassName(francaInterface.getName()))
            .comment(StubCommentParser.parse(francaInterface).getMainBodyText());

    CppClass cppClass = stubClassBuilder.build();

    for (CppElement cppElement : getCurrentContext().previousResults) {
      if (cppElement instanceof CppMethod) {
        cppClass.methods.add((CppMethod) cppElement);
      }
    }

    storeResult(cppClass);
    closeContext();
  }

  @Override
  public void finishBuilding(FMethod francaMethod) {

    StubMethodMapper.ReturnTypeData returnTypeData =
        StubMethodMapper.mapMethodReturnType(francaMethod, rootModel);
    CppMethod cppMethod = buildCppMethod(francaMethod, returnTypeData.type, returnTypeData.comment);

    storeResult(cppMethod);
    closeContext();
  }

  @Override
  public void finishBuildingInputArgument(FArgument francaArgument) {

    CppParameter cppParameter = new CppParameter();
    cppParameter.name = francaArgument.getName();
    cppParameter.mode = CppParameter.Mode.Input;
    cppParameter.type = StubMethodMapper.mapArgumentType(francaArgument, null, rootModel);

    storeResult(cppParameter);
    closeContext();
  }

  private CppMethod buildCppMethod(
      FMethod francaMethod, CppType returnType, String returnTypeComment) {

    String methodName =
        CppNameRules.getMethodName(francaMethod.getName())
            + NameHelper.toUpperCamelCase(francaMethod.getSelector());

    CppMethod.Builder builder = new CppMethod.Builder(methodName).returnType(returnType);

    if (rootModel.getPropertyAccessor().getStatic(francaMethod)) {
      builder.specifier(CppMethod.Specifier.STATIC);
    } else {
      if (rootModel.getPropertyAccessor().getConst(francaMethod)) {
        // const needs to be before "= 0" pure virtual specifier
        builder.qualifier(CppMethod.Qualifier.CONST);
      }
      builder.specifier(CppMethod.Specifier.VIRTUAL);
      builder.qualifier(CppMethod.Qualifier.PURE_VIRTUAL);
    }

    String methodComment = StubCommentParser.parse(francaMethod).getMainBodyText();
    if (!returnTypeComment.isEmpty()) {
      methodComment += StubCommentParser.FORMATTER.formatTag("@return", returnTypeComment);
    }
    builder.comment(methodComment);

    for (CppElement cppElement : getCurrentContext().previousResults) {
      if (cppElement instanceof CppParameter) {
        builder.inParameter((CppParameter) cppElement);
      }
    }

    return builder.build();
  }
}
