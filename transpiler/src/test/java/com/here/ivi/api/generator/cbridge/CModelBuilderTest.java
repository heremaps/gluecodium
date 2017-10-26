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

import static java.util.Arrays.asList;
import static java.util.Collections.singleton;
import static java.util.Collections.singletonList;
import static org.junit.Assert.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;
import static org.mockito.MockitoAnnotations.initMocks;
import static org.powermock.api.mockito.PowerMockito.mockStatic;

import com.here.ivi.api.common.CollectionsHelper;
import com.here.ivi.api.generator.cpp.CppModelBuilder;
import com.here.ivi.api.generator.cpp.CppNameRules;
import com.here.ivi.api.generator.swift.SwiftModelBuilder;
import com.here.ivi.api.generator.swift.SwiftNameRules;
import com.here.ivi.api.model.cmodel.*;
import com.here.ivi.api.model.cmodel.CElement;
import com.here.ivi.api.model.cmodel.CEnum;
import com.here.ivi.api.model.cmodel.CField;
import com.here.ivi.api.model.cmodel.CFunction;
import com.here.ivi.api.model.cmodel.CInParameter;
import com.here.ivi.api.model.cmodel.CInterface;
import com.here.ivi.api.model.cmodel.COutParameter;
import com.here.ivi.api.model.cmodel.CParameter;
import com.here.ivi.api.model.cmodel.CStruct;
import com.here.ivi.api.model.cmodel.CType;
import com.here.ivi.api.model.cmodel.IncludeResolver;
import com.here.ivi.api.model.common.Include;
import com.here.ivi.api.model.cppmodel.CppElement;
import com.here.ivi.api.model.cppmodel.CppField;
import com.here.ivi.api.model.cppmodel.CppMethod;
import com.here.ivi.api.model.franca.Interface;
import com.here.ivi.api.model.swift.SwiftField;
import com.here.ivi.api.model.swift.SwiftProperty;
import com.here.ivi.api.model.swift.SwiftType;
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
@PrepareForTest({
  CTypeMapper.class,
  CppNameRules.class,
  CppTypeInfo.class,
  CBridgeNameRules.class,
  SwiftNameRules.class
})
@SuppressWarnings("PMD.TooManyFields")
public class CModelBuilderTest {

  private static final String FULL_FUNCTION_NAME = "FULL_FUNCTION_NAME";
  private static final String DELEGATE_NAME = "DELEGATE_NAME";
  private static final String PARAM_NAME = "inputParam";
  private static final String STRUCT_NAME = "SomeStruct";
  private static final String STRUCT_REF_NAME = STRUCT_NAME + "Ref";
  private static final String STRUCT_BASEAPI_NAME = "BaseAPI::" + STRUCT_NAME;
  private static final String ATTRIBUTE_NAME = "someAttributeName";
  private static final String CBRIDGE_ATTR_GETTER_NAME = "C_ATTR_GETTER";
  private static final String CBRIDGE_ATTR_SETTER_NAME = "C_ATTR_SETTER";
  private static final String CPP_ATTR_GETTER_NAME = "CPP_ATTR_GETTER";
  private static final String CPP_ATTR_SETTER_NAME = "CPP_ATTR_SETTER";
  public static final String CPP_FIELD_NAME = "CppFieldName";
  public static final String SWIFT_FIELD_NAME = "SwiftFieldName";

  private final MockContextStack<CElement> contextStack = new MockContextStack<>();

  @Mock private CppModelBuilder cppModelbuilder;
  @Mock private SwiftModelBuilder swiftModelbuilder;
  @Mock private IncludeResolver resolver;
  @Mock private Interface anInterface;
  @Mock private FInterface francaInterface;
  @Mock private FMethod francaMethod;
  @Mock private FArgument francaArgument;
  @Mock private FStructType francaStruct;
  @Mock private FField francaField;
  @Mock private FTypeCollection francaTypeCollection;
  @Mock private FModel francaModel;
  @Mock private FAttribute francaAttribute;
  @Mock private FTypeRef francaTypeRef;

  private final CppTypeInfo cppTypeInfo = CppTypeInfo.BYTE_VECTOR;
  private CModelBuilder modelBuilder;

  @Before
  public void setUp() {
    mockStatic(
        CTypeMapper.class,
        CppNameRules.class,
        CppTypeInfo.class,
        CBridgeNameRules.class,
        SwiftNameRules.class);
    initMocks(this);

    CType fakeType = mock(CType.class);
    fakeType.includes = new HashSet<>();
    CppTypeInfo typeInfo = new CppTypeInfo(fakeType);

    when(CBridgeNameRules.getStructRefType(any())).thenReturn(STRUCT_REF_NAME);
    when(CBridgeNameRules.getStructBaseName(any())).thenReturn(STRUCT_NAME);
    when(CBridgeNameRules.getBaseApiStructName(any())).thenReturn(STRUCT_BASEAPI_NAME);

    when(CppTypeInfo.createCustomTypeInfo(any(), any())).thenReturn(typeInfo);

    when(anInterface.isStatic(any())).thenReturn(true);
    when(CBridgeNameRules.getMethodName(any())).thenReturn(FULL_FUNCTION_NAME);
    when(CBridgeNameRules.getDelegateMethodName(any())).thenReturn(DELEGATE_NAME);

    when(francaArgument.getName()).thenReturn(PARAM_NAME);
    when(francaMethod.eContainer()).thenReturn(francaTypeCollection);
    when(francaTypeCollection.eContainer()).thenReturn(francaModel);
    when(francaInterface.eContainer()).thenReturn(francaModel);

    when(francaAttribute.eContainer()).thenReturn(francaInterface);
    when(francaAttribute.getName()).thenReturn(ATTRIBUTE_NAME);

    modelBuilder =
        new CModelBuilder(contextStack, anInterface, resolver, cppModelbuilder, swiftModelbuilder);
  }

  @Test
  public void finishBuildingInputArgumentReturnsCreatedParams() {
    contextStack.injectResult(cppTypeInfo);

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
    contextStack.injectResult(cppTypeInfo);

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
    CFunction function = CFunction.builder("SomeName").build();
    contextStack.injectResult(function);

    modelBuilder.finishBuilding(francaInterface);

    assertCorrectCInterfaceCreation(function);
  }

  @Test
  public void finishBuildingCreatesCInterfaceForFTypeCollection() {

    CFunction function = CFunction.builder("SomeName").build();
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
    CFunction function = CFunction.builder("SomeName").build();
    contextStack.injectResult(function);

    modelBuilder.finishBuilding(francaInterface);

    assertCorrectIncludes(0, 1, 0);
  }

  @Test
  public void properIncludesForVoidFunctionCallingToBaseApi() {
    CFunction function =
        CFunction.builder("SomeName")
            .delegateCall("someBaseApiFunc()")
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
    contextStack.injectResult(new CField("SwiftName1", "CppName1", cppTypeInfo));
    contextStack.injectResult(new CField("SwiftName2", "CppName2", cppTypeInfo));

    modelBuilder.finishBuilding(francaStruct);

    List<CStruct> structs = getResults(CStruct.class);
    assertEquals(1, structs.size());
    CStruct cStruct = structs.get(0);
    assertEquals("There should be 2 fields in struct", 2, cStruct.fields.size());
    assertEquals("SwiftName1", cStruct.fields.get(0).name);
    assertEquals("CppName1", cStruct.fields.get(0).baseLayerName);
    assertEquals("SwiftName2", cStruct.fields.get(1).name);
    assertEquals("CppName2", cStruct.fields.get(1).baseLayerName);
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
  public void finishBuildingFrancaFieldReadsName() {
    when(cppModelbuilder.getFinalResult(any())).thenReturn(new CppField(null, CPP_FIELD_NAME));
    when(swiftModelbuilder.getFinalResult(any()))
        .thenReturn(new SwiftField(SWIFT_FIELD_NAME, null));

    modelBuilder.finishBuilding(francaField);

    List<CField> fields = getResults(CField.class);
    assertEquals(1, fields.size());
    assertEquals(SWIFT_FIELD_NAME, fields.get(0).name);
    assertEquals(CPP_FIELD_NAME, fields.get(0).baseLayerName);
  }

  @Test
  public void finishBuildingFrancaFieldReadsTypeInfo() {
    when(cppModelbuilder.getFinalResult(any())).thenReturn(new CppField(null, CPP_FIELD_NAME));
    when(swiftModelbuilder.getFinalResult(any()))
        .thenReturn(new SwiftField(SWIFT_FIELD_NAME, null));
    contextStack.injectResult(cppTypeInfo);

    modelBuilder.finishBuilding(francaField);

    List<CField> fields = getResults(CField.class);
    assertEquals(1, fields.size());
    assertEquals(cppTypeInfo, fields.get(0).type);
  }

  @Test
  public void finishBuildingCreatesCEnum() {
    FEnumerationType francaEnumerationType = mock(FEnumerationType.class);

    modelBuilder.finishBuilding(francaEnumerationType);

    List<CEnum> enums = getResults(CEnum.class);
    assertEquals("Should be 1 enum created", 1, enums.size());
  }

  @Test
  public void finishBuildingCreatesCppTypeInfo() {
    when(CTypeMapper.mapType(any(), any())).thenReturn(cppTypeInfo);

    modelBuilder.finishBuilding(francaTypeRef);

    List<CppTypeInfo> typeInfos = getResults(CppTypeInfo.class);
    assertEquals("Should be 1 CppTypeInfo created", 1, typeInfos.size());
    assertSame(cppTypeInfo, typeInfos.get(0));
  }

  @Test
  public void finishBuildingCreatesFunctionsForAttribute() {
    CppTypeInfo classTypeInfo = mock(CppTypeInfo.class);
    List<CppElement> cppMethods =
        asList(
            new CppMethod.Builder(CPP_ATTR_GETTER_NAME).build(),
            new CppMethod.Builder(CPP_ATTR_SETTER_NAME).build());
    prepareTestForAttributes(classTypeInfo, cppMethods);

    modelBuilder.finishBuilding(francaAttribute);

    List<CFunction> functions = getResults(CFunction.class);
    assertEquals("There should be getter and setter", 2, functions.size());
    verifyAttributeGetter(classTypeInfo, functions.get(0));
    verifyAttributeSetter(classTypeInfo, functions.get(1));
  }

  @Test
  public void finishBuildingCreatesFunctionForReadonlyAttribute() {
    CppTypeInfo classTypeInfo = mock(CppTypeInfo.class);
    List<CppElement> cppMethods =
        singletonList(new CppMethod.Builder(CPP_ATTR_GETTER_NAME).build());
    prepareTestForAttributes(classTypeInfo, cppMethods);
    when(francaAttribute.isReadonly()).thenReturn(true);

    modelBuilder.finishBuilding(francaAttribute);

    List<CFunction> functions = getResults(CFunction.class);
    assertEquals("There should be only getter", 1, functions.size());
    verifyAttributeGetter(classTypeInfo, functions.get(0));
  }

  private void prepareTestForAttributes(CppTypeInfo classTypeInfo, List<CppElement> cppMethods) {
    when(cppModelbuilder.getFinalResults()).thenReturn(cppMethods);
    when(francaAttribute.isReadonly()).thenReturn(false);
    when(SwiftNameRules.getPropertyGetterName(any())).thenReturn(CBRIDGE_ATTR_GETTER_NAME);
    when(SwiftNameRules.getPropertySetterName(any())).thenReturn(CBRIDGE_ATTR_SETTER_NAME);
    SwiftProperty swiftProperty = new SwiftProperty("", mock(SwiftType.class), false, "");
    when(swiftModelbuilder.getFinalResult(any())).thenReturn(swiftProperty);

    contextStack.injectResult(cppTypeInfo);
    contextStack.getParentContext().currentResults.add(new CClassType(classTypeInfo));
  }

  private void verifyAttributeSetter(CppTypeInfo classTypeInfo, CFunction cSetter) {
    assertEquals(CBRIDGE_ATTR_SETTER_NAME, cSetter.name);
    assertEquals(CPP_ATTR_SETTER_NAME, cSetter.functionName);
    assertSame(classTypeInfo, cSetter.selfParameter.mappedType);
    assertSame(CType.VOID, cSetter.returnType.functionReturnType);
    assertEquals(
        "Setter should have two parameters, new value and instance(not included here)",
        1,
        cSetter.parameters.size());
  }

  private void verifyAttributeGetter(CppTypeInfo classTypeInfo, CFunction cGetter) {
    assertEquals(CBRIDGE_ATTR_GETTER_NAME, cGetter.name);
    assertEquals(CPP_ATTR_GETTER_NAME, cGetter.functionName);
    assertSame(classTypeInfo, cGetter.selfParameter.mappedType);
    assertSame(cppTypeInfo, cGetter.returnType);
    assertEquals(
        "Getter should have only one parameter, instance but not included here",
        0,
        cGetter.parameters.size());
  }

  private <T extends CElement> List<T> getResults(Class<T> clazz) {
    return CollectionsHelper.getAllOfType(contextStack.getParentContext().previousResults, clazz);
  }
}
