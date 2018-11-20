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
import com.here.genium.generator.common.modelbuilder.AbstractModelBuilder;
import com.here.genium.generator.common.modelbuilder.ModelBuilderContextStack;
import com.here.genium.model.common.InstanceRules;
import com.here.genium.model.cpp.*;
import com.here.genium.model.franca.CommentHelper;
import com.here.genium.model.franca.FrancaDeploymentModel;
import java.util.*;
import java.util.stream.Collectors;
import org.franca.core.franca.*;

public class CppModelBuilder extends AbstractModelBuilder<CppElement> {

  private final FrancaDeploymentModel deploymentModel;
  private final CppTypeMapper typeMapper;
  private final CppValueMapper valueMapper;
  private final CppNameResolver nameResolver;

  @VisibleForTesting
  CppModelBuilder(
      final ModelBuilderContextStack<CppElement> contextStack,
      final FrancaDeploymentModel deploymentModel,
      final CppTypeMapper typeMapper,
      final CppValueMapper valueMapper,
      final CppNameResolver nameResolver) {
    super(contextStack);
    this.deploymentModel = deploymentModel;
    this.typeMapper = typeMapper;
    this.valueMapper = valueMapper;
    this.nameResolver = nameResolver;
  }

  public CppModelBuilder(
      final FrancaDeploymentModel deploymentModel,
      final CppTypeMapper typeMapper,
      final CppValueMapper valueMapper,
      final CppNameResolver nameResolver) {
    this(new ModelBuilderContextStack<>(), deploymentModel, typeMapper, valueMapper, nameResolver);
  }

  @Override
  public void finishBuilding(FInterface francaInterface) {

    String className = nameResolver.getName(francaInterface);
    String fullyQualifiedName = nameResolver.getFullyQualifiedName(francaInterface);
    String classComment = CommentHelper.getDescription(francaInterface);
    boolean isExternal = deploymentModel.isExternalType(francaInterface);
    CppClass cppClass = new CppClass(className, fullyQualifiedName, classComment, isExternal);

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
            .filter(CppParameter::isOutput)
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
    finishBuildingFrancaArgument(francaArgument, false);
  }

  @Override
  public void finishBuildingOutputArgument(FArgument francaArgument) {
    finishBuildingFrancaArgument(francaArgument, true);
  }

  private void finishBuildingFrancaArgument(
      final FArgument francaArgument, final boolean isOutput) {

    String name = nameResolver.getName(francaArgument);
    CppTypeRef cppTypeRef = getPreviousResult(CppTypeRef.class);
    CppParameter cppParameter =
        new CppParameter(name, cppTypeRef, isOutput, deploymentModel.isNotNull(francaArgument));
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

    String name = nameResolver.getName(francaConstant);
    String fullyQualifiedName = nameResolver.getFullyQualifiedName(francaConstant);
    CppTypeRef cppTypeRef = getPreviousResult(CppTypeRef.class);
    CppValue value = getPreviousResult(CppValue.class);

    CppConstant cppConstant = new CppConstant(name, fullyQualifiedName, cppTypeRef, value);
    cppConstant.comment = CommentHelper.getDescription(francaConstant);

    storeResult(cppConstant);
    closeContext();
  }

  @Override
  public void finishBuilding(FField francaField) {

    CppTypeRef cppTypeRef = getPreviousResult(CppTypeRef.class);
    CppValue initializer = valueMapper.mapDeploymentDefaultValue(cppTypeRef, francaField);
    CppField cppField =
        CppField.builder(nameResolver.getName(francaField), cppTypeRef)
            .initializer(initializer)
            .isNotNull(deploymentModel.isNotNull(francaField))
            .build();
    cppField.comment = CommentHelper.getDescription(francaField);

    storeResult(cppField);
    closeContext();
  }

  @Override
  public void finishBuilding(FStructType francaStructType) {

    CppStruct cppStruct =
        CppStruct.builder()
            .name(nameResolver.getName(francaStructType))
            .fullyQualifiedName(nameResolver.getFullyQualifiedName(francaStructType))
            .comment(CommentHelper.getDescription(francaStructType))
            .fields(getPreviousResults(CppField.class))
            .isExternal(deploymentModel.isExternalType(francaStructType))
            .isEquatable(deploymentModel.isEquatable(francaStructType))
            .isImmutable(deploymentModel.isImmutable(francaStructType))
            .build();

    storeResult(cppStruct);
    closeContext();
  }

  @Override
  public void finishBuilding(FTypeDef francaTypeDef) {

    if (!InstanceRules.isInstanceId(francaTypeDef)) {
      CppTypeRef cppTypeRef = getPreviousResult(CppTypeRef.class);
      String comment = CommentHelper.getDescription(francaTypeDef);
      CppUsing cppUsing =
          CppUsing.builder(nameResolver.getName(francaTypeDef), cppTypeRef)
              .fullyQualifiedName(nameResolver.getFullyQualifiedName(francaTypeDef))
              .comment(comment)
              .build();

      storeResult(cppUsing);
    }

    closeContext();
  }

  @Override
  public void finishBuilding(FArrayType francaArrayType) {

    CppTypeRef elementType = getPreviousResult(CppTypeRef.class);
    CppTypeRef targetType =
        CppTemplateTypeRef.create(CppTemplateTypeRef.TemplateClass.VECTOR, elementType);
    String comment = CommentHelper.getDescription(francaArrayType);
    CppUsing cppUsing =
        CppUsing.builder(nameResolver.getName(francaArrayType), targetType)
            .fullyQualifiedName(nameResolver.getFullyQualifiedName(francaArrayType))
            .comment(comment)
            .build();

    storeResult(cppUsing);
    closeContext();
  }

  @Override
  public void finishBuilding(FMapType francaMapType) {

    List<CppTypeRef> typeRefs = getPreviousResults(CppTypeRef.class);
    CppTypeRef targetType = typeMapper.wrapMap(typeRefs.get(0), typeRefs.get(1));
    String comment = CommentHelper.getDescription(francaMapType);
    CppUsing cppUsing =
        CppUsing.builder(nameResolver.getName(francaMapType), targetType)
            .fullyQualifiedName(nameResolver.getFullyQualifiedName(francaMapType))
            .comment(comment)
            .build();

    storeResult(cppUsing);
    closeContext();
  }

  @Override
  public void finishBuilding(FEnumerationType francaEnumerationType) {

    // Type definition
    CppEnum cppEnum =
        CppEnum.builder(nameResolver.getName(francaEnumerationType))
            .fullyQualifiedName(nameResolver.getFullyQualifiedName(francaEnumerationType))
            .isScoped(true)
            .isExternal(deploymentModel.isExternalType(francaEnumerationType))
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
      enumItemName = nameResolver.getName(francaEnumerator);
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

    CppMethod getterMethod =
        new CppMethod(
            nameResolver.getGetterName(francaAttribute),
            nameResolver.getFullyQualifiedName(francaAttribute),
            francaComment,
            cppTypeRef,
            "",
            false,
            Collections.emptyList(),
            EnumSet.of(CppMethod.Specifier.VIRTUAL),
            EnumSet.of(CppMethod.Qualifier.CONST, CppMethod.Qualifier.PURE_VIRTUAL));
    storeResult(getterMethod);

    if (!francaAttribute.isReadonly()) {
      CppMethod setterMethod =
          new CppMethod(
              nameResolver.getSetterName(francaAttribute),
              nameResolver.getFullyQualifiedName(francaAttribute),
              francaComment,
              CppPrimitiveTypeRef.VOID,
              "",
              false,
              Collections.singletonList(new CppParameter("value", cppTypeRef)),
              EnumSet.of(CppMethod.Specifier.VIRTUAL),
              EnumSet.of(CppMethod.Qualifier.PURE_VIRTUAL));
      storeResult(setterMethod);
    }

    closeContext();
  }

  private CppMethod buildCppMethod(
      final FMethod francaMethod, final CppTypeRef returnType, final String returnComment) {

    Set<CppMethod.Specifier> specifiers = EnumSet.noneOf(CppMethod.Specifier.class);
    Set<CppMethod.Qualifier> qualifiers = EnumSet.noneOf(CppMethod.Qualifier.class);

    if (deploymentModel.isStatic(francaMethod)) {
      specifiers.add(CppMethod.Specifier.STATIC);
    } else {
      if (deploymentModel.isConst(francaMethod)) {
        // const needs to be before "= 0" pure virtual specifier
        qualifiers.add(CppMethod.Qualifier.CONST);
      }
      specifiers.add(CppMethod.Specifier.VIRTUAL);
      qualifiers.add(CppMethod.Qualifier.PURE_VIRTUAL);
    }

    List<CppParameter> parameters =
        CollectionsHelper.getStreamOfType(getCurrentContext().previousResults, CppParameter.class)
            .filter(parameter -> !parameter.isOutput())
            .collect(Collectors.toList());

    CppParameter returnTypeParameter =
        CollectionsHelper.getStreamOfType(getCurrentContext().previousResults, CppParameter.class)
            .filter(CppParameter::isOutput)
            .findFirst()
            .orElse(null);
    boolean isNotNull = returnTypeParameter != null && returnTypeParameter.isNotNull();

    return new CppMethod(
        nameResolver.getName(francaMethod),
        nameResolver.getFullyQualifiedName(francaMethod),
        CommentHelper.getDescription(francaMethod),
        returnType,
        returnComment,
        isNotNull,
        parameters,
        specifiers,
        qualifiers);
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
}
