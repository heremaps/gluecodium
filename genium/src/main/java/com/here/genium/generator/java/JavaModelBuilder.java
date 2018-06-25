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

package com.here.genium.generator.java;

import com.google.common.annotations.VisibleForTesting;
import com.here.genium.common.CollectionsHelper;
import com.here.genium.common.FrancaTypeHelper;
import com.here.genium.generator.common.modelbuilder.AbstractModelBuilder;
import com.here.genium.generator.common.modelbuilder.ModelBuilderContextStack;
import com.here.genium.model.franca.CommentHelper;
import com.here.genium.model.franca.FrancaDeploymentModel;
import com.here.genium.model.java.*;
import com.here.genium.model.java.JavaMethod.MethodQualifier;
import java.util.List;
import java.util.stream.Collectors;
import org.franca.core.franca.*;

public class JavaModelBuilder extends AbstractModelBuilder<JavaElement> {

  private final FrancaDeploymentModel deploymentModel;
  private final JavaPackage rootPackage;
  private final JavaTypeMapper typeMapper;
  private final JavaType nativeBase;
  private final FrancaTypeHelper.ErrorEnumFilter errorEnums;

  @VisibleForTesting
  JavaModelBuilder(
      final ModelBuilderContextStack<JavaElement> contextStack,
      final FrancaDeploymentModel deploymentModel,
      final JavaPackage rootPackage,
      final JavaTypeMapper typeMapper,
      final FrancaTypeHelper.ErrorEnumFilter errorEnums) {
    super(contextStack);
    this.deploymentModel = deploymentModel;
    this.rootPackage = rootPackage;
    this.typeMapper = typeMapper;
    this.nativeBase = typeMapper.getNativeBase();
    this.errorEnums = errorEnums;
  }

  public JavaModelBuilder(
      final FrancaDeploymentModel deploymentModel,
      final JavaPackage rootPackage,
      final JavaTypeMapper typeMapper,
      final FrancaTypeHelper.ErrorEnumFilter errorEnums) {
    this(new ModelBuilderContextStack<>(), deploymentModel, rootPackage, typeMapper, errorEnums);
  }

  @Override
  public void finishBuilding(FInterface francaInterface) {

    if (deploymentModel.isInterface(francaInterface)) {
      finishBuildingFrancaInterface(francaInterface);
    } else {
      finishBuildingFrancaClass(francaInterface);
    }

    closeContext();
  }

  @Override
  public void finishBuilding(FTypeCollection francaTypeCollection) {

    getPreviousResults(JavaTopLevelElement.class).forEach(this::storeResult);

    List<JavaConstant> constants = getPreviousResults(JavaConstant.class);
    if (!constants.isEmpty()) {
      String name = JavaNameRules.getClassName(francaTypeCollection.getName());
      JavaClass javaClass = JavaClass.builder(name).build();
      javaClass.visibility = getVisibility(francaTypeCollection);
      javaClass.qualifiers.add(JavaTopLevelElement.Qualifier.FINAL);
      javaClass.javaPackage = rootPackage;
      javaClass.comment = CommentHelper.getDescription(francaTypeCollection);
      javaClass.constants.addAll(constants);

      storeResult(javaClass);
    }

    closeContext();
  }

  @Override
  public void finishBuilding(FMethod francaMethod) {

    boolean needSelectorSuffix =
        francaMethod.getSelector() != null && FrancaTypeHelper.hasArrayParameters(francaMethod);
    String selector = needSelectorSuffix ? francaMethod.getSelector() : "";
    String javaMethodName = JavaNameRules.getMethodName(francaMethod.getName(), selector);

    // Map return type
    JavaParameter outputParameter =
        CollectionsHelper.getStreamOfType(getCurrentContext().previousResults, JavaParameter.class)
            .filter(parameter -> parameter.isOutput)
            .findFirst()
            .orElse(null);

    JavaType returnType;
    String returnComment;
    if (outputParameter == null) { // Void return type
      returnType = JavaPrimitiveType.VOID;
      returnComment = null;
    } else {
      returnType = outputParameter.type;
      returnComment = outputParameter.comment;
    }

    JavaExceptionType javaExceptionTypeRef = getPreviousResult(JavaExceptionType.class);

    JavaMethod javaMethod =
        JavaMethod.builder(javaMethodName)
            .returnType(returnType)
            .returnComment(returnComment)
            .exception(javaExceptionTypeRef)
            .build();
    javaMethod.comment = CommentHelper.getDescription(francaMethod);

    if (deploymentModel.isStatic(francaMethod)) {
      javaMethod.qualifiers.add(MethodQualifier.STATIC);
    }
    javaMethod.visibility = getVisibility(francaMethod);

    List<JavaParameter> inputParameters =
        CollectionsHelper.getStreamOfType(getCurrentContext().previousResults, JavaParameter.class)
            .filter(parameter -> !parameter.isOutput)
            .collect(Collectors.toList());
    javaMethod.parameters.addAll(inputParameters);

    storeResult(javaMethod);
    closeContext();
  }

  @Override
  public void finishBuildingInputArgument(FArgument francaArgument) {

    JavaType javaArgumentType = getPreviousResult(JavaType.class);

    JavaParameter javaParameter =
        new JavaParameter(
            javaArgumentType, JavaNameRules.getArgumentName(francaArgument.getName()));
    javaParameter.comment = CommentHelper.getDescription(francaArgument);

    storeResult(javaParameter);
    closeContext();
  }

  @Override
  public void finishBuildingOutputArgument(FArgument francaArgument) {

    JavaType javaArgumentType = getPreviousResult(JavaType.class);

    JavaParameter javaParameter =
        new JavaParameter(
            javaArgumentType, JavaNameRules.getArgumentName(francaArgument.getName()), true);
    javaParameter.comment = CommentHelper.getDescription(francaArgument);

    storeResult(javaParameter);
    closeContext();
  }

  @Override
  public void finishBuilding(FConstantDef francaConstant) {

    JavaType javaType = getPreviousResult(JavaType.class);
    String name = JavaNameRules.getConstantName(francaConstant.getName());
    JavaValue value = getPreviousResult(JavaValue.class);

    JavaConstant javaConstant = new JavaConstant(javaType, name, value);
    javaConstant.visibility = getVisibility(francaConstant);
    javaConstant.comment = CommentHelper.getDescription(francaConstant);

    storeResult(javaConstant);
    closeContext();
  }

  @Override
  public void finishBuilding(FField francaField) {

    String fieldName = JavaNameRules.getFieldName(francaField.getName());
    JavaType javaType = getPreviousResult(JavaType.class);
    String defaultValue = deploymentModel.getDefaultValue(francaField);
    JavaValue initialValue =
        defaultValue != null
            ? JavaValueMapper.mapDefaultValue(javaType, defaultValue)
            : JavaValueMapper.mapDefaultValue(javaType);
    boolean isNonNull = deploymentModel.isNotNull(francaField);

    JavaField javaField =
        JavaField.builder(fieldName, javaType).initial(initialValue).isNonNull(isNonNull).build();
    javaField.visibility = getVisibility(francaField);
    javaField.comment = CommentHelper.getDescription(francaField);

    if (isNonNull) {
      JavaType notNullAnnotation = typeMapper.getNotNullAnnotation();
      if (notNullAnnotation != null) {
        javaField.annotations.add(notNullAnnotation);
      }
    }

    storeResult(javaField);
    closeContext();
  }

  @Override
  public void finishBuilding(FStructType francaStructType) {

    JavaType serializationBase = typeMapper.getSerializationBase();
    boolean isSerializable =
        serializationBase != null && deploymentModel.isSerializable(francaStructType);

    // Type definition
    JavaClass javaClass =
        JavaClass.builder(JavaNameRules.getClassName(francaStructType.getName()))
            .extendedClass(getPreviousResult(JavaCustomType.class))
            .isParcelable(isSerializable)
            .isEquatable(deploymentModel.isEquatable(francaStructType))
            .build();
    javaClass.visibility = getVisibility(francaStructType);
    javaClass.javaPackage = rootPackage;

    javaClass.comment = CommentHelper.getDescription(francaStructType);
    javaClass.fields.addAll(getPreviousResults(JavaField.class));

    JavaClass parentClass = getPreviousResult(JavaClass.class);
    if (parentClass != null) {
      javaClass.parentFields.addAll(parentClass.parentFields);
      javaClass.parentFields.addAll(parentClass.fields);
    }

    if (isSerializable) {
      javaClass.parentInterfaces.add(serializationBase);
    }

    storeResult(javaClass);

    // Type reference
    storeResult(typeMapper.mapCustomType(francaStructType));

    closeContext();
  }

  @Override
  public void finishBuilding(FTypeRef francaTypeRef) {
    storeResult(typeMapper.map(francaTypeRef));
    closeContext();
  }

  @Override
  public void finishBuilding(FEnumerationType francaEnumType) {

    // Type definition
    JavaEnum javaEnum = new JavaEnum(JavaNameRules.getClassName(francaEnumType.getName()));
    javaEnum.visibility = getVisibility(francaEnumType);
    javaEnum.javaPackage = rootPackage;

    javaEnum.comment = CommentHelper.getDescription(francaEnumType);
    javaEnum.items.addAll(getPreviousResults(JavaEnumItem.class));
    JavaValueMapper.completePartialEnumeratorValues(javaEnum.items);
    storeResult(javaEnum);

    // Type reference
    JavaEnumType javaEnumType = (JavaEnumType) typeMapper.mapCustomType(francaEnumType);
    storeResult(javaEnumType);

    if (errorEnums.isErrorEnum(francaEnumType)) {
      //Exception definition & reference
      JavaExceptionClass javaException =
          new JavaExceptionClass(JavaNameRules.getExceptionName(javaEnum.name), javaEnumType);
      javaException.visibility = getVisibility(francaEnumType);

      storeResult(javaException);
      storeResult(typeMapper.mapExceptionType(francaEnumType));
    }
    closeContext();
  }

  @Override
  public void finishBuilding(FInitializerExpression francaExpression) {
    storeResult(JavaValueMapper.map(francaExpression));
    closeContext();
  }

  @Override
  public void finishBuilding(FEnumerator francaEnumerator) {

    String enumItemName = JavaNameRules.getConstantName(francaEnumerator.getName());
    JavaValue javaValue = getPreviousResult(JavaValue.class);
    JavaEnumItem javaEnumItem = new JavaEnumItem(enumItemName, javaValue);

    javaEnumItem.comment = CommentHelper.getDescription(francaEnumerator);

    storeResult(javaEnumItem);
    closeContext();
  }

  @Override
  public void finishBuilding(FArrayType francaArrayType) {

    storeResult(typeMapper.mapArray(francaArrayType));
    closeContext();
  }

  @Override
  public void finishBuilding(FMapType francaMapType) {

    storeResult(typeMapper.mapMap(francaMapType));
    closeContext();
  }

  @Override
  public void finishBuilding(FAttribute francaAttribute) {

    JavaType javaType = getPreviousResult(JavaType.class);
    String comment = CommentHelper.getDescription(francaAttribute);

    JavaVisibility visibility = getVisibility(francaAttribute);

    String getterName = JavaNameRules.getGetterName(francaAttribute.getName(), javaType);

    JavaMethod getterMethod = JavaMethod.builder(getterName).returnType(javaType).build();
    getterMethod.visibility = visibility;
    getterMethod.comment = comment;

    storeResult(getterMethod);

    if (!francaAttribute.isReadonly()) {
      String setterName = JavaNameRules.getSetterName(francaAttribute.getName());

      JavaMethod setterMethod = JavaMethod.builder(setterName).build();
      setterMethod.visibility = visibility;
      setterMethod.comment = comment;

      setterMethod.parameters.add(new JavaParameter(javaType, "value"));
      storeResult(setterMethod);
    }

    closeContext();
  }

  private JavaClass createJavaClass(
      final FInterface francaInterface,
      final List<JavaMethod> methods,
      final JavaType extendedClass) {

    JavaClass javaClass =
        JavaClass.builder(JavaNameRules.getClassName(francaInterface.getName()))
            .extendedClass(extendedClass)
            .isImplClass(true)
            .needsDisposer(nativeBase.equals(extendedClass))
            .build();
    javaClass.visibility = getVisibility(francaInterface);
    javaClass.javaPackage = rootPackage;

    javaClass.comment = CommentHelper.getDescription(francaInterface);
    javaClass.fields.addAll(getPreviousResults(JavaField.class));

    javaClass.constants.addAll(getPreviousResults(JavaConstant.class));
    javaClass.methods.addAll(methods);
    javaClass.methods.forEach(method -> method.qualifiers.add(MethodQualifier.NATIVE));
    javaClass.enums.addAll(getPreviousResults(JavaEnum.class));
    javaClass.exceptions.addAll(getPreviousResults(JavaExceptionClass.class));

    addInnerClasses(javaClass);

    return javaClass;
  }

  private JavaInterface createJavaInterface(final FInterface francaInterface) {

    JavaInterface javaInterface =
        new JavaInterface(JavaNameRules.getClassName(francaInterface.getName()));
    javaInterface.visibility = getVisibility(francaInterface);
    javaInterface.javaPackage = rootPackage;

    javaInterface.comment = CommentHelper.getDescription(francaInterface);
    javaInterface.constants.addAll(getPreviousResults(JavaConstant.class));
    javaInterface.enums.addAll(getPreviousResults(JavaEnum.class));
    javaInterface.exceptions.addAll(getPreviousResults(JavaExceptionClass.class));

    List<JavaMethod> interfaceMethods =
        getPreviousResults(JavaMethod.class)
            .stream()
            .map(javaMethod -> javaMethod.toBuilder().visibility(JavaVisibility.PACKAGE).build())
            .collect(Collectors.toList());
    javaInterface.methods.addAll(interfaceMethods);

    addInnerClasses(javaInterface);

    return javaInterface;
  }

  private JavaClass createJavaImplementationClass(
      final FInterface francaInterface,
      final JavaInterface javaInterface,
      final JavaType extendedClass) {

    JavaClass javaClass =
        JavaClass.builder(JavaNameRules.getImplementationClassName(francaInterface.getName()))
            .extendedClass(extendedClass)
            .isImplClass(true)
            .needsDisposer(nativeBase.equals(extendedClass))
            .build();
    javaClass.visibility = JavaVisibility.PACKAGE;
    javaClass.javaPackage = rootPackage;
    javaClass.fields.addAll(getPreviousResults(JavaField.class));

    javaClass.methods.addAll(getPreviousResults(JavaMethod.class));
    javaClass.methods.forEach(method -> method.qualifiers.add(MethodQualifier.NATIVE));

    JavaCustomType interfaceTypeReference =
        new JavaCustomType(javaInterface.name, javaInterface.javaPackage);
    javaClass.parentInterfaces.add(interfaceTypeReference);

    return javaClass;
  }

  private void addInnerClasses(final JavaTopLevelElement javaTopLevelElement) {
    List<JavaClass> innerClasses =
        getPreviousResults(JavaClass.class)
            .stream()
            .filter(javaClass -> !javaClass.isImplClass)
            .collect(Collectors.toList());
    innerClasses.forEach(innerClass -> innerClass.qualifiers.add(JavaClass.Qualifier.STATIC));
    javaTopLevelElement.innerClasses.addAll(innerClasses);
  }

  private void finishBuildingFrancaClass(final FInterface francaInterface) {

    JavaType extendedClass = nativeBase;

    FInterface parentInterface = francaInterface.getBase();
    if (parentInterface != null) {
      if (deploymentModel.isInterface(parentInterface)) {
        String parentImplementationClassName =
            JavaNameRules.getImplementationClassName(parentInterface.getName());
        extendedClass = typeMapper.mapCustomType(parentInterface, parentImplementationClassName);
      } else {
        extendedClass = typeMapper.mapCustomType(parentInterface);
      }
    }

    List<JavaMethod> methods = getPreviousResults(JavaMethod.class);
    JavaClass javaClass = createJavaClass(francaInterface, methods, extendedClass);

    storeResult(javaClass);
  }

  private void finishBuildingFrancaInterface(final FInterface francaInterface) {

    JavaInterface javaInterface = createJavaInterface(francaInterface);

    JavaType extendedClass = nativeBase;
    FInterface parentInterface = francaInterface.getBase();
    if (parentInterface != null) {
      javaInterface.parentInterfaces.add(typeMapper.mapCustomType(parentInterface));
      String parentImplementationClassName =
          JavaNameRules.getImplementationClassName(parentInterface.getName());
      extendedClass = typeMapper.mapCustomType(parentInterface, parentImplementationClassName);
    }

    JavaClass javaImplementationClass =
        createJavaImplementationClass(francaInterface, javaInterface, extendedClass);

    storeResult(javaInterface);
    storeResult(javaImplementationClass);
  }

  private JavaVisibility getVisibility(final FModelElement francaModelElement) {
    return deploymentModel.isInternal(francaModelElement)
        ? JavaVisibility.PACKAGE
        : JavaVisibility.PUBLIC;
  }
}
