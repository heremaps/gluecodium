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

import com.here.ivi.api.common.CollectionsHelper;
import com.here.ivi.api.generator.common.AbstractModelBuilder;
import com.here.ivi.api.generator.common.ModelBuilderContextStack;
import com.here.ivi.api.generator.common.NameHelper;
import com.here.ivi.api.generator.common.cpp.CppDefaultInitializer;
import com.here.ivi.api.generator.common.cpp.CppNameRules;
import com.here.ivi.api.generator.common.cpp.CppTypeMapper;
import com.here.ivi.api.generator.common.cpp.CppValueMapper;
import com.here.ivi.api.model.cppmodel.CppClass;
import com.here.ivi.api.model.cppmodel.CppConstant;
import com.here.ivi.api.model.cppmodel.CppElement;
import com.here.ivi.api.model.cppmodel.CppEnum;
import com.here.ivi.api.model.cppmodel.CppEnumItem;
import com.here.ivi.api.model.cppmodel.CppField;
import com.here.ivi.api.model.cppmodel.CppMethod;
import com.here.ivi.api.model.cppmodel.CppParameter;
import com.here.ivi.api.model.cppmodel.CppStruct;
import com.here.ivi.api.model.cppmodel.CppTaggedUnion;
import com.here.ivi.api.model.cppmodel.CppTypeRef;
import com.here.ivi.api.model.cppmodel.CppUsing;
import com.here.ivi.api.model.cppmodel.CppValue;
import com.here.ivi.api.model.franca.FrancaElement;
import com.here.ivi.api.model.rules.InstanceRules;
import java.util.List;
import navigation.BaseApiSpec;
import org.franca.core.franca.FArgument;
import org.franca.core.franca.FArrayType;
import org.franca.core.franca.FCompoundType;
import org.franca.core.franca.FConstantDef;
import org.franca.core.franca.FEnumerationType;
import org.franca.core.franca.FEnumerator;
import org.franca.core.franca.FExpression;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FMapType;
import org.franca.core.franca.FMethod;
import org.franca.core.franca.FStructType;
import org.franca.core.franca.FTypeCollection;
import org.franca.core.franca.FTypeDef;
import org.franca.core.franca.FTypeRef;
import org.franca.core.franca.FTypedElement;
import org.franca.core.franca.FUnionType;

public class CppModelBuilder extends AbstractModelBuilder<CppElement> {

  private final FrancaElement<?> rootModel;

  public CppModelBuilder(
      final ModelBuilderContextStack<CppElement> contextStack, final FrancaElement<?> rootModel) {
    super(contextStack);
    this.rootModel = rootModel;
  }

  public CppModelBuilder(final FrancaElement<?> rootModel) {
    super(new ModelBuilderContextStack<>());
    this.rootModel = rootModel;
  }

  @Override
  public void finishBuilding(FInterface francaInterface) {

    String className = CppNameRules.getClassName(francaInterface.getName());

    List<CppElement> previousResults = getCurrentContext().previousResults;

    CppClass cppClass =
        new CppClass.Builder(className)
            .comment(CppCommentParser.parse(francaInterface).getMainBodyText())
            .build();

    cppClass.methods.addAll(CollectionsHelper.getAllOfType(previousResults, CppMethod.class));
    cppClass.structs.addAll(CollectionsHelper.getAllOfType(previousResults, CppStruct.class));
    cppClass.enums.addAll(CollectionsHelper.getAllOfType(previousResults, CppEnum.class));
    cppClass.usings.addAll(CollectionsHelper.getAllOfType(previousResults, CppUsing.class));

    storeResult(cppClass);
    closeContext();
  }

  @Override
  public void finishBuilding(FMethod francaMethod) {

    CppMethodMapper.ReturnTypeData returnTypeData =
        CppMethodMapper.mapMethodReturnType(francaMethod, rootModel);
    CppMethod cppMethod = buildCppMethod(francaMethod, returnTypeData.type, returnTypeData.comment);

    storeResult(cppMethod);
    closeContext();
  }

  @Override
  public void finishBuildingInputArgument(FArgument francaArgument) {

    CppTypeRef cppType = CppMethodMapper.mapArgumentType(francaArgument, null, rootModel);
    CppParameter cppParameter = new CppParameter(francaArgument.getName(), cppType);

    storeResult(cppParameter);
    closeContext();
  }

  @Override
  public void finishBuilding(FTypeCollection francaTypeCollection) {

    for (CppElement cppElement : getCurrentContext().previousResults) {
      if (cppElement instanceof CppStruct
          || cppElement instanceof CppEnum
          || cppElement instanceof CppConstant
          || cppElement instanceof CppUsing) {
        storeResult(cppElement);
      }
    }

    closeContext();
  }

  @Override
  public void finishBuilding(FConstantDef francaConstant) {

    String name = CppNameRules.getConstantName(francaConstant.getName());
    CppTypeRef type = CppTypeMapper.map(rootModel, francaConstant);
    CppValue value = CppValueMapper.map(type, francaConstant.getRhs());

    CppConstant cppConstant = new CppConstant(name, type, value);
    cppConstant.comment = CppCommentParser.parse(francaConstant).getMainBodyText();

    storeResult(cppConstant);
    closeContext();
  }

  @Override
  public void finishBuilding(FTypedElement francaTypedElement) {

    CppTypeRef cppTypeRef =
        CollectionsHelper.getFirstOfType(getCurrentContext().previousResults, CppTypeRef.class);
    String fieldName = CppNameRules.getFieldName(francaTypedElement.getName());
    CppValue cppValue = CppDefaultInitializer.map(francaTypedElement);

    CppField cppField = new CppField(cppTypeRef, fieldName, cppValue);
    cppField.comment = CppCommentParser.parse(francaTypedElement).getMainBodyText();

    storeResult(cppField);
    closeContext();
  }

  @Override
  public void finishBuilding(FStructType francaStructType) {

    finishBuildingCompoundType(francaStructType, false);
  }

  @Override
  public void finishBuilding(FTypeDef francaTypeDef) {

    if (!InstanceRules.isInstanceId(francaTypeDef)) {
      String typedefName = CppNameRules.getTypedefName(francaTypeDef.getName());
      CppTypeRef typedefType = CppTypeMapper.map(rootModel, francaTypeDef.getActualType());

      CppUsing cppUsing = new CppUsing(typedefName, typedefType);
      cppUsing.comment = CppCommentParser.parse(francaTypeDef).getMainBodyText();

      storeResult(cppUsing);
    }

    closeContext();
  }

  @Override
  public void finishBuilding(FArrayType francaArrayType) {

    String name = CppNameRules.getTypedefName(francaArrayType.getName());
    CppTypeRef targetType = CppTypeMapper.mapArray(rootModel, francaArrayType);
    CppUsing cppUsing = new CppUsing(name, targetType);
    cppUsing.comment = CppCommentParser.parse(francaArrayType).getMainBodyText();

    storeResult(cppUsing);
    closeContext();
  }

  @Override
  public void finishBuilding(FMapType francaMapType) {

    String name = CppNameRules.getTypedefName(francaMapType.getName());
    CppTypeRef targetType =
        CppTypeMapper.wrapMapType(
            CppTypeMapper.map(rootModel, francaMapType.getKeyType()),
            CppTypeMapper.map(rootModel, francaMapType.getValueType()));
    CppUsing cppUsing = new CppUsing(name, targetType);
    cppUsing.comment = CppCommentParser.parse(francaMapType).getMainBodyText();

    storeResult(cppUsing);
    closeContext();
  }

  @Override
  public void finishBuilding(FEnumerationType francaEnumerationType) {

    CppEnum cppEnum = new CppEnum(CppNameRules.getEnumName(francaEnumerationType.getName()), true);
    cppEnum.comment = CppCommentParser.parse(francaEnumerationType).getMainBodyText();
    cppEnum.items =
        CollectionsHelper.getAllOfType(getCurrentContext().previousResults, CppEnumItem.class);

    storeResult(cppEnum);
    closeContext();
  }

  @Override
  public void finishBuilding(FEnumerator francaEnumerator) {

    String enumItemName = CppNameRules.getEnumEntryName(francaEnumerator.getName());
    CppValue cppValue =
        CollectionsHelper.getFirstOfType(getCurrentContext().previousResults, CppValue.class);
    CppEnumItem cppEnumItem = new CppEnumItem(enumItemName, cppValue);
    cppEnumItem.comment = CppCommentParser.parse(francaEnumerator).getMainBodyText();

    storeResult(cppEnumItem);
    closeContext();
  }

  @Override
  public void finishBuilding(FExpression francaExpression) {

    storeResult(CppValueMapper.map(francaExpression));
    closeContext();
  }

  @Override
  public void finishBuilding(FTypeRef francaTypeRef) {

    storeResult(CppTypeMapper.map(rootModel, francaTypeRef));
    closeContext();
  }

  @Override
  public void finishBuilding(FUnionType francaUnionType) {

    finishBuildingCompoundType(francaUnionType, true);
  }

  private CppMethod buildCppMethod(
      FMethod francaMethod, CppTypeRef returnType, String returnTypeComment) {

    String methodName =
        CppNameRules.getMethodName(francaMethod.getName())
            + NameHelper.toUpperCamelCase(francaMethod.getSelector());

    CppMethod.Builder builder = new CppMethod.Builder(methodName).returnType(returnType);

    BaseApiSpec.IDataPropertyAccessor propertyAccessor = rootModel.getPropertyAccessor();
    if (propertyAccessor instanceof BaseApiSpec.InterfacePropertyAccessor) {
      BaseApiSpec.InterfacePropertyAccessor interfacePropertyAccessor =
          (BaseApiSpec.InterfacePropertyAccessor) propertyAccessor;
      Boolean isStatic = interfacePropertyAccessor.getStatic(francaMethod);
      if (isStatic != null && isStatic) {
        builder.specifier(CppMethod.Specifier.STATIC);
      } else {
        Boolean isConst = interfacePropertyAccessor.getConst(francaMethod);
        if (isConst != null && isConst) {
          // const needs to be before "= 0" pure virtual specifier
          builder.qualifier(CppMethod.Qualifier.CONST);
        }
        builder.specifier(CppMethod.Specifier.VIRTUAL);
        builder.qualifier(CppMethod.Qualifier.PURE_VIRTUAL);
      }
    }

    StringBuilder methodCommentBuilder =
        new StringBuilder(CppCommentParser.parse(francaMethod).getMainBodyText());
    if (!returnTypeComment.isEmpty()) {
      methodCommentBuilder.append(
          CppCommentParser.FORMATTER.formatTag("@return", returnTypeComment));
    }
    builder.comment(methodCommentBuilder.toString());

    CollectionsHelper.getStreamOfType(getCurrentContext().previousResults, CppParameter.class)
        .forEach(builder::parameter);

    return builder.build();
  }

  private void finishBuildingCompoundType(
      final FCompoundType francaCompoundType, final boolean isUnion) {

    String cppStructName = CppNameRules.getStructName(francaCompoundType.getName());
    CppStruct cppStruct =
        isUnion ? new CppTaggedUnion(cppStructName) : new CppStruct(cppStructName);
    cppStruct.comment = CppCommentParser.parse(francaCompoundType).getMainBodyText();

    List<CppField> elements =
        CollectionsHelper.getAllOfType(getCurrentContext().previousResults, CppField.class);

    cppStruct.fields.addAll(elements);

    storeResult(cppStruct);
    closeContext();
  }
}
