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
import com.here.ivi.api.generator.common.cpp.TypeGenerationHelper;
import com.here.ivi.api.model.common.LazyInternalInclude;
import com.here.ivi.api.model.cppmodel.CppClass;
import com.here.ivi.api.model.cppmodel.CppConstant;
import com.here.ivi.api.model.cppmodel.CppElement;
import com.here.ivi.api.model.cppmodel.CppEnum;
import com.here.ivi.api.model.cppmodel.CppField;
import com.here.ivi.api.model.cppmodel.CppMethod;
import com.here.ivi.api.model.cppmodel.CppParameter;
import com.here.ivi.api.model.cppmodel.CppStruct;
import com.here.ivi.api.model.cppmodel.CppType;
import com.here.ivi.api.model.cppmodel.CppTypeDef;
import com.here.ivi.api.model.cppmodel.CppValue;
import com.here.ivi.api.model.franca.DefinedBy;
import com.here.ivi.api.model.franca.FrancaElement;
import com.here.ivi.api.model.rules.InstanceRules;
import java.util.List;
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
import org.franca.core.franca.FTypeRef;
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

    List<CppElement> previousResults = getCurrentContext().previousResults;
    cppClass.methods.addAll(CollectionsHelper.getAllOfType(previousResults, CppMethod.class));
    cppClass.structs.addAll(CollectionsHelper.getAllOfType(previousResults, CppStruct.class));

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
          || cppElement instanceof CppEnum
          || cppElement instanceof CppConstant) {
        storeResult(cppElement);
      }
    }

    closeContext();
  }

  @Override
  public void finishBuilding(FConstantDef francaConstant) {

    String name = CppNameRules.getConstantName(francaConstant.getName());
    CppType type = CppTypeMapper.map(rootModel, francaConstant);
    CppValue value = CppValueMapper.map(type, francaConstant.getRhs());

    CppConstant cppConstant = new CppConstant(name, type, value);
    cppConstant.comment = StubCommentParser.parse(francaConstant).getMainBodyText();

    storeResult(cppConstant);
    closeContext();
  }

  @Override
  public void finishBuilding(FTypedElement francaTypedElement) {

    CppField cppField = new CppField();
    cppField.name = CppNameRules.getFieldName(francaTypedElement.getName());
    cppField.initializer = CppDefaultInitializer.map(francaTypedElement);
    cppField.comment = StubCommentParser.parse(francaTypedElement).getMainBodyText();
    cppField.type =
        CollectionsHelper.getFirstOfType(getCurrentContext().previousResults, CppType.class);

    storeResult(cppField);
    closeContext();
  }

  @Override
  public void finishBuilding(FStructType francaStructType) {

    CppStruct struct = new CppStruct(CppNameRules.getStructName(francaStructType.getName()));
    struct.comment = StubCommentParser.parse(francaStructType).getMainBodyText();
    struct.fields.addAll(
        CollectionsHelper.getAllOfType(getCurrentContext().previousResults, CppField.class));

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
            new LazyInternalInclude(DefinedBy.createFromFModelElement(francaMapType)),
            CppTypeMapper.map(rootModel, francaMapType.getKeyType()),
            CppTypeMapper.map(rootModel, francaMapType.getValueType()));

    storeResult(typeDef);
    closeContext();
  }

  @Override
  public void finishBuilding(FEnumerationType francaEnumerationType) {

    CppEnum cppEnum = TypeGenerationHelper.buildCppEnum(francaEnumerationType);

    storeResult(cppEnum);
    closeContext();
  }

  @Override
  public void finishBuilding(FTypeRef francaTypeRef) {

    storeResult(CppTypeMapper.map(rootModel, francaTypeRef));
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

    CollectionsHelper.getAllOfType(getCurrentContext().previousResults, CppParameter.class)
        .forEach(builder::inParameter);

    return builder.build();
  }

  /*
   * This method returns the namespace members for the contained FrancaElement.
   *
   * As cpp namespace is not inheriting from cpp element and cpp class has no
   * namespace member, namespaces are not handled via tree walking but processed separately.
   */
  public List<String> getNamespaceMembers() {
    return rootModel.getPackage();
  }
}
