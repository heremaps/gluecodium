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

import com.here.ivi.api.model.franca.FrancaElement;
import com.here.ivi.api.model.javamodel.*;
import com.here.ivi.api.test.MockContextStack;
import java.util.Arrays;
import java.util.Collections;
import java.util.LinkedList;
import java.util.List;
import org.franca.core.franca.*;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Answers;
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

  @Mock(answer = Answers.RETURNS_DEEP_STUBS)
  private FrancaElement rootModel;

  @Mock private FInterface francaInterface;

  private final JavaType javaCustomType = new JavaCustomType("typical");
  private final JavaConstant javaConstant =
      new JavaConstant(javaCustomType, "permanent", new JavaValue("valuable"));
  private final JavaField javaField = new JavaField(javaCustomType, "flowers");
  private final JavaMethod javaMethod = new JavaMethod("methodical");

  private JavaModelBuilder modelBuilder;

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);
    PowerMockito.mockStatic(JavaModelBuilder.class);

    modelBuilder = new JavaModelBuilder(contextStack, BASE_PACKAGE, rootModel, null);

    when(rootModel.getFrancaModel().getName()).thenReturn("");
    when(rootModel.getPackageNames()).thenReturn(Collections.emptyList());

    when(francaInterface.getName()).thenReturn("classy");

    when(JavaModelBuilder.containsInstanceMethod(any())).thenReturn(true);
  }

  // Creates: Interface

  @Test
  public void finishBuildingFrancaInterfaceCreatesInterface() {
    modelBuilder.finishBuilding(francaInterface);

    JavaInterface javaInterface = modelBuilder.getFirstResult(JavaInterface.class);
    assertNotNull(javaInterface);
    assertEquals("classy", javaInterface.name.toLowerCase());
    assertEquals(JavaVisibility.PUBLIC, javaInterface.visibility);
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsPackageIntoInterface() {
    String packageName = "packed";
    when(rootModel.getPackageNames()).thenReturn(Collections.singletonList(packageName));

    modelBuilder.finishBuilding(francaInterface);

    JavaInterface javaInterface = modelBuilder.getFirstResult(JavaInterface.class);
    assertNotNull(javaInterface);

    List<String> expectedPackageNames = new LinkedList<>(BASE_PACKAGE.packageNames);
    expectedPackageNames.add(packageName);
    assertEquals(expectedPackageNames, javaInterface.javaPackage.packageNames);
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsConstantsIntoInterface() {
    contextStack.injectResult(javaConstant);

    modelBuilder.finishBuilding(francaInterface);

    JavaInterface javaInterface = modelBuilder.getFirstResult(JavaInterface.class);
    assertNotNull(javaInterface);
    assertFalse(javaInterface.constants.isEmpty());
    assertEquals(javaConstant, javaInterface.constants.iterator().next());
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsNonStaticMethodsIntoInterface() {
    contextStack.injectResult(javaMethod);

    modelBuilder.finishBuilding(francaInterface);

    JavaInterface javaInterface = modelBuilder.getFirstResult(JavaInterface.class);
    assertNotNull(javaInterface);
    assertFalse(javaInterface.methods.isEmpty());

    JavaMethod resultMethod = javaInterface.methods.iterator().next();
    assertEquals(javaMethod.name, resultMethod.name);
    assertFalse(resultMethod.qualifiers.contains(JavaMethod.MethodQualifier.NATIVE));
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsInnerClassesIntoInterface() {
    JavaClass innerClass = new JavaClass("struct");
    contextStack.injectResult(innerClass);

    modelBuilder.finishBuilding(francaInterface);

    JavaInterface javaInterface = modelBuilder.getFirstResult(JavaInterface.class);
    assertNotNull(javaInterface);
    assertFalse(javaInterface.innerClasses.isEmpty());
    assertEquals(innerClass, javaInterface.innerClasses.iterator().next());
  }

  // Creates: Implementation class

  @Test
  public void finishBuildingFrancaInterfaceCreatesImplClass() {
    modelBuilder.finishBuilding(francaInterface);

    JavaClass javaClass = modelBuilder.getFirstResult(JavaClass.class);
    assertNotNull(javaClass);
    assertEquals("classyimpl", javaClass.name.toLowerCase());
    assertEquals(JavaVisibility.PACKAGE, javaClass.visibility);
    assertEquals(JavaClass.NATIVE_BASE, javaClass.extendedClass);

    assertFalse(javaClass.parentInterfaces.isEmpty());
    assertEquals("classy", javaClass.parentInterfaces.iterator().next().name.toLowerCase());
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsPackageIntoImplClass() {
    String packageName = "packed";
    when(rootModel.getPackageNames()).thenReturn(Collections.singletonList(packageName));

    modelBuilder.finishBuilding(francaInterface);

    JavaClass javaClass = modelBuilder.getFirstResult(JavaClass.class);
    assertNotNull(javaClass);

    List<String> expectedPackageNames = new LinkedList<>(BASE_PACKAGE.packageNames);
    expectedPackageNames.add(packageName);
    assertEquals(expectedPackageNames, javaClass.javaPackage.packageNames);
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsFieldsIntoImplClass() {
    contextStack.injectResult(javaField);

    modelBuilder.finishBuilding(francaInterface);

    JavaClass javaClass = modelBuilder.getFirstResult(JavaClass.class);
    assertNotNull(javaClass);
    assertFalse(javaClass.fields.isEmpty());
    assertEquals(javaField, javaClass.fields.iterator().next());
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsStaticMethods() {
    javaMethod.qualifiers.add(JavaMethod.MethodQualifier.STATIC);
    contextStack.injectResult(javaMethod);

    modelBuilder.finishBuilding(francaInterface);

    JavaClass javaClass = modelBuilder.getFirstResult(JavaClass.class);
    assertNotNull(javaClass);
    assertFalse(javaClass.methods.isEmpty());
    assertEquals(javaMethod, javaClass.methods.iterator().next());
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsNonStaticMethodsIntoImplClass() {
    contextStack.injectResult(javaMethod);

    modelBuilder.finishBuilding(francaInterface);

    JavaClass javaClass = modelBuilder.getFirstResult(JavaClass.class);
    assertNotNull(javaClass);
    assertFalse(javaClass.methods.isEmpty());

    JavaMethod resultMethod = javaClass.methods.iterator().next();
    assertEquals(javaMethod.name, resultMethod.name);
    assertTrue(resultMethod.qualifiers.contains(JavaMethod.MethodQualifier.NATIVE));
  }

  // Creates: Static class

  @Test
  public void finishBuildingFrancaInterfaceCreatesStaticClass() {
    when(JavaModelBuilder.containsInstanceMethod(any())).thenReturn(false);

    modelBuilder.finishBuilding(francaInterface);

    JavaClass javaClass = modelBuilder.getFirstResult(JavaClass.class);
    assertNotNull(javaClass);
    assertEquals("classy", javaClass.name.toLowerCase());
    assertEquals(JavaVisibility.PUBLIC, javaClass.visibility);
    assertNull(javaClass.extendedClass);
    assertTrue(javaClass.parentInterfaces.isEmpty());
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsPackageIntoStaticClass() {
    when(JavaModelBuilder.containsInstanceMethod(any())).thenReturn(false);
    String packageName = "packed";
    when(rootModel.getPackageNames()).thenReturn(Collections.singletonList(packageName));

    modelBuilder.finishBuilding(francaInterface);

    JavaClass javaClass = modelBuilder.getFirstResult(JavaClass.class);
    assertNotNull(javaClass);

    List<String> expectedPackageNames = new LinkedList<>(BASE_PACKAGE.packageNames);
    expectedPackageNames.add(packageName);
    assertEquals(expectedPackageNames, javaClass.javaPackage.packageNames);
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsConstantsStaticClass() {
    when(JavaModelBuilder.containsInstanceMethod(any())).thenReturn(false);
    contextStack.injectResult(javaConstant);

    modelBuilder.finishBuilding(francaInterface);

    JavaClass javaClass = modelBuilder.getFirstResult(JavaClass.class);
    assertNotNull(javaClass);
    assertFalse(javaClass.constants.isEmpty());
    assertEquals(javaConstant, javaClass.constants.iterator().next());
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsFieldsIntoStaticClass() {
    when(JavaModelBuilder.containsInstanceMethod(any())).thenReturn(false);
    contextStack.injectResult(javaField);

    modelBuilder.finishBuilding(francaInterface);

    JavaClass javaClass = modelBuilder.getFirstResult(JavaClass.class);
    assertNotNull(javaClass);
    assertFalse(javaClass.fields.isEmpty());
    assertEquals(javaField, javaClass.fields.iterator().next());
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsMethodsIntoStaticClass() {
    when(JavaModelBuilder.containsInstanceMethod(any())).thenReturn(false);
    contextStack.injectResult(javaMethod);

    modelBuilder.finishBuilding(francaInterface);

    JavaClass javaClass = modelBuilder.getFirstResult(JavaClass.class);
    assertNotNull(javaClass);
    assertFalse(javaClass.methods.isEmpty());

    JavaMethod resultMethod = javaClass.methods.iterator().next();
    assertEquals(javaMethod, resultMethod);
    assertTrue(resultMethod.qualifiers.contains(JavaMethod.MethodQualifier.NATIVE));
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsInnerClassesIntoStaticClass() {
    when(JavaModelBuilder.containsInstanceMethod(any())).thenReturn(false);
    JavaClass innerClass = new JavaClass("struct");
    contextStack.injectResult(innerClass);

    modelBuilder.finishBuilding(francaInterface);

    JavaClass javaClass = modelBuilder.getFirstResult(JavaClass.class);
    assertNotNull(javaClass);
    assertFalse(javaClass.innerClasses.isEmpty());
    assertEquals(innerClass, javaClass.innerClasses.iterator().next());
  }
}
