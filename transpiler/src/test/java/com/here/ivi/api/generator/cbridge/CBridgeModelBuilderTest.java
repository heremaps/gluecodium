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
import com.here.ivi.api.model.cbridge.*;
import com.here.ivi.api.model.cbridge.CElement;
import com.here.ivi.api.model.cbridge.CEnum;
import com.here.ivi.api.model.cbridge.CField;
import com.here.ivi.api.model.cbridge.CFunction;
import com.here.ivi.api.model.cbridge.CInParameter;
import com.here.ivi.api.model.cbridge.CInterface;
import com.here.ivi.api.model.cbridge.COutParameter;
import com.here.ivi.api.model.cbridge.CParameter;
import com.here.ivi.api.model.cbridge.CStruct;
import com.here.ivi.api.model.cbridge.CType;
import com.here.ivi.api.model.cbridge.IncludeResolver;
import com.here.ivi.api.model.common.Include;
import com.here.ivi.api.model.cpp.CppElement;
import com.here.ivi.api.model.cpp.CppField;
import com.here.ivi.api.model.cpp.CppMethod;
import com.here.ivi.api.model.franca.FrancaDeploymentModel;
import com.here.ivi.api.model.swift.SwiftField;
import com.here.ivi.api.model.swift.SwiftMethod;
import com.here.ivi.api.model.swift.SwiftProperty;
import com.here.ivi.api.model.swift.SwiftType;
import com.here.ivi.api.test.MockContextStack;
import java.util.Collection;
import java.util.List;
import org.franca.core.franca.*;
import org.franca.core.franca.FArgument;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FMethod;
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
  CArrayMapper.class,
  CBridgeNameRules.class,
  SwiftNameRules.class
})
public class CBridgeModelBuilderTest {

  private static final String FULL_FUNCTION_NAME = "NOT_SHORT_FUNCTION_NAME";
  private static final String NESTED_SPECIFIER_NAME = "NOT";
  private static final String SHORT_FUNCTION_NAME = "SHORT_FUNCTION_NAME";
  private static final String DELEGATE_NAME = "DELEGATE_NAME";
  private static final String PARAM_NAME = "inputParam";
  private static final String STRUCT_NAME = "SomeStruct";
  private static final String STRUCT_BASEAPI_NAME = "BaseAPI::" + STRUCT_NAME;
  private static final String ATTRIBUTE_NAME = "someAttributeName";
  private static final String CBRIDGE_ATTR_GETTER_NAME = "C_ATTR_GETTER";
  private static final String CBRIDGE_ATTR_SETTER_NAME = "C_ATTR_SETTER";
  private static final String CPP_ATTR_GETTER_NAME = "CPP_ATTR_GETTER";
  private static final String CPP_ATTR_SETTER_NAME = "CPP_ATTR_SETTER";
  public static final String CPP_FIELD_NAME = "CppFieldName";
  public static final String SWIFT_FIELD_NAME = "SwiftFieldName";

  private final MockContextStack<CElement> contextStack = new MockContextStack<>();

  @Mock private FrancaDeploymentModel deploymentModel;

  @Mock private CppModelBuilder cppModelbuilder;
  @Mock private SwiftModelBuilder swiftModelBuilder;
  @Mock private IncludeResolver resolver;
  @Mock private FInterface francaInterface;
  @Mock private FMethod francaMethod;
  @Mock private FArgument francaArgument;
  @Mock private FStructType francaStruct;
  @Mock private FField francaField;
  @Mock private FTypeCollection francaTypeCollection;
  @Mock private FAttribute francaAttribute;
  @Mock private FTypeRef francaTypeRef;
  @Mock private FArrayType francaArray;

  private final CppTypeInfo cppTypeInfo = CppTypeInfo.BYTE_VECTOR;
  private final SwiftMethod swiftMethod =
      SwiftMethod.builder("swiftFoo")
          .cNestedSpecifier(NESTED_SPECIFIER_NAME)
          .cShortName(SHORT_FUNCTION_NAME)
          .build();
  private CBridgeModelBuilder modelBuilder;

  @Before
  public void setUp() {
    mockStatic(
        CTypeMapper.class,
        CppNameRules.class,
        CBridgeNameRules.class,
        CArrayMapper.class,
        SwiftNameRules.class);
    initMocks(this);

    CppTypeInfo typeInfo = new CppTypeInfo(new CType(""));

    when(CBridgeNameRules.getStructBaseName(any())).thenReturn(STRUCT_NAME);
    when(CBridgeNameRules.getBaseApiStructName(any())).thenReturn(STRUCT_BASEAPI_NAME);

    when(cppModelbuilder.getFinalResult(CppMethod.class)).thenReturn(CppMethod.builder().build());
    when(swiftModelBuilder.getFinalResult(SwiftMethod.class)).thenReturn(swiftMethod);

    when(CTypeMapper.createCustomTypeInfo(any(), any(), any())).thenReturn(typeInfo);

    when(deploymentModel.isStatic(any())).thenReturn(true);

    when(francaArgument.getName()).thenReturn(PARAM_NAME);
    when(francaAttribute.getName()).thenReturn(ATTRIBUTE_NAME);

    when(resolver.resolveInclude(any(), any())).thenReturn(Include.createInternalInclude(""));

    modelBuilder =
        new CBridgeModelBuilder(
            contextStack, deploymentModel, resolver, cppModelbuilder, swiftModelBuilder);
  }

  @Test
  public void finishBuildingInputArgumentReturnsCreatedParams() {
    contextStack.injectResult(cppTypeInfo);

    modelBuilder.finishBuildingInputArgument(francaArgument);

    CInParameter param = modelBuilder.getFinalResult(CInParameter.class);

    assertNotNull(param);
    assertEquals(francaArgument.getName(), param.name);
    assertEquals(2, param.getSignatureParameters().size());
    for (int i = 0; i < 2; i++) {
      CParameter.SimpleParameter simpleParameter = param.getSignatureParameters().get(i);
      assertEquals(PARAM_NAME + cppTypeInfo.paramSuffixes.get(i), simpleParameter.name);
      assertEquals(cppTypeInfo.cTypesNeededByConstructor.get(i), simpleParameter.type);
    }
  }

  @Test
  public void finishBuildingOutputArgumentReturnsCreatedParam() {
    contextStack.injectResult(cppTypeInfo);

    modelBuilder.finishBuildingOutputArgument(francaArgument);

    COutParameter param = modelBuilder.getFinalResult(COutParameter.class);
    assertNotNull(param);

    assertEquals("result", param.name);
    assertSame(cppTypeInfo, param.mappedType);
  }

  @Test
  public void finishBuildingInstanceMethodNoParams() {
    when(deploymentModel.isStatic(any())).thenReturn(false);
    contextStack.getParentContext().currentResults.add(new CppTypeInfo(CType.VOID));

    modelBuilder.finishBuilding(francaMethod);

    CFunction interfaceFunction = modelBuilder.getFinalResult(CFunction.class);
    assertNotNull(interfaceFunction.selfParameter);
    assertEquals(
        "Instance parameter should not be part of normal parameters",
        0,
        interfaceFunction.parameters.size());
    assertEquals(
        "Instance should be part of C signature parameters",
        1,
        interfaceFunction.getSignatureParameters().size());
  }

  @Test
  public void finishBuildingInstanceMethodWithParams() {
    when(deploymentModel.isStatic(any())).thenReturn(false);
    contextStack.getParentContext().currentResults.add(new CppTypeInfo(CType.VOID));
    contextStack.injectResult(new CInParameter(PARAM_NAME, new CppTypeInfo(CType.DOUBLE)));

    modelBuilder.finishBuilding(francaMethod);

    CFunction interfaceFunction = modelBuilder.getFinalResult(CFunction.class);
    assertEquals(
        "Instance function should only take normal parameters",
        1,
        interfaceFunction.parameters.size());
    assertEquals(
        "Instance parameter should be part of signature",
        2,
        interfaceFunction.getSignatureParameters().size());
  }

  @Test
  public void finishBuildingFrancaMethodReadsName() {
    when(CBridgeNameRules.getNestedSpecifierString(any())).thenReturn("NOT");

    modelBuilder.finishBuilding(francaMethod);

    CFunction function = modelBuilder.getFinalResult(CFunction.class);
    assertNotNull(function);
    assertEquals(FULL_FUNCTION_NAME, function.name);
    assertEquals(SHORT_FUNCTION_NAME, function.shortName);
  }

  @Test
  public void finishBuildingCreatesMethodWithoutParams() {
    CppMethod cppMethod = CppMethod.builder().fullyQualifiedName(DELEGATE_NAME).build();
    when(cppModelbuilder.getFinalResult(CppMethod.class)).thenReturn(cppMethod);

    modelBuilder.finishBuilding(francaMethod);

    CFunction function = modelBuilder.getFinalResult(CFunction.class);
    assertNotNull(function);
    assertEquals(CType.VOID, function.returnType.functionReturnType);
    assertEquals(0, function.parameters.size());
    assertEquals(DELEGATE_NAME, function.delegateCall);
  }

  @Test
  public void finishBuildingCreatesMethodWithParam() {
    CppMethod cppMethod = CppMethod.builder().fullyQualifiedName(DELEGATE_NAME).build();
    when(cppModelbuilder.getFinalResult(CppMethod.class)).thenReturn(cppMethod);
    CInParameter param = new CInParameter(PARAM_NAME, new CppTypeInfo(CType.DOUBLE));
    contextStack.injectResult(param);

    modelBuilder.finishBuilding(francaMethod);

    CFunction function = modelBuilder.getFinalResult(CFunction.class);
    assertNotNull(function);
    assertEquals(CType.VOID, function.returnType.functionReturnType);
    assertEquals(DELEGATE_NAME, function.delegateCall);
    assertEquals(1, function.parameters.size());
    assertSame(param, function.parameters.get(0));
  }

  @Test
  public void finishBuildingCreatesCInterfaceForFInterface() {
    CFunction function = CFunction.builder("SomeName").nestedSpecifier("foo").build();
    contextStack.injectResult(function);

    modelBuilder.finishBuilding(francaInterface);

    CInterface iface = modelBuilder.getFinalResult(CInterface.class);
    assertNotNull(iface);
    assertEquals(1, iface.functions.size());
    assertSame(function, iface.functions.get(0));
  }

  @Test
  public void finishBuildingCreatesCInterfaceForFTypeCollection() {
    CFunction function = CFunction.builder("SomeName").nestedSpecifier("foo").build();
    contextStack.injectResult(function);

    modelBuilder.finishBuilding(francaTypeCollection);

    CInterface iface = modelBuilder.getFinalResult(CInterface.class);
    assertNotNull(iface);
    assertEquals(1, iface.functions.size());
    assertSame(function, iface.functions.get(0));
  }

  @Test
  public void properIncludesForVoidFunctionNotCallingToBaseApi() {
    CFunction function = CFunction.builder("SomeName").nestedSpecifier("foo").build();
    contextStack.injectResult(function);

    modelBuilder.finishBuilding(francaInterface);

    CInterface iface = modelBuilder.getFinalResult(CInterface.class);
    assertNotNull(iface);
    assertEquals(0, iface.headerIncludes.size());
    assertEquals(1, iface.implementationIncludes.size());
    assertEquals(0, iface.privateHeaderIncludes.size());
  }

  @Test
  public void properIncludesForVoidFunctionCallingToBaseApi() {
    CFunction function =
        CFunction.builder("SomeName")
            .nestedSpecifier("foo")
            .delegateCall("someBaseApiFunc()")
            .delegateCallIncludes(singleton(Include.createInternalInclude("baseApiInclude.h")))
            .build();
    contextStack.injectResult(function);

    modelBuilder.finishBuilding(francaInterface);

    CInterface iface = modelBuilder.getFinalResult(CInterface.class);
    assertNotNull(iface);
    assertEquals(0, iface.headerIncludes.size());
    assertEquals(2, iface.implementationIncludes.size());
    assertEquals(0, iface.privateHeaderIncludes.size());
  }

  @Test
  public void finishBuildingStructContainsFields() {
    contextStack.injectResult(new CField("SwiftName1", "CppName1", cppTypeInfo));
    contextStack.injectResult(new CField("SwiftName2", "CppName2", cppTypeInfo));

    modelBuilder.finishBuilding(francaStruct);

    CStruct cStruct = modelBuilder.getFinalResult(CStruct.class);
    assertNotNull(cStruct);
    assertEquals("There should be 2 fields in struct", 2, cStruct.fields.size());
    assertEquals("SwiftName1", cStruct.fields.get(0).name);
    assertEquals("CppName1", cStruct.fields.get(0).baseLayerName);
    assertEquals("SwiftName2", cStruct.fields.get(1).name);
    assertEquals("CppName2", cStruct.fields.get(1).baseLayerName);
  }

  @Test
  public void finishBuildingStructCreatesStructWithProperName() {
    modelBuilder.finishBuilding(francaStruct);

    CStruct cStruct = modelBuilder.getFinalResult(CStruct.class);
    assertNotNull(cStruct);
    assertEquals(STRUCT_NAME, cStruct.name);
  }

  @Test
  public void finishBuildingStructReadsParentFields() {
    CStruct parentStruct = new CStruct("Foo", null, null);
    CField parentField = new CField("ParentField", "CppName2", cppTypeInfo);
    parentStruct.fields.add(parentField);
    contextStack.injectResult(parentStruct);
    CField cField = new CField("SwiftName1", "CppName1", cppTypeInfo);
    contextStack.injectResult(cField);

    modelBuilder.finishBuilding(francaStruct);

    CStruct cStruct = modelBuilder.getFinalResult(CStruct.class);
    assertNotNull(cStruct);
    assertEquals("There should be 2 fields in struct", 2, cStruct.fields.size());
    assertEquals(parentField, cStruct.fields.get(0));
    assertEquals(cField, cStruct.fields.get(1));
  }

  @Test
  public void finishBuildingInterfaceDoesNotAddStructs() {
    CStruct struct = new CStruct("name", "baseApiName", new CppTypeInfo(CType.VOID));
    contextStack.injectResult(struct);

    modelBuilder.finishBuilding(francaInterface);

    CInterface iface = modelBuilder.getFinalResult(CInterface.class);
    assertNotNull(iface);
    assertEquals(
        "There should be 1 struct typedefs (structRef and function table)",
        1,
        iface.structs.size());
    assertSame(struct, iface.structs.get(0));
  }

  @Test
  public void finishBuildingTypeCollectionContainsStructs() {
    CStruct struct = new CStruct("name", "baseApiName", new CppTypeInfo(CType.VOID));
    contextStack.injectResult(struct);

    modelBuilder.finishBuilding(francaTypeCollection);

    CInterface iface = modelBuilder.getFinalResult(CInterface.class);
    assertNotNull(iface);
    assertEquals("There should be 1 struct typedefs (structRef)", 1, iface.structs.size());
    assertSame(struct, iface.structs.get(0));
  }

  @Test
  public void finishBuildingFrancaFieldReadsName() {
    when(cppModelbuilder.getFinalResult(any())).thenReturn(new CppField(null, CPP_FIELD_NAME));
    when(swiftModelBuilder.getFinalResult(any()))
        .thenReturn(new SwiftField(SWIFT_FIELD_NAME, null, null));

    modelBuilder.finishBuilding(francaField);

    CField field = modelBuilder.getFinalResult(CField.class);
    assertNotNull(field);
    assertEquals(SWIFT_FIELD_NAME, field.name);
    assertEquals(CPP_FIELD_NAME, field.baseLayerName);
  }

  @Test
  public void finishBuildingFrancaFieldReadsTypeInfo() {
    when(cppModelbuilder.getFinalResult(any())).thenReturn(new CppField(null, CPP_FIELD_NAME));
    when(swiftModelBuilder.getFinalResult(any()))
        .thenReturn(new SwiftField(SWIFT_FIELD_NAME, null, null));
    contextStack.injectResult(cppTypeInfo);

    modelBuilder.finishBuilding(francaField);

    CField field = modelBuilder.getFinalResult(CField.class);
    assertNotNull(field);
    assertEquals(cppTypeInfo, field.type);
  }

  @Test
  public void finishBuildingCreatesCEnum() {
    FEnumerationType francaEnumerationType = mock(FEnumerationType.class);

    modelBuilder.finishBuilding(francaEnumerationType);

    CEnum anEnum = modelBuilder.getFinalResult(CEnum.class);
    assertNotNull("Should be 1 enum created", anEnum);
  }

  @Test
  public void finishBuildingCreatesCppTypeInfo() {
    when(CTypeMapper.mapType(any(), any())).thenReturn(cppTypeInfo);

    modelBuilder.finishBuilding(francaTypeRef);

    CppTypeInfo typeInfo = modelBuilder.getFinalResult(CppTypeInfo.class);
    assertNotNull("Should be 1 CppTypeInfo created", typeInfo);
    assertSame(cppTypeInfo, typeInfo);
  }

  @Test
  public void finishBuildingCreatesFunctionsForAttribute() {
    CppTypeInfo classTypeInfo = new CppTypeInfo(new CType(""));
    List<CppElement> cppMethods =
        asList(
            new CppMethod.Builder(CPP_ATTR_GETTER_NAME).build(),
            new CppMethod.Builder(CPP_ATTR_SETTER_NAME).build());
    when(cppModelbuilder.getFinalResults()).thenReturn(cppMethods);

    when(francaAttribute.isReadonly()).thenReturn(false);
    SwiftProperty swiftProperty = new SwiftProperty("", new SwiftType(""));
    swiftProperty.propertyAccessors.add(
        SwiftMethod.builder("").cShortName(CBRIDGE_ATTR_GETTER_NAME).build());
    swiftProperty.propertyAccessors.add(
        SwiftMethod.builder("").cShortName(CBRIDGE_ATTR_SETTER_NAME).build());
    when(swiftModelBuilder.getFinalResult(any())).thenReturn(swiftProperty);

    contextStack.injectResult(cppTypeInfo);
    contextStack.getParentContext().currentResults.add(classTypeInfo);

    modelBuilder.finishBuilding(francaAttribute);

    List<CFunction> functions =
        CollectionsHelper.getAllOfType(modelBuilder.getFinalResults(), CFunction.class);
    assertEquals("There should be getter and setter", 2, functions.size());
    verifyAttributeGetter(classTypeInfo, functions.get(0));
    verifyAttributeSetter(classTypeInfo, functions.get(1));
  }

  @Test
  public void finishBuildingCreatesFunctionForReadonlyAttribute() {
    CppTypeInfo classTypeInfo = new CppTypeInfo(new CType(""));
    List<CppElement> cppMethods =
        singletonList(new CppMethod.Builder(CPP_ATTR_GETTER_NAME).build());
    when(cppModelbuilder.getFinalResults()).thenReturn(cppMethods);

    when(francaAttribute.isReadonly()).thenReturn(true);
    SwiftProperty swiftProperty = new SwiftProperty("", new SwiftType(""));
    swiftProperty.propertyAccessors.add(
        SwiftMethod.builder("").cShortName(CBRIDGE_ATTR_GETTER_NAME).build());
    when(swiftModelBuilder.getFinalResult(any())).thenReturn(swiftProperty);

    contextStack.injectResult(cppTypeInfo);
    contextStack.getParentContext().currentResults.add(classTypeInfo);

    modelBuilder.finishBuilding(francaAttribute);

    List<CFunction> functions =
        CollectionsHelper.getAllOfType(modelBuilder.getFinalResults(), CFunction.class);
    assertEquals("There should be only getter", 1, functions.size());
    verifyAttributeGetter(classTypeInfo, functions.get(0));
  }

  @Test
  public void finishBuildingFrancaArrayTypeCreatesArray() {
    CArray cArray = new CArray("FooArray", cppTypeInfo);
    when(CArrayMapper.createArrayDefinition(any(), any())).thenReturn(cArray);

    modelBuilder.finishBuilding(francaArray);

    Collection<CArray> arrays = modelBuilder.arraysCollector.values();
    assertEquals("There should one array", 1, arrays.size());
    assertEquals("FooArray", arrays.iterator().next().name);
  }

  @Test
  public void finishBuildingFrancaTypeRefCreatesInlineArray() {
    CppTypeInfo arrayType = new CppTypeInfo(new CType("ArrayTest"));
    arrayType.typeCategory = CppTypeInfo.TypeCategory.ARRAY;
    when(CTypeMapper.mapType(any(), any())).thenReturn(arrayType);
    CArray cArray = new CArray("FooArray", cppTypeInfo);
    when(CArrayMapper.createArrayDefinition(any(), any(), any())).thenReturn(cArray);

    modelBuilder.finishBuilding(francaTypeRef);

    Collection<CArray> arrays = modelBuilder.arraysCollector.values();
    assertEquals("There should one array", 1, arrays.size());
    assertEquals("FooArray", arrays.iterator().next().name);
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

  @Test
  public void finishBuildingInterfacePropagatesFunctionsFromBase() {
    CInterface base = new CInterface("Base");
    base.inheritedFunctions.add(CFunction.builder("GrandParentFunction").build());
    base.functions.add(CFunction.builder("ParentFunction").build());
    contextStack.injectResult(base);
    CFunction function = CFunction.builder("ChildFunction").build();
    contextStack.injectResult(function);

    modelBuilder.finishBuilding(francaInterface);

    CInterface iface = modelBuilder.getFinalResult(CInterface.class);
    assertNotNull(iface);
    assertEquals(2, iface.inheritedFunctions.size());
    assertEquals(1, iface.functions.size());
  }
}
