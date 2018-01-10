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

import static org.junit.Assert.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;

import com.here.ivi.api.model.franca.FrancaDeploymentModel;
import com.here.ivi.api.model.java.*;
import com.here.ivi.api.test.MockContextStack;
import java.util.Arrays;
import org.franca.core.franca.*;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.powermock.api.mockito.PowerMockito;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
@PrepareForTest(JavaModelBuilder.class)
public class JavaModelBuilderInterfaceTest {

  private static final JavaPackage BASE_PACKAGE =
      new JavaPackage(Arrays.asList("these", "are", "prefix", "packages"));

  private final MockContextStack<JavaElement> contextStack = new MockContextStack<>();

  @Mock private FrancaDeploymentModel deploymentModel;
  @Mock private JavaTypeMapper typeMapper;

  @Mock private FInterface francaInterface;
  @Mock private FInterface parentInterface;

  private final JavaCustomType nativeBase = new JavaCustomType("FooNativeBar");
  private final JavaType javaCustomType = new JavaCustomType("typical");
  private final JavaConstant javaConstant =
      new JavaConstant(javaCustomType, "permanent", new JavaValue("valuable"));
  private final JavaField javaField = new JavaField(javaCustomType, "flowers");
  private final JavaMethod javaMethod = new JavaMethod("methodical");
  private final JavaEnum javaEnum = new JavaEnum("enumerable");

  private JavaModelBuilder modelBuilder;

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);
    PowerMockito.mockStatic(JavaModelBuilder.class);

    when(typeMapper.getNativeBase()).thenReturn(nativeBase);
    modelBuilder = new JavaModelBuilder(contextStack, deploymentModel, BASE_PACKAGE, typeMapper);

    when(francaInterface.getName()).thenReturn("classy");
  }

  // Creates: Interface implemented as Java class

  @Test
  public void finishBuildingFrancaInterfaceCreatesJavaClassWithExtendedNativeBase() {
    modelBuilder.finishBuilding(francaInterface);

    JavaClass javaClass = modelBuilder.getFinalResult(JavaClass.class);
    assertNotNull(javaClass);
    assertEquals("Classy", javaClass.name);
    assertEquals(JavaVisibility.PUBLIC, javaClass.visibility);
    assertEquals(nativeBase, javaClass.extendedClass);
    assertTrue(javaClass.parentInterfaces.isEmpty());
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsPackageIntoJavaClassInterface() {
    modelBuilder.finishBuilding(francaInterface);

    JavaClass javaClass = modelBuilder.getFinalResult(JavaClass.class);
    assertNotNull(javaClass);
    assertEquals(BASE_PACKAGE, javaClass.javaPackage);
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsConstantsJavaClassInterface() {
    contextStack.injectResult(javaConstant);

    modelBuilder.finishBuilding(francaInterface);

    JavaClass javaClass = modelBuilder.getFinalResult(JavaClass.class);
    assertNotNull(javaClass);
    assertFalse(javaClass.constants.isEmpty());
    assertEquals(javaConstant, javaClass.constants.iterator().next());
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsFieldsIntoJavaClassInterface() {
    contextStack.injectResult(javaField);

    modelBuilder.finishBuilding(francaInterface);

    JavaClass javaClass = modelBuilder.getFinalResult(JavaClass.class);
    assertNotNull(javaClass);
    assertFalse(javaClass.fields.isEmpty());
    assertEquals(javaField, javaClass.fields.iterator().next());
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsMethodsJavaClassInterface() {
    contextStack.injectResult(javaMethod);

    modelBuilder.finishBuilding(francaInterface);

    JavaClass javaClass = modelBuilder.getFinalResult(JavaClass.class);
    assertNotNull(javaClass);
    assertFalse(javaClass.methods.isEmpty());

    JavaMethod resultMethod = javaClass.methods.iterator().next();
    assertEquals(javaMethod, resultMethod);
    assertTrue(resultMethod.qualifiers.contains(JavaMethod.MethodQualifier.NATIVE));
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsInnerClassesIntoJavaClassInterface() {
    JavaClass innerClass = new JavaClass("struct");
    contextStack.injectResult(innerClass);

    modelBuilder.finishBuilding(francaInterface);

    JavaClass javaClass = modelBuilder.getFinalResult(JavaClass.class);
    assertNotNull(javaClass);
    assertFalse(javaClass.innerClasses.isEmpty());
    assertEquals(innerClass, javaClass.innerClasses.iterator().next());
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsEnumIntoJavaClassInterface() {
    contextStack.injectResult(javaEnum);

    modelBuilder.finishBuilding(francaInterface);

    JavaClass javaClass = modelBuilder.getFinalResult(JavaClass.class);
    assertNotNull(javaClass);
    assertEquals(1, javaClass.enums.size());
    assertEquals(javaEnum, javaClass.enums.iterator().next());
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsClassParentIntoJavaClass() {
    when(francaInterface.getBase()).thenReturn(parentInterface);
    when(typeMapper.mapCustomType(any())).thenReturn(javaCustomType);

    modelBuilder.finishBuilding(francaInterface);

    JavaClass javaClass = modelBuilder.getFinalResult(JavaClass.class);
    assertNotNull(javaClass);
    assertEquals(javaCustomType, javaClass.extendedClass);
    assertTrue(javaClass.parentInterfaces.isEmpty());
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsInterfaceParentIntoJavaClass() {
    when(deploymentModel.isInterface(parentInterface)).thenReturn(true);
    when(francaInterface.getBase()).thenReturn(parentInterface);
    when(typeMapper.mapCustomType(any(), any())).thenReturn(javaCustomType);

    modelBuilder.finishBuilding(francaInterface);

    JavaClass javaClass = modelBuilder.getFinalResult(JavaClass.class);
    assertNotNull(javaClass);
    assertEquals(javaCustomType, javaClass.extendedClass);
    assertTrue(javaClass.innerClasses.isEmpty());
  }

  // Creates: Interface implemented as Java interface

  @Test
  public void finishBuildingFrancaInterfaceCreatesInterface() {
    when(deploymentModel.isInterface(francaInterface)).thenReturn(true);
    modelBuilder.finishBuilding(francaInterface);

    JavaInterface javaInterface = modelBuilder.getFinalResult(JavaInterface.class);
    assertNotNull(javaInterface);
    assertEquals("Classy", javaInterface.name);
    assertEquals(JavaVisibility.PUBLIC, javaInterface.visibility);
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsPackageIntoInterface() {
    when(deploymentModel.isInterface(francaInterface)).thenReturn(true);
    modelBuilder.finishBuilding(francaInterface);

    JavaInterface javaInterface = modelBuilder.getFinalResult(JavaInterface.class);
    assertNotNull(javaInterface);

    assertEquals(BASE_PACKAGE, javaInterface.javaPackage);
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsConstantsIntoInterface() {
    when(deploymentModel.isInterface(francaInterface)).thenReturn(true);
    contextStack.injectResult(javaConstant);

    modelBuilder.finishBuilding(francaInterface);

    JavaInterface javaInterface = modelBuilder.getFinalResult(JavaInterface.class);
    assertNotNull(javaInterface);
    assertFalse(javaInterface.constants.isEmpty());
    assertEquals(javaConstant, javaInterface.constants.iterator().next());
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsNonStaticMethodsIntoInterface() {
    when(deploymentModel.isInterface(francaInterface)).thenReturn(true);
    contextStack.injectResult(javaMethod);

    modelBuilder.finishBuilding(francaInterface);

    JavaInterface javaInterface = modelBuilder.getFinalResult(JavaInterface.class);
    assertNotNull(javaInterface);
    assertFalse(javaInterface.methods.isEmpty());
    JavaMethod resultMethod = javaInterface.methods.iterator().next();
    assertEquals(javaMethod.name, resultMethod.name);
    assertFalse(resultMethod.qualifiers.contains(JavaMethod.MethodQualifier.NATIVE));
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsEnumIntoInterface() {
    when(deploymentModel.isInterface(francaInterface)).thenReturn(true);
    contextStack.injectResult(javaEnum);

    modelBuilder.finishBuilding(francaInterface);

    JavaInterface javaInterface = modelBuilder.getFinalResult(JavaInterface.class);
    assertNotNull(javaInterface);
    assertEquals(1, javaInterface.enums.size());
    assertEquals(javaEnum, javaInterface.enums.iterator().next());
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsInnerClassesIntoInterface() {
    when(deploymentModel.isInterface(francaInterface)).thenReturn(true);
    JavaClass innerClass = new JavaClass("struct");
    contextStack.injectResult(innerClass);

    modelBuilder.finishBuilding(francaInterface);

    JavaInterface javaInterface = modelBuilder.getFinalResult(JavaInterface.class);
    assertNotNull(javaInterface);
    assertFalse(javaInterface.innerClasses.isEmpty());
    assertEquals(innerClass, javaInterface.innerClasses.iterator().next());
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsParentIntoInterface() {
    when(deploymentModel.isInterface(francaInterface)).thenReturn(true);
    when(francaInterface.getBase()).thenReturn(parentInterface);
    when(typeMapper.mapCustomType(any())).thenReturn(javaCustomType);

    modelBuilder.finishBuilding(francaInterface);

    JavaInterface javaInterface = modelBuilder.getFinalResult(JavaInterface.class);
    assertNotNull(javaInterface);
    assertFalse(javaInterface.parentInterfaces.isEmpty());
    assertEquals(javaCustomType, javaInterface.parentInterfaces.iterator().next());
    assertTrue(javaInterface.innerClasses.isEmpty());
  }

  // Creates: Implementation class for Java interface

  @Test
  public void finishBuildingFrancaInterfaceCreatesImplClass() {
    when(deploymentModel.isInterface(francaInterface)).thenReturn(true);
    modelBuilder.finishBuilding(francaInterface);

    JavaClass javaClass = modelBuilder.getFinalResult(JavaClass.class);
    assertNotNull(javaClass);
    assertEquals("ClassyImpl", javaClass.name);
    assertEquals(JavaVisibility.PACKAGE, javaClass.visibility);
    assertEquals(nativeBase, javaClass.extendedClass);

    assertFalse(javaClass.parentInterfaces.isEmpty());
    assertEquals("Classy", javaClass.parentInterfaces.iterator().next().name);
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsPackageIntoImplClass() {
    when(deploymentModel.isInterface(francaInterface)).thenReturn(true);
    modelBuilder.finishBuilding(francaInterface);

    JavaClass javaClass = modelBuilder.getFinalResult(JavaClass.class);
    assertNotNull(javaClass);
    assertEquals(BASE_PACKAGE, javaClass.javaPackage);
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsFieldsIntoImplClass() {
    when(deploymentModel.isInterface(francaInterface)).thenReturn(true);
    contextStack.injectResult(javaField);

    modelBuilder.finishBuilding(francaInterface);

    JavaClass javaClass = modelBuilder.getFinalResult(JavaClass.class);
    assertNotNull(javaClass);
    assertFalse(javaClass.fields.isEmpty());
    assertEquals(javaField, javaClass.fields.iterator().next());
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsStaticMethods() {
    when(deploymentModel.isInterface(francaInterface)).thenReturn(true);
    javaMethod.qualifiers.add(JavaMethod.MethodQualifier.STATIC);
    contextStack.injectResult(javaMethod);

    modelBuilder.finishBuilding(francaInterface);

    JavaClass javaClass = modelBuilder.getFinalResult(JavaClass.class);
    assertNotNull(javaClass);
    assertFalse(javaClass.methods.isEmpty());
    assertEquals(javaMethod, javaClass.methods.iterator().next());
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsNonStaticMethodsIntoImplClass() {
    when(deploymentModel.isInterface(francaInterface)).thenReturn(true);
    contextStack.injectResult(javaMethod);

    modelBuilder.finishBuilding(francaInterface);

    JavaClass javaClass = modelBuilder.getFinalResult(JavaClass.class);
    assertNotNull(javaClass);
    assertFalse(javaClass.methods.isEmpty());
    JavaMethod resultMethod = javaClass.methods.iterator().next();
    assertEquals(javaMethod.name, resultMethod.name);
    assertTrue(resultMethod.qualifiers.contains(JavaMethod.MethodQualifier.NATIVE));
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsEnumIntoImplClass() {
    when(deploymentModel.isInterface(francaInterface)).thenReturn(true);
    contextStack.injectResult(new JavaMethod("myMethod"));
    contextStack.injectResult(javaEnum);

    modelBuilder.finishBuilding(francaInterface);

    JavaInterface result = modelBuilder.getFinalResult(JavaInterface.class);
    assertEquals(1, result.enums.size());
    assertEquals(javaEnum, result.enums.iterator().next());
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsParentIntoImplClass() {
    when(deploymentModel.isInterface(francaInterface)).thenReturn(true);
    when(francaInterface.getBase()).thenReturn(parentInterface);
    when(typeMapper.mapCustomType(any(), any())).thenReturn(javaCustomType);

    modelBuilder.finishBuilding(francaInterface);

    JavaClass javaClass = modelBuilder.getFinalResult(JavaClass.class);
    assertNotNull(javaClass);
    assertEquals(javaCustomType, javaClass.extendedClass);
  }
}
