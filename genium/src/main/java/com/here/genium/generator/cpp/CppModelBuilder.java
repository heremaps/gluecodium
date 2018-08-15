/*
 * Copyright (C) 2016-2018 HERE Europe B.V.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
 * License-Filename: LICENSE
 */

package com.here.genium.generator.cpp;

import com.google.common.annotations.VisibleForTesting;
import com.here.genium.common.CollectionsHelper;
import com.here.genium.common.FrancaTypeHelper;
import com.here.genium.generator.common.NameRules;
import com.here.genium.generator.common.modelbuilder.AbstractModelBuilder;
import com.here.genium.generator.common.modelbuilder.ModelBuilderContextStack;
import com.here.genium.model.common.InstanceRules;
import com.here.genium.model.cpp.*;
import com.here.genium.model.franca.CommentHelper;
import com.here.genium.model.franca.FrancaDeploymentModel;
import java.util.*;
import org.eclipse.emf.ecore.EObject;
import org.franca.core.franca.*;

@SuppressWarnings({"PMD.GodClass", "PMD.TooManyMethods"})
public class CppModelBuilder extends AbstractModelBuilder<CppElement> {

  private final FrancaDeploymentModel deploymentModel;
  private final CppTypeMapper typeMapper;
  private final CppValueMapper valueMapper;

  @VisibleForTesting
  CppModelBuilder(
      final ModelBuilderContextStack<CppElement> contextStack,
      final FrancaDeploymentModel deploymentModel,
      final CppTypeMapper typeMapper,
      final CppValueMapper valueMapper) {
    super(contextStack);
    this.deploymentModel = deploymentModel;
    this.typeMapper = typeMapper;
    this.valueMapper = valueMapper;
  }

  public CppModelBuilder(
      final FrancaDeploymentModel deploymentModel,
      final CppTypeMapper typeMapper,
      final CppValueMapper valueMapper) {
    this(new ModelBuilderContextStack<>(), deploymentModel, typeMapper, valueMapper);
  }

  @Override
  public void startBuilding(final EObject object) {
    openContext();
    propagateParentNameRules();
  }

  @Override
  public void startBuilding(final FInterface francaInterface) {
    openContext();
    setNameRules(francaInterface);
  }

  @Override
  public void startBuilding(final FTypeCollection francaTypeCollection) {
    openContext();
    setNameRules(francaTypeCollection);
  }

  @Override
  public void startBuilding(final FStructType francaType) {
    openContext();
    setNameRules(francaType);
  }

  @Override
  public void startBuilding(final FEnumerationType francaType) {
    openContext();
    setNameRules(francaType);
  }

  @Override
  public void startBuildingInputArgument(FArgument francaArgument) {
    openContext();
    propagateParentNameRules();
  }

  @Override
  public void startBuildingOutputArgument(FArgument francaArgument) {
    openContext();
    propagateParentNameRules();
  }

  @Override
  public void finishBuilding(FInterface francaInterface) {

    String className = getNameRules().getTypeName(francaInterface.getName());
    String classComment = CommentHelper.getDescription(francaInterface);

    CppClass cppClass = new CppClass(className, classComment);

    FInterface parentInterface = francaInterface.getBase();
    if (parentInterface != null) {
      CppTypeRef parentTypeRef = typeMapper.mapComplexType(parentInterface);
      cppClass.inheritances.add(new CppInheritance(parentTypeRef, CppInheritance.Type.Public));
    }

    cppClass.methods.addAll(getPreviousResults(CppMethod.class));

    cppClass.members.addAll(getPreviousResults(CppEnum.class));
    cppClass.members.addAll(getPreviousResults(CppUsing.class));
    cppClass.members.addAll(getPreviousResults(CppStruct.class));
    cppClass.members.addAll(getPreviousResults(CppConstant.class));

    storeResult(cppClass);
    closeContext();
  }

  @Override
  public void finishBuilding(FMethod francaMethod) {

    CppParameter outputParameter =
        CollectionsHelper.getStreamOfType(getCurrentContext().previousResults, CppParameter.class)
            .filter(parameter -> parameter.isOutput)
            .findFirst()
            .orElse(null);
    String returnTypeComment = outputParameter != null ? outputParameter.comment : null;

    CppTypeRef errorEnumTypeRef = getPreviousResult(CppTypeRef.class);
    CppTypeRef errorType = errorEnumTypeRef != null ? CppTypeMapper.STD_ERROR_CODE_TYPE : null;
    CppTypeRef returnType = mapMethodReturnType(outputParameter, errorType);
    CppMethod cppMethod = buildCppMethod(francaMethod, returnType, returnTypeComment);

    storeResult(cppMethod);
    closeContext();
  }

  @Override
  public void finishBuildingInputArgument(FArgument francaArgument) {

    CppTypeRef cppTypeRef = getPreviousResult(CppTypeRef.class);
    NameRules nameRules = getNameRules();
    CppParameter cppParameter =
        new CppParameter(nameRules.getVariableName(francaArgument.getName()), cppTypeRef);
    cppParameter.comment = CommentHelper.getDescription(francaArgument);

    storeResult(cppParameter);
    closeContext();
  }

  @Override
  public void finishBuildingOutputArgument(FArgument francaArgument) {

    CppTypeRef cppTypeRef = getPreviousResult(CppTypeRef.class);
    CppParameter cppParameter =
        new CppParameter(
            getNameRules().getVariableName(francaArgument.getName()), cppTypeRef, true);
    cppParameter.comment = CommentHelper.getDescription(francaArgument);

    storeResult(cppParameter);
    closeContext();
  }

  @Override
  public void finishBuilding(FTypeCollection francaTypeCollection) {

    for (CppElement cppElement : getCurrentContext().previousResults) {
      if (cppElement instanceof CppEnum
          || cppElement instanceof CppConstant
          || cppElement instanceof CppUsing
          || cppElement instanceof CppStruct) {
        storeResult(cppElement);
      }
    }

    closeContext();
  }

  @Override
  public void finishBuilding(FConstantDef francaConstant) {

    List<String> nestedNameSpecifier = CppNameRules.INSTANCE.getNestedNameSpecifier(francaConstant);
    String name = getNameRules().getConstantName(francaConstant.getName());
    String fullyQualifiedName = CppNameRules.getFullyQualifiedName(nestedNameSpecifier, name);
    CppTypeRef cppTypeRef = getPreviousResult(CppTypeRef.class);
    CppValue value = getPreviousResult(CppValue.class);

    CppConstant cppConstant = new CppConstant(name, fullyQualifiedName, cppTypeRef, value);
    cppConstant.comment = CommentHelper.getDescription(francaConstant);

    storeResult(cppConstant);
    closeContext();
  }

  @Override
  public void finishBuilding(FField francaField) {

    String fieldName = francaField.getName();
    if (!deploymentModel.isExternalType((FStructType) francaField.eContainer())) {
      fieldName = getNameRules().getVariableName(fieldName);
    }
    CppTypeRef cppTypeRef = getPreviousResult(CppTypeRef.class);

    CppValue initializer = valueMapper.mapDeploymentDefaultValue(cppTypeRef, francaField);
    CppField cppField =
        CppField.builder(fieldName, cppTypeRef)
            .initializer(initializer)
            .isNotNull(deploymentModel.isNotNull(francaField))
            .build();
    cppField.comment = CommentHelper.getDescription(francaField);

    storeResult(cppField);
    closeContext();
  }

  @Override
  public void finishBuilding(FStructType francaStructType) {

    // Type definition
    boolean isExternal = deploymentModel.isExternalType(francaStructType);
    String externalName = deploymentModel.getExternalName(francaStructType);
    String name =
        externalName == null
            ? getNameRules().getTypeName(francaStructType.getName())
            : externalName;
    String fullyQualifiedName =
        CppNameRules.INSTANCE.getFullyQualifiedName(francaStructType, isExternal, externalName);

    boolean isEquatable = deploymentModel.isEquatable(francaStructType);
    CppStruct cppStruct = new CppStruct(name, fullyQualifiedName, isExternal, isEquatable);
    cppStruct.comment = CommentHelper.getDescription(francaStructType);
    cppStruct.fields.addAll(getPreviousResults(CppField.class));

    CppTypeRef parentTypeRef = getPreviousResult(CppTypeRef.class);
    if (parentTypeRef != null) {
      cppStruct.inheritances.add(new CppInheritance(parentTypeRef, CppInheritance.Type.Public));
    }
    storeResult(cppStruct);

    // Type reference
    storeResult(typeMapper.mapComplexType(francaStructType));

    closeContext();
  }

  @Override
  public void finishBuilding(FTypeDef francaTypeDef) {

    if (!InstanceRules.isInstanceId(francaTypeDef)) {
      String typeDefName = getNameRules().getTypeName(francaTypeDef.getName());
      String fullyQualifiedName = CppNameRules.INSTANCE.getFullyQualifiedName(francaTypeDef);
      CppTypeRef cppTypeRef = getPreviousResult(CppTypeRef.class);
      String comment = CommentHelper.getDescription(francaTypeDef);
      CppUsing cppUsing =
          CppUsing.builder(typeDefName, cppTypeRef)
              .fullyQualifiedName(fullyQualifiedName)
              .comment(comment)
              .build();

      storeResult(cppUsing);
    }

    closeContext();
  }

  @Override
  public void finishBuilding(FArrayType francaArrayType) {

    String name = getNameRules().getTypeName(francaArrayType.getName());
    String fullyQualifiedName = CppNameRules.INSTANCE.getFullyQualifiedName(francaArrayType);
    CppTypeRef elementType = getPreviousResult(CppTypeRef.class);
    CppTypeRef targetType =
        CppTemplateTypeRef.create(CppTemplateTypeRef.TemplateClass.VECTOR, elementType);
    String comment = CommentHelper.getDescription(francaArrayType);
    CppUsing cppUsing =
        CppUsing.builder(name, targetType)
            .fullyQualifiedName(fullyQualifiedName)
            .comment(comment)
            .build();

    storeResult(cppUsing);
    closeContext();
  }

  @Override
  public void finishBuilding(FMapType francaMapType) {

    String name = getNameRules().getTypeName(francaMapType.getName());
    String fullyQualifiedName = CppNameRules.INSTANCE.getFullyQualifiedName(francaMapType);
    List<CppTypeRef> typeRefs = getPreviousResults(CppTypeRef.class);
    CppTypeRef targetType = typeMapper.wrapMap(typeRefs.get(0), typeRefs.get(1));
    String comment = CommentHelper.getDescription(francaMapType);
    CppUsing cppUsing =
        CppUsing.builder(name, targetType)
            .fullyQualifiedName(fullyQualifiedName)
            .comment(comment)
            .build();

    storeResult(cppUsing);
    closeContext();
  }

  @Override
  public void finishBuilding(FEnumerationType francaEnumerationType) {

    // Type definition
    boolean isExternal = deploymentModel.isExternalType(francaEnumerationType);
    String externalName = deploymentModel.getExternalName(francaEnumerationType);
    String enumName =
        externalName == null
            ? getNameRules().getTypeName(francaEnumerationType.getName())
            : externalName;
    String fullyQualifiedName =
        CppNameRules.INSTANCE.getFullyQualifiedName(
            francaEnumerationType, isExternal, externalName);

    CppEnum cppEnum =
        CppEnum.builder(enumName)
            .fullyQualifiedName(fullyQualifiedName)
            .isScoped(true)
            .isExternal(isExternal)
            .build();
    cppEnum.comment = CommentHelper.getDescription(francaEnumerationType);
    cppEnum.items.addAll(getPreviousResults(CppEnumItem.class));
    storeResult(cppEnum);

    // Type reference
    storeResult(typeMapper.mapComplexType(francaEnumerationType));

    closeContext();
  }

  @Override
  public void finishBuilding(FEnumerator francaEnumerator) {

    String enumItemName = francaEnumerator.getName();
    if (!deploymentModel.isExternalType((FEnumerationType) francaEnumerator.eContainer())) {
      enumItemName = getNameRules().getConstantName(enumItemName);
    }
    CppValue cppValue = getPreviousResult(CppValue.class);

    CppEnumItem cppEnumItem = new CppEnumItem(enumItemName, cppValue);
    cppEnumItem.comment = CommentHelper.getDescription(francaEnumerator);

    storeResult(cppEnumItem);
    closeContext();
  }

  @Override
  public void finishBuilding(FInitializerExpression francaExpression) {

    storeResult(valueMapper.map(francaExpression));
    closeContext();
  }

  @Override
  public void finishBuilding(FTypeRef francaTypeRef) {

    CppTypeRef cppTypeRef = typeMapper.map(francaTypeRef);

    if (FrancaTypeHelper.isImplicitArray(francaTypeRef)) {
      cppTypeRef = CppTemplateTypeRef.create(CppTemplateTypeRef.TemplateClass.VECTOR, cppTypeRef);
    }

    storeResult(cppTypeRef);
    closeContext();
  }

  @Override
  public void finishBuilding(FAttribute francaAttribute) {

    CppTypeRef cppTypeRef = getPreviousResult(CppTypeRef.class);
    String francaComment = CommentHelper.getDescription(francaAttribute);

    boolean isBoolean = cppTypeRef.getActualType() == CppPrimitiveTypeRef.BOOL;
    String getterName = getNameRules().getGetterName(francaAttribute.getName(), isBoolean);
    CppMethod getterMethod =
        new CppMethod.Builder(getterName)
            .returnType(cppTypeRef)
            .specifier(CppMethod.Specifier.VIRTUAL)
            .qualifier(CppMethod.Qualifier.CONST)
            .qualifier(CppMethod.Qualifier.PURE_VIRTUAL)
            .comment(francaComment)
            .build();
    storeResult(getterMethod);

    if (!francaAttribute.isReadonly()) {
      String setterName = getNameRules().getSetterName(francaAttribute.getName());
      CppMethod setterMethod =
          new CppMethod.Builder(setterName)
              .returnType(CppPrimitiveTypeRef.VOID)
              .specifier(CppMethod.Specifier.VIRTUAL)
              .qualifier(CppMethod.Qualifier.PURE_VIRTUAL)
              .comment(francaComment)
              .build();
      setterMethod.parameters.add(new CppParameter("value", cppTypeRef));
      storeResult(setterMethod);
    }

    closeContext();
  }

  private CppMethod buildCppMethod(
      final FMethod francaMethod, final CppTypeRef returnType, final String returnComment) {

    String methodName = getNameRules().getFunctionName(francaMethod.getName());
    String fullyQualifiedMethodName =
        CppNameRules.getFullyQualifiedName(
            CppNameRules.INSTANCE.getNestedNameSpecifier(francaMethod), methodName);
    CppMethod.Builder builder =
        new CppMethod.Builder(methodName)
            .fullyQualifiedName(fullyQualifiedMethodName)
            .returnType(returnType);

    if (deploymentModel.isStatic(francaMethod)) {
      builder.specifier(CppMethod.Specifier.STATIC);
    } else {
      if (deploymentModel.isConst(francaMethod)) {
        // const needs to be before "= 0" pure virtual specifier
        builder.qualifier(CppMethod.Qualifier.CONST);
      }
      builder.specifier(CppMethod.Specifier.VIRTUAL);
      builder.qualifier(CppMethod.Qualifier.PURE_VIRTUAL);
    }

    builder.comment(CommentHelper.getDescription(francaMethod));
    builder.returnComment(returnComment);

    CollectionsHelper.getStreamOfType(getCurrentContext().previousResults, CppParameter.class)
        .filter(parameter -> !parameter.isOutput)
        .forEach(builder::parameter);

    return builder.build();
  }

  private CppTypeRef mapMethodReturnType(
      final CppParameter outputParameter, final CppTypeRef errorType) {

    CppTypeRef outArgType = outputParameter != null ? outputParameter.type : null;
    if (errorType == null && outArgType == null) {
      return CppPrimitiveTypeRef.VOID;
    } else if (errorType != null && outArgType == null) {
      return errorType;
    } else if (errorType == null) {
      return outArgType;
    }

    // wrap multiple out values (error + outArg) in their own type
    return typeMapper.getReturnWrapperType(outArgType, errorType);
  }

  private void propagateParentNameRules() {
    getCurrentContext().nameRules = getParentContext().nameRules;
  }

  private void setNameRules(final FModelElement francaElement) {
    getCurrentContext().nameRules = CppNameRules.selectNameRules(deploymentModel, francaElement);
  }

  private NameRules getNameRules() {
    return getCurrentContext().nameRules;
  }
}
