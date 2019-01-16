/*
 * Copyright (C) 2016-2019 HERE Europe B.V.
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

package com.here.genium.generator.swift;

import static org.junit.Assert.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;
import static org.mockito.MockitoAnnotations.initMocks;
import static org.powermock.api.mockito.PowerMockito.mockStatic;

import com.here.genium.common.FrancaSignatureResolver;
import com.here.genium.generator.cbridge.CBridgeNameRules;
import com.here.genium.model.common.InstanceRules;
import com.here.genium.model.franca.DefinedBy;
import com.here.genium.model.franca.FrancaDeploymentModel;
import com.here.genium.model.swift.*;
import com.here.genium.test.MockContextStack;
import org.franca.core.franca.*;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.powermock.api.mockito.PowerMockito;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
@PrepareForTest({
  SwiftTypeMapper.class,
  CBridgeNameRules.class,
  InstanceRules.class,
  DefinedBy.class,
  SwiftValueMapper.class
})
public final class SwiftModelBuilderTest {

  private static final String PARAM_NAME = "someParamName";
  private static final String FUNCTION_NAME = "someFunctionName";
  private static final String STRUCT_NAME = "someStruct";
  private static final String ATTRIBUTE_NAME = "someAttributeName";
  private static final String FIELD_NAME = "flowers";
  private static final String CBRIDGE_GETTER_NAME = "CBRIDGE_GETTER_NAME";
  private static final String CBRIDGE_SETTER_NAME = "CBRIDGE_SETTER_NAME";

  private final MockContextStack<SwiftModelElement> contextStack = new MockContextStack<>();

  @Mock private FrancaDeploymentModel deploymentModel;
  @Mock private FrancaSignatureResolver signatureResolver;

  @Mock private FMethod francaMethod;
  @Mock private FArgument francaArgument;
  @Mock private FTypeCollection francaTypeCollection;
  @Mock private FTypeRef francaTypeRef;
  @Mock private FField francaField;
  @Mock private FTypeDef francaTypeDef;
  @Mock private FAttribute francaAttribute;
  @Mock private FArrayType francaArray;
  @Mock private FStructType francaStruct;
  @Mock private FMapType francaMap;
  @Mock private FEnumerationType francaEnum;
  @Mock private FConstantDef francaConstant;
  @Mock private FInitializerExpression francaInitializer;

  private final SwiftType swiftType = new SwiftType("VerySwiftType");
  private final SwiftValue swiftValue = new SwiftValue("");
  private final SwiftField swiftField = new SwiftField("flowers", null, swiftType, swiftValue);

  private SwiftModelBuilder modelBuilder;

  @Before
  public void setUp() {
    mockStatic(
        SwiftTypeMapper.class,
        CBridgeNameRules.class,
        InstanceRules.class,
        DefinedBy.class,
        SwiftValueMapper.class);
    initMocks(this);

    when(francaArgument.getType()).thenReturn(francaTypeRef);

    when(francaArgument.getName()).thenReturn(PARAM_NAME);
    when(francaMethod.getName()).thenReturn(FUNCTION_NAME);
    when(CBridgeNameRules.getPropertyGetterName(any())).thenReturn(CBRIDGE_GETTER_NAME);
    when(CBridgeNameRules.getPropertySetterName(any())).thenReturn(CBRIDGE_SETTER_NAME);

    when(francaArgument.getName()).thenReturn(PARAM_NAME);
    when(francaField.getName()).thenReturn(FIELD_NAME);
    when(francaTypeDef.getName()).thenReturn("definite");
    when(francaAttribute.getName()).thenReturn(ATTRIBUTE_NAME);

    modelBuilder = new SwiftModelBuilder(contextStack, deploymentModel, signatureResolver);
  }

  @Test
  public void finishBuildingInputArgumentReturnsCreatedParams() {
    contextStack.injectResult(swiftType);

    modelBuilder.finishBuildingInputArgument(francaArgument);

    SwiftParameter param = modelBuilder.getFinalResult(SwiftParameter.class);
    assertNotNull(param);
    assertEquals(PARAM_NAME, param.variableName);
    assertSame(swiftType, param.type);
  }

  @Test
  public void finishBuildingInputArgumentCreatesGenericParameters() {
    contextStack.injectResult(new SwiftArray(swiftType));

    modelBuilder.finishBuildingInputArgument(francaArgument);

    SwiftGenericParameter genericParameter =
        modelBuilder.getFinalResult(SwiftGenericParameter.class);
    assertNotNull(genericParameter);

    assertEquals(PARAM_NAME, genericParameter.name);
    assertEquals(SwiftGenericParameter.COLLECTION_TYPE_NAME, genericParameter.typeName);
    assertEquals(1, genericParameter.constraints.size());

    SwiftGenericParameter.Constraint constraint = genericParameter.constraints.get(0);
    assertEquals(PARAM_NAME + "." + SwiftGenericParameter.ELEMENT_FIELD_NAME, constraint.name);
    assertEquals(swiftType.name, constraint.typeName);
    assertFalse(constraint.isProtocol);
  }

  @Test
  public void finishBuildingCreatesMethodWithArrayOfArraysParam() {
    contextStack.injectResult(new SwiftArray(new SwiftArray(swiftType)));

    modelBuilder.finishBuildingInputArgument(francaArgument);

    SwiftGenericParameter genericParameter =
        modelBuilder.getFinalResult(SwiftGenericParameter.class);
    assertNotNull(genericParameter);
    assertEquals(2, genericParameter.constraints.size());

    SwiftGenericParameter.Constraint constraint1 = genericParameter.constraints.get(0);
    assertEquals(PARAM_NAME + "." + SwiftGenericParameter.ELEMENT_FIELD_NAME, constraint1.name);
    assertEquals(SwiftGenericParameter.COLLECTION_TYPE_NAME, constraint1.typeName);
    assertTrue(constraint1.isProtocol);

    SwiftGenericParameter.Constraint constraint2 = genericParameter.constraints.get(1);
    assertEquals(
        constraint1.name + "." + SwiftGenericParameter.ELEMENT_FIELD_NAME, constraint2.name);
    assertEquals(swiftType.name, constraint2.typeName);
    assertFalse(constraint2.isProtocol);
  }

  @Test
  public void finishBuildingDeclareArray() {
    when(SwiftTypeMapper.mapType(any(), any())).thenReturn(swiftType);

    modelBuilder.finishBuilding(francaArray);

    SwiftArray swiftArray = modelBuilder.arraysCollector.values().iterator().next();

    assertNotNull(swiftArray);
    assertEquals(1, swiftArray.genericParameter.constraints.size());

    SwiftGenericParameter.Constraint constraint1 = swiftArray.genericParameter.constraints.get(0);
    assertEquals(SwiftGenericParameter.ELEMENT_FIELD_NAME, constraint1.name);
  }

  @Test
  public void finishBuildingDeclareNestedArray() {
    SwiftArray array = new SwiftArray(SwiftType.STRING);
    when(SwiftTypeMapper.mapType(any(), any())).thenReturn(array);

    modelBuilder.finishBuilding(francaArray);

    SwiftArray swiftArray = modelBuilder.arraysCollector.values().iterator().next();

    assertNotNull(swiftArray);
    assertEquals(2, swiftArray.genericParameter.constraints.size());

    SwiftGenericParameter.Constraint constraint1 = swiftArray.genericParameter.constraints.get(0);
    assertEquals(SwiftGenericParameter.ELEMENT_FIELD_NAME, constraint1.name);
    assertEquals(SwiftGenericParameter.COLLECTION_TYPE_NAME, constraint1.typeName);
    assertTrue(constraint1.isProtocol);

    SwiftGenericParameter.Constraint constraint2 = swiftArray.genericParameter.constraints.get(1);
    assertEquals(
        SwiftGenericParameter.ELEMENT_FIELD_NAME + "." + SwiftGenericParameter.ELEMENT_FIELD_NAME,
        constraint2.name);
    assertEquals(array.underlyingType.name, constraint2.typeName);
    assertFalse(constraint2.isProtocol);
  }

  @Test
  public void finishBuildingOutputArgumentReturnsCreatedParam() {
    contextStack.injectResult(swiftType);

    modelBuilder.finishBuildingOutputArgument(francaArgument);

    SwiftParameter param = modelBuilder.getFinalResult(SwiftParameter.class);
    assertNotNull(param);
    assertEquals(PARAM_NAME, param.variableName);
    assertSame(swiftType, param.type);
  }

  @Test
  public void finishBuildingMethodReadsName() {
    modelBuilder.finishBuilding(francaMethod);

    SwiftMethod method = modelBuilder.getFinalResult(SwiftMethod.class);
    assertNotNull(method);
    assertEquals(FUNCTION_NAME, method.name);
  }

  @Test
  public void finishBuildingMethodOmitsSelector() {
    when(francaMethod.getSelector()).thenReturn("selective");

    modelBuilder.finishBuilding(francaMethod);

    SwiftMethod method = modelBuilder.getFinalResult(SwiftMethod.class);
    assertNotNull(method);
    assertEquals(FUNCTION_NAME, method.name);
  }

  @Test
  public void finishBuildingMethodCreatesStaticMethod() {
    when(deploymentModel.isStatic(francaMethod)).thenReturn(true);

    modelBuilder.finishBuilding(francaMethod);

    SwiftMethod method = modelBuilder.getFinalResult(SwiftMethod.class);
    assertNotNull(method);
    assertTrue("Method is marked as static", method.isStatic());
  }

  @Test
  public void finishBuildingMethodCreatesNonStaticMethod() {
    when(deploymentModel.isStatic(francaMethod)).thenReturn(false);

    modelBuilder.finishBuilding(francaMethod);

    SwiftMethod method = modelBuilder.getFinalResult(SwiftMethod.class);
    assertNotNull(method);
    assertFalse("Method is marked as non-static", method.isStatic());
  }

  @Test
  public void finishBuildingCreatesMethodWithoutParams() {
    modelBuilder.finishBuilding(francaMethod);

    SwiftMethod method = modelBuilder.getFinalResult(SwiftMethod.class);
    assertNotNull(method);
    assertEquals(SwiftType.VOID, method.getReturnType());
    assertEquals(0, method.getParameters().size());
  }

  @Test
  public void finishBuildingCreatesMethodWithParam() {
    SwiftInParameter param = new SwiftInParameter(PARAM_NAME, swiftType);
    contextStack.injectResult(param);

    modelBuilder.finishBuilding(francaMethod);

    SwiftMethod method = modelBuilder.getFinalResult(SwiftMethod.class);
    assertNotNull(method);
    assertEquals(1, method.getParameters().size());
    assertSame(param, method.getParameters().get(0));
  }

  @Test
  public void finishBuildingMethodReadsGenericParameters() {
    SwiftGenericParameter genericParameter = new SwiftGenericParameter("foo", "bar");
    contextStack.injectResult(genericParameter);

    modelBuilder.finishBuilding(francaMethod);

    SwiftMethod method = modelBuilder.getFinalResult(SwiftMethod.class);
    assertNotNull(method);
    assertEquals(1, method.getGenericParameters().size());
    assertSame(genericParameter, method.getGenericParameters().get(0));
  }

  @Test
  public void finishBuildingFrancaMethodCreatesInternalMethod() {
    when(deploymentModel.isInternal(any())).thenReturn(true);

    modelBuilder.finishBuilding(francaMethod);

    SwiftMethod swiftMethod = modelBuilder.getFinalResult(SwiftMethod.class);
    assertNotNull(swiftMethod);
    assertEquals(SwiftVisibility.INTERNAL, swiftMethod.visibility);
  }

  @Test
  public void finishBuildingFrancaMethodCreatesConstructor() {
    when(deploymentModel.isConstructor(any())).thenReturn(true);

    modelBuilder.finishBuilding(francaMethod);

    SwiftMethod swiftMethod = modelBuilder.getFinalResult(SwiftMethod.class);
    assertNotNull(swiftMethod);
    assertTrue(swiftMethod.isConstructor());
  }

  @Test
  public void finishBuildingFrancaMethodCreatesOverridingConstructor() {
    when(deploymentModel.isConstructor(any())).thenReturn(true);
    when(signatureResolver.hasSignatureClash(any())).thenReturn(true);

    modelBuilder.finishBuilding(francaMethod);

    SwiftMethod swiftMethod = modelBuilder.getFinalResult(SwiftMethod.class);
    assertNotNull(swiftMethod);
    assertTrue(swiftMethod.isOverriding());
  }

  @Test
  public void finishBuildingCreatesTypesFromTypeCollection() {
    SwiftStruct struct = new SwiftStruct(STRUCT_NAME, null);
    SwiftEnum swiftEnum = new SwiftEnum("");
    contextStack.injectResult(struct);
    contextStack.injectResult(swiftEnum);

    modelBuilder.finishBuilding(francaTypeCollection);

    SwiftFile file = modelBuilder.getFinalResult(SwiftFile.class);
    assertNotNull(file);
    assertEquals("There should be no classes inside file", 0, file.classes.size());
    assertEquals("There should be one struct inside file", 1, file.structs.size());
    assertSame(struct, file.structs.get(0));
    assertEquals("There should be one enum inside file", 1, file.enums.size());
    assertSame(swiftEnum, file.enums.get(0));
  }

  @Test
  public void finishBuildingFrancaTypeCollectionReadsConstants() {
    SwiftConstant swiftConstant =
        new SwiftConstant("Foo", SwiftVisibility.PUBLIC, swiftType, swiftValue);
    contextStack.injectResult(swiftConstant);

    modelBuilder.finishBuilding(francaTypeCollection);

    SwiftFile result = modelBuilder.getFinalResult(SwiftFile.class);
    assertNotNull(result);
    assertEquals(1, result.structs.size());

    SwiftStruct resultStruct = result.structs.get(0);
    assertEquals(1, resultStruct.getConstants().size());
    assertEquals(swiftConstant, resultStruct.getConstants().get(0));
  }

  @Test
  public void finishBuildingCreatesCValuesOutOfExpressions() {
    FExpression francaExpression = mock(FExpression.class);
    when(SwiftValueMapper.map(any(FExpression.class))).thenReturn(swiftValue);

    modelBuilder.finishBuilding(francaExpression);

    SwiftValue value = modelBuilder.getFinalResult(SwiftValue.class);
    assertNotNull("Should be on value stored", value);
    assertSame(swiftValue, value);
  }

  @Test
  public void finishBuildingCreatesEnumItemWithoutValue() {
    FEnumerator francaEnumerator = mock(FEnumerator.class);

    modelBuilder.finishBuilding(francaEnumerator);

    SwiftEnumItem enumItem = modelBuilder.getFinalResult(SwiftEnumItem.class);
    assertNotNull("Should be 1 enum item created", enumItem);
    assertNull("Enum item should have not value set", enumItem.getValue());
  }

  @Test
  public void finishBuildingCreatesEnumItemWithValue() {
    contextStack.injectResult(swiftValue);
    FEnumerator enumerator = mock(FEnumerator.class);

    modelBuilder.finishBuilding(enumerator);

    SwiftEnumItem enumItem = modelBuilder.getFinalResult(SwiftEnumItem.class);
    assertNotNull("Should be 1 enum item created", enumItem);
    assertSame(swiftValue, enumItem.getValue());
  }

  @Test
  public void finishBuildingCreatesSwiftEnum() {
    SwiftEnumItem swiftEnumItem = new SwiftEnumItem("", null);
    contextStack.injectResult(swiftEnumItem);
    when(francaEnum.getName()).thenReturn("SWIFT_NAME");

    modelBuilder.finishBuilding(francaEnum);

    SwiftEnum enumType = modelBuilder.getFinalResult(SwiftEnum.class);
    assertNotNull("Should be 1 enum created", enumType);
    assertEquals("SwiftName", enumType.name);
    assertEquals("should be 1 enum item created", 1, enumType.getItems().size());
    assertSame(
        "Enum item inside enum type should be on injected into model",
        swiftEnumItem,
        enumType.getItems().get(0));
  }

  @Test
  public void finishBuildingFrancaEnumerationTypeCreatesInternalEnum() {
    when(deploymentModel.isInternal(any())).thenReturn(true);

    modelBuilder.finishBuilding(francaEnum);

    SwiftEnum swiftEnum = modelBuilder.getFinalResult(SwiftEnum.class);
    assertNotNull(swiftEnum);
    assertEquals(SwiftVisibility.INTERNAL, swiftEnum.visibility);
  }

  @Test
  public void finishBuildingFrancaFieldReadsName() {
    when(francaField.getName()).thenReturn("SwiftFieldName");
    contextStack.injectResult(swiftType);
    modelBuilder.finishBuilding(francaField);

    SwiftField resultField = modelBuilder.getFinalResult(SwiftField.class);
    assertNotNull("Should be 1 field item created", resultField);
    assertEquals("swiftFieldName", resultField.name);
  }

  @Test
  public void finishBuildingFrancaFieldReadsType() {
    contextStack.injectResult(swiftType);

    modelBuilder.finishBuilding(francaField);

    SwiftField resultField = modelBuilder.getFinalResult(SwiftField.class);
    assertNotNull("Should be 1 field item created", resultField);
    assertSame(swiftType, resultField.type);
  }

  @Test
  public void finishBuildingFrancaFieldReadsDefaultValue() {
    when(deploymentModel.getDefaultValue(any())).thenReturn("SomeValue");
    when(SwiftValueMapper.mapDefaultValue(any(), any())).thenReturn(swiftValue);
    contextStack.injectResult(swiftType);

    modelBuilder.finishBuilding(francaField);

    SwiftField resultField = modelBuilder.getFinalResult(SwiftField.class);
    assertNotNull(resultField);
    assertEquals(swiftValue, resultField.defaultValue);
    verify(deploymentModel).getDefaultValue(francaField);
    PowerMockito.verifyStatic();
    SwiftValueMapper.mapDefaultValue(swiftType, "SomeValue");
  }

  @Test
  public void finishBuildingFrancaFieldCreatesInternalField() {
    when(deploymentModel.isInternal(any())).thenReturn(true);
    contextStack.injectResult(swiftType);

    modelBuilder.finishBuilding(francaField);

    SwiftField resultField = modelBuilder.getFinalResult(SwiftField.class);
    assertNotNull(resultField);
    assertEquals(SwiftVisibility.INTERNAL, resultField.visibility);
  }

  @Test
  public void finishBuildingFrancaTypeDefDoesNotReadInstance() {
    when(InstanceRules.isInstanceId(francaTypeDef)).thenReturn(true);

    modelBuilder.finishBuilding(francaTypeDef);

    assertNull(
        "Instance typedef should not be added to results",
        modelBuilder.getFinalResult(SwiftTypeDef.class));
  }

  @Test
  public void finishBuildingFrancaTypeDefReadsName() {
    when(francaTypeDef.getName()).thenReturn("definite");

    modelBuilder.finishBuilding(francaTypeDef);

    SwiftTypeDef swiftTypeDef = modelBuilder.getFinalResult(SwiftTypeDef.class);
    assertNotNull("Should be 1 field item created", swiftTypeDef);
    assertEquals("Definite", swiftTypeDef.name);
  }

  @Test
  public void finishBuildingFrancaTypeDefReadsType() {
    contextStack.injectResult(swiftType);

    modelBuilder.finishBuilding(francaTypeDef);

    SwiftTypeDef swiftTypeDef = modelBuilder.getFinalResult(SwiftTypeDef.class);
    assertNotNull("Should be 1 field item created", swiftTypeDef);
    assertSame(swiftType, swiftTypeDef.type);
  }

  @Test
  public void finishBuildingFrancaTypeDefCreatesInternalTypeDef() {
    when(deploymentModel.isInternal(any())).thenReturn(true);

    modelBuilder.finishBuilding(francaTypeDef);

    SwiftTypeDef swiftTypeDef = modelBuilder.getFinalResult(SwiftTypeDef.class);
    assertNotNull(swiftTypeDef);
    assertEquals(SwiftVisibility.INTERNAL, swiftTypeDef.visibility);
  }

  @Test
  public void finishBuildingFrancaTypeRef() {
    when(InstanceRules.isInstanceId(francaTypeRef)).thenReturn(false);
    when(SwiftTypeMapper.mapType(any(FTypeRef.class), any())).thenReturn(swiftType);

    modelBuilder.finishBuilding(francaTypeRef);

    SwiftType resultType = modelBuilder.getFinalResult(SwiftType.class);
    assertNotNull("Should be 1 type item created", resultType);
    assertSame(swiftType, resultType);
    PowerMockito.verifyStatic();
    SwiftTypeMapper.mapType(francaTypeRef, deploymentModel);
  }

  @Test
  public void finishBuildingFrancaInstanceTypeRef() {
    when(francaTypeRef.getDerived()).thenReturn(francaTypeDef);
    when(SwiftTypeMapper.mapType(francaTypeRef, deploymentModel)).thenReturn(swiftType);
    when(InstanceRules.isInstanceId(francaTypeRef)).thenReturn(true);
    when(deploymentModel.isInterface(any())).thenReturn(false);

    modelBuilder.finishBuilding(francaTypeRef);

    SwiftType resultType = modelBuilder.getFinalResult(SwiftType.class);
    assertNotNull("Should be 1 type item created", resultType);
    assertSame(swiftType, resultType);
    PowerMockito.verifyStatic();
    SwiftTypeMapper.mapType(francaTypeRef, deploymentModel);
  }

  @Test
  public void finishBuildingFrancaInterfaceInstanceTypeRef() {
    when(francaTypeRef.getDerived()).thenReturn(francaTypeDef);
    when(SwiftTypeMapper.mapType(francaTypeRef, deploymentModel)).thenReturn(swiftType);
    when(InstanceRules.isInstanceId(francaTypeRef)).thenReturn(true);
    when(deploymentModel.isInterface(any())).thenReturn(true);

    modelBuilder.finishBuilding(francaTypeRef);

    SwiftType resultType = modelBuilder.getFinalResult(SwiftType.class);
    assertNotNull("Should be 1 type item created", resultType);
    assertEquals(swiftType.name, resultType.name);
    assertEquals(swiftType.implementingClass, resultType.implementingClass);
    PowerMockito.verifyStatic();
    SwiftTypeMapper.mapType(francaTypeRef, deploymentModel);
  }

  @Test
  public void finishBuildingCreatesWritableAttribute() {
    contextStack.injectResult(swiftType);

    modelBuilder.finishBuilding(francaAttribute);

    SwiftProperty property = modelBuilder.getFinalResult(SwiftProperty.class);
    assertNotNull("Should be one property created", property);
    assertSame(swiftType, property.type);
    assertEquals(ATTRIBUTE_NAME, property.name);

    assertEquals(
        "Should be two accessor methods - getter and setter", 2, property.propertyAccessors.size());

    SwiftMethod getter = property.propertyAccessors.get(0);
    assertSame(swiftType, getter.getReturnType());
    assertEquals("Getter should have no parameters", 0, getter.getParameters().size());
    assertEquals(CBRIDGE_GETTER_NAME, getter.getCShortName());

    SwiftMethod setter = property.propertyAccessors.get(1);
    assertSame(SwiftType.VOID, setter.getReturnType());
    assertEquals("Setter should have one parameters", 1, setter.getParameters().size());
    assertSame(swiftType, setter.getParameters().get(0).type);
    assertEquals(CBRIDGE_SETTER_NAME, setter.getCShortName());
  }

  @Test
  public void finishBuildingCreatesReadonlyAttribute() {
    contextStack.injectResult(swiftType);
    when(francaAttribute.isReadonly()).thenReturn(true);

    modelBuilder.finishBuilding(francaAttribute);

    SwiftProperty property = modelBuilder.getFinalResult(SwiftProperty.class);
    assertNotNull("Should be one property created", property);

    assertEquals("Should be one accessor method - getter", 1, property.propertyAccessors.size());

    SwiftMethod getter = property.propertyAccessors.get(0);
    assertSame(swiftType, getter.getReturnType());
    assertEquals("Getter should have no parameters", 0, getter.getParameters().size());
    assertEquals(CBRIDGE_GETTER_NAME, getter.getCShortName());
  }

  @Test
  public void finishBuildingCreatesBooleanAttribute() {
    contextStack.injectResult(SwiftType.BOOL);

    modelBuilder.finishBuilding(francaAttribute);

    SwiftProperty property = modelBuilder.getFinalResult(SwiftProperty.class);
    assertNotNull(property);
    assertEquals(SwiftType.BOOL, property.type);
    assertEquals("isSomeAttributeName", property.name);
  }

  @Test
  public void finishBuildingFrancaAttributeCreatesInternalProperty() {
    contextStack.injectResult(swiftType);
    when(deploymentModel.isInternal(any())).thenReturn(true);

    modelBuilder.finishBuilding(francaAttribute);

    SwiftProperty swiftProperty = modelBuilder.getFinalResult(SwiftProperty.class);
    assertNotNull(swiftProperty);
    assertEquals(SwiftVisibility.INTERNAL, swiftProperty.visibility);
  }

  @Test
  public void finishBuildingFrancaAttributeWithStatic() {
    contextStack.injectResult(swiftType);
    when(deploymentModel.isStatic(any(FAttribute.class))).thenReturn(true);

    modelBuilder.finishBuilding(francaAttribute);

    SwiftProperty swiftProperty = modelBuilder.getFinalResult(SwiftProperty.class);
    assertNotNull(swiftProperty);
    assertTrue(swiftProperty.isStatic);
    assertTrue(swiftProperty.propertyAccessors.get(0).isStatic());
    assertTrue(swiftProperty.propertyAccessors.get(1).isStatic());
  }

  @Test
  public void finishBuildingOutputArgumentDoesNotChangeStringType() {
    contextStack.injectResult(SwiftType.STRING);

    modelBuilder.finishBuildingOutputArgument(francaArgument);

    assertFalse(SwiftType.STRING.optional);
  }

  @Test
  public void finishBuildingLeavesErrorNotSet() {
    modelBuilder.finishBuilding(francaMethod);

    SwiftMethod method = modelBuilder.getFinalResult(SwiftMethod.class);
    assertNull(method.getError());
  }

  @Test
  public void finishBuildingMethodProcessErrors() {
    FEnumerationType enumerationType = mock(FEnumerationType.class);
    when(francaMethod.getErrorEnum()).thenReturn(enumerationType);
    when(enumerationType.getName()).thenReturn("SOME_ERROR");

    modelBuilder.finishBuilding(francaMethod);

    SwiftMethod method = modelBuilder.getFinalResult(SwiftMethod.class);
    assertNotNull(method.getError());
    assertEquals("SomeError", method.getError().name);
  }

  @Test
  public void finishBuildingFrancaStructTypeReadsName() {
    when(francaStruct.getName()).thenReturn("Structural");
    when(CBridgeNameRules.getStructBaseName(any())).thenReturn("CBase");

    modelBuilder.finishBuilding(francaStruct);

    SwiftStruct swiftStruct = modelBuilder.getFinalResult(SwiftStruct.class);
    assertNotNull(swiftStruct);
    assertEquals("Structural", swiftStruct.name);
    assertEquals("CBase", swiftStruct.getcPrefix());
  }

  @Test
  public void finishBuildingFrancaStructTypeReadsFields() {
    contextStack.injectResult(swiftField);

    modelBuilder.finishBuilding(francaStruct);

    SwiftStruct swiftStruct = modelBuilder.getFinalResult(SwiftStruct.class);
    assertNotNull(swiftStruct);
    assertEquals(1, swiftStruct.getFields().size());
    assertEquals(swiftField, swiftStruct.getFields().get(0));
  }

  @Test
  public void finishBuildingFrancaStructTypeCreatesInternalStruct() {
    when(deploymentModel.isInternal(any())).thenReturn(true);

    modelBuilder.finishBuilding(francaStruct);

    SwiftStruct swiftStruct = modelBuilder.getFinalResult(SwiftStruct.class);
    assertNotNull(swiftStruct);
    assertEquals(SwiftVisibility.INTERNAL, swiftStruct.visibility);
  }

  @Test
  public void finishBuildingFrancaStructTypeReadsEquatable() {
    when(deploymentModel.isEquatable(any())).thenReturn(true);

    modelBuilder.finishBuilding(francaStruct);

    SwiftStruct swiftStruct = modelBuilder.getFinalResult(SwiftStruct.class);
    assertNotNull(swiftStruct);
    assertTrue(swiftStruct.isEquatable());
  }

  @Test
  public void finishBuildingFrancaStructTypeReadsImmutable() {
    when(deploymentModel.isImmutable(any())).thenReturn(true);

    modelBuilder.finishBuilding(francaStruct);

    SwiftStruct swiftStruct = modelBuilder.getFinalResult(SwiftStruct.class);
    assertNotNull(swiftStruct);
    assertTrue(swiftStruct.isImmutable());
  }

  @Test
  public void finishBuildingFrancaMapTypeCreatesDictionary() {
    when(francaMap.getName()).thenReturn("SomeMap");
    when(CBridgeNameRules.getStructBaseName(any())).thenReturn("SomeMapBaz");
    contextStack.injectResult(SwiftType.STRING);
    contextStack.injectResult(swiftType);

    modelBuilder.finishBuilding(francaMap);

    SwiftDictionary swiftDictionary = modelBuilder.getFinalResult(SwiftDictionary.class);
    assertNotNull(swiftDictionary);
    assertEquals("SomeMap", swiftDictionary.name);
    assertEquals("SomeMap", swiftDictionary.publicName);
    assertEquals("SomeMapBaz", swiftDictionary.getcPrefix());
    assertEquals(SwiftType.STRING, swiftDictionary.getKeyType());
    assertEquals(swiftType, swiftDictionary.getValueType());

    PowerMockito.verifyStatic();
    CBridgeNameRules.getStructBaseName(francaMap);
  }

  @Test
  public void finishBuildingFrancaMapTypeCreatesTypeDef() {
    when(francaMap.getName()).thenReturn("SomeMap");
    contextStack.injectResult(SwiftType.STRING);
    contextStack.injectResult(swiftType);

    modelBuilder.finishBuilding(francaMap);

    SwiftTypeDef swiftTypeDef = modelBuilder.getFinalResult(SwiftTypeDef.class);
    assertNotNull(swiftTypeDef);
    assertEquals("SomeMap", swiftTypeDef.name);
    assertEquals("[String: VerySwiftType]", swiftTypeDef.type.name);
  }

  @Test
  public void finishBuildingFrancaMapTypeCreatesInternalTypeDef() {
    when(deploymentModel.isInternal(any())).thenReturn(true);
    contextStack.injectResult(SwiftType.STRING);
    contextStack.injectResult(swiftType);

    modelBuilder.finishBuilding(francaMap);

    SwiftTypeDef swiftTypeDef = modelBuilder.getFinalResult(SwiftTypeDef.class);
    assertNotNull(swiftTypeDef);
    assertEquals(SwiftVisibility.INTERNAL, swiftTypeDef.visibility);
  }

  @Test
  public void finishBuildingFrancaConstant() {
    when(francaConstant.getRhs()).thenReturn(francaInitializer);
    when(francaConstant.getName()).thenReturn("FooConst");
    contextStack.injectResult(swiftValue);
    contextStack.injectResult(swiftType);

    modelBuilder.finishBuilding(francaConstant);

    SwiftConstant swiftConstant = modelBuilder.getFinalResult(SwiftConstant.class);
    assertNotNull(swiftConstant);
    assertEquals("fooConst", swiftConstant.name);
    assertEquals(swiftType, swiftConstant.type);
    assertEquals(swiftValue, swiftConstant.value);
  }
}
