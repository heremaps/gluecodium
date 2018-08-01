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
import org.franca.core.franca.*;

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
  public void finishBuilding(FInterface francaInterface) {

    String className = CppNameRules.getClassName(francaInterface.getName());
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
    CppParameter cppParameter =
        new CppParameter(CppNameRules.getParameterName(francaArgument.getName()), cppTypeRef);
    cppParameter.comment = CommentHelper.getDescription(francaArgument);

    storeResult(cppParameter);
    closeContext();
  }

  @Override
  public void finishBuildingOutputArgument(FArgument francaArgument) {

    CppTypeRef cppTypeRef = getPreviousResult(CppTypeRef.class);
    CppParameter cppParameter =
        new CppParameter(CppNameRules.getParameterName(francaArgument.getName()), cppTypeRef, true);
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

    List<String> nestedNameSpecifier = CppNameRules.getNestedNameSpecifier(francaConstant);
    String name = CppNameRules.getConstantName(francaConstant.getName());
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

    CppTypeRef cppTypeRef = getPreviousResult(CppTypeRef.class);
    String fieldName = CppNameRules.getFieldName(francaField.getName());

    CppField cppField =
        CppField.builder(fieldName, cppTypeRef)
            .initializer(valueMapper.mapDeploymentDefaultValue(cppTypeRef, francaField))
            .isNotNull(deploymentModel.isNotNull(francaField))
            .build();
    cppField.comment = CommentHelper.getDescription(francaField);

    storeResult(cppField);
    closeContext();
  }

  @Override
  public void finishBuilding(FStructType francaStructType) {

    // Type definition
    String name;
    String fullyQualifiedName;
    String externalName = deploymentModel.getExternalName(francaStructType);
    if (externalName == null) {
      name = CppNameRules.getStructName(francaStructType.getName());
      fullyQualifiedName = CppNameRules.getFullyQualifiedName(francaStructType);
    } else {
      name = externalName;
      fullyQualifiedName = externalName;
    }

    boolean isExternal = deploymentModel.getExternalType(francaStructType) != null;
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
      String typeDefName = CppNameRules.getTypedefName(francaTypeDef.getName());
      String fullyQualifiedName = CppNameRules.getFullyQualifiedName(francaTypeDef);
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

    String name = CppNameRules.getTypedefName(francaArrayType.getName());
    String fullyQualifiedName = CppNameRules.getFullyQualifiedName(francaArrayType);
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

    String name = CppNameRules.getTypedefName(francaMapType.getName());
    String fullyQualifiedName = CppNameRules.getFullyQualifiedName(francaMapType);
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
    String enumName;
    String fullyQualifiedName;
    String externalName = deploymentModel.getExternalName(francaEnumerationType);
    if (externalName == null) {
      enumName = CppNameRules.getStructName(francaEnumerationType.getName());
      fullyQualifiedName = CppNameRules.getFullyQualifiedName(francaEnumerationType);
    } else {
      enumName = externalName;
      fullyQualifiedName = externalName;
    }

    boolean isExternal = deploymentModel.getExternalType(francaEnumerationType) != null;
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
    storeResult(typeMapper.mapEnum(francaEnumerationType));

    closeContext();
  }

  @Override
  public void finishBuilding(FEnumerator francaEnumerator) {

    String enumItemName = francaEnumerator.getName();
    if (deploymentModel.getExternalType((FType) francaEnumerator.eContainer()) == null) {
      enumItemName = CppNameRules.getEnumEntryName(enumItemName);
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

    String getterName = CppNameRules.getGetterName(francaAttribute.getName(), cppTypeRef);
    CppMethod getterMethod = buildAccessorMethod(getterName, cppTypeRef, francaComment);
    storeResult(getterMethod);

    if (!francaAttribute.isReadonly()) {
      String setterName = CppNameRules.getSetterName(francaAttribute.getName());
      CppMethod setterMethod =
          buildAccessorMethod(setterName, CppPrimitiveTypeRef.VOID, francaComment);
      setterMethod.parameters.add(new CppParameter("value", cppTypeRef));
      storeResult(setterMethod);
    }

    closeContext();
  }

  private CppMethod buildAccessorMethod(
      final String name, final CppTypeRef cppTypeRef, final String francaComment) {

    return new CppMethod.Builder(name)
        .returnType(cppTypeRef)
        .specifier(CppMethod.Specifier.VIRTUAL)
        .qualifier(CppMethod.Qualifier.PURE_VIRTUAL)
        .comment(francaComment)
        .build();
  }

  private CppMethod buildCppMethod(
      final FMethod francaMethod, final CppTypeRef returnType, final String returnComment) {

    String methodName = CppNameRules.getMethodName(francaMethod.getName());
    String fullyQualifiedMethodName =
        CppNameRules.getFullyQualifiedName(
            CppNameRules.getNestedNameSpecifier(francaMethod), methodName);
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
}
