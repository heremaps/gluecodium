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

package com.here.genium.generator.cbridge;

import static java.util.Arrays.asList;
import static java.util.Collections.singleton;
import static java.util.Collections.singletonList;
import static org.junit.Assert.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;
import static org.mockito.MockitoAnnotations.initMocks;
import static org.powermock.api.mockito.PowerMockito.mockStatic;

import com.here.genium.common.CollectionsHelper;
import com.here.genium.generator.cpp.CppModelBuilder;
import com.here.genium.generator.swift.SwiftModelBuilder;
import com.here.genium.generator.swift.SwiftNameRules;
import com.here.genium.model.cbridge.*;
import com.here.genium.model.cbridge.CBridgeIncludeResolver;
import com.here.genium.model.cbridge.CElement;
import com.here.genium.model.cbridge.CEnum;
import com.here.genium.model.cbridge.CField;
import com.here.genium.model.cbridge.CFunction;
import com.here.genium.model.cbridge.CInParameter;
import com.here.genium.model.cbridge.CInterface;
import com.here.genium.model.cbridge.COutParameter;
import com.here.genium.model.cbridge.CStruct;
import com.here.genium.model.cbridge.CType;
import com.here.genium.model.common.Include;
import com.here.genium.model.cpp.*;
import com.here.genium.model.franca.FrancaDeploymentModel;
import com.here.genium.model.swift.SwiftField;
import com.here.genium.model.swift.SwiftMethod;
import com.here.genium.model.swift.SwiftProperty;
import com.here.genium.model.swift.SwiftType;
import com.here.genium.test.MockContextStack;
import java.util.Collection;
import java.util.Collections;
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
import org.powermock.api.mockito.PowerMockito;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
@PrepareForTest({CArrayMapper.class, CBridgeNameRules.class, SwiftNameRules.class})
public final class CBridgeModelBuilderTest {

  private static final String FULL_FUNCTION_NAME = "NOT_SHORT_FUNCTION_NAME";
  private static final String NESTED_SPECIFIER_NAME = "NOT";
  private static final String SHORT_FUNCTION_NAME = "SHORT_FUNCTION_NAME";
  private static final String DELEGATE_NAME = "DELEGATE_NAME";
  private static final String PARAM_NAME = "inputParam";
  private static final String STRUCT_NAME = "SomeStruct";
  private static final String ATTRIBUTE_NAME = "someAttributeName";
  private static final String CBRIDGE_ATTR_GETTER_NAME = "C_ATTR_GETTER";
  private static final String CBRIDGE_ATTR_SETTER_NAME = "C_ATTR_SETTER";
  private static final String CPP_ATTR_GETTER_NAME = "CPP_ATTR_GETTER";
  private static final String CPP_ATTR_SETTER_NAME = "CPP_ATTR_SETTER";
  private static final String CPP_FIELD_NAME = "CppFieldName";
  private static final String SWIFT_FIELD_NAME = "SwiftFieldName";

  private final MockContextStack<CElement> contextStack = new MockContextStack<>();

  @Mock private FrancaDeploymentModel deploymentModel;

  @Mock private CppModelBuilder cppModelbuilder;
  @Mock private SwiftModelBuilder swiftModelBuilder;
  @Mock private CppIncludeResolver cppIncludeResolver;
  @Mock private CBridgeIncludeResolver includeResolver;
  @Mock private CBridgeTypeMapper typeMapper;

  @Mock private FInterface francaInterface;
  @Mock private FMethod francaMethod;
  @Mock private FArgument francaArgument;
  @Mock private FStructType francaStruct;
  @Mock private FField francaField;
  @Mock private FTypeCollection francaTypeCollection;
  @Mock private FAttribute francaAttribute;
  @Mock private FTypeRef francaTypeRef;
  @Mock private FArrayType francaArray;
  @Mock private FMapType francaMap;

  private final CppTypeInfo cppTypeInfo = new CppTypeInfo(CType.FLOAT);
  private final CppArrayTypeInfo cppArrayTypeInfo =
      CppArrayTypeInfo.arrayTypeBuilder("FooArrayType").build();
  private final SwiftMethod swiftMethod =
      new SwiftMethod(
          "swiftFoo", null, null, SwiftType.VOID, null, NESTED_SPECIFIER_NAME, SHORT_FUNCTION_NAME);
  private final CppField cppField =
      new CppField(CPP_FIELD_NAME, CppPrimitiveTypeRef.Companion.getBOOL());

  private CBridgeModelBuilder modelBuilder;

  @Before
  public void setUp() {
    mockStatic(CBridgeNameRules.class, CArrayMapper.class, SwiftNameRules.class);
    initMocks(this);

    CppTypeInfo typeInfo = new CppTypeInfo(new CType(""));

    when(CBridgeNameRules.getStructBaseName(any())).thenReturn(STRUCT_NAME);

    when(cppModelbuilder.getFinalResult(CppMethod.class)).thenReturn(new CppMethod(""));
    when(cppModelbuilder.getFinalResult(CppStruct.class)).thenReturn(new CppStruct(STRUCT_NAME));
    when(swiftModelBuilder.getFinalResult(SwiftMethod.class)).thenReturn(swiftMethod);

    when(typeMapper.createCustomTypeInfo(any(), any())).thenReturn(typeInfo);

    when(francaArgument.getName()).thenReturn(PARAM_NAME);
    when(francaAttribute.getName()).thenReturn(ATTRIBUTE_NAME);

    when(includeResolver.resolveInclude(any()))
        .thenReturn(Include.Companion.createInternalInclude(""));

    modelBuilder =
        new CBridgeModelBuilder(
            contextStack,
            deploymentModel,
            cppIncludeResolver,
            includeResolver,
            cppModelbuilder,
            swiftModelBuilder,
            typeMapper);
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
    contextStack.getParentContext().currentResults.add(new CppTypeInfo(CType.VOID));

    modelBuilder.finishBuilding(francaMethod);

    CFunction interfaceFunction = modelBuilder.getFinalResult(CFunction.class);
    assertNotNull(interfaceFunction.selfParameter);
    assertEquals(
        "Instance parameter should not be part of normal parameters",
        0,
        interfaceFunction.parameters.size());
    assertNotNull(
        "Instance should be part of C signature parameters", interfaceFunction.selfParameter);
  }

  @Test
  public void finishBuildingInstanceMethodWithParams() {
    contextStack.getParentContext().currentResults.add(new CppTypeInfo(CType.VOID));
    contextStack.injectResult(new CInParameter(PARAM_NAME, new CppTypeInfo(CType.DOUBLE)));

    modelBuilder.finishBuilding(francaMethod);

    CFunction interfaceFunction = modelBuilder.getFinalResult(CFunction.class);
    assertEquals(
        "Instance function should only take normal parameters",
        1,
        interfaceFunction.parameters.size());
    assertNotNull(
        "Instance parameter should be part of signature", interfaceFunction.selfParameter);
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
    CppMethod cppMethod = new CppMethod(DELEGATE_NAME);
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
    CppMethod cppMethod = new CppMethod(DELEGATE_NAME);
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
  public void finishBuildingFrancaMethodReadsIsConst() {
    when(deploymentModel.isConst(any())).thenReturn(true);

    modelBuilder.finishBuilding(francaMethod);

    CFunction function = modelBuilder.getFinalResult(CFunction.class);
    assertNotNull(function);
    assertTrue(function.isConst);
  }

  @Test
  public void finishBuildingFrancaMethodReadsCppTypeName() {
    CppMethod cppMethod =
        new CppMethod(DELEGATE_NAME, DELEGATE_NAME, "", new CppComplexTypeRef("::std::FooType"));
    when(cppModelbuilder.getFinalResult(CppMethod.class)).thenReturn(cppMethod);
    when(CBridgeNameRules.getNestedSpecifierString(any())).thenReturn("NOT");

    modelBuilder.finishBuilding(francaMethod);

    CFunction function = modelBuilder.getFinalResult(CFunction.class);
    assertNotNull(function);
    assertEquals("::std::FooType", function.cppReturnTypeName);
  }

  @Test
  public void finishBuildingFrancaMethodReadsIsStatic() {
    when(deploymentModel.isStatic(any(FMethod.class))).thenReturn(true);

    modelBuilder.finishBuilding(francaMethod);

    CFunction function = modelBuilder.getFinalResult(CFunction.class);
    assertNotNull(function);
    assertNull(function.selfParameter);
  }

  @Test
  public void finishBuildingFrancaMethodReadsIsCosntructor() {
    when(deploymentModel.isConstructor(any())).thenReturn(true);

    modelBuilder.finishBuilding(francaMethod);

    CFunction function = modelBuilder.getFinalResult(CFunction.class);
    assertNotNull(function);
    assertNull(function.selfParameter);
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
            .delegateCallIncludes(
                singleton(Include.Companion.createInternalInclude("baseApiInclude.h")))
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
    contextStack.injectResult(
        CField.builder()
            .swiftLayerName("SwiftName1")
            .baseLayerName("CppName1")
            .cppTypeInfo(cppTypeInfo)
            .build());
    contextStack.injectResult(
        CField.builder()
            .swiftLayerName("SwiftName2")
            .baseLayerName("CppName2")
            .cppTypeInfo(cppTypeInfo)
            .build());

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
  public void finishBuildingStructReadsImmutable() {
    when(cppModelbuilder.getFinalResult(CppStruct.class))
        .thenReturn(
            new CppStruct(
                STRUCT_NAME, STRUCT_NAME, "", Collections.emptyList(), false, false, true));

    modelBuilder.finishBuilding(francaStruct);

    CStruct cStruct = modelBuilder.getFinalResult(CStruct.class);
    assertNotNull(cStruct);
    assertTrue(cStruct.isImmutable);
  }

  @Test
  public void finishBuildingInterfaceDoesNotAddStructs() {
    CStruct struct = new CStruct("name", "baseApiName", new CppTypeInfo(CType.VOID), false);
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
    CStruct struct = new CStruct("name", "baseApiName", new CppTypeInfo(CType.VOID), false);
    contextStack.injectResult(struct);

    modelBuilder.finishBuilding(francaTypeCollection);

    CInterface iface = modelBuilder.getFinalResult(CInterface.class);
    assertNotNull(iface);
    assertEquals("There should be 1 struct typedefs (structRef)", 1, iface.structs.size());
    assertSame(struct, iface.structs.get(0));
  }

  @Test
  public void finishBuildingFrancaFieldReadsName() {
    when(cppModelbuilder.getFinalResult(any())).thenReturn(cppField);
    when(swiftModelBuilder.getFinalResult(any()))
        .thenReturn(new SwiftField(SWIFT_FIELD_NAME, null, null, null));

    modelBuilder.finishBuilding(francaField);

    CField field = modelBuilder.getFinalResult(CField.class);
    assertNotNull(field);
    assertEquals(SWIFT_FIELD_NAME, field.name);
    assertEquals(CPP_FIELD_NAME, field.baseLayerName);
  }

  @Test
  public void finishBuildingFrancaFieldReadsTypeInfo() {
    when(cppModelbuilder.getFinalResult(any())).thenReturn(cppField);
    when(swiftModelBuilder.getFinalResult(any()))
        .thenReturn(new SwiftField(SWIFT_FIELD_NAME, null, null, null));
    contextStack.injectResult(cppTypeInfo);

    modelBuilder.finishBuilding(francaField);

    CField field = modelBuilder.getFinalResult(CField.class);
    assertNotNull(field);
    assertEquals(cppTypeInfo, field.type);
  }

  @Test
  public void finishBuildingFrancaFieldReadsExternalAccessors() {
    when(cppModelbuilder.getFinalResult(any())).thenReturn(cppField);
    when(swiftModelBuilder.getFinalResult(any()))
        .thenReturn(new SwiftField(SWIFT_FIELD_NAME, null, null, null));
    when(deploymentModel.getExternalGetter(any())).thenReturn("get_foo");
    when(deploymentModel.getExternalSetter(any())).thenReturn("setFoo");

    modelBuilder.finishBuilding(francaField);

    CField field = modelBuilder.getFinalResult(CField.class);
    assertNotNull(field);
    assertEquals("get_foo", field.baseLayerGetterName);
    assertEquals("setFoo", field.baseLayerSetterName);
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
    when(typeMapper.mapType(any())).thenReturn(cppTypeInfo);

    modelBuilder.finishBuilding(francaTypeRef);

    CppTypeInfo typeInfo = modelBuilder.getFinalResult(CppTypeInfo.class);
    assertNotNull("Should be 1 CppTypeInfo created", typeInfo);
    assertSame(cppTypeInfo, typeInfo);
  }

  @Test
  public void finishBuildingCreatesFunctionsForAttribute() {
    CppTypeInfo classTypeInfo = new CppTypeInfo(new CType(""));
    List<CppElement> cppMethods =
        asList(new CppMethod(CPP_ATTR_GETTER_NAME), new CppMethod(CPP_ATTR_SETTER_NAME));
    when(cppModelbuilder.getFinalResults()).thenReturn(cppMethods);

    when(francaAttribute.isReadonly()).thenReturn(false);
    SwiftProperty swiftProperty =
        new SwiftProperty(
            "",
            null,
            new SwiftType(""),
            new SwiftMethod("", null, null, SwiftType.VOID, null, null, CBRIDGE_ATTR_GETTER_NAME),
            new SwiftMethod("", null, null, SwiftType.VOID, null, null, CBRIDGE_ATTR_SETTER_NAME),
            false);
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
    List<CppElement> cppMethods = singletonList(new CppMethod(CPP_ATTR_GETTER_NAME));
    when(cppModelbuilder.getFinalResults()).thenReturn(cppMethods);

    when(francaAttribute.isReadonly()).thenReturn(true);
    SwiftProperty swiftProperty =
        new SwiftProperty(
            "",
            null,
            new SwiftType(""),
            new SwiftMethod("", null, null, SwiftType.VOID, null, null, CBRIDGE_ATTR_GETTER_NAME),
            null,
            false);
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
  public void finishBuildingStaticAttribute() {
    SwiftProperty swiftProperty =
        new SwiftProperty(
            "", null, new SwiftType(""), new SwiftMethod(""), new SwiftMethod(""), false);
    when(swiftModelBuilder.getFinalResult(any())).thenReturn(swiftProperty);
    when(cppModelbuilder.getFinalResults())
        .thenReturn(asList(new CppMethod(""), new CppMethod("")));
    when(deploymentModel.isStatic(any(FAttribute.class))).thenReturn(true);
    contextStack.injectResult(cppTypeInfo);

    modelBuilder.finishBuilding(francaAttribute);

    List<CFunction> functions =
        CollectionsHelper.getAllOfType(modelBuilder.getFinalResults(), CFunction.class);
    assertNull(functions.get(0).selfParameter);
    assertNull(functions.get(1).selfParameter);
  }

  @Test
  public void finishBuildingFrancaArrayTypeCreatesArray() {
    CArray cArray = new CArray("FooArray", cppArrayTypeInfo);
    when(CArrayMapper.createArrayDefinition(any(), any())).thenReturn(cArray);

    modelBuilder.finishBuilding(francaArray);

    Collection<CArray> arrays = modelBuilder.arraysCollector.values();
    assertEquals("There should one array", 1, arrays.size());
    assertEquals("FooArray", arrays.iterator().next().name);
  }

  @Test
  public void finishBuildingFrancaTypeRefCreatesInlineArray() {
    CppArrayTypeInfo arrayType =
        CppArrayTypeInfo.arrayTypeBuilder("ArrayTest")
            .cType(new CType("ArrayTest"))
            .functionReturnType(new CType("ArrayTest"))
            .build();
    arrayType.typeCategory = CppTypeInfo.TypeCategory.ARRAY;
    when(typeMapper.mapType(any())).thenReturn(arrayType);
    CArray cArray = new CArray("FooArray", cppArrayTypeInfo);
    when(CArrayMapper.createArrayDefinition(any(), any(), any())).thenReturn(cArray);

    modelBuilder.finishBuilding(francaTypeRef);

    Collection<CArray> arrays = modelBuilder.arraysCollector.values();
    assertEquals("There should one array", 1, arrays.size());
    assertEquals("FooArray", arrays.iterator().next().name);

    PowerMockito.verifyStatic();
    CArrayMapper.createArrayDefinition(francaTypeRef, arrayType.innerType, arrayType);
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

  @Test
  public void finishBuildingFrancaMapType() {
    when(CBridgeNameRules.getMapName(any())).thenReturn("FooMap");
    contextStack.injectResult(CppTypeInfo.STRING);
    contextStack.injectResult(cppTypeInfo);
    Include fooInclude = Include.Companion.createInternalInclude("Foo");
    when(cppIncludeResolver.resolveInclude(any())).thenReturn(fooInclude);

    modelBuilder.finishBuilding(francaMap);

    CMap cMap = modelBuilder.getFinalResult(CMap.class);
    assertNotNull(cMap);
    assertEquals("FooMap", cMap.name);
    assertEquals(CppTypeInfo.STRING, cMap.keyType);
    assertEquals(cppTypeInfo, cMap.valueType);
    assertEquals(fooInclude, cMap.include);
  }
}
