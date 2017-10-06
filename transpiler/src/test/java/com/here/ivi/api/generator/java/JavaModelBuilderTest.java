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

import com.here.ivi.api.common.CollectionsHelper;
import com.here.ivi.api.model.franca.FrancaElement;
import com.here.ivi.api.model.javamodel.*;
import com.here.ivi.api.test.ArrayEList;
import com.here.ivi.api.test.MockContextStack;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.eclipse.emf.common.util.EList;
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
@PrepareForTest(JavaTypeMapper.class)
public class JavaModelBuilderTest {

  private static final String CLASS_NAME = "classy";
  private static final String METHOD_NAME = "methodical";
  private static final String PARAMETER_NAME = "curvature";
  private static final String FIELD_NAME = "flowers";
  private static final String ATTRIBUTE_NAME = "tribute";

  private static final List<String> BASE_PACKAGE_NAMES =
      Arrays.asList("these", "are", "prefix", "packages");
  private static final JavaPackage BASE_PACKAGE = new JavaPackage(BASE_PACKAGE_NAMES);

  private final MockContextStack<JavaElement> contextStack = new MockContextStack<>();

  @Mock(answer = Answers.RETURNS_DEEP_STUBS)
  private FrancaElement rootModel;

  @Mock private FTypeCollection francaTypeCollection;
  @Mock private FMethod francaMethod;
  @Mock private FArgument francaArgument;
  @Mock private FTypeRef francaTypeRef;
  @Mock private FConstantDef francaConstant;
  @Mock private FField francaField;
  @Mock private FStructType francaStructType;
  @Mock private FAttribute francaAttribute;
  @Mock private FArrayType francaArrayType;

  private final EList<FArgument> arguments = new ArrayEList<>();

  private final JavaType javaCustomType = new JavaCustomType("typical");
  private final JavaField javaField = new JavaField(javaCustomType, FIELD_NAME);

  private JavaModelBuilder modelBuilder;

  @Before
  public void setUp() {
    PowerMockito.mockStatic(JavaTypeMapper.class);
    MockitoAnnotations.initMocks(this);

    modelBuilder = new JavaModelBuilder(contextStack, BASE_PACKAGE, rootModel);

    when(rootModel.getFrancaModel().getName()).thenReturn("");
    when(rootModel.getPackageNames()).thenReturn(Collections.emptyList());

    when(francaConstant.getName()).thenReturn("permanent");
    when(francaField.getName()).thenReturn(FIELD_NAME);
    when(francaStructType.getName()).thenReturn("nonsense");
    when(francaAttribute.getName()).thenReturn(ATTRIBUTE_NAME);

    when(francaMethod.getName()).thenReturn(METHOD_NAME);
    when(francaMethod.getOutArgs()).thenReturn(arguments);

    when(francaArgument.getName()).thenReturn(PARAMETER_NAME);
    when(francaArgument.getType()).thenReturn(francaTypeRef);
  }

  @Test
  public void finishBuildingFrancaMethod() {
    modelBuilder.finishBuilding(francaMethod);

    JavaMethod javaMethod = modelBuilder.getFirstResult(JavaMethod.class);
    assertNotNull(javaMethod);
    assertEquals(METHOD_NAME, javaMethod.name);
    assertFalse(javaMethod.qualifiers.contains(JavaMethod.MethodQualifier.STATIC));
    assertEquals(JavaVisibility.PUBLIC, javaMethod.visibility);
  }

  @Test
  public void finishBuildingFrancaMethodOmitsSelector() {
    when(francaMethod.getSelector()).thenReturn("selective");

    modelBuilder.finishBuilding(francaMethod);

    JavaMethod javaMethod = modelBuilder.getFirstResult(JavaMethod.class);
    assertNotNull(javaMethod);
    assertEquals(METHOD_NAME, javaMethod.name);
  }

  @Test
  public void finishBuildingFrancaMethodWithStatic() {
    when(rootModel.isStatic(any())).thenReturn(true);

    modelBuilder.finishBuilding(francaMethod);

    JavaMethod javaMethod = modelBuilder.getFirstResult(JavaMethod.class);
    assertNotNull(javaMethod);
    assertTrue(javaMethod.qualifiers.contains(JavaMethod.MethodQualifier.STATIC));
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
    contextStack.injectResult(javaCustomType);

    modelBuilder.finishBuildingInputArgument(francaArgument);

    JavaParameter javaParameter = modelBuilder.getFirstResult(JavaParameter.class);
    assertNotNull(javaParameter);
    assertEquals(javaCustomType, javaParameter.type);
  }

  @Test
  public void finishBuildingFrancaTypeCollectionReadsClasses() {
    when(francaTypeCollection.getName()).thenReturn("TestTypeCollection");
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
  public void finishBuildingFrancaConstant() {
    contextStack.injectResult(javaCustomType);

    modelBuilder.finishBuilding(francaConstant);

    JavaConstant resultConstant = modelBuilder.getFirstResult(JavaConstant.class);
    assertNotNull(resultConstant);
    assertEquals("permanent", resultConstant.name.toLowerCase());
    assertEquals(javaCustomType, resultConstant.type);
  }

  @Test
  public void finishBuildingFrancaFieldReadsName() {
    modelBuilder.finishBuilding(francaField);

    JavaField resultField = modelBuilder.getFirstResult(JavaField.class);
    assertNotNull(resultField);
    assertEquals(FIELD_NAME, resultField.name.toLowerCase());
  }

  @Test
  public void finishBuildingFrancaFieldReadsType() {
    contextStack.injectResult(javaCustomType);

    modelBuilder.finishBuilding(francaField);

    JavaField resultField = modelBuilder.getFirstResult(JavaField.class);
    assertNotNull(resultField);
    assertEquals(javaCustomType, resultField.type);
  }

  @Test
  public void finishBuildingFrancaCustomTypedElementHasInitializer() {
    contextStack.injectResult(javaCustomType);

    modelBuilder.finishBuilding(francaField);

    JavaField resultField = modelBuilder.getFirstResult(JavaField.class);
    assertNotNull(resultField);
    assertEquals(javaCustomType, resultField.customTypeInitial);
  }

  @Test
  public void finishBuildingFrancaFieldCreatesPublicField() {
    modelBuilder.finishBuilding(francaField);

    JavaField resultField = modelBuilder.getFirstResult(JavaField.class);
    assertNotNull(resultField);
    assertEquals(JavaVisibility.PUBLIC, resultField.visibility);
  }

  @Test
  public void finishBuildingFrancaStructType() {
    modelBuilder.finishBuilding(francaStructType);

    JavaClass javaClass = modelBuilder.getFirstResult(JavaClass.class);
    assertNotNull(javaClass);
    assertEquals("nonsense", javaClass.name.toLowerCase());
    assertEquals(BASE_PACKAGE_NAMES, javaClass.javaPackage.packageNames);
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

  @Test
  public void finishBuildingFrancaAttributeCreatesGetter() {
    modelBuilder.finishBuilding(francaAttribute);

    JavaMethod javaMethod = modelBuilder.getFirstResult(JavaMethod.class);
    assertNotNull(javaMethod);
    assertEquals("get" + ATTRIBUTE_NAME, javaMethod.name.toLowerCase());
  }

  @Test
  public void finishBuildingFrancaAttributeCreatesSetter() {
    modelBuilder.finishBuilding(francaAttribute);

    List<JavaMethod> methods =
        CollectionsHelper.getAllOfType(modelBuilder.getResults(), JavaMethod.class);
    assertEquals(2, methods.size());
    assertEquals("set" + ATTRIBUTE_NAME, methods.get(1).name.toLowerCase());
  }

  @Test
  public void finishBuildingFrancaAttributeReadonly() {
    when(francaAttribute.isReadonly()).thenReturn(true);

    modelBuilder.finishBuilding(francaAttribute);

    List<JavaMethod> methods =
        CollectionsHelper.getAllOfType(modelBuilder.getResults(), JavaMethod.class);
    assertEquals(1, methods.size());
    assertEquals("get" + ATTRIBUTE_NAME, methods.get(0).name.toLowerCase());
  }

  @Test
  public void finishBuildingFrancaAttributeReadsTypeIntoGetter() {
    contextStack.injectResult(javaCustomType);

    modelBuilder.finishBuilding(francaAttribute);

    JavaMethod javaMethod = modelBuilder.getFirstResult(JavaMethod.class);
    assertNotNull(javaMethod);
    assertEquals(javaCustomType, javaMethod.returnType);
    assertTrue(javaMethod.parameters.isEmpty());
  }

  @Test
  public void finishBuildingFrancaAttributeReadsTypeIntoSetter() {
    contextStack.injectResult(javaCustomType);

    modelBuilder.finishBuilding(francaAttribute);

    List<JavaMethod> methods =
        CollectionsHelper.getAllOfType(modelBuilder.getResults(), JavaMethod.class);
    assertEquals(2, methods.size());

    JavaMethod javaMethod = methods.get(1);
    assertEquals(JavaPrimitiveType.VOID, javaMethod.returnType);
    assertFalse(javaMethod.parameters.isEmpty());
    assertEquals(javaCustomType, javaMethod.parameters.get(0).type);
  }

  @Test
  public void finishBuildingFrancaArrayReadArrays() {
    JavaCustomType javaTemplateType =
        JavaTemplateType.create(JavaTemplateType.TemplateClass.LIST, javaCustomType);
    when(JavaTypeMapper.mapArray(any(), any())).thenReturn(javaTemplateType);

    modelBuilder.finishBuilding(francaArrayType);

    JavaTemplateType javaType = modelBuilder.getFirstResult(JavaTemplateType.class);
    assertEquals(javaTemplateType, javaType);
    assertFalse(javaType.templateParameters.isEmpty());
    assertEquals(javaCustomType, javaType.templateParameters.get(0));
  }
}
