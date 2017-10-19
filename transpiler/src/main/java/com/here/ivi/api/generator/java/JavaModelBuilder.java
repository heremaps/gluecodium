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
import com.here.ivi.api.model.franca.FrancaElement;
import com.here.ivi.api.model.javamodel.*;
import com.here.ivi.api.model.javamodel.JavaMethod.MethodQualifier;
import java.util.List;
import java.util.stream.Collectors;
import org.franca.core.franca.*;

public class JavaModelBuilder extends AbstractModelBuilder<JavaElement> {

  private final JavaPackage basePackage;
  private final FrancaElement rootModel;
  private final JavaTypeMapper typeMapper;

  @VisibleForTesting
  JavaModelBuilder(
      final ModelBuilderContextStack<JavaElement> contextStack,
      final JavaPackage basePackage,
      final FrancaElement rootModel,
      final JavaTypeMapper typeMapper) {
    super(contextStack);
    this.basePackage = basePackage;
    this.rootModel = rootModel;
    this.typeMapper = typeMapper;
  }

  public JavaModelBuilder(final JavaPackage basePackage, final FrancaElement rootModel) {
    this(new ModelBuilderContextStack<>(), basePackage, rootModel, new JavaTypeMapper(basePackage));
  }

  @Override
  public void finishBuilding(FInterface francaInterface) {

    List<JavaMethod> methods = getPreviousResults(JavaMethod.class);
    List<JavaEnum> enums = getPreviousResults(JavaEnum.class);

    if (containsInstanceMethod(methods)) {

      JavaInterface javaInterface = createJavaInterface(francaInterface);
      javaInterface.enums.addAll(enums);
      storeResult(javaInterface);

      JavaClass javaClass = createJavaImplementationClass(francaInterface);
      JavaCustomType interfaceTypeReference =
          new JavaCustomType(javaInterface.name, javaInterface.javaPackage);
      javaClass.parentInterfaces.add(interfaceTypeReference);
      storeResult(javaClass);

    } else {

      JavaClass javaClass = createJavaClass(francaInterface);
      javaClass.constants.addAll(getPreviousResults(JavaConstant.class));

      javaClass.methods.addAll(methods);
      javaClass.methods.forEach(method -> method.qualifiers.add(MethodQualifier.NATIVE));
      javaClass.enums.addAll(enums);

      addInnerClasses(javaClass);
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

    if (rootModel.isStatic(francaMethod)) {
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
    javaEnum.comment = getCommentString(francaEnumType);
    javaEnum.items.addAll(getPreviousResults(JavaEnumItem.class));

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
    javaClass.javaPackage = basePackage.createChildPackage(rootModel.getPackageNames());
    javaClass.comment = getCommentString(francaModelElement);

    javaClass.fields.addAll(getPreviousResults(JavaField.class));

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
    javaInterface.javaPackage = basePackage.createChildPackage(rootModel.getPackageNames());
    javaInterface.comment = getCommentString(francaInterface);
    javaInterface.constants.addAll(getPreviousResults(JavaConstant.class));

    List<JavaMethod> interfaceMethods =
        CollectionsHelper.getStreamOfType(previousResults, JavaMethod.class)
            .filter(method -> !method.qualifiers.contains(MethodQualifier.STATIC))
            .map(JavaMethod::new)
            .collect(Collectors.toList());
    javaInterface.methods.addAll(interfaceMethods);

    addInnerClasses(javaInterface);

    return javaInterface;
  }

  private JavaClass createJavaImplementationClass(final FInterface francaInterface) {

    JavaClass javaClass =
        new JavaClass(JavaNameRules.getImplementationClassName(francaInterface.getName()));
    javaClass.visibility = JavaVisibility.PACKAGE;
    javaClass.javaPackage = basePackage.createChildPackage(rootModel.getPackageNames());
    javaClass.extendedClass = JavaClass.NATIVE_BASE;
    javaClass.fields.addAll(getPreviousResults(JavaField.class));

    javaClass.methods.addAll(getPreviousResults(JavaMethod.class));
    javaClass.methods.forEach(method -> method.qualifiers.add(MethodQualifier.NATIVE));

    return javaClass;
  }

  private void addInnerClasses(final JavaTopLevelElement javaTopLevelElement) {
    javaTopLevelElement.innerClasses.addAll(getPreviousResults(JavaClass.class));
    javaTopLevelElement.innerClasses.forEach(
        innerClass -> innerClass.qualifiers.add(JavaClass.Qualifier.STATIC));
  }

  @VisibleForTesting
  static boolean containsInstanceMethod(final List<JavaMethod> methods) {
    for (JavaMethod method : methods) {
      if (!method.qualifiers.contains(MethodQualifier.STATIC)) {
        return true;
      }
    }
    return false;
  }
}
