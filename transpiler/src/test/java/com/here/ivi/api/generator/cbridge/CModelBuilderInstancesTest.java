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

import static org.junit.Assert.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;
import static org.mockito.MockitoAnnotations.initMocks;
import static org.powermock.api.mockito.PowerMockito.mockStatic;

import com.here.ivi.api.common.CollectionsHelper;
import com.here.ivi.api.generator.cpp.CppNameRules;
import com.here.ivi.api.model.cmodel.*;
import com.here.ivi.api.model.franca.Interface;
import com.here.ivi.api.test.MockContextStack;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import org.franca.core.franca.*;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
@PrepareForTest({CTypeMapper.class, CppNameRules.class, CppTypeInfo.class})
public class CModelBuilderInstancesTest {
  private static final String FULL_FUNCTION_NAME = "FULL_FUNCTION_NAME";
  private static final String DELEGATE_NAME = "DELEGATE_NAME";
  private static final String PARAM_NAME = "inputParam";

  private final MockContextStack<CElement> contextStack = new MockContextStack<>();

  @Mock private CBridgeNameRules cBridgeNameRules;
  @Mock private IncludeResolver resolver;
  @Mock private Interface anInterface;
  @Mock private FInterface francaInterface;
  @Mock private FMethod francaMethod;
  @Mock private FArgument francaArgument;
  @Mock private FTypeCollection francaTypeCollection;
  @Mock private FModel francaModel;

  private final CppTypeInfo cppTypeInfo = CppTypeInfo.BYTE_VECTOR;
  private CModelBuilder modelBuilder;
  private CClassType classType;

  @Before
  public void setUp() {
    mockStatic(CTypeMapper.class, CppNameRules.class, CppTypeInfo.class);
    initMocks(this);

    CType fakeType = mock(CType.class);
    fakeType.includes = new HashSet<>();
    CppTypeInfo typeInfo = new CppTypeInfo(fakeType);
    typeInfo.returnValueConstrExpr = "";
    classType = new CClassType(typeInfo);

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
  //Instances

  @Test
  public void assertGetPointerClassInstanceMethod() {
    classInterfaceMockPreparation();
    modelBuilder.finishBuilding(francaInterface);
    CInterface classInterface = getResults(CInterface.class).get(0);
    CFunction getPointerFunction = getFunction(classInterface.functions, "get_pointer");
    assertTrue("Pointer function should be internal", getPointerFunction.internalOnlyFunction);
    assertEquals("Getter should take in 1 param", 1, getPointerFunction.parameters.size());
  }

  @Test
  public void assertInstanceMethodNoParams() {
    when(anInterface.isStatic(any())).thenReturn(false);

    CFunction function =
        new CFunction.Builder("InstanceMethod")
            .functionMember(CFunction.FunctionMember.INSTANCE)
            .build();
    contextStack.injectResult(function);
    modelBuilder.finishBuilding(francaMethod);
    CFunction interfaceFunction = getResults(CFunction.class).get(0);
    assertEquals(
        "Instance function should take in 1 param, itself", 1, interfaceFunction.parameters.size());
  }

  @Test
  public void assertInstanceMethodWithParams() {
    when(anInterface.isStatic(any())).thenReturn(false);
    CInParameter param = new CInParameter(PARAM_NAME, CType.DOUBLE);
    param.conversion = TypeConverter.identity(param);
    contextStack.injectResult(param);
    CFunction function =
        new CFunction.Builder("InstanceMethod")
            .parameters(Collections.singletonList(param))
            .functionMember(CFunction.FunctionMember.INSTANCE)
            .build();
    contextStack.injectResult(function);
    modelBuilder.finishBuilding(francaMethod);
    CFunction interfaceFunction = getResults(CFunction.class).get(0);
    assertEquals(
        "Instance function should take in 2 param", 2, interfaceFunction.parameters.size());
  }

  private void classInterfaceMockPreparation() {
    when(cBridgeNameRules.getStructRefType(any())).thenReturn("ClassNameRef");
    when(cBridgeNameRules.getStructBaseName(any())).thenReturn("ClassName");
    when(cBridgeNameRules.getBaseApiInstanceName(any())).thenReturn("BaseAPIClassName");
    contextStack.injectResult(classType);
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
