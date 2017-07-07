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
import com.here.ivi.api.generator.common.cpp.CppTypeMapper;
import com.here.ivi.api.generator.common.cpp.TypeGenerationHelper;
import com.here.ivi.api.model.common.Includes;
import com.here.ivi.api.model.cppmodel.CppClass;
import com.here.ivi.api.model.cppmodel.CppConstant;
import com.here.ivi.api.model.cppmodel.CppElement;
import com.here.ivi.api.model.cppmodel.CppEnumClass;
import com.here.ivi.api.model.cppmodel.CppField;
import com.here.ivi.api.model.cppmodel.CppMethod;
import com.here.ivi.api.model.cppmodel.CppParameter;
import com.here.ivi.api.model.cppmodel.CppStruct;
import com.here.ivi.api.model.cppmodel.CppType;
import com.here.ivi.api.model.cppmodel.CppTypeDef;
import com.here.ivi.api.model.franca.DefinedBy;
import com.here.ivi.api.model.franca.FrancaElement;
import com.here.ivi.api.model.rules.InstanceRules;
import navigation.BaseApiSpec;
import org.franca.core.franca.FArgument;
import org.franca.core.franca.FArrayType;
import org.franca.core.franca.FConstantDef;
import org.franca.core.franca.FEnumerationType;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FMapType;
import org.franca.core.franca.FMethod;
import org.franca.core.franca.FStructType;
import org.franca.core.franca.FTypeCollection;
import org.franca.core.franca.FTypeDef;
import org.franca.core.franca.FTypedElement;

public class StubModelBuilder extends AbstractModelBuilder<CppElement> {

  private final FrancaElement<?> rootModel;

  public StubModelBuilder(
      final ModelBuilderContextStack<CppElement> contextStack, final FrancaElement<?> rootModel) {
    super(contextStack);
    this.rootModel = rootModel;
  }

  public StubModelBuilder(final FrancaElement<?> rootModel) {
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

  @Override
  public void finishBuilding(FTypeCollection francaTypeCollection) {

    for (CppElement cppElement : getCurrentContext().previousResults) {
      if (cppElement instanceof CppStruct
          || cppElement instanceof CppTypeDef
          || cppElement instanceof CppEnumClass
          || cppElement instanceof CppConstant) {
        storeResult(cppElement);
      }
    }

    closeContext();
  }

  @Override
  public void finishBuilding(FConstantDef francaConstant) {

    CppConstant cppConstant = TypeGenerationHelper.buildCppConstant(rootModel, francaConstant);
    cppConstant.comment = StubCommentParser.parse(francaConstant).getMainBodyText();

    storeResult(cppConstant);
    closeContext();
  }

  @Override
  public void finishBuilding(FTypedElement francaTypedElement) {

    CppField field = TypeGenerationHelper.buildCppField(rootModel, francaTypedElement, null);
    field.comment = StubCommentParser.parse(francaTypedElement).getMainBodyText();

    storeResult(field);
    closeContext();
  }

  @Override
  public void finishBuilding(FStructType francaStructType) {

    CppStruct struct = new CppStruct();
    struct.comment = StubCommentParser.parse(francaStructType).getMainBodyText();
    struct.name = CppNameRules.getStructName(francaStructType.getName());

    for (CppElement cppElement : getCurrentContext().previousResults) {
      if (cppElement instanceof CppField) {
        struct.fields.add((CppField) cppElement);
      }
    }

    storeResult(struct);
    closeContext();
  }

  @Override
  public void finishBuilding(FTypeDef francaTypeDef) {

    if (!InstanceRules.isInstanceId(francaTypeDef)) {

      CppTypeDef typeDef = new CppTypeDef();
      typeDef.comment = StubCommentParser.parse(francaTypeDef).getMainBodyText();
      typeDef.name = CppNameRules.getTypedefName(francaTypeDef.getName());
      typeDef.targetType = CppTypeMapper.map(rootModel, francaTypeDef.getActualType());

      storeResult(typeDef);
    }

    closeContext();
  }

  @Override
  public void finishBuilding(FArrayType francaArrayType) {

    CppTypeDef typeDef = new CppTypeDef();
    typeDef.comment = StubCommentParser.parse(francaArrayType).getMainBodyText();
    typeDef.name = CppNameRules.getTypedefName(francaArrayType.getName());
    typeDef.targetType = CppTypeMapper.defineArray(rootModel, francaArrayType);

    storeResult(typeDef);
    closeContext();
  }

  @Override
  public void finishBuilding(FMapType francaMapType) {

    CppTypeDef typeDef = new CppTypeDef();
    typeDef.comment = StubCommentParser.parse(francaMapType).getMainBodyText();
    typeDef.name = CppNameRules.getTypedefName(francaMapType.getName());
    typeDef.targetType =
        CppTypeMapper.wrapMapType(
            new Includes.LazyInternalInclude(DefinedBy.createFromFModelElement(francaMapType)),
            CppTypeMapper.map(rootModel, francaMapType.getKeyType()),
            CppTypeMapper.map(rootModel, francaMapType.getValueType()));

    storeResult(typeDef);
    closeContext();
  }

  @Override
  public void finishBuilding(FEnumerationType francaEnumerationType) {

    CppEnumClass enumClass = new CppEnumClass();
    enumClass.enumeration = TypeGenerationHelper.buildCppEnum(francaEnumerationType);

    storeResult(enumClass);
    closeContext();
  }

  private CppMethod buildCppMethod(
      FMethod francaMethod, CppType returnType, String returnTypeComment) {

    String methodName =
        CppNameRules.getMethodName(francaMethod.getName())
            + NameHelper.toUpperCamelCase(francaMethod.getSelector());

    CppMethod.Builder builder = new CppMethod.Builder(methodName).returnType(returnType);

    BaseApiSpec.IDataPropertyAccessor propertyAccessor = rootModel.getPropertyAccessor();
    if (propertyAccessor instanceof BaseApiSpec.InterfacePropertyAccessor) {
      BaseApiSpec.InterfacePropertyAccessor interfacePropertyAccessor =
          (BaseApiSpec.InterfacePropertyAccessor) propertyAccessor;
      if (interfacePropertyAccessor.getStatic(francaMethod)) {
        builder.specifier(CppMethod.Specifier.STATIC);
      } else {
        if (interfacePropertyAccessor.getConst(francaMethod)) {
          // const needs to be before "= 0" pure virtual specifier
          builder.qualifier(CppMethod.Qualifier.CONST);
        }
        builder.specifier(CppMethod.Specifier.VIRTUAL);
        builder.qualifier(CppMethod.Qualifier.PURE_VIRTUAL);
      }
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
