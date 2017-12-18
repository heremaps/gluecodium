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
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;
import static org.powermock.api.mockito.PowerMockito.verifyStatic;

import com.here.ivi.api.common.CollectionsHelper;
import com.here.ivi.api.common.FrancaTypeHelper;
import com.here.ivi.api.model.franca.FrancaDeploymentModel;
import com.here.ivi.api.model.java.*;
import com.here.ivi.api.test.ArrayEList;
import com.here.ivi.api.test.MockContextStack;
import java.util.Arrays;
import java.util.List;
import org.eclipse.emf.common.util.EList;
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
@PrepareForTest({JavaValueMapper.class, FrancaTypeHelper.class})
public class JavaModelBuilderTest {

  private static final String CLASS_NAME = "classy";
  private static final String METHOD_NAME = "methodical";
  private static final String PARAMETER_NAME = "curvature";
  private static final String FIELD_NAME = "flowers";
  private static final String ATTRIBUTE_NAME = "tribute";
  private static final String ENUMERATION_NAME = "MyEnumName";
  private static final String ENUMERATOR_1_NAME = "MY_ENUMERATOR_1";
  private static final String ENUMERATOR_2_NAME = "MY_ENUMERATOR_2";

  private static final List<String> BASE_PACKAGE_NAMES =
      Arrays.asList("these", "are", "prefix", "packages");

  private final MockContextStack<JavaElement> contextStack = new MockContextStack<>();

  @Mock private FrancaDeploymentModel deploymentModel;

  @Mock private JavaTypeMapper typeMapper;

  @Mock private FTypeCollection francaTypeCollection;
  @Mock private FMethod francaMethod;
  @Mock private FArgument francaArgument;
  @Mock private FTypeRef francaTypeRef;
  @Mock private FConstantDef francaConstant;
  @Mock private FField francaField;
  @Mock private FStructType francaStructType;
  @Mock private FAttribute francaAttribute;
  @Mock private FArrayType francaArrayType;
  @Mock private FEnumerationType francaEnumerationType;
  @Mock private FEnumerator francaEnumerator1;
  @Mock private FEnumerator francaEnumerator2;
  @Mock private FMapType francaMapType;

  private final EList<FArgument> arguments = new ArrayEList<>();

  private final JavaCustomType javaCustomType = new JavaCustomType("typical");
  private final JavaTemplateType javaTemplateType =
      JavaTemplateType.create(JavaTemplateType.TemplateClass.LIST, javaCustomType);
  private final JavaField javaField = new JavaField(javaCustomType, FIELD_NAME);
  private final JavaEnum javaEnum = new JavaEnum(ENUMERATION_NAME);
  private final EList<FEnumerator> francaEnumerators = new ArrayEList<>();
  private final JavaExceptionClass javaExceptionClass =
      new JavaExceptionClass("FooException", null, JavaPackage.DEFAULT);

  private JavaModelBuilder modelBuilder;

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);
    PowerMockito.mockStatic(JavaValueMapper.class, FrancaTypeHelper.class);

    modelBuilder =
        new JavaModelBuilder(
            contextStack, deploymentModel, new JavaPackage(BASE_PACKAGE_NAMES), typeMapper);

    when(typeMapper.map(any())).thenReturn(javaCustomType);

    when(francaConstant.getName()).thenReturn("permanent");
    when(francaField.getName()).thenReturn(FIELD_NAME);
    when(francaStructType.getName()).thenReturn("nonsense");
    when(francaAttribute.getName()).thenReturn(ATTRIBUTE_NAME);

    when(francaMethod.getName()).thenReturn(METHOD_NAME);
    when(francaMethod.getOutArgs()).thenReturn(arguments);

    when(francaArgument.getName()).thenReturn(PARAMETER_NAME);
    when(francaArgument.getType()).thenReturn(francaTypeRef);

    when(francaEnumerationType.getName()).thenReturn(ENUMERATION_NAME);
    francaEnumerators.add(francaEnumerator1);
    francaEnumerators.add(francaEnumerator2);
    when(francaEnumerationType.getEnumerators()).thenReturn(francaEnumerators);
    when(francaEnumerator1.getName()).thenReturn(ENUMERATOR_1_NAME);
    when(francaEnumerator2.getName()).thenReturn(ENUMERATOR_2_NAME);
  }

  @Test
  public void finishBuildingFrancaMethod() {
    modelBuilder.finishBuilding(francaMethod);

    JavaMethod javaMethod = modelBuilder.getFinalResult(JavaMethod.class);
    assertNotNull(javaMethod);
    assertEquals(METHOD_NAME, javaMethod.name);
    assertFalse(javaMethod.qualifiers.contains(JavaMethod.MethodQualifier.STATIC));
    assertEquals(JavaVisibility.PUBLIC, javaMethod.visibility);
  }

  @Test
  public void finishBuildingFrancaMethodOmitsSelector() {
    when(francaMethod.getSelector()).thenReturn("selective");

    modelBuilder.finishBuilding(francaMethod);

    JavaMethod javaMethod = modelBuilder.getFinalResult(JavaMethod.class);
    assertNotNull(javaMethod);
    assertEquals(METHOD_NAME, javaMethod.name);
  }

  @Test
  public void finishBuildingFrancaMethodAddsSelector() {
    when(FrancaTypeHelper.hasArrayParameters(any())).thenReturn(true);
    when(francaMethod.getSelector()).thenReturn("selective");

    modelBuilder.finishBuilding(francaMethod);

    JavaMethod javaMethod = modelBuilder.getFinalResult(JavaMethod.class);
    assertNotNull(javaMethod);
    assertEquals(METHOD_NAME + "Selective", javaMethod.name);

    PowerMockito.verifyStatic();
    FrancaTypeHelper.hasArrayParameters(francaMethod);
  }

  @Test
  public void finishBuildingFrancaMethodWithStatic() {
    when(deploymentModel.isStatic(any())).thenReturn(true);

    modelBuilder.finishBuilding(francaMethod);

    JavaMethod javaMethod = modelBuilder.getFinalResult(JavaMethod.class);
    assertNotNull(javaMethod);
    assertTrue(javaMethod.qualifiers.contains(JavaMethod.MethodQualifier.STATIC));
  }

  @Test
  public void finishBuildingFrancaMethodWithZeroOutArgs() {
    modelBuilder.finishBuilding(francaMethod);

    JavaMethod javaMethod = modelBuilder.getFinalResult(JavaMethod.class);
    assertNotNull(javaMethod);
    assertTrue(javaMethod.returnType instanceof JavaPrimitiveType);
    assertEquals(JavaPrimitiveType.Type.VOID, ((JavaPrimitiveType) javaMethod.returnType).type);
  }

  @Test
  public void finishBuildingFrancaMethodReadsOutputParameters() {
    JavaParameter outParameter = new JavaParameter(javaCustomType, "foo", true);
    contextStack.injectResult(outParameter);

    modelBuilder.finishBuilding(francaMethod);

    JavaMethod javaMethod = modelBuilder.getFinalResult(JavaMethod.class);
    assertNotNull(javaMethod);
    assertEquals(javaCustomType, javaMethod.returnType);
  }

  @Test
  public void finishBuildingFrancaMethodReadsInputParameters() {
    final JavaParameter javaParameter = new JavaParameter(javaCustomType, PARAMETER_NAME);
    contextStack.injectResult(javaParameter);

    modelBuilder.finishBuilding(francaMethod);

    JavaMethod javaMethod = modelBuilder.getFinalResult(JavaMethod.class);
    assertNotNull(javaMethod);
    assertFalse(javaMethod.parameters.isEmpty());
    assertEquals(javaParameter, javaMethod.parameters.get(0));
  }

  @Test
  public void finishBuildingFrancaMethodReadsExceptionTypeRef() {
    contextStack.injectResult(javaExceptionClass);

    modelBuilder.finishBuilding(francaMethod);

    JavaMethod javaMethod = modelBuilder.getFinalResult(JavaMethod.class);
    assertNotNull(javaMethod);
    assertEquals(javaExceptionClass.name, javaMethod.exception.name);
    assertEquals(javaExceptionClass.javaPackage.packageNames, javaMethod.exception.packageNames);
  }

  @Test
  public void finishBuildingFrancaInputArgument() {
    contextStack.injectResult(javaCustomType);

    modelBuilder.finishBuildingInputArgument(francaArgument);

    JavaParameter javaParameter = modelBuilder.getFinalResult(JavaParameter.class);
    assertNotNull(javaParameter);
    assertEquals(javaCustomType, javaParameter.type);
    assertFalse(javaParameter.isOutput);
  }

  @Test
  public void finishBuildingFrancaOutputArgument() {
    contextStack.injectResult(javaCustomType);

    modelBuilder.finishBuildingOutputArgument(francaArgument);

    JavaParameter javaParameter = modelBuilder.getFinalResult(JavaParameter.class);
    assertNotNull(javaParameter);
    assertEquals(javaCustomType, javaParameter.type);
    assertTrue(javaParameter.isOutput);
  }

  @Test
  public void finishBuildingFrancaTypeCollectionReadsClasses() {
    when(francaTypeCollection.getName()).thenReturn("TestTypeCollection");
    final JavaClass firstInnerClass = new JavaClass(CLASS_NAME);
    final JavaClass secondInnerClass = new JavaClass(CLASS_NAME + "Sibling");
    contextStack.injectResult(firstInnerClass);
    contextStack.injectResult(secondInnerClass);

    modelBuilder.finishBuilding(francaTypeCollection);
    List<JavaElement> javaElements = modelBuilder.getFinalResults();

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

    JavaConstant resultConstant = modelBuilder.getFinalResult(JavaConstant.class);
    assertNotNull(resultConstant);
    assertEquals("permanent", resultConstant.name.toLowerCase());
    assertEquals(javaCustomType, resultConstant.type);
  }

  @Test
  public void finishBuildingFrancaFieldReadsName() {
    modelBuilder.finishBuilding(francaField);

    JavaField resultField = modelBuilder.getFinalResult(JavaField.class);
    assertNotNull(resultField);
    assertEquals(FIELD_NAME, resultField.name.toLowerCase());
  }

  @Test
  public void finishBuildingFrancaFieldReadsType() {
    contextStack.injectResult(javaCustomType);

    modelBuilder.finishBuilding(francaField);

    JavaField resultField = modelBuilder.getFinalResult(JavaField.class);
    assertNotNull(resultField);
    assertEquals(javaCustomType, resultField.type);
  }

  @Test
  public void finishBuildingFrancaCustomTypedElementHasInitializer() {

    contextStack.injectResult(javaCustomType);

    modelBuilder.finishBuilding(francaField);

    JavaField resultField = modelBuilder.getFinalResult(JavaField.class);
    assertNotNull(resultField);
    verifyStatic();
    JavaValueMapper.mapDefaultValue(javaCustomType);
    verify(deploymentModel).getDefaultValue(francaField);
  }

  @Test
  public void finishBuildingFrancaCustomTypedElementHasDefaultValue() {

    when(deploymentModel.getDefaultValue(francaField)).thenReturn("someValue");
    contextStack.injectResult(javaCustomType);

    modelBuilder.finishBuilding(francaField);

    JavaField resultField = modelBuilder.getFinalResult(JavaField.class);
    assertNotNull(resultField);
    verifyStatic();
    JavaValueMapper.mapDefaultValue(javaCustomType, "someValue");
    verify(deploymentModel).getDefaultValue(francaField);
  }

  @Test
  public void finishBuildingFrancaFieldCreatesPublicField() {
    modelBuilder.finishBuilding(francaField);

    JavaField resultField = modelBuilder.getFinalResult(JavaField.class);
    assertNotNull(resultField);
    assertEquals(JavaVisibility.PUBLIC, resultField.visibility);
  }

  @Test
  public void finishBuildingFrancaTemplateField() {
    contextStack.injectResult(javaTemplateType);

    modelBuilder.finishBuilding(francaField);

    JavaField resultField = modelBuilder.getFinalResult(JavaField.class);
    assertNotNull(resultField);
    assertEquals(FIELD_NAME, resultField.name.toLowerCase());
    assertEquals("List<typical>", resultField.type.name);
    verifyStatic();
    JavaValueMapper.mapDefaultValue(javaTemplateType);
    verify(deploymentModel).getDefaultValue(francaField);
  }

  @Test
  public void finishBuildingFrancaFieldReadsNullable() {
    JavaCustomType customType = JavaCustomType.builder("").isNullable(true).build();
    contextStack.injectResult(customType);

    modelBuilder.finishBuilding(francaField);

    JavaField resultField = modelBuilder.getFinalResult(JavaField.class);
    assertNotNull(resultField);
    assertNull(resultField.initial);
  }

  @Test
  public void finishBuildingFrancaStructType() {
    modelBuilder.finishBuilding(francaStructType);

    JavaClass javaClass = modelBuilder.getFinalResult(JavaClass.class);
    assertNotNull(javaClass);
    assertEquals("nonsense", javaClass.name.toLowerCase());
    assertEquals(BASE_PACKAGE_NAMES, javaClass.javaPackage.packageNames);
  }

  @Test
  public void finishBuildingFrancaStructTypeReadsFields() {
    contextStack.injectResult(javaField);

    modelBuilder.finishBuilding(francaStructType);

    JavaClass javaClass = modelBuilder.getFinalResult(JavaClass.class);
    assertNotNull(javaClass);
    assertFalse(javaClass.fields.isEmpty());
    assertEquals(javaField, javaClass.fields.iterator().next());
  }

  @Test
  public void finishBuildingFrancaStructTypeReadsParent() {
    contextStack.injectResult(javaCustomType);

    modelBuilder.finishBuilding(francaStructType);

    JavaClass javaClass = modelBuilder.getFinalResult(JavaClass.class);
    assertNotNull(javaClass);
    assertEquals(javaCustomType, javaClass.extendedClass);
  }

  @Test
  public void finishBuildingFrancaStructTypeCreatesTypeRef() {
    when(typeMapper.mapCustomType(any())).thenReturn(javaCustomType);

    modelBuilder.finishBuilding(francaStructType);

    JavaCustomType resultType = modelBuilder.getFinalResult(JavaCustomType.class);
    assertEquals(javaCustomType, resultType);

    verify(typeMapper).mapCustomType(francaStructType);
  }

  @Test
  public void finishBuildingFrancaTypeRef() {
    modelBuilder.finishBuilding(francaTypeRef);

    JavaType javaType = modelBuilder.getFinalResult(JavaType.class);
    assertEquals(javaCustomType, javaType);

    verify(typeMapper).map(francaTypeRef);
  }

  @Test
  public void finishBuildingFrancaAttributeCreatesGetter() {
    modelBuilder.finishBuilding(francaAttribute);

    JavaMethod javaMethod = modelBuilder.getFinalResult(JavaMethod.class);
    assertNotNull(javaMethod);
    assertEquals("get" + ATTRIBUTE_NAME, javaMethod.name.toLowerCase());
  }

  @Test
  public void finishBuildingFrancaAttributeCreatesSetter() {
    modelBuilder.finishBuilding(francaAttribute);

    List<JavaMethod> methods =
        CollectionsHelper.getAllOfType(modelBuilder.getFinalResults(), JavaMethod.class);
    assertEquals(2, methods.size());
    assertEquals("set" + ATTRIBUTE_NAME, methods.get(1).name.toLowerCase());
  }

  @Test
  public void finishBuildingFrancaAttributeReadonly() {
    when(francaAttribute.isReadonly()).thenReturn(true);

    modelBuilder.finishBuilding(francaAttribute);

    List<JavaMethod> methods =
        CollectionsHelper.getAllOfType(modelBuilder.getFinalResults(), JavaMethod.class);
    assertEquals(1, methods.size());
    assertEquals("get" + ATTRIBUTE_NAME, methods.get(0).name.toLowerCase());
  }

  @Test
  public void finishBuildingFrancaAttributeReadsTypeIntoGetter() {
    contextStack.injectResult(javaCustomType);

    modelBuilder.finishBuilding(francaAttribute);

    JavaMethod javaMethod = modelBuilder.getFinalResult(JavaMethod.class);
    assertNotNull(javaMethod);
    assertEquals(javaCustomType, javaMethod.returnType);
    assertTrue(javaMethod.parameters.isEmpty());
  }

  @Test
  public void finishBuildingFrancaAttributeReadsTypeIntoSetter() {
    contextStack.injectResult(javaCustomType);

    modelBuilder.finishBuilding(francaAttribute);

    List<JavaMethod> methods =
        CollectionsHelper.getAllOfType(modelBuilder.getFinalResults(), JavaMethod.class);
    assertEquals(2, methods.size());

    JavaMethod javaMethod = methods.get(1);
    assertEquals(JavaPrimitiveType.VOID, javaMethod.returnType);
    assertFalse(javaMethod.parameters.isEmpty());
    assertEquals(javaCustomType, javaMethod.parameters.get(0).type);
  }

  @Test
  public void finishBuildingFrancaArrayMapsArrayType() {
    when(typeMapper.mapArray(any())).thenReturn(javaCustomType);

    modelBuilder.finishBuilding(francaArrayType);

    JavaType javaType = modelBuilder.getFinalResult(JavaType.class);
    assertEquals(javaCustomType, javaType);

    verify(typeMapper).mapArray(francaArrayType);
  }

  @Test
  public void finishBuildingFrancaTypeCollectionReadsEnum() {
    contextStack.injectResult(javaEnum);

    modelBuilder.finishBuilding(francaTypeCollection);

    JavaEnum result = modelBuilder.getFinalResult(JavaEnum.class);
    assertEquals(javaEnum, result);
  }

  @Test
  public void finishBuildingFrancaEnumerationType() {
    contextStack.getParentContext().allowsTypeDefinitions = true;

    modelBuilder.finishBuilding(francaEnumerationType);

    JavaEnum result = modelBuilder.getFinalResult(JavaEnum.class);
    assertNotNull(result);
    assertEquals(ENUMERATION_NAME, result.name);
    assertEquals(JavaVisibility.PUBLIC, result.visibility);
    assertEquals(BASE_PACKAGE_NAMES, result.javaPackage.packageNames);
    assertNotNull(result.items);
  }

  @Test
  public void finishBuildingFrancaEnumerationTypeReadsEnumItems() {
    contextStack.getParentContext().allowsTypeDefinitions = true;
    JavaEnumItem javaEnumItem = new JavaEnumItem("enumerated");
    contextStack.injectResult(javaEnumItem);
    contextStack.injectResult(javaEnumItem);

    modelBuilder.finishBuilding(francaEnumerationType);

    JavaEnum resultEnum = modelBuilder.getFinalResult(JavaEnum.class);
    assertNotNull(resultEnum);
    assertEquals(2, resultEnum.items.size());
    assertEquals(javaEnumItem, resultEnum.items.get(0));
    assertEquals(javaEnumItem, resultEnum.items.get(1));
  }

  @Test
  public void finishBuildingFrancaEnumerationTypeCallsCompletePartialEnumeratorValues() {
    contextStack.getParentContext().allowsTypeDefinitions = true;

    PowerMockito.doNothing().when(JavaValueMapper.class);
    JavaValueMapper.completePartialEnumeratorValues(any());

    modelBuilder.finishBuilding(francaEnumerationType);

    verifyStatic();
    JavaValueMapper.completePartialEnumeratorValues(any());
  }

  @Test
  public void finishBuildingFrancaEnumerationTypeCreatesTypeRef() {
    contextStack.getParentContext().allowsTypeDefinitions = false;
    when(typeMapper.mapErrorClass(any())).thenReturn(javaExceptionClass);
    when(typeMapper.mapCustomType(any())).thenReturn(javaCustomType);

    modelBuilder.finishBuilding(francaEnumerationType);

    JavaCustomType resultTypeRef = modelBuilder.getFinalResult(JavaCustomType.class);
    assertEquals(javaCustomType, resultTypeRef);

    verify(typeMapper).mapCustomType(francaEnumerationType);
  }

  @Test
  public void finishBuildingFrancaEnumerationTypeCreatesExceptionClass() {
    contextStack.getParentContext().allowsTypeDefinitions = false;
    when(typeMapper.mapErrorClass(any())).thenReturn(javaExceptionClass);

    modelBuilder.finishBuilding(francaEnumerationType);

    JavaExceptionClass resultException = modelBuilder.getFinalResult(JavaExceptionClass.class);
    assertEquals(javaExceptionClass, resultException);
    assertTrue(modelBuilder.exceptionClasses.containsValue(javaExceptionClass));

    verify(typeMapper).mapErrorClass(francaEnumerationType);
  }

  @Test
  public void finishBuildingFEnumeratorWithoutValueReadsEnumItem() {
    when(francaEnumerator1.getValue()).thenReturn(null);

    modelBuilder.finishBuilding(francaEnumerator1);

    JavaEnumItem result = modelBuilder.getFinalResult(JavaEnumItem.class);
    assertNotNull(result);
    assertEquals(ENUMERATOR_1_NAME, result.name);
    assertNull(result.value);
  }

  @Test
  public void finishBuildingFEnumeratorWithValueReadsEnumItem() {

    JavaValue value = new JavaValue("foo");
    contextStack.injectResult(value);

    modelBuilder.finishBuilding(francaEnumerator1);

    JavaEnumItem result = modelBuilder.getFinalResult(JavaEnumItem.class);
    assertNotNull(result);
    assertEquals(ENUMERATOR_1_NAME, result.name);
    assertEquals(value, result.value);
  }

  @Test
  public void finishBuildingFExpressionReadsJavaValue() {
    FExpression francaExpression = mock(FExpression.class);
    JavaValue value = new JavaValue("foo");
    when(JavaValueMapper.map(francaExpression)).thenReturn(value);

    modelBuilder.finishBuilding(francaExpression);

    JavaValue result = modelBuilder.getFinalResult(JavaValue.class);
    assertSame(value, result);
  }

  @Test
  public void finishBuildingFrancaMapMapsMapType() {
    when(typeMapper.mapMap(any())).thenReturn(javaCustomType);

    modelBuilder.finishBuilding(francaMapType);

    JavaType javaType = modelBuilder.getFinalResult(JavaType.class);
    assertEquals(javaCustomType, javaType);

    verify(typeMapper).mapMap(francaMapType);
  }
}
