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

package com.here.ivi.api.generator.common.java;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;

import com.here.ivi.api.model.franca.FrancaElement;
import com.here.ivi.api.model.javamodel.JavaClass;
import com.here.ivi.api.model.javamodel.JavaConstant;
import com.here.ivi.api.model.javamodel.JavaCustomType;
import com.here.ivi.api.model.javamodel.JavaElement;
import com.here.ivi.api.model.javamodel.JavaField;
import com.here.ivi.api.model.javamodel.JavaMethod;
import com.here.ivi.api.model.javamodel.JavaPackage;
import com.here.ivi.api.model.javamodel.JavaParameter;
import com.here.ivi.api.model.javamodel.JavaPrimitiveType;
import com.here.ivi.api.model.javamodel.JavaType;
import com.here.ivi.api.model.javamodel.JavaValue;
import com.here.ivi.api.model.javamodel.JavaVisibility;
import com.here.ivi.api.test.ArrayEList;
import com.here.ivi.api.test.MockContextStack;
import java.util.Arrays;
import java.util.Collections;
import java.util.LinkedList;
import java.util.List;
import org.eclipse.emf.common.util.EList;
import org.franca.core.franca.FArgument;
import org.franca.core.franca.FConstantDef;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FMethod;
import org.franca.core.franca.FModel;
import org.franca.core.franca.FStructType;
import org.franca.core.franca.FTypeCollection;
import org.franca.core.franca.FTypeRef;
import org.franca.core.franca.FTypedElement;
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
@PrepareForTest(JavaTypeMapper.class)
public class JavaModelBuilderTest {

  private static final String CLASS_NAME = "classy";
  private static final String METHOD_NAME = "methodical";
  private static final String PARAMETER_NAME = "curvature";
  private static final String CONSTANT_NAME = "permanent";
  private static final String FIELD_NAME = "flowers";
  private static final String STRUCT_NAME = "nonsense";
  private static final List<String> BASE_PACKAGE_NAMES =
      Arrays.asList("these", "are", "prefix", "packages");
  private static final JavaPackage BASE_PACKAGE = new JavaPackage(BASE_PACKAGE_NAMES);
  private static final String TYPE_COLLECTION_NAME = "TestTypeCollection";

  private final MockContextStack<JavaElement> contextStack = new MockContextStack<>();

  @Mock(answer = Answers.RETURNS_DEEP_STUBS)
  private FrancaElement rootElementModel;

  @Mock private FInterface francaInterface;
  @Mock private FTypeCollection francaTypeCollection;
  @Mock private FMethod francaMethod;
  @Mock private FArgument francaArgument;
  @Mock private FTypeRef francaTypeRef;
  @Mock private FConstantDef francaConstant;
  @Mock private FTypedElement francaTypedElement;
  @Mock private FStructType francaStructType;

  @Mock private FModel fModel;

  private final EList<FArgument> arguments = new ArrayEList<>();

  private final JavaType javaCustomType = new JavaCustomType("typical");
  private final JavaConstant javaConstant =
      new JavaConstant(javaCustomType, CONSTANT_NAME, new JavaValue("valuable"));
  private final JavaField javaField = new JavaField(javaCustomType, FIELD_NAME);

  private JavaModelBuilder modelBuilder;

  @Before
  public void setUp() {
    PowerMockito.mockStatic(JavaTypeMapper.class);
    MockitoAnnotations.initMocks(this);

    modelBuilder = new JavaModelBuilder(contextStack, BASE_PACKAGE, rootElementModel);

    when(rootElementModel.getModelInfo().getFModel()).thenReturn(fModel);
    when(rootElementModel.getModelInfo().getPackageNames()).thenReturn(new LinkedList<>());

    when(francaInterface.getName()).thenReturn(CLASS_NAME);
    when(francaConstant.getName()).thenReturn(CONSTANT_NAME);
    when(francaTypedElement.getName()).thenReturn(FIELD_NAME);
    when(francaStructType.getName()).thenReturn(STRUCT_NAME);

    when(francaMethod.getName()).thenReturn(METHOD_NAME);
    when(francaMethod.getOutArgs()).thenReturn(arguments);

    when(francaArgument.getName()).thenReturn(PARAMETER_NAME);
    when(francaArgument.getType()).thenReturn(francaTypeRef);
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsClassName() {
    modelBuilder.finishBuilding(francaInterface);

    JavaClass javaClass = modelBuilder.getFirstResult(JavaClass.class);
    assertNotNull(javaClass);
    assertEquals(CLASS_NAME, javaClass.name.toLowerCase());
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsPackage() {
    JavaPackage javaPackage = new JavaPackage(Collections.singletonList("packed"));
    when(JavaTypeMapper.createJavaPackage(any(), any())).thenReturn(javaPackage);

    modelBuilder.finishBuilding(francaInterface);

    JavaClass javaClass = modelBuilder.getFirstResult(JavaClass.class);
    assertNotNull(javaClass);
    assertEquals(javaPackage, javaClass.javaPackage);

    PowerMockito.verifyStatic();
    JavaTypeMapper.createJavaPackage(BASE_PACKAGE, fModel);
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsConstants() {
    contextStack.injectResult(javaConstant);

    modelBuilder.finishBuilding(francaInterface);

    JavaClass javaClass = modelBuilder.getFirstResult(JavaClass.class);
    assertNotNull(javaClass);
    assertFalse(javaClass.constants.isEmpty());
    assertEquals(javaConstant, javaClass.constants.iterator().next());
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsFields() {
    contextStack.injectResult(javaField);

    modelBuilder.finishBuilding(francaInterface);

    JavaClass javaClass = modelBuilder.getFirstResult(JavaClass.class);
    assertNotNull(javaClass);
    assertFalse(javaClass.fields.isEmpty());
    assertEquals(javaField, javaClass.fields.iterator().next());
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsMethods() {
    final JavaMethod javaMethod = new JavaMethod(METHOD_NAME);
    contextStack.injectResult(javaMethod);

    modelBuilder.finishBuilding(francaInterface);

    JavaClass javaClass = modelBuilder.getFirstResult(JavaClass.class);
    assertNotNull(javaClass);
    assertFalse(javaClass.methods.isEmpty());
    assertEquals(javaMethod, javaClass.methods.iterator().next());
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsInnerClasses() {
    JavaClass innerClass = new JavaClass("struct");
    contextStack.injectResult(innerClass);

    modelBuilder.finishBuilding(francaInterface);

    JavaClass javaClass = modelBuilder.getFirstResult(JavaClass.class);
    assertNotNull(javaClass);
    assertFalse(javaClass.innerClasses.isEmpty());
    assertEquals(innerClass, javaClass.innerClasses.iterator().next());
  }

  @Test
  public void finishBuildingFrancaMethod() {
    modelBuilder.finishBuilding(francaMethod);

    JavaMethod javaMethod = modelBuilder.getFirstResult(JavaMethod.class);
    assertNotNull(javaMethod);
    assertEquals(METHOD_NAME, javaMethod.name);
    assertTrue(javaMethod.qualifiers.contains(JavaMethod.MethodQualifier.NATIVE));
    assertEquals(JavaVisibility.PUBLIC, javaMethod.visibility);
  }

  @Test
  public void finishBuildingFrancaMethodWithZeroOutArgs() {
    modelBuilder.finishBuilding(francaMethod);

    JavaMethod javaMethod = modelBuilder.getFirstResult(JavaMethod.class);
    assertNotNull(javaMethod);
    assertTrue(javaMethod.returnType instanceof JavaPrimitiveType);
    assertEquals(JavaPrimitiveType.Type.VOID, ((JavaPrimitiveType) javaMethod.returnType).type);
  }

  @Test
  public void finishBuildingFrancaMethodWithOneOutArg() {
    when(JavaTypeMapper.map(any(), any())).thenReturn(javaCustomType);
    arguments.add(francaArgument);

    modelBuilder.finishBuilding(francaMethod);

    JavaMethod javaMethod = modelBuilder.getFirstResult(JavaMethod.class);
    assertNotNull(javaMethod);
    assertEquals(javaCustomType, javaMethod.returnType);

    PowerMockito.verifyStatic();
    JavaTypeMapper.map(BASE_PACKAGE, francaTypeRef);
  }

  @Test
  public void finishBuildingFrancaMethodReadsParameters() {
    final JavaParameter javaParameter = new JavaParameter(javaCustomType, PARAMETER_NAME);
    contextStack.injectResult(javaParameter);

    modelBuilder.finishBuilding(francaMethod);

    JavaMethod javaMethod = modelBuilder.getFirstResult(JavaMethod.class);
    assertNotNull(javaMethod);
    assertFalse(javaMethod.parameters.isEmpty());
    assertEquals(javaParameter, javaMethod.parameters.get(0));
  }

  @Test
  public void finishBuildingFrancaInputArgument() {
    when(JavaTypeMapper.map(any(), any())).thenReturn(javaCustomType);

    modelBuilder.finishBuildingInputArgument(francaArgument);

    JavaParameter javaParameter = modelBuilder.getFirstResult(JavaParameter.class);
    assertNotNull(javaParameter);
    assertEquals(PARAMETER_NAME, javaParameter.name);
    assertEquals(javaCustomType, javaParameter.type);

    PowerMockito.verifyStatic();
    JavaTypeMapper.map(BASE_PACKAGE, francaTypeRef);
  }

  @Test
  public void finishBuildingFrancaTypeCollectionReadsClasses() {
    when(JavaTypeMapper.createJavaPackage(any(), any())).thenReturn(BASE_PACKAGE);
    when(francaTypeCollection.getName()).thenReturn(TYPE_COLLECTION_NAME);
    final JavaClass firstInnerClass = new JavaClass(CLASS_NAME);
    final JavaClass secondInnerClass = new JavaClass(CLASS_NAME + "Sibling");
    contextStack.injectResult(firstInnerClass);
    contextStack.injectResult(secondInnerClass);

    modelBuilder.finishBuilding(francaTypeCollection);
    List<JavaElement> javaElements = modelBuilder.getResults();

    assertNotNull(javaElements);
    assertEquals(2, javaElements.size());

    JavaClass firstJavaClass = (JavaClass) javaElements.get(0);
    JavaClass secondJavaClass = (JavaClass) javaElements.get(1);

    assertEquals(firstInnerClass, firstJavaClass);
    assertEquals(secondInnerClass, secondJavaClass);
  }

  @Test
  public void finishBuildingFrancaTypeCollectionPutsClassesInRightPackage() {
    when(JavaTypeMapper.createJavaPackage(any(), any())).thenReturn(BASE_PACKAGE);
    when(francaTypeCollection.getName()).thenReturn(TYPE_COLLECTION_NAME);

    final JavaClass innerClass = new JavaClass(CLASS_NAME);
    contextStack.injectResult(innerClass);
    modelBuilder.finishBuilding(francaTypeCollection);
    JavaClass javaClass = (JavaClass) modelBuilder.getResults().get(0);
    String expectedPackage =
        String.join(".", BASE_PACKAGE_NAMES) + "." + TYPE_COLLECTION_NAME.toLowerCase();
    String innerPackage = String.join(".", javaClass.javaPackage.packageNames);
    assertEquals(expectedPackage, innerPackage);

    PowerMockito.verifyStatic();
    JavaTypeMapper.createJavaPackage(BASE_PACKAGE, fModel);
  }

  @Test
  public void finishBuildingFrancaConstant() {
    modelBuilder.finishBuilding(francaConstant);

    JavaConstant javaConstant = modelBuilder.getFirstResult(JavaConstant.class);
    assertNotNull(javaConstant);
    assertNotNull(javaConstant);
    assertEquals(CONSTANT_NAME, javaConstant.name.toLowerCase());
  }

  @Test
  public void finishBuildingFrancaTypedElementReadsName() {
    modelBuilder.finishBuilding(francaTypedElement);

    JavaField javaField = modelBuilder.getFirstResult(JavaField.class);
    assertNotNull(javaField);
    assertEquals(FIELD_NAME, javaField.name.toLowerCase());
  }

  @Test
  public void finishBuildingFrancaTypedElementReadsType() {
    contextStack.injectResult(javaCustomType);

    modelBuilder.finishBuilding(francaTypedElement);

    JavaField javaField = modelBuilder.getFirstResult(JavaField.class);
    assertNotNull(javaField);
    assertEquals(javaCustomType, javaField.type);
  }

  @Test
  public void finishBuildingFrancaCustomTypedElementHasInitializer() {
    contextStack.injectResult(javaCustomType);

    modelBuilder.finishBuilding(francaTypedElement);

    JavaField javaField = modelBuilder.getFirstResult(JavaField.class);
    assertNotNull(javaField);
    assertEquals(javaCustomType, javaField.customTypeInitial);
  }

  @Test
  public void finishBuildingFrancaTypedElementCreatesPublicField() {
    modelBuilder.finishBuilding(francaTypedElement);

    JavaField javaField = modelBuilder.getFirstResult(JavaField.class);
    assertNotNull(javaField);
    assertEquals(JavaVisibility.PUBLIC, javaField.visibility);
  }

  @Test
  public void finishBuildingFrancaStructType() {
    modelBuilder.finishBuilding(francaStructType);

    JavaClass javaClass = modelBuilder.getFirstResult(JavaClass.class);
    assertNotNull(javaClass);
    assertEquals(STRUCT_NAME, javaClass.name.toLowerCase());
  }

  @Test
  public void finishBuildingFrancaStructTypeReadsFields() {
    contextStack.injectResult(javaField);

    modelBuilder.finishBuilding(francaStructType);

    JavaClass javaClass = modelBuilder.getFirstResult(JavaClass.class);
    assertNotNull(javaClass);
    assertFalse(javaClass.fields.isEmpty());
    assertEquals(javaField, javaClass.fields.iterator().next());
  }

  @Test
  public void finishBuildingFrancaTypeRef() {
    when(JavaTypeMapper.map(any(), any())).thenReturn(javaCustomType);

    modelBuilder.finishBuilding(francaTypeRef);

    JavaType javaType = modelBuilder.getFirstResult(JavaType.class);
    assertEquals(javaCustomType, javaType);

    PowerMockito.verifyStatic();
    JavaTypeMapper.map(BASE_PACKAGE, francaTypeRef);
  }
}
