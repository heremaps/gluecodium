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

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertSame;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;
import static org.mockito.MockitoAnnotations.initMocks;
import static org.powermock.api.mockito.PowerMockito.mockStatic;

import com.here.ivi.api.common.CollectionsHelper;
import com.here.ivi.api.generator.common.cpp.CppNameRules;
import com.here.ivi.api.model.cmodel.CElement;
import com.here.ivi.api.model.cmodel.CField;
import com.here.ivi.api.model.cmodel.CFunction;
import com.here.ivi.api.model.cmodel.CInParameter;
import com.here.ivi.api.model.cmodel.CInterface;
import com.here.ivi.api.model.cmodel.COutParameter;
import com.here.ivi.api.model.cmodel.CParameter;
import com.here.ivi.api.model.cmodel.CStruct;
import com.here.ivi.api.model.cmodel.CType;
import com.here.ivi.api.model.franca.Interface;
import com.here.ivi.api.test.MockContextStack;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;
import navigation.BaseApiSpec.InterfacePropertyAccessor;
import org.franca.core.franca.FArgument;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FMethod;
import org.franca.core.franca.FStructType;
import org.franca.core.franca.FTypedElement;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
@PrepareForTest({CTypeMapper.class, CppNameRules.class, CppTypeInfo.class})
public class CModelBuilderTest {

  private static final String FULL_FUNCTION_NAME = "FULL_FUNCTION_NAME";
  private static final String DELEGATE_NAME = "DELEGATE_NAME";
  private static final String PARAM_NAME = "inputParam";
  private static final String FIELD_NAME = "FIELD1";

  private final MockContextStack<CElement> contextStack = new MockContextStack<>();

  @Mock private CBridgeNameRules cBridgeNameRules;
  @Mock private Interface<InterfacePropertyAccessor> anInterface;
  @Mock private InterfacePropertyAccessor propertyAccessor;
  @Mock private FInterface francaInterface;
  @Mock private FMethod francaMethod;
  @Mock private FArgument francaArgument;
  @Mock private FStructType francaStruct;
  @Mock private FTypedElement francaTypedElement;

  @Mock private CppTypeInfo mockedTypeInfo;

  private final CppTypeInfo cppTypeInfo = CppTypeInfo.BYTE_VECTOR;
  private CModelBuilder modelBuilder;

  @Before
  public void setUp() {
    mockStatic(CTypeMapper.class, CppNameRules.class, CppTypeInfo.class);
    CType fakeType = mock(CType.class);
    fakeType.includes = new HashSet<>();
    mockedTypeInfo = new CppTypeInfo(fakeType);
    initMocks(this);
    mockedTypeInfo.baseTypeIncludes = Collections.emptyList();
    mockedTypeInfo.returnValueConstrExpr = "";
    when(CppTypeInfo.createStructTypeInfo(any(), any())).thenReturn(mockedTypeInfo);

    when(anInterface.getPropertyAccessor()).thenReturn(propertyAccessor);
    when(propertyAccessor.getStatic(any())).thenReturn(true);
    when(cBridgeNameRules.getMethodName(any(), any())).thenReturn(FULL_FUNCTION_NAME);
    when(cBridgeNameRules.getDelegateMethodName(any(), any())).thenReturn(DELEGATE_NAME);

    when(CTypeMapper.mapType(any(), any())).thenReturn(cppTypeInfo);
    when(francaArgument.getName()).thenReturn(PARAM_NAME);

    modelBuilder = new CModelBuilder(anInterface, cBridgeNameRules, contextStack);
  }

  @Test
  public void finishBuildingInputArgumentReturnsCreatedParams() {
    modelBuilder.finishBuildingInputArgument(francaArgument);

    List<CParameter> params = getResults(CParameter.class);

    assertEquals(2, params.size());
    for (int i = 0; i < 2; i++) {
      CParameter param = params.get(i);
      assertEquals(PARAM_NAME + cppTypeInfo.paramSuffixes.get(i), param.name);
      assertEquals(cppTypeInfo.cTypesNeededByConstructor.get(i), param.type);
    }
    List<TypeConverter.TypeConversion> conversions =
        params
            .stream()
            .map(param -> param.conversion)
            .filter(Objects::nonNull)
            .collect(Collectors.toList());
    assertFalse(conversions.isEmpty());
  }

  @Test
  public void finishBuildingOutputArgumentReturnsCreatedParam() {
    modelBuilder.finishBuildingOutputArgument(francaArgument);

    List<COutParameter> params = getResults(COutParameter.class);
    assertEquals(1, params.size());
    COutParameter param = params.get(0);

    assertEquals("result", param.name);
    assertSame(cppTypeInfo, param.mappedType);
    assertEquals(cppTypeInfo.functionReturnType, param.type);
    assertNotNull(param.conversion);
  }

  @Test
  public void finishBuildingMethodProcessesOnlyStaticMethods() {
    when(propertyAccessor.getStatic(any())).thenReturn(false);

    modelBuilder.finishBuilding(francaMethod);

    assertEquals(0, getResults(CFunction.class).size());
  }

  @Test
  public void finishBuildingCreatesMethodWithoutParams() {
    modelBuilder.finishBuilding(francaMethod);

    List<CFunction> functions = getResults(CFunction.class);
    assertEquals(1, functions.size());
    CFunction function = functions.get(0);
    assertEquals(CType.VOID, function.returnType);
    assertEquals(0, function.parameters.size());
    assertEquals(FULL_FUNCTION_NAME, function.name);
    assertEquals(DELEGATE_NAME + "()", function.delegateCall);
  }

  @Test
  public void finishBuildingCreatesMethodWithParam() {
    CInParameter param = new CInParameter(PARAM_NAME, CType.DOUBLE);
    param.conversion = TypeConverter.identity(param);
    contextStack.injectResult(param);

    modelBuilder.finishBuilding(francaMethod);

    List<CFunction> functions = getResults(CFunction.class);
    assertEquals(1, functions.size());
    CFunction function = functions.get(0);
    assertEquals(CType.VOID, function.returnType);
    assertEquals(FULL_FUNCTION_NAME, function.name);
    assertEquals(DELEGATE_NAME + "(cpp_inputParam)", function.delegateCall);
    assertEquals(1, function.parameters.size());
    assertSame(param, function.parameters.get(0));
  }

  @Test
  public void conversionsAreCreatedForParamsWhenNonParamHasOne() {
    contextStack.injectResult(new CInParameter(PARAM_NAME, CType.DOUBLE));
    contextStack.injectResult(new CInParameter(PARAM_NAME + "2", CType.BOOL));

    modelBuilder.finishBuilding(francaMethod);

    List<CFunction> functions = getResults(CFunction.class);
    assertEquals(1, functions.size());
    CFunction function = functions.get(0);
    assertEquals(2, function.parameters.size());
    assertEquals(2, function.conversions.size());
  }

  @Test
  public void createdConversionsArePresentInDelegateCall() {
    contextStack.injectResult(new CInParameter(PARAM_NAME, CType.DOUBLE));
    contextStack.injectResult(new CInParameter(PARAM_NAME + "2", CType.BOOL));

    modelBuilder.finishBuilding(francaMethod);

    List<CFunction> functions = getResults(CFunction.class);
    assertEquals(1, functions.size());
    CFunction function = functions.get(0);
    assertEquals(DELEGATE_NAME + "(cpp_inputParam, cpp_inputParam2)", function.delegateCall);
  }

  @Test
  public void finishBuildingCreatesInterface() {
    CFunction function = new CFunction.Builder("SomeName").build();
    contextStack.injectResult(function);

    modelBuilder.finishBuilding(francaInterface);

    List<CInterface> interfaces = getResults(CInterface.class);
    assertEquals(1, interfaces.size());
    CInterface iface = interfaces.get(0);
    assertEquals(1, iface.functions.size());
    assertSame(function, iface.functions.get(0));
    assertEquals(0, iface.headerIncludes.size());
    assertEquals(2, iface.implementationIncludes.size());
  }

  @Test
  public void finishBuildingStructContainsFields() {
    contextStack.injectResult(new CField("field1", cppTypeInfo));
    contextStack.injectResult(new CField("field2", cppTypeInfo));

    modelBuilder.finishBuilding(francaStruct);

    List<CStruct> structs = getResults(CStruct.class);
    assertEquals(1, structs.size());
    CStruct cStruct = structs.get(0);
    assertEquals(2, cStruct.fields.size());
    assertEquals("field1", cStruct.fields.get(0).name);
    assertEquals("field2", cStruct.fields.get(1).name);
  }

  @Test
  public void finishBuildingStructContainsFunctionsForStructAndField() {
    contextStack.injectResult(new CField(FIELD_NAME, cppTypeInfo));

    modelBuilder.finishBuilding(francaStruct);

    List<CStruct> structs = getResults(CStruct.class);
    assertEquals(1, structs.size());
    CStruct cStruct = structs.get(0);
    assertEquals(1, cStruct.fields.size());
    CField field = cStruct.fields.get(0);
    assertEquals(FIELD_NAME, field.name);
    List<CFunction> functions = getResults(CFunction.class);
    assertEquals(
        "Should be get_pointer, get, set, create and release functions", 5, functions.size());
    CFunction func = getFunction(functions, cStruct.getNameOfFieldGetter(FIELD_NAME));
    assertNotEquals("Field getter function should be generated", null, func);
    assertEquals("Getter should take in 1 param", 1, func.parameters.size());
    assertNotEquals(
        "get_oointer function should be generated", null, getFunction(functions, "get_pointer"));
    assertNotEquals(
        "Field setter function should be generated",
        null,
        getFunction(functions, cStruct.getNameOfFieldSetter(FIELD_NAME)));
    assertNotEquals(
        "Struct release function should be generated",
        null,
        getFunction(functions, cStruct.releaseFunctionName));
    assertNotEquals(
        "Struct create function should be generated",
        null,
        getFunction(functions, cStruct.createFunctionName));
  }

  @Test
  public void finishBuildingStructDoesNotCreateFieldSetterForNestedStruct() {
    mockedTypeInfo.typeCategory = CppTypeInfo.TypeCategory.STRUCT;
    contextStack.injectResult(new CField(FIELD_NAME, mockedTypeInfo));

    modelBuilder.finishBuilding(francaStruct);

    List<CStruct> structs = getResults(CStruct.class);
    assertEquals(1, structs.size());
    CStruct cStruct = structs.get(0);
    assertEquals(1, cStruct.fields.size());
    CField field = cStruct.fields.get(0);
    assertEquals(FIELD_NAME, field.name);
    List<CFunction> functions = getResults(CFunction.class);
    assertEquals("Should be get_pointer, get, create and release function", 4, functions.size());
    CFunction func = getFunction(functions, cStruct.getNameOfFieldGetter(FIELD_NAME));
    assertNotEquals("Field getter function should be generated", null, func);
    assertEquals("Getter should take in 1 param", 1, func.parameters.size());
    assertEquals(
        "Field setter function should not be generated",
        null,
        getFunction(functions, cStruct.getNameOfFieldSetter(FIELD_NAME)));
    assertNotEquals(
        "Struct release function should be generated",
        null,
        getFunction(functions, cStruct.releaseFunctionName));
    assertNotEquals(
        "Struct create function should be generated",
        null,
        getFunction(functions, cStruct.createFunctionName));
  }

  @Test
  public void finishBuildingStructCreatesGetterFunctionWithCorrectProperties() {
    CType fakeType = mock(CType.class);
    fakeType.includes = new HashSet<>();
    mockedTypeInfo = new CppTypeInfo(fakeType);
    contextStack.injectResult(new CField(FIELD_NAME, mockedTypeInfo));

    modelBuilder.finishBuilding(francaStruct);

    CStruct cStruct = getResults(CStruct.class).get(0);
    CFunction func =
        getFunction(getResults(CFunction.class), cStruct.getNameOfFieldGetter(FIELD_NAME));
    assertSame(fakeType, func.returnType);
    assertEquals(1, func.parameters.size());
    assertEquals(cStruct, func.parameters.get(0).type);
  }

  @Test
  public void finishBuildingStructCreatesSetterFunctionWithCorrectProperties() {
    CType fakeType = mock(CType.class);
    fakeType.includes = new HashSet<>();
    mockedTypeInfo = new CppTypeInfo(fakeType);
    contextStack.injectResult(new CField(FIELD_NAME, mockedTypeInfo));

    modelBuilder.finishBuilding(francaStruct);

    CStruct cStruct = getResults(CStruct.class).get(0);
    CFunction func =
        getFunction(getResults(CFunction.class), cStruct.getNameOfFieldSetter(FIELD_NAME));
    assertEquals(CType.VOID, func.returnType);
    assertEquals(2, func.parameters.size());
    assertEquals(cStruct, func.parameters.get(0).type);
    assertEquals(fakeType, func.parameters.get(1).type);
  }

  @Test
  public void finishBuildingStructCreatesStructWithProperName() {
    when(cBridgeNameRules.getStructRefType(any(), any())).thenReturn("StructNameRef");
    when(cBridgeNameRules.getStructBaseName(any(), any())).thenReturn("StructName");
    when(cBridgeNameRules.getBaseApiStructName(any(), any())).thenReturn("BaseAPIStructName");

    modelBuilder.finishBuilding(francaStruct);

    List<CStruct> structs = getResults(CStruct.class);
    assertEquals(1, structs.size());
    CStruct cStruct = structs.get(0);
    assertEquals("StructNameRef", cStruct.name);
    assertEquals("BaseAPIStructName", cStruct.baseApiName);
    assertEquals("StructName_create", cStruct.createFunctionName);
    assertEquals("StructName_release", cStruct.releaseFunctionName);
  }

  @Test
  public void finishBuildingInterfaceContainsStructs() {
    CStruct struct = mock(CStruct.class);
    contextStack.injectResult(struct);

    modelBuilder.finishBuilding(francaInterface);

    List<CInterface> interfaces = getResults(CInterface.class);
    assertEquals(1, interfaces.size());
    assertEquals(1, interfaces.get(0).structs.size());
    assertSame(struct, interfaces.get(0).structs.get(0));
  }

  @Test
  public void finishBuildingTypedElementAddsFields() {

    when(francaTypedElement.getName()).thenReturn("field");
    modelBuilder.finishBuilding(francaTypedElement);

    List<CField> fields = getResults(CField.class);
    assertEquals(1, fields.size());
    assertEquals("field", fields.get(0).name);
  }

  private CFunction getFunction(List<CFunction> functions, String functionName) {
    for (CFunction function : functions) {
      if (function.name.equals(functionName)) {
        return function;
      }
    }
    return null;
  }

  private <T extends CElement> List<T> getResults(Class<T> clazz) {
    return CollectionsHelper.getAllOfType(contextStack.getParentContext().previousResults, clazz);
  }
}
