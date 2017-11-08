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
import com.here.ivi.api.common.CollectionsHelper;
import com.here.ivi.api.generator.baseapi.CppCommentParser;
import com.here.ivi.api.generator.common.AbstractModelBuilder;
import com.here.ivi.api.generator.common.ModelBuilderContextStack;
import com.here.ivi.api.generator.common.PlatformUnsupportedFeatures;
import com.here.ivi.api.model.franca.FrancaDeploymentModel;
import com.here.ivi.api.model.javamodel.*;
import com.here.ivi.api.model.javamodel.JavaMethod.MethodQualifier;
import java.util.List;
import java.util.stream.Collectors;
import org.franca.core.franca.*;

public class JavaModelBuilder extends AbstractModelBuilder<JavaElement> {

  private final FrancaDeploymentModel deploymentModel;
  private final JavaPackage rootPackage;
  private final JavaTypeMapper typeMapper;

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
  }

  public JavaModelBuilder(
      final FrancaDeploymentModel deploymentModel,
      final JavaPackage rootPackage,
      final JavaTypeMapper typeMapper) {
    this(new ModelBuilderContextStack<>(), deploymentModel, rootPackage, typeMapper);
  }

  @Override
  public void finishBuilding(FInterface francaInterface) {

    List<JavaMethod> methods = getPreviousResults(JavaMethod.class);
    if (deploymentModel.isInterface(francaInterface)) {
      // Instantiable Franca interface implemented as Java interface
      JavaInterface javaInterface = createJavaInterface(francaInterface);
      JavaClass javaImplementationClass =
          createJavaImplementationClass(francaInterface, javaInterface);

      storeResult(javaInterface);
      storeResult(javaImplementationClass);
    } else {
      JavaClass javaClass = createJavaClass(francaInterface, methods);
      javaClass.extendedClass =
          hasOnlyStaticMethods(methods)
              // Non instantiable Franca interface implemented as static class
              // TODO APIGEN-893: it should always be instantiable
              ? null
              // Instantiable Franca interface implemented as Java class
              : JavaClass.NATIVE_BASE;

      storeResult(javaClass);
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

    JavaMethod javaMethod;

    // Map return type
    List<JavaParameter> outputParameters =
        CollectionsHelper.getStreamOfType(getCurrentContext().previousResults, JavaParameter.class)
            .filter(parameter -> parameter.isOutput)
            .collect(Collectors.toList());
    if (outputParameters.isEmpty()) { // Void return type
      javaMethod = new JavaMethod(JavaNameRules.getMethodName(francaMethod.getName()));
    } else if (outputParameters.size() == 1) {
      javaMethod =
          new JavaMethod(
              JavaNameRules.getMethodName(francaMethod.getName()), outputParameters.get(0).type);
    } else {
      // TODO: Wrap complex return type in an immutable container class
      javaMethod = new JavaMethod(JavaNameRules.getMethodName(francaMethod.getName()));
    }

    // TODO: Map errors to exception(s)
    // Either create a per-Interface exception and add mapped enum values to it's EnumSet member
    // Or do something different...

    javaMethod.comment = CppCommentParser.FORMATTER.readDescription(francaMethod.getComment());

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
    javaConstant.comment = getCommentString(francaConstant);

    storeResult(javaConstant);
    closeContext();
  }

  @Override
  public void finishBuilding(FField francaField) {

    JavaType javaType = getPreviousResult(JavaType.class);
    String fieldName = JavaNameRules.getFieldName(francaField.getName());
    JavaField javaField;
    if (javaType instanceof JavaTemplateType) {
      JavaTemplateType javaTemplateType = (JavaTemplateType) javaType;
      javaField = new JavaField(javaTemplateType, fieldName, javaTemplateType.implementationType);
    } else if (javaType instanceof JavaEnumType) {
      JavaEnumType enumType = (JavaEnumType) javaType;
      javaField = new JavaField(javaType, fieldName, enumType.initializer);
    } else if (javaType instanceof JavaCustomType) {
      javaField = new JavaField((JavaCustomType) javaType, fieldName);
    } else {
      javaField = new JavaField(javaType, fieldName);
    }
    javaField.visibility = JavaVisibility.PUBLIC;
    javaField.comment = getCommentString(francaField);

    storeResult(javaField);
    closeContext();
  }

  @Override
  public void finishBuilding(FStructType francaStructType) {

    if (PlatformUnsupportedFeatures.isUnsupportedType(francaStructType)) {
      closeContext();
      return;
    }

    JavaClass javaClass = createJavaClass(francaStructType);

    storeResult(javaClass);
    closeContext();
  }

  @Override
  public void finishBuilding(FTypeRef francaTypeRef) {
    storeResult(typeMapper.map(francaTypeRef));
    closeContext();
  }

  @Override
  public void finishBuilding(FEnumerationType francaEnumType) {
    String enumName = JavaNameRules.getClassName(francaEnumType.getName());

    JavaEnum javaEnum = new JavaEnum(enumName);
    javaEnum.visibility = JavaVisibility.PUBLIC;
    javaEnum.javaPackage = rootPackage;
    javaEnum.comment = getCommentString(francaEnumType);
    javaEnum.items.addAll(getPreviousResults(JavaEnumItem.class));
    JavaValueMapper.completePartialEnumeratorValues(javaEnum.items);

    storeResult(javaEnum);
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
    javaEnumItem.comment = getCommentString(francaEnumerator);

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

  private JavaClass createJavaClass(final FModelElement francaModelElement) {

    JavaClass javaClass = new JavaClass(JavaNameRules.getClassName(francaModelElement.getName()));
    javaClass.visibility = JavaVisibility.PUBLIC;
    javaClass.javaPackage = rootPackage;
    javaClass.comment = getCommentString(francaModelElement);
    javaClass.fields.addAll(getPreviousResults(JavaField.class));

    return javaClass;
  }

  private JavaClass createJavaClass(
      final FInterface francaInterface, final List<JavaMethod> methods) {

    JavaClass javaClass = createJavaClass(francaInterface);
    javaClass.constants.addAll(getPreviousResults(JavaConstant.class));
    javaClass.methods.addAll(methods);
    javaClass.methods.forEach(method -> method.qualifiers.add(MethodQualifier.NATIVE));
    javaClass.enums.addAll(getPreviousResults(JavaEnum.class));

    addInnerClasses(javaClass);

    return javaClass;
  }

  private static String getCommentString(FModelElement francaModelElement) {

    String comment = "";
    FAnnotationBlock francaComment = francaModelElement.getComment();
    if (francaComment != null && francaComment.getElements() != null) {
      comment = CppCommentParser.FORMATTER.readDescription(francaComment);
    }

    return comment;
  }

  private JavaInterface createJavaInterface(final FInterface francaInterface) {

    List<JavaElement> previousResults = getCurrentContext().previousResults;

    JavaInterface javaInterface =
        new JavaInterface(JavaNameRules.getClassName(francaInterface.getName()));
    javaInterface.visibility = JavaVisibility.PUBLIC;
    javaInterface.javaPackage = rootPackage;
    javaInterface.comment = getCommentString(francaInterface);
    javaInterface.constants.addAll(getPreviousResults(JavaConstant.class));
    javaInterface.enums.addAll(getPreviousResults(JavaEnum.class));
    // TODO: APIGEN-868 validator should fail when static methods are defined in a interface
    List<JavaMethod> interfaceMethods =
        CollectionsHelper.getStreamOfType(previousResults, JavaMethod.class)
            .filter(method -> !method.qualifiers.contains(MethodQualifier.STATIC))
            .map(JavaMethod::new)
            .collect(Collectors.toList());
    javaInterface.methods.addAll(interfaceMethods);

    addInnerClasses(javaInterface);

    return javaInterface;
  }

  private JavaClass createJavaImplementationClass(
      final FInterface francaInterface, final JavaInterface javaInterface) {

    JavaClass javaClass =
        new JavaClass(JavaNameRules.getImplementationClassName(francaInterface.getName()));
    javaClass.visibility = JavaVisibility.PACKAGE;
    javaClass.javaPackage = rootPackage;
    javaClass.extendedClass = JavaClass.NATIVE_BASE;
    javaClass.fields.addAll(getPreviousResults(JavaField.class));

    javaClass.methods.addAll(getPreviousResults(JavaMethod.class));
    javaClass.methods.forEach(method -> method.qualifiers.add(MethodQualifier.NATIVE));

    JavaCustomType interfaceTypeReference =
        new JavaCustomType(javaInterface.name, javaInterface.javaPackage);
    javaClass.parentInterfaces.add(interfaceTypeReference);

    return javaClass;
  }

  private void addInnerClasses(final JavaTopLevelElement javaTopLevelElement) {
    javaTopLevelElement.innerClasses.addAll(getPreviousResults(JavaClass.class));
    javaTopLevelElement.innerClasses.forEach(
        innerClass -> innerClass.qualifiers.add(JavaClass.Qualifier.STATIC));
  }

  @VisibleForTesting
  static boolean hasOnlyStaticMethods(final List<JavaMethod> methods) {
    return !methods.isEmpty()
        && methods
            .stream()
            .allMatch(javaMethod -> javaMethod.qualifiers.contains(MethodQualifier.STATIC));
  }
}
