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

package com.here.ivi.api.generator.baseapi;

import static org.junit.Assert.assertEquals;
import static org.mockito.ArgumentMatchers.same;
import static org.mockito.Mockito.any;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import com.here.ivi.api.generator.common.cpp.CppTypeMapper;
import com.here.ivi.api.model.cppmodel.CppCustomType;
import com.here.ivi.api.model.cppmodel.CppElements;
import com.here.ivi.api.model.cppmodel.CppPrimitiveType;
import com.here.ivi.api.model.cppmodel.CppType;
import com.here.ivi.api.model.franca.FrancaElement;
import com.here.ivi.api.test.ArrayEList;
import navigation.BaseApiSpec;
import org.eclipse.emf.common.util.EList;
import org.franca.core.franca.FArgument;
import org.franca.core.franca.FBasicTypeId;
import org.franca.core.franca.FEnumerationType;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FMethod;
import org.franca.core.franca.FModel;
import org.franca.core.franca.FTypeCollection;
import org.franca.core.franca.FTypeRef;
import org.franca.core.franca.FTypedElement;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Answers;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.powermock.api.mockito.PowerMockito;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
@PrepareForTest(CppTypeMapper.class)
public class StubMethodMapperTest {

  private static final String METHOD_NAME = "shoot foot";
  private static final String ARGUMENT_NAME = "which foot";
  private static final String TYPE_NAME = "typical";

  @Mock private FrancaElement<BaseApiSpec.InterfacePropertyAccessor> rootModel;
  @Mock private BaseApiSpec.InterfacePropertyAccessor propertyAccessor;

  @Mock(answer = Answers.RETURNS_DEEP_STUBS)
  private FMethod francaMethod;

  @Mock private FEnumerationType francaEnum;
  @Mock private FArgument francaArgument;

  private final CppCustomType cppCustomType = new CppCustomType(TYPE_NAME);

  @Before
  public void setUp() {
    PowerMockito.mockStatic(CppTypeMapper.class);
    MockitoAnnotations.initMocks(this);

    when(CppTypeMapper.map(any(), any(FTypedElement.class))).thenReturn(cppCustomType);

    when(rootModel.getPropertyAccessor()).thenReturn(propertyAccessor);

    when(francaMethod.getErrorEnum()).thenReturn(null);
    when(francaMethod.getOutArgs()).thenReturn(new ArrayEList<>());
    when(francaMethod.getName()).thenReturn(METHOD_NAME);
  }

  private EList<FArgument> createFrancaArgumentsArray() {
    FTypeCollection parentTypeCollection = mock(FTypeCollection.class);
    when(parentTypeCollection.eContainer()).thenReturn(mock(FModel.class));

    FTypeRef typeRef = mock(FTypeRef.class);
    when(typeRef.getPredefined()).thenReturn(FBasicTypeId.STRING);
    when(typeRef.eContainer()).thenReturn(parentTypeCollection);

    when(francaArgument.getName()).thenReturn(ARGUMENT_NAME);
    when(francaArgument.getType()).thenReturn(typeRef);

    ArrayEList<FArgument> arguments = new ArrayEList<>();
    arguments.add(francaArgument);

    return arguments;
  }

  @Test
  public void mapMethodReturnTypeNoArguments() {
    StubMethodMapper.ReturnTypeData returnTypeData =
        StubMethodMapper.mapMethodReturnType(francaMethod, rootModel);

    assertEquals(CppPrimitiveType.VOID_TYPE, returnTypeData.type);
  }

  @Test
  public void mapMethodReturnTypeWithErrorType() {
    when(CppTypeMapper.mapEnum(any(), any())).thenReturn(cppCustomType);
    when(francaMethod.getErrorEnum()).thenReturn(francaEnum);

    StubMethodMapper.ReturnTypeData returnTypeData =
        StubMethodMapper.mapMethodReturnType(francaMethod, rootModel);

    assertEquals(TYPE_NAME, returnTypeData.type.name);

    PowerMockito.verifyStatic();
    CppTypeMapper.mapEnum(same(rootModel), same(francaEnum));
  }

  @Test
  public void mapMethodReturnTypeOneOutputArgument() {
    EList<FArgument> francaArguments = createFrancaArgumentsArray();
    when(francaMethod.getOutArgs()).thenReturn(francaArguments);

    StubMethodMapper.ReturnTypeData returnTypeData =
        StubMethodMapper.mapMethodReturnType(francaMethod, rootModel);

    assertEquals(TYPE_NAME, returnTypeData.type.name);

    PowerMockito.verifyStatic();
    CppTypeMapper.map(same(rootModel), same(francaArgument));
  }

  @Test
  public void mapMethodReturnTypeOneOutputArgumentWithErrorType() {
    when(CppTypeMapper.mapEnum(any(), any())).thenReturn(cppCustomType);

    EList<FArgument> francaArguments = createFrancaArgumentsArray();
    when(francaMethod.getOutArgs()).thenReturn(francaArguments);
    when(francaMethod.getErrorEnum()).thenReturn(francaEnum);

    StubMethodMapper.ReturnTypeData returnTypeData =
        StubMethodMapper.mapMethodReturnType(francaMethod, rootModel);

    assertEquals(
        "here::internal::expected< " + TYPE_NAME + ", " + TYPE_NAME + " >",
        returnTypeData.type.name.toLowerCase());

    PowerMockito.verifyStatic();
    CppTypeMapper.map(same(rootModel), same(francaArgument));
    PowerMockito.verifyStatic();
    CppTypeMapper.mapEnum(same(rootModel), same(francaEnum));
  }

  @Test
  public void mapArgumentTypeCallsTypeMapper() {
    CppType cppType = StubMethodMapper.mapArgumentType(francaArgument, null, rootModel);

    assertEquals(cppCustomType, cppType);

    PowerMockito.verifyStatic();
    CppTypeMapper.map(same(rootModel), same(francaArgument));
  }

  @Test
  public void mapArgumentTypeWrapsInSharedPtr() {
    final CppCustomType cppInterfaceInstance =
        new CppCustomType(TYPE_NAME, CppElements.TypeInfo.InterfaceInstance);
    when(CppTypeMapper.map(any(), any(FArgument.class))).thenReturn(cppInterfaceInstance);
    when(CppTypeMapper.wrapSharedPtr(any())).thenReturn(cppCustomType);

    CppType cppType = StubMethodMapper.mapArgumentType(francaArgument, francaMethod, rootModel);

    assertEquals(cppCustomType, cppType);

    PowerMockito.verifyStatic();
    CppTypeMapper.wrapSharedPtr(same(cppInterfaceInstance));
  }

  @Test
  public void mapArgumentTypeWrapsInUniquePtr() {
    final CppCustomType cppInterfaceInstance =
        new CppCustomType(TYPE_NAME, CppElements.TypeInfo.InterfaceInstance);
    when(CppTypeMapper.map(any(), any(FArgument.class))).thenReturn(cppInterfaceInstance);
    when(CppTypeMapper.wrapUniquePtr(any())).thenReturn(cppCustomType);
    when(propertyAccessor.getCreates(any())).thenReturn(mock(FInterface.class));

    CppType cppType = StubMethodMapper.mapArgumentType(francaArgument, francaMethod, rootModel);

    assertEquals(cppCustomType, cppType);

    PowerMockito.verifyStatic();
    CppTypeMapper.wrapUniquePtr(same(cppInterfaceInstance));
  }
}
