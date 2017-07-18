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
import static org.junit.Assert.assertTrue;
import static org.mockito.Mockito.when;

import com.here.ivi.api.generator.common.ModelBuilderContextStack;
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
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import org.eclipse.emf.common.util.EList;
import org.franca.core.franca.FArgument;
import org.franca.core.franca.FConstantDef;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FMethod;
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

  @Mock(answer = Answers.RETURNS_DEEP_STUBS)
  private ModelBuilderContextStack<JavaElement> contextStack;

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

  private final EList<FArgument> arguments = new ArrayEList<>();

  private final JavaType javaCustomType = new JavaCustomType("typical");
  private final JavaConstant javaConstant =
      new JavaConstant(javaCustomType, CONSTANT_NAME, new JavaValue("valuable"));
  private final JavaField javaField = new JavaField(javaCustomType, FIELD_NAME);

  private JavaModelBuilder modelBuilder;

  private JavaElement getFirstResult() {
    List<JavaElement> results = contextStack.getParentContext().previousResults;
    assertFalse(results.isEmpty());

    return results.get(0);
  }

  private void injectResult(JavaElement element) {
    contextStack.getCurrentContext().previousResults.add(element);
  }

  @Before
  public void setUp() {
    PowerMockito.mockStatic(JavaTypeMapper.class);
    MockitoAnnotations.initMocks(this);

    modelBuilder =
        new JavaModelBuilder(
            contextStack, new JavaPackage(Collections.emptyList()), rootElementModel);

    contextStack.getCurrentContext().currentResults = new ArrayList<>();
    contextStack.getCurrentContext().previousResults = new ArrayList<>();
    contextStack.getParentContext().previousResults = new ArrayList<>();

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
  public void finishBuildingFrancaInterface() {
    injectResult(javaConstant);

    modelBuilder.finishBuilding(francaInterface);

    JavaElement result = getFirstResult();
    assertTrue(result instanceof JavaClass);

    assertEquals(CLASS_NAME, ((JavaClass) result).name.toLowerCase());
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsConstants() {
    injectResult(javaConstant);

    modelBuilder.finishBuilding(francaInterface);

    JavaElement result = getFirstResult();
    assertTrue(result instanceof JavaClass);

    JavaClass javaClass = (JavaClass) result;
    assertFalse(javaClass.constants.isEmpty());
    assertEquals(javaConstant, javaClass.constants.iterator().next());
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsFields() {
    injectResult(javaField);

    modelBuilder.finishBuilding(francaInterface);

    JavaElement result = getFirstResult();
    assertTrue(result instanceof JavaClass);

    JavaClass javaClass = (JavaClass) result;
    assertFalse(javaClass.fields.isEmpty());
    assertEquals(javaField, javaClass.fields.iterator().next());
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsMethods() {
    final JavaMethod javaMethod = new JavaMethod(METHOD_NAME);
    injectResult(javaMethod);

    modelBuilder.finishBuilding(francaInterface);

    JavaElement result = getFirstResult();
    assertTrue(result instanceof JavaClass);

    JavaClass javaClass = (JavaClass) result;
    assertFalse(javaClass.methods.isEmpty());
    assertEquals(javaMethod, javaClass.methods.iterator().next());
  }

  @Test
  public void finishBuildingFrancaMethod() {
    modelBuilder.finishBuilding(francaMethod);

    JavaElement result = getFirstResult();
    assertTrue(result instanceof JavaMethod);

    JavaMethod javaMethod = (JavaMethod) result;
    assertEquals(METHOD_NAME, javaMethod.name);
    assertTrue(javaMethod.qualifiers.contains(JavaMethod.MethodQualifier.NATIVE));
    assertEquals(JavaVisibility.PUBLIC, javaMethod.visibility);
  }

  @Test
  public void finishBuildingFrancaMethodWithZeroOutArgs() {
    modelBuilder.finishBuilding(francaMethod);

    JavaElement result = getFirstResult();
    assertTrue(result instanceof JavaMethod);

    JavaMethod javaMethod = (JavaMethod) result;
    assertTrue(javaMethod.returnType instanceof JavaPrimitiveType);

    assertEquals(JavaPrimitiveType.Type.VOID, ((JavaPrimitiveType) javaMethod.returnType).type);
  }

  @Test
  public void finishBuildingFrancaMethodWithOneOutArg() {
    when(JavaTypeMapper.map(francaTypeRef)).thenReturn(javaCustomType);
    arguments.add(francaArgument);

    modelBuilder.finishBuilding(francaMethod);

    JavaElement result = getFirstResult();
    assertTrue(result instanceof JavaMethod);

    assertEquals(javaCustomType, ((JavaMethod) result).returnType);

    PowerMockito.verifyStatic();
    JavaTypeMapper.map(francaTypeRef);
  }

  @Test
  public void finishBuildingFrancaMethodReadsParameters() {
    final JavaParameter javaParameter = new JavaParameter(javaCustomType, PARAMETER_NAME);
    injectResult(javaParameter);

    modelBuilder.finishBuilding(francaMethod);

    JavaElement result = getFirstResult();
    assertTrue(result instanceof JavaMethod);

    JavaMethod javaMethod = (JavaMethod) result;
    assertFalse(javaMethod.parameters.isEmpty());
    assertEquals(javaParameter, javaMethod.parameters.get(0));
  }

  @Test
  public void finishBuildingFrancaInputArgument() {
    final JavaType javaTypeCustom = new JavaCustomType("typical");
    when(JavaTypeMapper.map(francaTypeRef)).thenReturn(javaTypeCustom);

    modelBuilder.finishBuildingInputArgument(francaArgument);

    JavaElement result = getFirstResult();
    assertTrue(result instanceof JavaParameter);

    JavaParameter javaParameter = (JavaParameter) result;
    assertEquals(PARAMETER_NAME, javaParameter.name);
    assertEquals(javaTypeCustom, javaParameter.type);

    PowerMockito.verifyStatic();
    JavaTypeMapper.map(francaTypeRef);
  }

  @Test
  public void finishBuildingFrancaTypeCollectionReadsConstants() {
    injectResult(javaConstant);

    modelBuilder.finishBuilding(francaTypeCollection);

    JavaElement result = getFirstResult();
    assertTrue(result instanceof JavaClass);

    JavaClass javaClass = (JavaClass) result;
    assertFalse(javaClass.constants.isEmpty());
    assertEquals(javaConstant, javaClass.constants.iterator().next());
  }

  @Test
  public void finishBuildingFrancaTypeCollectionReadsClasses() {
    final JavaClass innerClass = new JavaClass(CLASS_NAME);
    injectResult(innerClass);

    modelBuilder.finishBuilding(francaTypeCollection);

    JavaElement result = getFirstResult();
    assertTrue(result instanceof JavaClass);

    JavaClass javaClass = (JavaClass) result;
    assertFalse(javaClass.innerClasses.isEmpty());
    assertEquals(innerClass, javaClass.innerClasses.iterator().next());
  }

  @Test
  public void finishBuildingFrancaConstant() {
    modelBuilder.finishBuilding(francaConstant);

    JavaElement result = getFirstResult();
    assertTrue(result instanceof JavaConstant);
    assertEquals(CONSTANT_NAME, result.name.toLowerCase());
  }

  @Test
  public void finishBuildingFrancaTypedElementReadsName() {
    modelBuilder.finishBuilding(francaTypedElement);

    JavaElement result = getFirstResult();
    assertTrue(result instanceof JavaField);
    assertEquals(FIELD_NAME, result.name.toLowerCase());
  }

  @Test
  public void finishBuildingFrancaTypedElementReadsType() {
    injectResult(javaCustomType);

    modelBuilder.finishBuilding(francaTypedElement);

    JavaElement result = getFirstResult();
    assertTrue(result instanceof JavaField);

    JavaField javaField = (JavaField) result;
    assertEquals(javaCustomType, javaField.type);
  }

  @Test
  public void finishBuildingFrancaStructType() {
    modelBuilder.finishBuilding(francaStructType);

    JavaElement result = getFirstResult();
    assertTrue(result instanceof JavaClass);

    assertEquals(STRUCT_NAME, ((JavaClass) result).name.toLowerCase());
  }

  @Test
  public void finishBuildingFrancaStructTypeReadsFields() {
    injectResult(javaField);

    modelBuilder.finishBuilding(francaStructType);

    JavaElement result = getFirstResult();
    assertTrue(result instanceof JavaClass);

    JavaClass javaClass = (JavaClass) result;
    assertFalse(javaClass.fields.isEmpty());
    assertEquals(javaField, javaClass.fields.iterator().next());
  }

  @Test
  public void finishBuildingFrancaTypeRef() {
    when(JavaTypeMapper.map(francaTypeRef)).thenReturn(javaCustomType);

    modelBuilder.finishBuilding(francaTypeRef);

    JavaElement result = getFirstResult();
    assertEquals(javaCustomType, result);

    PowerMockito.verifyStatic();
    JavaTypeMapper.map(francaTypeRef);
  }
}
