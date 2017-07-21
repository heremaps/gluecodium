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

import static java.util.stream.Collectors.toList;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertSame;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;
import static org.mockito.MockitoAnnotations.initMocks;
import static org.powermock.api.mockito.PowerMockito.mockStatic;

import com.here.ivi.api.common.CollectionsHelper;
import com.here.ivi.api.generator.common.cpp.CppNameRules;
import com.here.ivi.api.model.cmodel.*;
import com.here.ivi.api.model.franca.Interface;
import com.here.ivi.api.test.MockContextStack;
import java.util.List;
import java.util.Objects;
import navigation.BaseApiSpec.InterfacePropertyAccessor;
import org.franca.core.franca.*;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
@PrepareForTest({CTypeMapper.class, CppNameRules.class})
public class CModelBuilderTest {

  private static final String FULL_FUNCTION_NAME = "FULL_FUNCTION_NAME";
  private static final String DELEGATE_NAME = "DELEGATE_NAME";
  private static final String PARAM_NAME = "inputParam";

  private MockContextStack<CElement> contextStack = new MockContextStack<>();

  @Mock private CBridgeNameRules cBridgeNameRules;
  @Mock private Interface<InterfacePropertyAccessor> anInterface;
  @Mock private InterfacePropertyAccessor propertyAccessor;
  @Mock private FInterface francaInterface;
  @Mock private FMethod francaMethod;
  @Mock private FArgument francaArgument;
  @Mock private FStructType francaStruct;
  @Mock private FTypedElement francaTypedElement;
  private CppTypeInfo cppTypeInfo = CppTypeInfo.BYTE_VECTOR;
  private CModelBuilder modelBuilder;

  @Before
  public void setUp() {
    mockStatic(CTypeMapper.class, CppNameRules.class);
    initMocks(this);

    when(anInterface.getPropertyAccessor()).thenReturn(propertyAccessor);
    when(propertyAccessor.getStatic(any())).thenReturn(true);
    when(cBridgeNameRules.getMethodName(any(), any())).thenReturn(FULL_FUNCTION_NAME);
    when(cBridgeNameRules.getDelegateMethodName(any(), any())).thenReturn(DELEGATE_NAME);

    when(CTypeMapper.mapType(any())).thenReturn(cppTypeInfo);
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
        params.stream().map(param -> param.conversion).filter(Objects::nonNull).collect(toList());
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
  public void createFourFunctionsForReturningString() {
    COutParameter returnVal = new COutParameter("result", CppTypeInfo.STRING);
    contextStack.injectResult(returnVal);

    modelBuilder.finishBuilding(francaMethod);

    List<CFunction> functions = getResults(CFunction.class);
    assertEquals(4, functions.size());
    assertEquals(FULL_FUNCTION_NAME, functions.get(0).name);
    assertEquals(FULL_FUNCTION_NAME + "_release", functions.get(1).name);
    assertEquals(FULL_FUNCTION_NAME + "_getData", functions.get(2).name);
    assertEquals(FULL_FUNCTION_NAME + "_getSize", functions.get(3).name);
  }

  @Test
  public void createFourFunctionsForReturningByteBuffer() {
    COutParameter returnVal = new COutParameter("result", CppTypeInfo.BYTE_VECTOR);
    contextStack.injectResult(returnVal);

    modelBuilder.finishBuilding(francaMethod);

    List<CFunction> functions = getResults(CFunction.class);
    assertEquals(4, functions.size());
    assertEquals(FULL_FUNCTION_NAME, functions.get(0).name);
    assertEquals(FULL_FUNCTION_NAME + "_release", functions.get(1).name);
    assertEquals(FULL_FUNCTION_NAME + "_getData", functions.get(2).name);
    assertEquals(FULL_FUNCTION_NAME + "_getSize", functions.get(3).name);
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
    contextStack.injectResult(new CField("field1"));
    contextStack.injectResult(new CField("field2"));

    modelBuilder.finishBuilding(francaStruct);

    List<CStruct> structs = getResults(CStruct.class);
    assertEquals(1, structs.size());
    CStruct cStruct = structs.get(0);
    assertEquals(2, cStruct.fields.size());
    assertEquals("field1", cStruct.fields.get(0).name);
    assertEquals("field2", cStruct.fields.get(1).name);
  }

  @Test
  public void finishBuildingStructCreatesStructWithProperName() {
    when(cBridgeNameRules.getHandleName(any(), any())).thenReturn("StructNameRef");
    modelBuilder.finishBuilding(francaStruct);

    List<CStruct> structs = getResults(CStruct.class);
    assertEquals(1, structs.size());
    CStruct cStruct = structs.get(0);
    assertEquals("StructNameRef", cStruct.name);
  }

  @Test
  public void finishBuildingInterfaceContainsStructs() {
    contextStack.injectResult(new CStruct("structor"));

    modelBuilder.finishBuilding(francaInterface);

    List<CInterface> interfaces = getResults(CInterface.class);
    assertEquals(1, interfaces.size());
    assertEquals(1, interfaces.get(0).structs.size());
    assertEquals("structor", interfaces.get(0).structs.get(0).name);
  }

  @Test
  public void finishBuildingTypedElementAddsFields() {

    when(francaTypedElement.getName()).thenReturn("field");
    modelBuilder.finishBuilding(francaTypedElement);

    List<CField> fields = getResults(CField.class);
    assertEquals(1, fields.size());
    assertEquals("field", fields.get(0).name);
  }

  private <T extends CElement> List<T> getResults(Class<T> clazz) {
    return CollectionsHelper.getAllOfType(contextStack.getParentContext().previousResults, clazz);
  }
}
