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

package com.here.ivi.api.generator.java;

import com.google.common.annotations.VisibleForTesting;
import com.google.common.collect.Iterables;
import com.here.ivi.api.common.CollectionsHelper;
import com.here.ivi.api.common.FrancaTypeHelper;
import com.here.ivi.api.generator.common.PlatformUnsupportedFeatures;
import com.here.ivi.api.generator.common.modelbuilder.AbstractModelBuilder;
import com.here.ivi.api.generator.common.modelbuilder.ModelBuilderContextStack;
import com.here.ivi.api.model.franca.CommentHelper;
import com.here.ivi.api.model.franca.FrancaDeploymentModel;
import com.here.ivi.api.model.java.*;
import com.here.ivi.api.model.java.JavaMethod.MethodQualifier;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import org.franca.core.franca.*;

public class JavaModelBuilder extends AbstractModelBuilder<JavaElement> {

  /**
   * Used to store a unique JavaExceptionClass element of every method that throws. They will be
   * later generated in a dedicated Java file from JavaGenerator
   */
  public final Map<String, JavaExceptionClass> exceptionClasses = new HashMap<>();

  private final FrancaDeploymentModel deploymentModel;
  private final JavaPackage rootPackage;
  private final JavaTypeMapper typeMapper;
  private final JavaType nativeBase;

  @VisibleForTesting
  JavaModelBuilder(
      final ModelBuilderContextStack<JavaElement> contextStack,
      final FrancaDeploymentModel deploymentModel,
      final JavaPackage rootPackage,
      final JavaTypeMapper typeMapper) {
    super(contextStack);
    this.deploymentModel = deploymentModel;
    this.rootPackage = rootPackage;
    this.typeMapper = typeMapper;
    this.nativeBase = typeMapper.getNativeBase();
  }

  public JavaModelBuilder(
      final FrancaDeploymentModel deploymentModel,
      final JavaPackage rootPackage,
      final JavaTypeMapper typeMapper) {
    this(new ModelBuilderContextStack<>(), deploymentModel, rootPackage, typeMapper);
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

    CollectionsHelper.getStreamOfType(getCurrentContext().previousResults, JavaClass.class)
        .forEach(this::storeResult);
    CollectionsHelper.getStreamOfType(getCurrentContext().previousResults, JavaEnum.class)
        .forEach(this::storeResult);
    closeContext();
  }

  @Override
  public void finishBuilding(FMethod francaMethod) {
    if (PlatformUnsupportedFeatures.hasUnsupportedParameters(francaMethod)) {
      closeContext();
      return;
    }

    boolean needSelectorSuffix =
        francaMethod.getSelector() != null && FrancaTypeHelper.hasArrayParameters(francaMethod);
    String selector = needSelectorSuffix ? francaMethod.getSelector() : "";
    String javaMethodName = JavaNameRules.getMethodName(francaMethod.getName(), selector);

    // Map return type
    List<JavaParameter> outputParameters =
        CollectionsHelper.getStreamOfType(getCurrentContext().previousResults, JavaParameter.class)
            .filter(parameter -> parameter.isOutput)
            .collect(Collectors.toList());
    JavaType returnType;
    if (outputParameters.isEmpty()) { // Void return type
      returnType = JavaPrimitiveType.VOID;
    } else if (outputParameters.size() == 1) {
      returnType = outputParameters.get(0).type;
    } else {
      // TODO: Wrap complex return type in an immutable container class
      returnType = JavaPrimitiveType.VOID;
    }

    JavaCustomType javaExceptionTypeRef = null;
    JavaEnumType exceptionEnumTypeRef = getPreviousResult(JavaEnumType.class);
    if (exceptionEnumTypeRef != null) {

      String exceptionName =
          JavaNameRules.getExceptionName(Iterables.getLast(exceptionEnumTypeRef.classNames));
      JavaPackage exceptionPackage = new JavaPackage(exceptionEnumTypeRef.packageNames);
      JavaExceptionClass javaExceptionClass =
          new JavaExceptionClass(exceptionName, exceptionEnumTypeRef, exceptionPackage);
      String mapKey = exceptionPackage.packageNames + "." + exceptionName;
      exceptionClasses.put(mapKey, javaExceptionClass);

      javaExceptionTypeRef = new JavaCustomType(exceptionName, exceptionPackage);
    }

    JavaMethod javaMethod = new JavaMethod(javaMethodName, returnType, javaExceptionTypeRef);
    javaMethod.comment = CommentHelper.getDescription(francaMethod);

    if (deploymentModel.isStatic(francaMethod)) {
      javaMethod.qualifiers.add(MethodQualifier.STATIC);
    }
    javaMethod.visibility = JavaVisibility.PUBLIC;

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

    storeResult(javaParameter);
    closeContext();
  }

  @Override
  public void finishBuildingOutputArgument(FArgument francaArgument) {

    JavaType javaArgumentType =
        CollectionsHelper.getFirstOfType(getCurrentContext().previousResults, JavaType.class);

    JavaParameter javaParameter =
        new JavaParameter(
            javaArgumentType, JavaNameRules.getArgumentName(francaArgument.getName()), true);

    storeResult(javaParameter);
    closeContext();
  }

  @Override
  public void finishBuilding(FConstantDef francaConstant) {

    if (PlatformUnsupportedFeatures.isUnsupportedType(francaConstant.getType())) {
      closeContext();
      return;
    }

    JavaType javaType =
        CollectionsHelper.getFirstOfType(getCurrentContext().previousResults, JavaType.class);
    JavaValue value = JavaValueMapper.map(javaType, francaConstant.getRhs());
    JavaConstant javaConstant =
        new JavaConstant(javaType, JavaNameRules.getConstantName(francaConstant.getName()), value);

    javaConstant.comment = CommentHelper.getDescription(francaConstant);

    storeResult(javaConstant);
    closeContext();
  }

  @Override
  public void finishBuilding(FField francaField) {

    JavaType javaType = getPreviousResult(JavaType.class);
    String defaultValue = deploymentModel.getDefaultValue(francaField);
    JavaValue initialValue =
        defaultValue != null
            ? JavaValueMapper.mapDefaultValue(javaType, defaultValue)
            : JavaValueMapper.mapDefaultValue(javaType);

    String fieldName = JavaNameRules.getFieldName(francaField.getName());
    JavaField javaField = new JavaField(javaType, fieldName, initialValue);
    javaField.visibility = JavaVisibility.PUBLIC;

    javaField.comment = CommentHelper.getDescription(francaField);

    storeResult(javaField);
    closeContext();
  }

  @Override
  public void finishBuilding(FStructType francaStructType) {

    if (PlatformUnsupportedFeatures.isUnsupportedType(francaStructType)) {
      closeContext();
      return;
    }

    // Type definition
    JavaClass javaClass =
        JavaClass.builder(JavaNameRules.getClassName(francaStructType.getName()))
            .extendedClass(getPreviousResult(JavaCustomType.class))
            .build();
    javaClass.visibility = JavaVisibility.PUBLIC;
    javaClass.javaPackage = rootPackage;

    javaClass.comment = CommentHelper.getDescription(francaStructType);
    javaClass.fields.addAll(getPreviousResults(JavaField.class));
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
    javaEnum.visibility = JavaVisibility.PUBLIC;
    javaEnum.javaPackage = rootPackage;

    javaEnum.comment = CommentHelper.getDescription(francaEnumType);
    javaEnum.items.addAll(getPreviousResults(JavaEnumItem.class));
    JavaValueMapper.completePartialEnumeratorValues(javaEnum.items);
    storeResult(javaEnum);

    // Type reference
    storeResult(typeMapper.mapCustomType(francaEnumType));

    closeContext();
  }

  @Override
  public void finishBuilding(FExpression francaExpression) {
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

    if (PlatformUnsupportedFeatures.isUnsupportedType(francaArrayType.getElementType())) {
      closeContext();
      return;
    }

    storeResult(typeMapper.mapArray(francaArrayType));
    closeContext();
  }

  @Override
  public void finishBuilding(FMapType francaMapType) {

    if (PlatformUnsupportedFeatures.isUnsupportedType(francaMapType.getKeyType())
        || PlatformUnsupportedFeatures.isUnsupportedType(francaMapType.getValueType())) {
      closeContext();
      return;
    }

    storeResult(typeMapper.mapMap(francaMapType));
    closeContext();
  }

  @Override
  public void finishBuilding(FAttribute francaAttribute) {

    if (PlatformUnsupportedFeatures.isUnsupportedType(francaAttribute.getType())) {
      closeContext();
      return;
    }

    JavaType javaType = getPreviousResult(JavaType.class);

    String getterName = JavaNameRules.getGetterName(francaAttribute.getName());

    JavaMethod getterMethod = new JavaMethod(getterName, javaType);
    getterMethod.visibility = JavaVisibility.PUBLIC;

    storeResult(getterMethod);

    if (!francaAttribute.isReadonly()) {
      String setterName = JavaNameRules.getSetterName(francaAttribute.getName());

      JavaMethod setterMethod = new JavaMethod(setterName);
      setterMethod.visibility = JavaVisibility.PUBLIC;

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
    javaClass.visibility = JavaVisibility.PUBLIC;
    javaClass.javaPackage = rootPackage;

    javaClass.comment = CommentHelper.getDescription(francaInterface);
    javaClass.fields.addAll(getPreviousResults(JavaField.class));

    javaClass.constants.addAll(getPreviousResults(JavaConstant.class));
    javaClass.methods.addAll(methods);
    javaClass.methods.forEach(method -> method.qualifiers.add(MethodQualifier.NATIVE));
    javaClass.enums.addAll(getPreviousResults(JavaEnum.class));

    addInnerClasses(javaClass);

    return javaClass;
  }

  private JavaInterface createJavaInterface(final FInterface francaInterface) {

    JavaInterface javaInterface =
        new JavaInterface(JavaNameRules.getClassName(francaInterface.getName()));
    javaInterface.visibility = JavaVisibility.PUBLIC;
    javaInterface.javaPackage = rootPackage;

    javaInterface.comment = CommentHelper.getDescription(francaInterface);
    javaInterface.constants.addAll(getPreviousResults(JavaConstant.class));
    javaInterface.enums.addAll(getPreviousResults(JavaEnum.class));

    List<JavaMethod> interfaceMethods =
        getPreviousResults(JavaMethod.class)
            .stream()
            .map(JavaMethod::new)
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
}
