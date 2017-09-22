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
import org.eclipse.emf.common.util.EList;
import org.franca.core.franca.*;

public class JavaModelBuilder extends AbstractModelBuilder<JavaElement> {

  private final JavaPackage basePackage;
  private final FrancaElement rootModel;

  public JavaModelBuilder(
      final ModelBuilderContextStack<JavaElement> contextStack,
      final JavaPackage basePackage,
      final FrancaElement rootModel) {
    super(contextStack);
    this.basePackage = basePackage;
    this.rootModel = rootModel;
  }

  public JavaModelBuilder(final JavaPackage basePackage, final FrancaElement rootModel) {
    super(new ModelBuilderContextStack<>());
    this.basePackage = basePackage;
    this.rootModel = rootModel;
  }

  @Override
  public void finishBuilding(FInterface francaInterface) {

    List<JavaElement> previousResults = getCurrentContext().previousResults;
    List<JavaMethod> methods = CollectionsHelper.getAllOfType(previousResults, JavaMethod.class);

    if (containsInstanceMethod(methods)) {

      JavaInterface javaInterface = createJavaInterface(francaInterface);
      storeResult(javaInterface);

      JavaClass javaClass = createJavaImplementationClass(francaInterface);
      javaClass.parentInterfaces.add(javaInterface);
      storeResult(javaClass);
    } else {

      JavaClass javaClass = createJavaClass(francaInterface);
      javaClass.constants.addAll(
          CollectionsHelper.getAllOfType(previousResults, JavaConstant.class));

      javaClass.methods.addAll(methods);
      javaClass.methods.forEach(method -> method.qualifiers.add(MethodQualifier.NATIVE));

      addInnerClasses(javaClass);

      storeResult(javaClass);
    }

    closeContext();
  }

  @Override
  public void finishBuilding(FTypeCollection francaTypeCollection) {

    JavaPackage javaPackage = basePackage.createChildPackage(rootModel.getPackageNames());
    CollectionsHelper.getStreamOfType(getCurrentContext().previousResults, JavaClass.class)
        .forEach(
            javaClass -> {
              javaClass.javaPackage = javaPackage;
              storeResult(javaClass);
            });
    closeContext();
  }

  @Override
  public void finishBuilding(FMethod francaMethod) {

    JavaMethod javaMethod;

    // Map return type
    EList<FArgument> outArgs = francaMethod.getOutArgs();
    if (outArgs.isEmpty()) { // Void return type
      javaMethod = new JavaMethod(JavaNameRules.getMethodName(francaMethod.getName()));
    } else if (outArgs.size() == 1) {
      JavaType returnType = JavaTypeMapper.map(basePackage, outArgs.get(0).getType());
      javaMethod = new JavaMethod(JavaNameRules.getMethodName(francaMethod.getName()), returnType);
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
    javaMethod.parameters.addAll(
        CollectionsHelper.getAllOfType(getCurrentContext().previousResults, JavaParameter.class));

    storeResult(javaMethod);
    closeContext();
  }

  @Override
  public void finishBuildingInputArgument(FArgument francaArgument) {

    JavaType javaArgumentType = JavaTypeMapper.map(basePackage, francaArgument.getType());
    JavaParameter javaParameter =
        new JavaParameter(
            javaArgumentType, JavaNameRules.getArgumentName(francaArgument.getName()));

    storeResult(javaParameter);
    closeContext();
  }

  @Override
  public void finishBuilding(FConstantDef francaConstant) {

    JavaType type = JavaTypeMapper.map(basePackage, francaConstant.getType());
    JavaValue value = JavaValueMapper.map(type, francaConstant.getRhs());
    JavaConstant javaConstant =
        new JavaConstant(type, JavaNameRules.getConstantName(francaConstant.getName()), value);
    javaConstant.comment = getCommentString(francaConstant);

    storeResult(javaConstant);
    closeContext();
  }

  @Override
  public void finishBuilding(FField francaField) {

    JavaType javaType =
        CollectionsHelper.getFirstOfType(getCurrentContext().previousResults, JavaType.class);
    String fieldName = JavaNameRules.getFieldName(francaField.getName());
    JavaField javaField;
    if (javaType instanceof JavaCustomType) {
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

    storeResult(JavaTypeMapper.map(basePackage, francaTypeRef));
    closeContext();
  }

  @Override
  public void finishBuilding(FAttribute francaAttribute) {

    JavaType javaType =
        CollectionsHelper.getFirstOfType(getCurrentContext().previousResults, JavaType.class);

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

    javaClass.fields.addAll(
        CollectionsHelper.getAllOfType(getCurrentContext().previousResults, JavaField.class));

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
    javaInterface.constants.addAll(
        CollectionsHelper.getAllOfType(previousResults, JavaConstant.class));

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

    List<JavaElement> previousResults = getCurrentContext().previousResults;

    JavaClass javaClass =
        new JavaClass(JavaNameRules.getImplementationClassName(francaInterface.getName()));
    javaClass.visibility = JavaVisibility.PACKAGE;
    javaClass.javaPackage = basePackage.createChildPackage(rootModel.getPackageNames());
    javaClass.extendedClass = JavaClass.NATIVE_BASE;
    javaClass.fields.addAll(CollectionsHelper.getAllOfType(previousResults, JavaField.class));

    javaClass.methods.addAll(CollectionsHelper.getAllOfType(previousResults, JavaMethod.class));
    javaClass.methods.forEach(method -> method.qualifiers.add(MethodQualifier.NATIVE));

    return javaClass;
  }

  private void addInnerClasses(final JavaTopLevelElement javaTopLevelElement) {
    javaTopLevelElement.innerClasses.addAll(
        CollectionsHelper.getAllOfType(getCurrentContext().previousResults, JavaClass.class));
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
