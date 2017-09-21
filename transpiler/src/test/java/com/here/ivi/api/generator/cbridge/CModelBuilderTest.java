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

package com.here.ivi.api.generator.cbridge;

import static java.util.Collections.singleton;
import static org.junit.Assert.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;
import static org.mockito.MockitoAnnotations.initMocks;
import static org.powermock.api.mockito.PowerMockito.mockStatic;

import com.here.ivi.api.common.CollectionsHelper;
import com.here.ivi.api.generator.cpp.CppNameRules;
import com.here.ivi.api.model.cmodel.*;
import com.here.ivi.api.model.cmodel.CElement;
import com.here.ivi.api.model.cmodel.CEnum;
import com.here.ivi.api.model.cmodel.CEnumItem;
import com.here.ivi.api.model.cmodel.CField;
import com.here.ivi.api.model.cmodel.CFunction;
import com.here.ivi.api.model.cmodel.CInParameter;
import com.here.ivi.api.model.cmodel.CInterface;
import com.here.ivi.api.model.cmodel.COutParameter;
import com.here.ivi.api.model.cmodel.CParameter;
import com.here.ivi.api.model.cmodel.CStruct;
import com.here.ivi.api.model.cmodel.CType;
import com.here.ivi.api.model.cmodel.CValue;
import com.here.ivi.api.model.cmodel.IncludeResolver;
import com.here.ivi.api.model.common.Include;
import com.here.ivi.api.model.franca.Interface;
import com.here.ivi.api.test.MockContextStack;
import java.util.HashSet;
import java.util.List;
import org.franca.core.franca.*;
import org.franca.core.franca.FArgument;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FMethod;
import org.franca.core.franca.FModel;
import org.franca.core.franca.FStructType;
import org.franca.core.franca.FTypeCollection;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
@PrepareForTest({CTypeMapper.class, CppNameRules.class, CppTypeInfo.class, CBridgeNameRules.class})
public class CModelBuilderTest {

  private static final String FULL_FUNCTION_NAME = "FULL_FUNCTION_NAME";
  private static final String DELEGATE_NAME = "DELEGATE_NAME";
  private static final String PARAM_NAME = "inputParam";
  private static final String STRUCT_NAME = "SomeStruct";
  private static final String STRUCT_REF_NAME = STRUCT_NAME + "Ref";
  private static final String STRUCT_BASEAPI_NAME = "BaseAPI::" + STRUCT_NAME;

  private final MockContextStack<CElement> contextStack = new MockContextStack<>();

  @Mock private CBridgeNameRules cBridgeNameRules;
  @Mock private IncludeResolver resolver;
  @Mock private Interface anInterface;
  @Mock private FInterface francaInterface;
  @Mock private FMethod francaMethod;
  @Mock private FArgument francaArgument;
  @Mock private FStructType francaStruct;
  @Mock private FField francaField;
  @Mock private FTypeCollection francaTypeCollection;
  @Mock private FModel francaModel;

  private final CppTypeInfo cppTypeInfo = CppTypeInfo.BYTE_VECTOR;
  private CModelBuilder modelBuilder;

  @Before
  public void setUp() {
    mockStatic(CTypeMapper.class, CppNameRules.class, CppTypeInfo.class, CBridgeNameRules.class);
    initMocks(this);

    CType fakeType = mock(CType.class);
    fakeType.includes = new HashSet<>();
    CppTypeInfo typeInfo = new CppTypeInfo(fakeType);

    when(cBridgeNameRules.getStructRefType(any())).thenReturn(STRUCT_REF_NAME);
    when(cBridgeNameRules.getStructBaseName(any())).thenReturn(STRUCT_NAME);
    when(cBridgeNameRules.getBaseApiStructName(any())).thenReturn(STRUCT_BASEAPI_NAME);

    when(CppTypeInfo.createStructTypeInfo(any(), any())).thenReturn(typeInfo);

    when(anInterface.isStatic(any())).thenReturn(true);
    when(cBridgeNameRules.getMethodName(any())).thenReturn(FULL_FUNCTION_NAME);
    when(cBridgeNameRules.getDelegateMethodName(any())).thenReturn(DELEGATE_NAME);

    when(CTypeMapper.mapType(any(), any())).thenReturn(cppTypeInfo);
    when(francaArgument.getName()).thenReturn(PARAM_NAME);
    when(francaMethod.eContainer()).thenReturn(francaTypeCollection);
    when(francaTypeCollection.eContainer()).thenReturn(francaModel);
    when(francaInterface.eContainer()).thenReturn(francaModel);

    modelBuilder = new CModelBuilder(anInterface, cBridgeNameRules, resolver, contextStack);
  }

  @Test
  public void finishBuildingInputArgumentReturnsCreatedParams() {
    modelBuilder.finishBuildingInputArgument(francaArgument);

    List<CParameter> params = getResults(CParameter.class);

    assertEquals(1, params.size());
    assertEquals(francaArgument.getName(), params.get(0).name);
    assertEquals(2, params.get(0).getSignatureParameters().size());
    for (int i = 0; i < 2; i++) {
      CParameter.SimpleParameter param = params.get(0).getSignatureParameters().get(i);
      assertEquals(PARAM_NAME + cppTypeInfo.paramSuffixes.get(i), param.name);
      assertEquals(cppTypeInfo.cTypesNeededByConstructor.get(i), param.type);
    }
  }

  @Test
  public void finishBuildingOutputArgumentReturnsCreatedParam() {
    modelBuilder.finishBuildingOutputArgument(francaArgument);

    List<COutParameter> params = getResults(COutParameter.class);
    assertEquals(1, params.size());
    COutParameter param = params.get(0);

    assertEquals("result", param.name);
    assertSame(cppTypeInfo, param.mappedType);
  }

  @Test
  public void finishBuildingMethodProcessInstanceMethods() {
    when(anInterface.isStatic(any())).thenReturn(false);

    // Insert instance type from startBuilding(FInterface);
    contextStack.getParentContext().currentResults.add(new CClassType(new CppTypeInfo(CType.VOID)));
    modelBuilder.finishBuilding(francaMethod);

    assertEquals(
        "We should be able to process Instance methods.", 1, getResults(CFunction.class).size());
  }

  @Test
  public void finishBuildingCreatesMethodWithoutParams() {
    modelBuilder.finishBuilding(francaMethod);

    List<CFunction> functions = getResults(CFunction.class);
    assertEquals(1, functions.size());
    CFunction function = functions.get(0);
    assertEquals(CType.VOID, function.returnType.functionReturnType);
    assertEquals(0, function.parameters.size());
    assertEquals(FULL_FUNCTION_NAME, function.name);
    assertEquals(DELEGATE_NAME, function.delegateCall);
  }

  @Test
  public void finishBuildingCreatesMethodWithParam() {
    CInParameter param = new CInParameter(PARAM_NAME, new CppTypeInfo(CType.DOUBLE));
    contextStack.injectResult(param);

    modelBuilder.finishBuilding(francaMethod);

    List<CFunction> functions = getResults(CFunction.class);
    assertEquals(1, functions.size());
    CFunction function = functions.get(0);
    assertEquals(CType.VOID, function.returnType.functionReturnType);
    assertEquals(FULL_FUNCTION_NAME, function.name);
    assertEquals(DELEGATE_NAME, function.delegateCall);
    assertEquals(1, function.parameters.size());
    assertSame(param, function.parameters.get(0));
  }

  @Test
  public void finishBuildingCreatesCInterfaceForFInterface() {
    CFunction function = new CFunction.Builder("SomeName").build();
    contextStack.injectResult(function);

    modelBuilder.finishBuilding(francaInterface);

    assertCorrectCInterfaceCreation(function);
  }

  @Test
  public void finishBuildingCreatesCInterfaceForFTypeCollection() {

    CFunction function = new CFunction.Builder("SomeName").build();
    contextStack.injectResult(function);

    modelBuilder.finishBuilding(francaTypeCollection);

    assertCorrectCInterfaceCreation(function);
  }

  private void assertCorrectCInterfaceCreation(CFunction function) {
    List<CInterface> interfaces = getResults(CInterface.class);
    assertEquals(1, interfaces.size());
    CInterface iface = interfaces.get(0);
    assertEquals(1, iface.functions.size());
    assertSame(function, iface.functions.get(0));
  }

  @Test
  public void properIncludesForVoidFunctionNotCallingToBaseApi() {
    CFunction function = new CFunction.Builder("SomeName").build();
    contextStack.injectResult(function);

    modelBuilder.finishBuilding(francaInterface);

    assertCorrectIncludes(0, 1, 0);
  }

  @Test
  public void properIncludesForVoidFunctionCallingToBaseApi() {
    CFunction function =
        new CFunction.Builder("SomeName")
            .delegate("someBaseApiFunc()")
            .delegateCallIncludes(singleton(Include.createInternalInclude("baseApiInclude.h")))
            .build();
    contextStack.injectResult(function);

    modelBuilder.finishBuilding(francaInterface);

    assertCorrectIncludes(0, 2, 0);
  }

  private void assertCorrectIncludes(
      int expectedHederIncludes,
      int expectedImplementationIncludes,
      int expectedPrivateHeaderIncludes) {
    CInterface iface = getResults(CInterface.class).get(0);
    assertEquals(expectedHederIncludes, iface.headerIncludes.size());
    assertEquals(expectedImplementationIncludes, iface.implementationIncludes.size());
    assertEquals(expectedPrivateHeaderIncludes, iface.privateHeaderIncludes.size());
  }

  @Test
  public void finishBuildingStructContainsFields() {
    contextStack.injectResult(new CField("field1", cppTypeInfo));
    contextStack.injectResult(new CField("field2", cppTypeInfo));

    modelBuilder.finishBuilding(francaStruct);

    List<CStruct> structs = getResults(CStruct.class);
    assertEquals(1, structs.size());
    CStruct cStruct = structs.get(0);
    assertEquals("There should be 2 fields in struct", 2, cStruct.fields.size());
    assertEquals("field1", cStruct.fields.get(0).name);
    assertEquals("field2", cStruct.fields.get(1).name);
  }

  public void finishBuildingStructCreatesStructWithProperName() {
    modelBuilder.finishBuilding(francaStruct);

    List<CStruct> structs = getResults(CStruct.class);
    assertEquals(1, structs.size());
    CStruct cStruct = structs.get(0);
    assertEquals(STRUCT_REF_NAME, cStruct.name);
  }

  @Test
  public void finishBuildingInterfaceDoesNotAddStructs() {
    CStruct struct = new CStruct("name", "baseApiName", new CppTypeInfo(CType.VOID));
    contextStack.injectResult(struct);

    modelBuilder.finishBuilding(francaInterface);

    List<CInterface> interfaces = getResults(CInterface.class);
    assertEquals(1, interfaces.size());
    assertEquals(
        "There should be 1 struct typedefs (structRef and function table)",
        1,
        interfaces.get(0).structs.size());
    assertSame(struct, interfaces.get(0).structs.get(0));
  }

  @Test
  public void finishBuildingTypeCollectionContainsStructs() {
    CStruct struct = new CStruct("name", "baseApiName", new CppTypeInfo(CType.VOID));
    contextStack.injectResult(struct);

    modelBuilder.finishBuilding(francaTypeCollection);

    List<CInterface> interfaces = getResults(CInterface.class);
    assertEquals(1, interfaces.size());
    assertEquals(
        "There should be 1 struct typedefs (structRef)", 1, interfaces.get(0).structs.size());
    assertSame(struct, interfaces.get(0).structs.get(0));
  }

  @Test
  public void finishBuildingTypedElementAddsFields() {
    when(francaField.getName()).thenReturn("field");

    modelBuilder.finishBuilding(francaField);

    List<CField> fields = getResults(CField.class);
    assertEquals(1, fields.size());
    assertEquals("field", fields.get(0).name);
  }

  @Test
  public void finishBuildingCreatesCValuesOutOfExpressions() {
    FExpression francaExpression = mock(FExpression.class);
    CValue fakeValue = mock(CValue.class);
    when(CTypeMapper.mapType(any(FExpression.class))).thenReturn(fakeValue);

    modelBuilder.finishBuilding(francaExpression);

    List<CValue> values = getResults(CValue.class);
    assertEquals("Should be on value stored", 1, values.size());
    assertSame(fakeValue, values.get(0));
  }

  @Test
  public void finishBuildingCreatesEnumItemWithoutValue() {
    FEnumerator francaEnumerator = mock(FEnumerator.class);

    modelBuilder.finishBuilding(francaEnumerator);

    List<CEnumItem> enumItems = getResults(CEnumItem.class);
    assertEquals("Should be 1 enum item created", 1, enumItems.size());
    CEnumItem enumItem = enumItems.get(0);
    assertNull("Enum item should have not value set", enumItem.value);
  }

  @Test
  public void finishBuildingCreatesEnumItemWithValue() {
    CValue fakeValue = mock(CValue.class);
    contextStack.injectResult(fakeValue);
    FEnumerator francaEnumerator = mock(FEnumerator.class);

    modelBuilder.finishBuilding(francaEnumerator);

    List<CEnumItem> enumItems = getResults(CEnumItem.class);
    assertEquals("Should be 1 enum item created", 1, enumItems.size());
    CEnumItem enumItem = enumItems.get(0);
    assertSame(fakeValue, enumItem.value);
  }

  @Test
  public void finishBuildingCreatesEnumType() {
    CEnumItem fakeEnumItem = mock(CEnumItem.class);
    contextStack.injectResult(fakeEnumItem);
    FEnumerationType francaEnumerationType = mock(FEnumerationType.class);
    when(CBridgeNameRules.getEnumName(any())).thenReturn("");

    modelBuilder.finishBuilding(francaEnumerationType);

    List<CEnum> enums = getResults(CEnum.class);
    assertEquals("Should be 1 enum created", 1, enums.size());
    CEnum enumType = enums.get(0);
    assertEquals("should be 1 enum item created", 1, enumType.items.size());
    assertSame(
        "Enum item inside enum type should be on injected into model",
        fakeEnumItem,
        enumType.items.get(0));
  }

  private <T extends CElement> List<T> getResults(Class<T> clazz) {
    return CollectionsHelper.getAllOfType(contextStack.getParentContext().previousResults, clazz);
  }
}
