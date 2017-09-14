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
import com.here.ivi.api.generator.cbridge.CppTypeInfo.TypeCategory;
import com.here.ivi.api.generator.cpp.CppNameRules;
import com.here.ivi.api.model.cmodel.*;
import com.here.ivi.api.model.common.Include;
import com.here.ivi.api.model.franca.Interface;
import com.here.ivi.api.test.MockContextStack;
import java.util.HashSet;
import java.util.List;
import java.util.Objects;
import java.util.StringJoiner;
import java.util.stream.Collectors;
import org.franca.core.franca.*;
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
  private static final String STRUCT_NAME = "SomeStruct";
  private static final String STRUCT_REF_NAME = STRUCT_NAME + "Ref";
  private static final String STRUCT_BASEAPI_NAME = "BaseAPI::" + STRUCT_NAME;
  private static final String FIELD_GETTER_FUNCTION_NAME =
      new StringJoiner("_").add(STRUCT_NAME).add(FIELD_NAME).add("get").toString();
  private static final String FIELD_SETTER_FUNCTION_NAME =
      new StringJoiner("_").add(STRUCT_NAME).add(FIELD_NAME).add("set").toString();
  private static final String STRUCT_CREATE_FUNCTION_NAME =
      new StringJoiner("_").add(STRUCT_NAME).add("create").toString();
  private static final String STRUCT_RELEASE_FUNCTION_NAME =
      new StringJoiner("_").add(STRUCT_NAME).add("release").toString();

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

  private CppTypeInfo typeInfo;

  private final CppTypeInfo cppTypeInfo = CppTypeInfo.BYTE_VECTOR;
  private CModelBuilder modelBuilder;

  @Before
  public void setUp() {
    mockStatic(CTypeMapper.class, CppNameRules.class, CppTypeInfo.class);
    initMocks(this);

    CType fakeType = mock(CType.class);
    fakeType.includes = new HashSet<>();
    typeInfo = new CppTypeInfo(fakeType);
    typeInfo.returnValueConstrExpr = "";

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
  public void finishBuildingMethodProcessInstanceMethods() {
    when(anInterface.isStatic(any())).thenReturn(false);

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
            .delegateCallTemplate("someBaseApiFunc()")
            .delegateCallIncludes(singleton(Include.createInternalInclude("baseApiInclude.h")))
            .build();
    contextStack.injectResult(function);

    modelBuilder.finishBuilding(francaInterface);

    assertCorrectIncludes(0, 2, 0);
  }

  @Test
  public void properIncludesForPrivateFunctionRequiringSomeIncludes() {
    CFunction function =
        new CFunction.Builder("PrivFunction")
            .delegateCallTemplate("someCallInPrivFunc()")
            .delegateCallIncludes(
                singleton(Include.createInternalInclude("fancyIncludeForPrivFunction.h")))
            .markAsInternalOnly()
            .build();
    contextStack.injectResult(function);

    modelBuilder.finishBuilding(francaInterface);

    assertCorrectIncludes(0, 1, 1);
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

    List<CStructTypedef> structs = getResults(CStructTypedef.class);
    assertEquals(1, structs.size());
    CStructTypedef cStruct = structs.get(0);
    assertEquals("There should be 1 field in struct - private pointer", 1, cStruct.fields.size());
    assertEquals("private_pointer", cStruct.fields.get(0).name);
  }

  @Test
  public void finishBuildingStructContainsFunctionsForStructAndField() {
    contextStack.injectResult(new CField(FIELD_NAME, cppTypeInfo));

    modelBuilder.finishBuilding(francaStruct);

    List<CStructTypedef> structs = getResults(CStructTypedef.class);
    assertEquals(1, structs.size());
    List<CFunction> functions = getResults(CFunction.class);
    assertEquals(
        "Should be get_pointer, get, set, create and release functions", 5, functions.size());
    CFunction func = getFunction(functions, FIELD_GETTER_FUNCTION_NAME);
    assertNotEquals("Field getter function should be generated", null, func);
    assertEquals("Getter should take in 1 param", 1, func.parameters.size());

    CFunction getPointerFunc = getFunction(functions, "get_pointer");
    assertNotEquals("get_pointer function should be generated", null, getPointerFunc);
    assertTrue("get_pointer should be flagged as private", getPointerFunc.internalOnlyFunction);

    assertNotNull(
        "Field setter function should be generated",
        getFunction(functions, FIELD_SETTER_FUNCTION_NAME));
    assertNotNull(
        "Struct release function should be generated",
        getFunction(functions, STRUCT_CREATE_FUNCTION_NAME));
    assertNotNull(
        "Struct create function should be generated",
        getFunction(functions, STRUCT_RELEASE_FUNCTION_NAME));
  }

  @Test
  public void finishBuildingStructDoesNotCreateFieldSetterForNestedStruct() {
    typeInfo.typeCategory = TypeCategory.STRUCT;
    contextStack.injectResult(new CField(FIELD_NAME, typeInfo));

    modelBuilder.finishBuilding(francaStruct);

    List<CStructTypedef> structs = getResults(CStructTypedef.class);
    assertEquals(1, structs.size());
    CStructTypedef cStruct = structs.get(0);
    assertEquals(1, cStruct.fields.size());
    CField field = cStruct.fields.get(0);
    assertEquals("private_pointer", field.name);
    List<CFunction> functions = getResults(CFunction.class);
    assertEquals("Should be get_pointer, get, create and release function", 4, functions.size());
    CFunction func = getFunction(functions, FIELD_GETTER_FUNCTION_NAME);
    assertNotNull("Field getter function should be generated", func);
    assertEquals("Getter should take in 1 param", 1, func.parameters.size());
    assertNull(
        "Field setter function should not be generated",
        getFunction(functions, FIELD_SETTER_FUNCTION_NAME));
    assertNotNull(
        "Struct release function should be generated",
        getFunction(functions, STRUCT_RELEASE_FUNCTION_NAME));
    assertNotNull(
        "Struct create function should be generated",
        getFunction(functions, STRUCT_CREATE_FUNCTION_NAME));
  }

  @Test
  public void finishBuildingStructCreatesGetterFunctionWithCorrectPropertiesForBasicType() {
    CType fakeType = mock(CType.class);
    fakeType.includes = new HashSet<>();
    typeInfo = new CppTypeInfo(fakeType);
    contextStack.injectResult(new CField(FIELD_NAME, typeInfo));

    modelBuilder.finishBuilding(francaStruct);

    CFunction func = getFunction(getResults(CFunction.class), FIELD_GETTER_FUNCTION_NAME);
    assertSame(fakeType, func.returnType);
    assertEquals(1, func.parameters.size());
    assertTrue(
        "parameter should be of type Struct", func.parameters.get(0).type instanceof CStruct);
    assertEquals(
        "parameter name should be as structRef type name",
        STRUCT_REF_NAME,
        func.parameters.get(0).type.name);
    assertEquals("get_pointer(cpp_handle)->FIELD1", func.delegateCall);
  }

  @Test
  public void finishBuildingStructCreatesGetterFunctionWithCorrectPropertiesForComplexType() {
    CType fakeType = mock(CType.class);
    when(fakeType.toString()).thenReturn("FakeType");
    fakeType.includes = new HashSet<>();
    typeInfo = new CppTypeInfo(fakeType, TypeCategory.STRUCT);
    contextStack.injectResult(new CField(FIELD_NAME, typeInfo));

    modelBuilder.finishBuilding(francaStruct);

    CFunction func = getFunction(getResults(CFunction.class), FIELD_GETTER_FUNCTION_NAME);
    assertSame(fakeType, func.returnType);
    assertEquals(1, func.parameters.size());
    assertTrue(
        "parameter should be of type Struct", func.parameters.get(0).type instanceof CStruct);
    assertEquals(
        "parameter name should be as structRef type name",
        STRUCT_REF_NAME,
        func.parameters.get(0).type.name);
    assertEquals("FakeType{&get_pointer(cpp_handle)->FIELD1}", func.delegateCall);
  }

  @Test
  public void finishBuildingStructCreatesSetterFunctionWithCorrectProperties() {
    CType fakeType = mock(CType.class);
    fakeType.includes = new HashSet<>();
    typeInfo = new CppTypeInfo(fakeType);
    contextStack.injectResult(new CField(FIELD_NAME, typeInfo));

    modelBuilder.finishBuilding(francaStruct);

    CFunction func = getFunction(getResults(CFunction.class), FIELD_SETTER_FUNCTION_NAME);
    assertEquals(CType.VOID, func.returnType);
    assertEquals("There should be 2 parameters for set function", 2, func.parameters.size());
    assertTrue(
        "1. parameter should be of type Struct", func.parameters.get(0).type instanceof CStruct);
    assertEquals(
        "1. parameter name should be as structRef type name",
        STRUCT_REF_NAME,
        func.parameters.get(0).type.name);
    assertEquals(fakeType, func.parameters.get(1).type);
  }

  @Test
  public void finishBuildingStructCreatesStructWithProperName() {
    modelBuilder.finishBuilding(francaStruct);

    List<CStructTypedef> structs = getResults(CStructTypedef.class);
    assertEquals(1, structs.size());
    CStructTypedef cStruct = structs.get(0);
    assertEquals(STRUCT_REF_NAME, cStruct.name);
  }

  @Test
  public void finishBuildingInterfaceContainsStructs() {
    CStructTypedef struct = mock(CStructTypedef.class);
    contextStack.injectResult(struct);

    modelBuilder.finishBuilding(francaInterface);

    List<CInterface> interfaces = getResults(CInterface.class);
    assertEquals(1, interfaces.size());
    assertEquals(
        "There should be 2 struct typedefs (structRef and function table)",
        2,
        interfaces.get(0).structs.size());
    assertSame(struct, interfaces.get(0).structs.get(0));
  }

  @Test
  public void finishBuildingTypeCollectionContainsStructs() {
    CStruct struct = mock(CStruct.class);
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
