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

package com.here.ivi.api.generator.swift;

import static org.junit.Assert.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.*;
import static org.mockito.MockitoAnnotations.initMocks;
import static org.powermock.api.mockito.PowerMockito.mockStatic;
import static org.powermock.api.mockito.PowerMockito.verifyStatic;

import com.here.ivi.api.generator.baseapi.CppCommentParser;
import com.here.ivi.api.generator.cbridge.CBridgeNameRules;
import com.here.ivi.api.generator.common.AbstractFrancaCommentParser;
import com.here.ivi.api.model.franca.DefinedBy;
import com.here.ivi.api.model.franca.FrancaDeploymentModel;
import com.here.ivi.api.model.rules.InstanceRules;
import com.here.ivi.api.model.swift.*;
import com.here.ivi.api.test.MockContextStack;
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
  CppCommentParser.class,
  SwiftNameRules.class,
  CBridgeNameRules.class,
  InstanceRules.class,
  DefinedBy.class,
  SwiftValueMapper.class
})
public class SwiftModelBuilderTest {

  private static final String PARAM_NAME = "someParamName";
  private static final String FUNCTION_NAME = "someFunctionName";
  private static final String STRUCT_NAME = "someStruct";
  private static final String COMMENT = "some comment on model element";
  private static final String ATTRIBUTE_NAME = "someAttributeName";
  private static final String FIELD_NAME = "flowers";

  private final MockContextStack<SwiftModelElement> contextStack = new MockContextStack<>();

  @Mock private FrancaDeploymentModel deploymentModel;

  @Mock private AbstractFrancaCommentParser.Comments comments;
  @Mock private FMethod francaMethod;
  @Mock private FArgument francaArgument;
  @Mock private FTypeCollection francaTypeCollection;
  @Mock private FTypeRef francaTypeRef;
  @Mock private FField francaField;
  @Mock private FTypeDef francaTypeDef;
  @Mock private FAttribute francaAttribute;
  @Mock private FArrayType francaArray;
  @Mock private FStructType francaStruct;

  private final SwiftType swiftType = new SwiftType("VerySwiftType");
  private final SwiftValue swiftValue = new SwiftValue("");
  private final SwiftField swiftField = new SwiftField("flowers", swiftType, swiftValue);

  private SwiftModelBuilder modelBuilder;

  @Before
  public void setUp() {
    mockStatic(
        SwiftTypeMapper.class,
        CppCommentParser.class,
        SwiftNameRules.class,
        CBridgeNameRules.class,
        InstanceRules.class,
        DefinedBy.class,
        SwiftValueMapper.class);
    initMocks(this);

    when(francaArgument.getType()).thenReturn(francaTypeRef);
    when(CppCommentParser.parse(any(FModelElement.class))).thenReturn(comments);
    when(CppCommentParser.parse(any(FMethod.class))).thenReturn(comments);
    when(CppCommentParser.parse(any(FEnumerator.class))).thenReturn(comments);
    when(CppCommentParser.parse(any(FEnumerationType.class))).thenReturn(comments);
    when(comments.getMainBodyText()).thenReturn(COMMENT);

    when(SwiftNameRules.getParameterName(any())).thenReturn(PARAM_NAME);
    when(SwiftNameRules.getMethodName(any())).thenReturn(FUNCTION_NAME);

    when(francaArgument.getName()).thenReturn(PARAM_NAME);
    when(francaField.getName()).thenReturn(FIELD_NAME);
    when(francaTypeDef.getName()).thenReturn("definite");
    when(francaAttribute.getName()).thenReturn(ATTRIBUTE_NAME);

    modelBuilder = new SwiftModelBuilder(contextStack, deploymentModel);
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
  public void finishBuildingOutputArgumentMarksStructAsOptional() {
    contextStack.injectResult(new SwiftType("Foo", SwiftType.TypeCategory.STRUCT));

    modelBuilder.finishBuildingOutputArgument(francaArgument);

    SwiftParameter param = modelBuilder.getFinalResult(SwiftParameter.class);
    assertNotNull(param);
    assertTrue(param.type.optional);
  }

  @Test
  public void finishBuildingOutputArgumentMarksStringAsOptional() {
    contextStack.injectResult(new SwiftType("Foo", SwiftType.TypeCategory.BUILTIN_STRING));

    modelBuilder.finishBuildingOutputArgument(francaArgument);

    SwiftParameter param = modelBuilder.getFinalResult(SwiftParameter.class);
    assertNotNull(param);
    assertTrue(param.type.optional);
  }

  @Test
  public void finishBuildingMethodReadsName() {
    modelBuilder.finishBuilding(francaMethod);

    SwiftMethod method = modelBuilder.getFinalResult(SwiftMethod.class);
    assertNotNull(method);
    assertEquals(FUNCTION_NAME, method.name);

    verifyStatic();
    SwiftNameRules.getMethodName(francaMethod);
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
    assertTrue("Method is marked as static", method.isStatic);
  }

  @Test
  public void finishBuildingMethodCreatesNonStaticMethod() {
    when(deploymentModel.isStatic(francaMethod)).thenReturn(false);

    modelBuilder.finishBuilding(francaMethod);

    SwiftMethod method = modelBuilder.getFinalResult(SwiftMethod.class);
    assertNotNull(method);
    assertFalse("Method is marked as non-static", method.isStatic);
  }

  @Test
  public void finishBuildingCreatesMethodWithoutParams() {
    modelBuilder.finishBuilding(francaMethod);

    SwiftMethod method = modelBuilder.getFinalResult(SwiftMethod.class);
    assertNotNull(method);
    assertEquals(SwiftType.VOID, method.returnType);
    assertEquals(0, method.parameters.size());
  }

  @Test
  public void finishBuildingCreatesMethodWithParam() {
    SwiftInParameter param = new SwiftInParameter(PARAM_NAME, swiftType);
    contextStack.injectResult(param);

    modelBuilder.finishBuilding(francaMethod);

    SwiftMethod method = modelBuilder.getFinalResult(SwiftMethod.class);
    assertNotNull(method);
    assertEquals(1, method.parameters.size());
    assertSame(param, method.parameters.get(0));
  }

  @Test
  public void finishBuildingMethodReadsGenericParameters() {
    SwiftGenericParameter genericParameter = new SwiftGenericParameter("foo", "bar");
    contextStack.injectResult(genericParameter);

    modelBuilder.finishBuilding(francaMethod);

    SwiftMethod method = modelBuilder.getFinalResult(SwiftMethod.class);
    assertNotNull(method);
    assertEquals(1, method.genericParameters.size());
    assertSame(genericParameter, method.genericParameters.get(0));
  }

  @Test
  public void finishBuildingCreatesTypesFromTypeCollection() {
    SwiftContainerType struct = SwiftContainerType.builder(STRUCT_NAME).build();
    SwiftEnum swiftEnum = SwiftEnum.builder("").build();
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
  public void finishBuildingCreatesCValuesOutOfExpressions() {
    FExpression francaExpression = mock(FExpression.class);
    when(SwiftValueMapper.mapExpression(any(FExpression.class))).thenReturn(swiftValue);

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
    assertNull("Enum item should have not value set", enumItem.value);
  }

  @Test
  public void finishBuildingCreatesEnumItemWithValue() {
    contextStack.injectResult(swiftValue);
    FEnumerator enumerator = mock(FEnumerator.class);

    modelBuilder.finishBuilding(enumerator);

    SwiftEnumItem enumItem = modelBuilder.getFinalResult(SwiftEnumItem.class);
    assertNotNull("Should be 1 enum item created", enumItem);
    assertSame(swiftValue, enumItem.value);
  }

  @Test
  public void finishBuildingCreatesSwiftEnum() {
    SwiftEnumItem swiftEnumItem = SwiftEnumItem.builder("").build();
    contextStack.injectResult(swiftEnumItem);
    FEnumerationType enumerationType = mock(FEnumerationType.class);
    when(SwiftNameRules.getEnumTypeName(any(), eq(deploymentModel))).thenReturn("SWIFT_NAME");

    modelBuilder.finishBuilding(enumerationType);

    SwiftEnum enumType = modelBuilder.getFinalResult(SwiftEnum.class);
    assertNotNull("Should be 1 enum created", enumType);
    assertEquals("SWIFT_NAME", enumType.name);
    assertEquals("should be 1 enum item created", 1, enumType.items.size());
    assertSame(
        "Enum item inside enum type should be on injected into model",
        swiftEnumItem,
        enumType.items.get(0));
  }

  @Test
  public void finishBuildingFrancaFieldReadsName() {
    when(SwiftNameRules.getFieldName(eq(FIELD_NAME))).thenReturn("SwiftFieldName");
    modelBuilder.finishBuilding(francaField);

    SwiftField resultField = modelBuilder.getFinalResult(SwiftField.class);
    assertNotNull("Should be 1 field item created", resultField);
    assertEquals("SwiftFieldName", resultField.name);
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
  public void finishBuildingFrancaTypeDefDoesNotReadInstance() {
    when(InstanceRules.isInstanceId(francaTypeDef)).thenReturn(true);

    modelBuilder.finishBuilding(francaTypeDef);

    assertNull(
        "Instance typedef should not be added to results",
        modelBuilder.getFinalResult(SwiftTypeDef.class));
  }

  @Test
  public void finishBuildingFrancaTypeDefReadsName() {
    when(SwiftNameRules.getTypeDefName(eq(francaTypeDef), any())).thenReturn("definite");

    modelBuilder.finishBuilding(francaTypeDef);

    SwiftTypeDef swiftTypeDef = modelBuilder.getFinalResult(SwiftTypeDef.class);
    assertNotNull("Should be 1 field item created", swiftTypeDef);
    assertEquals("definite", swiftTypeDef.name);
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
    when(SwiftNameRules.getPropertyName(any())).thenReturn(ATTRIBUTE_NAME);

    modelBuilder.finishBuilding(francaAttribute);

    SwiftProperty property = modelBuilder.getFinalResult(SwiftProperty.class);
    assertNotNull("Should be one property created", property);
    assertSame(swiftType, property.type);
    assertEquals(ATTRIBUTE_NAME, property.name);
    assertFalse(property.readonly);
  }

  @Test
  public void finishBuildingCreatesReadonlyAttribute() {
    contextStack.injectResult(swiftType);
    when(SwiftNameRules.getPropertyName(any())).thenReturn(ATTRIBUTE_NAME);
    when(francaAttribute.isReadonly()).thenReturn(true);

    modelBuilder.finishBuilding(francaAttribute);

    SwiftProperty property = modelBuilder.getFinalResult(SwiftProperty.class);
    assertNotNull("Should be one property created", property);
    assertTrue(property.readonly);
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
    assertNull(method.error);
  }

  @Test
  public void finishBuildingMethodProcessErrors() {
    FEnumerationType enumerationType = mock(FEnumerationType.class);
    when(francaMethod.getErrorEnum()).thenReturn(enumerationType);
    when(SwiftNameRules.getEnumTypeName(any(), any())).thenReturn("SOME_ERROR");

    modelBuilder.finishBuilding(francaMethod);

    SwiftMethod method = modelBuilder.getFinalResult(SwiftMethod.class);
    assertNotNull(method.error);
    assertEquals("SOME_ERROR", method.error.name);
  }

  @Test
  public void finishBuildingFrancaStructTypeReadsName() {
    when(SwiftNameRules.getStructName(any(), any())).thenReturn("Structural");
    when(CBridgeNameRules.getStructBaseName(any())).thenReturn("CBase");
    when(CBridgeNameRules.getStructRefType(any())).thenReturn("CRef");

    modelBuilder.finishBuilding(francaStruct);

    SwiftContainerType swiftStruct = modelBuilder.getFinalResult(SwiftContainerType.class);
    assertNotNull(swiftStruct);
    assertEquals("Structural", swiftStruct.name);
    assertEquals("CBase", swiftStruct.cPrefix);
    assertEquals("CRef", swiftStruct.cType);

    PowerMockito.verifyStatic();
    SwiftNameRules.getStructName(francaStruct, deploymentModel);
  }

  @Test
  public void finishBuildingFrancaStructTypeReadsFields() {
    contextStack.injectResult(swiftField);

    modelBuilder.finishBuilding(francaStruct);

    SwiftContainerType swiftStruct = modelBuilder.getFinalResult(SwiftContainerType.class);
    assertNotNull(swiftStruct);
    assertEquals(1, swiftStruct.fields.size());
    assertEquals(swiftField, swiftStruct.fields.get(0));
  }

  @Test
  public void finishBuildingFrancaStructTypeReadsParent() {
    SwiftContainerType parentStruct = SwiftContainerType.builder("FooStruct").build();
    SwiftField parentField = new SwiftField("foo", swiftType, null);
    parentStruct.fields.add(parentField);
    contextStack.injectResult(parentStruct);
    contextStack.injectResult(swiftField);

    modelBuilder.finishBuilding(francaStruct);

    SwiftContainerType swiftStruct = modelBuilder.getFinalResult(SwiftContainerType.class);
    assertNotNull(swiftStruct);
    assertEquals(parentStruct, swiftStruct.parent);
    assertEquals(2, swiftStruct.fields.size());
    assertEquals(parentField, swiftStruct.fields.get(0));
    assertEquals(swiftField, swiftStruct.fields.get(1));
  }
}
