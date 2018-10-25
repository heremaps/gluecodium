/*
 * Copyright (C) 2016-2018 HERE Europe B.V.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
 * License-Filename: LICENSE
 */

package com.here.genium.generator.java;

import static org.junit.Assert.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;
import static org.powermock.api.mockito.PowerMockito.verifyStatic;

import com.here.genium.common.CollectionsHelper;
import com.here.genium.common.FrancaTypeHelper;
import com.here.genium.model.franca.FrancaDeploymentModel;
import com.here.genium.model.java.*;
import com.here.genium.test.ArrayEList;
import com.here.genium.test.MockContextStack;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
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
  @Mock private FEnumerationType francaEnumerationTypeError;
  @Mock private FEnumerator francaEnumerator1;
  @Mock private FEnumerator francaEnumerator2;
  @Mock private FMapType francaMapType;

  private final EList<FArgument> arguments = new ArrayEList<>();

  private final JavaCustomType nativeBase = new JavaCustomType("FooNativeBar");
  private final JavaCustomType javaCustomType = new JavaCustomType("typical");
  private final JavaTemplateType javaTemplateType =
      JavaTemplateType.create(JavaTemplateType.TemplateClass.LIST, javaCustomType);
  private final JavaField javaField = JavaField.builder(FIELD_NAME, javaCustomType).build();
  private final JavaEnum javaEnum = new JavaEnum(ENUMERATION_NAME);
  private final JavaEnumType enumType =
      new JavaEnumType("myEnum", null, JavaPackage.DEFAULT_PACKAGE_NAMES, null);
  private final EList<FEnumerator> francaEnumerators = new ArrayEList<>();
  private final JavaExceptionType javaExceptionType =
      new JavaExceptionType(
          "FooEx", null, new JavaImport(null, new JavaPackage(JavaPackage.DEFAULT_PACKAGE_NAMES)));
  private final JavaValue javaValue = new JavaValue("Foo");

  private JavaModelBuilder modelBuilder;

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);
    PowerMockito.mockStatic(JavaValueMapper.class, FrancaTypeHelper.class);

    when(typeMapper.getNativeBase()).thenReturn(nativeBase);
    modelBuilder =
        new JavaModelBuilder(
            contextStack,
            deploymentModel,
            new JavaPackage(BASE_PACKAGE_NAMES),
            typeMapper,
            e -> e == francaEnumerationTypeError);

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
    FMethod anotherFrancaMethod = mock(FMethod.class);
    when(FrancaTypeHelper.getAllOverloads(any()))
        .thenReturn(Arrays.asList(francaMethod, anotherFrancaMethod));
    when(FrancaTypeHelper.hasArrayParameters(any())).thenReturn(true);
    when(francaMethod.getSelector()).thenReturn("selective");

    modelBuilder.finishBuilding(francaMethod);

    JavaMethod javaMethod = modelBuilder.getFinalResult(JavaMethod.class);
    assertNotNull(javaMethod);
    assertEquals(METHOD_NAME + "Selective", javaMethod.name);
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
  public void finishBuildingFrancaMethodCreatesExceptionTypeRef() {
    contextStack.injectResult(javaExceptionType);

    modelBuilder.finishBuilding(francaMethod);

    JavaMethod javaMethod = modelBuilder.getFinalResult(JavaMethod.class);
    assertNotNull(javaMethod);
    assertEquals(javaExceptionType, javaMethod.exception);
  }

  @Test
  public void finishBuildingFrancaMethodCreatesInternalMethod() {
    when(deploymentModel.isInternal(any())).thenReturn(true);

    modelBuilder.finishBuilding(francaMethod);

    JavaMethod javaMethod = modelBuilder.getFinalResult(JavaMethod.class);
    assertNotNull(javaMethod);
    assertEquals(JavaVisibility.PACKAGE, javaMethod.visibility);
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
  public void finishBuildingFrancaTypeCollectionReadsEnums() {
    contextStack.injectResult(javaEnum);

    modelBuilder.finishBuilding(francaTypeCollection);

    JavaEnum result = modelBuilder.getFinalResult(JavaEnum.class);
    assertEquals(javaEnum, result);
  }

  @Test
  public void finishBuildingFrancaTypeCollectionReadsConstants() {
    when(francaTypeCollection.getName()).thenReturn("TestTypeCollection");
    JavaConstant javaConstant = new JavaConstant(javaCustomType, "Foo", new JavaValue("bar"));
    contextStack.injectResult(javaConstant);

    modelBuilder.finishBuilding(francaTypeCollection);

    JavaClass result = modelBuilder.getFinalResult(JavaClass.class);
    assertNotNull(result);
    assertEquals("TestTypeCollection", result.name);
    assertTrue(result.qualifiers.contains(JavaTopLevelElement.Qualifier.FINAL));

    assertEquals(1, result.constants.size());
    assertEquals(javaConstant, result.constants.iterator().next());
  }

  @Test
  public void finishBuildingFrancaTypeCollectionReadsExceptions() {
    when(francaTypeCollection.getName()).thenReturn("TestTypeCollection");
    final JavaClass innerClass = new JavaClass(CLASS_NAME);
    final JavaEnumType javaEnumType = new JavaEnumType(null, null, Collections.emptyList(), null);
    final JavaExceptionClass exceptionClass =
        new JavaExceptionClass(CLASS_NAME + "EX", javaEnumType);
    contextStack.injectResult(innerClass);
    contextStack.injectResult(exceptionClass);

    modelBuilder.finishBuilding(francaTypeCollection);
    List<JavaElement> javaElements = modelBuilder.getFinalResults();

    assertNotNull(javaElements);
    assertEquals(2, javaElements.size());

    JavaTopLevelElement firstJavaClass = (JavaTopLevelElement) javaElements.get(0);
    JavaTopLevelElement secondJavaClass = (JavaTopLevelElement) javaElements.get(1);

    assertEquals(innerClass, firstJavaClass);
    assertEquals(exceptionClass, secondJavaClass);
  }

  @Test
  public void finishBuildingFrancaConstant() {
    contextStack.injectResult(javaCustomType);
    contextStack.injectResult(javaValue);

    modelBuilder.finishBuilding(francaConstant);

    JavaConstant resultConstant = modelBuilder.getFinalResult(JavaConstant.class);
    assertNotNull(resultConstant);
    assertEquals("permanent", resultConstant.name.toLowerCase());
    assertEquals(javaCustomType, resultConstant.type);
    assertEquals(javaValue, resultConstant.value);
    assertEquals(JavaVisibility.PUBLIC, resultConstant.visibility);
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
    JavaCustomType customType = JavaCustomType.builder("").isInterface(true).build();
    contextStack.injectResult(customType);

    modelBuilder.finishBuilding(francaField);

    JavaField resultField = modelBuilder.getFinalResult(JavaField.class);
    assertNotNull(resultField);
    assertNull(resultField.initial);
  }

  @Test
  public void finishBuildingFrancaFieldCreatesInternalField() {
    when(deploymentModel.isInternal(any())).thenReturn(true);

    modelBuilder.finishBuilding(francaField);

    JavaField resultField = modelBuilder.getFinalResult(JavaField.class);
    assertNotNull(resultField);
    assertEquals(JavaVisibility.PACKAGE, resultField.visibility);
  }

  @Test
  public void finishBuildingFrancaFieldReadsNotNull() {
    when(deploymentModel.isNotNull(francaField)).thenReturn(true);

    modelBuilder.finishBuilding(francaField);

    JavaField resultField = modelBuilder.getFinalResult(JavaField.class);
    assertNotNull(resultField);
    assertTrue(resultField.isNonNull);
  }

  @Test
  public void finishBuildingFrancaFieldAddsNonNullAnnotation() {
    when(deploymentModel.isNotNull(francaField)).thenReturn(true);
    when(typeMapper.getNotNullAnnotation()).thenReturn(javaCustomType);

    modelBuilder.finishBuilding(francaField);

    JavaField resultField = modelBuilder.getFinalResult(JavaField.class);
    assertNotNull(resultField);
    assertEquals(1, resultField.annotations.size());
    assertEquals(javaCustomType, resultField.annotations.iterator().next());
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
  public void finishBuildingFrancaStructTypeReadsParentFields() {
    JavaClass parentClass = JavaClass.builder("Foo").build();
    JavaField grandParentField = JavaField.builder("BarField", javaCustomType).build();
    parentClass.parentFields.add(grandParentField);
    parentClass.fields.add(javaField);
    contextStack.injectResult(parentClass);

    modelBuilder.finishBuilding(francaStructType);

    JavaClass javaClass = modelBuilder.getFinalResult(JavaClass.class);
    assertNotNull(javaClass);
    assertEquals(2, javaClass.parentFields.size());

    Iterator<JavaField> iterator = javaClass.parentFields.iterator();
    assertEquals(grandParentField, iterator.next());
    assertEquals(javaField, iterator.next());
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
  public void finishBuildingFrancaStructTypeWithSerializable() {
    when(typeMapper.getSerializationBase()).thenReturn(javaCustomType);
    when(deploymentModel.isSerializable(francaStructType)).thenReturn(true);

    modelBuilder.finishBuilding(francaStructType);

    JavaClass javaClass = modelBuilder.getFinalResult(JavaClass.class);
    assertNotNull(javaClass);
    assertTrue(javaClass.isParcelable);
    assertEquals(1, javaClass.parentInterfaces.size());
    assertEquals(javaCustomType, javaClass.parentInterfaces.iterator().next());
  }

  @Test
  public void finishBuildingFrancaStructTypeWithSerializableNoBase() {
    when(deploymentModel.isSerializable(francaStructType)).thenReturn(true);

    modelBuilder.finishBuilding(francaStructType);

    JavaClass javaClass = modelBuilder.getFinalResult(JavaClass.class);
    assertNotNull(javaClass);
    assertFalse(javaClass.isParcelable);
    assertTrue(javaClass.parentInterfaces.isEmpty());
  }

  @Test
  public void finishBuildingFrancaStructTypeCreatesInternalStruct() {
    when(deploymentModel.isInternal(any())).thenReturn(true);

    modelBuilder.finishBuilding(francaStructType);

    JavaClass javaClass = modelBuilder.getFinalResult(JavaClass.class);
    assertNotNull(javaClass);
    assertEquals(JavaVisibility.PACKAGE, javaClass.visibility);
  }

  @Test
  public void finishBuildingFrancaStructTypeWithEquatable() {
    when(deploymentModel.isEquatable(francaStructType)).thenReturn(true);

    modelBuilder.finishBuilding(francaStructType);

    JavaClass javaClass = modelBuilder.getFinalResult(JavaClass.class);
    assertNotNull(javaClass);
    assertTrue(javaClass.isEquatable);
  }

  @Test
  public void finishBuildingFrancaStructTypeWithImmutable() {
    when(deploymentModel.isImmutable(francaStructType)).thenReturn(true);

    modelBuilder.finishBuilding(francaStructType);

    JavaClass javaClass = modelBuilder.getFinalResult(JavaClass.class);
    assertNotNull(javaClass);
    assertTrue(javaClass.isImmutable);
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
  public void finishBuildingFrancaBooleanAttributeCreatesGetter() {
    contextStack.injectResult(JavaPrimitiveType.BOOL);

    modelBuilder.finishBuilding(francaAttribute);

    JavaMethod javaMethod = modelBuilder.getFinalResult(JavaMethod.class);
    assertNotNull(javaMethod);
    assertEquals("is" + ATTRIBUTE_NAME, javaMethod.name.toLowerCase());
  }

  @Test
  public void finishBuildingFrancaAttributeCreatesInternalGetter() {
    when(deploymentModel.isInternal(any())).thenReturn(true);

    modelBuilder.finishBuilding(francaAttribute);

    JavaMethod javaMethod = modelBuilder.getFinalResult(JavaMethod.class);
    assertNotNull(javaMethod);
    assertEquals(JavaVisibility.PACKAGE, javaMethod.visibility);
  }

  @Test
  public void finishBuildingFrancaAttributeCreatesInternalSetter() {
    when(deploymentModel.isInternal(any())).thenReturn(true);

    modelBuilder.finishBuilding(francaAttribute);

    List<JavaMethod> methods =
        CollectionsHelper.getAllOfType(modelBuilder.getFinalResults(), JavaMethod.class);
    assertEquals(2, methods.size());
    assertEquals(JavaVisibility.PACKAGE, methods.get(1).visibility);
  }

  @Test
  public void finishBuildingFrancaArrayMapsArrayType() {
    JavaTemplateType templateType = JavaTemplateType.wrapInList(javaCustomType);
    when(typeMapper.mapArray(any())).thenReturn(templateType);

    modelBuilder.finishBuilding(francaArrayType);

    JavaType javaType = modelBuilder.getFinalResult(JavaType.class);
    assertEquals(templateType, javaType);

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
    when(typeMapper.mapCustomType(any())).thenReturn(enumType);
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
    when(typeMapper.mapCustomType(any())).thenReturn(enumType);
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
    PowerMockito.doNothing().when(JavaValueMapper.class);
    JavaValueMapper.completePartialEnumeratorValues(any());
    when(typeMapper.mapCustomType(any())).thenReturn(enumType);

    modelBuilder.finishBuilding(francaEnumerationType);

    verifyStatic();
    JavaValueMapper.completePartialEnumeratorValues(any());
  }

  @Test
  public void finishBuildingFrancaEnumerationTypeCreatesTypeRef() {
    when(typeMapper.mapCustomType(any())).thenReturn(enumType);

    modelBuilder.finishBuilding(francaEnumerationType);

    JavaCustomType resultTypeRef = modelBuilder.getFinalResult(JavaCustomType.class);
    assertEquals(enumType, resultTypeRef);

    verify(typeMapper).mapCustomType(francaEnumerationType);
  }

  @Test
  public void finishBuildingFrancaEnumerationTypeCreatesInternalEnum() {
    when(deploymentModel.isInternal(any())).thenReturn(true);
    when(typeMapper.mapCustomType(any())).thenReturn(enumType);

    modelBuilder.finishBuilding(francaEnumerationType);

    JavaEnum resultEnum = modelBuilder.getFinalResult(JavaEnum.class);
    assertNotNull(resultEnum);
    assertEquals(JavaVisibility.PACKAGE, resultEnum.visibility);
  }

  @Test
  public void finishBuildingFrancaEnumerationTypeCreatesExceptionClass() {
    when(typeMapper.mapCustomType(any())).thenReturn(enumType);
    when(francaEnumerationTypeError.getName()).thenReturn("MyEnum");

    modelBuilder.finishBuilding(francaEnumerationTypeError);

    JavaExceptionClass result = modelBuilder.getFinalResult(JavaExceptionClass.class);
    assertEquals("MyEnumException", result.name);
    assertEquals(enumType.packageNames, result.javaPackage.packageNames);
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
    contextStack.injectResult(javaValue);

    modelBuilder.finishBuilding(francaEnumerator1);

    JavaEnumItem result = modelBuilder.getFinalResult(JavaEnumItem.class);
    assertNotNull(result);
    assertEquals(ENUMERATOR_1_NAME, result.name);
    assertEquals(javaValue, result.value);
  }

  @Test
  public void finishBuildingFExpressionReadsJavaValue() {
    FExpression francaExpression = mock(FExpression.class);
    when(JavaValueMapper.map(francaExpression)).thenReturn(javaValue);

    modelBuilder.finishBuilding(francaExpression);

    JavaValue result = modelBuilder.getFinalResult(JavaValue.class);
    assertSame(javaValue, result);
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
