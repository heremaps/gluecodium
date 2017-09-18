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
import static org.mockito.Mockito.*;

import com.here.ivi.api.generator.cpp.CppTypeMapper;
import com.here.ivi.api.model.cppmodel.CppComplexTypeRef;
import com.here.ivi.api.model.cppmodel.CppPrimitiveTypeRef;
import com.here.ivi.api.test.ArrayEList;
import org.eclipse.emf.common.util.EList;
import org.franca.core.franca.FArgument;
import org.franca.core.franca.FBasicTypeId;
import org.franca.core.franca.FEnumerationType;
import org.franca.core.franca.FMethod;
import org.franca.core.franca.FModel;
import org.franca.core.franca.FTypeCollection;
import org.franca.core.franca.FTypeRef;
import org.franca.core.franca.FTypedElement;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;
import org.mockito.Answers;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

@RunWith(JUnit4.class)
public class CppMethodMapperTest {

  private static final String METHOD_NAME = "shoot foot";
  private static final String ARGUMENT_NAME = "which foot";
  private static final String TYPE_NAME = "typical";

  @Mock private CppTypeMapper typeMapper;

  @Mock(answer = Answers.RETURNS_DEEP_STUBS)
  private FMethod francaMethod;

  @Mock private FEnumerationType francaEnum;
  @Mock private FArgument francaArgument;

  private final CppComplexTypeRef cppCustomType = new CppComplexTypeRef.Builder(TYPE_NAME).build();

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);

    when(typeMapper.map(any(FTypedElement.class))).thenReturn(cppCustomType);

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
    CppMethodMapper.ReturnTypeData returnTypeData =
        CppMethodMapper.mapMethodReturnType(typeMapper, francaMethod);

    assertEquals(CppPrimitiveTypeRef.VOID, returnTypeData.type);
  }

  @Test
  public void mapMethodReturnTypeWithErrorType() {
    when(typeMapper.mapEnum(any())).thenReturn(cppCustomType);
    when(francaMethod.getErrorEnum()).thenReturn(francaEnum);

    CppMethodMapper.ReturnTypeData returnTypeData =
        CppMethodMapper.mapMethodReturnType(typeMapper, francaMethod);

    assertEquals(TYPE_NAME, returnTypeData.type.name);

    verify(typeMapper).mapEnum(francaEnum);
  }

  @Test
  public void mapMethodReturnTypeOneOutputArgument() {
    EList<FArgument> francaArguments = createFrancaArgumentsArray();
    when(francaMethod.getOutArgs()).thenReturn(francaArguments);

    CppMethodMapper.ReturnTypeData returnTypeData =
        CppMethodMapper.mapMethodReturnType(typeMapper, francaMethod);

    assertEquals(TYPE_NAME, returnTypeData.type.name);

    verify(typeMapper).map(francaArgument);
  }

  @Test
  public void mapMethodReturnTypeOneOutputArgumentWithErrorType() {
    when(typeMapper.mapEnum(any())).thenReturn(cppCustomType);

    EList<FArgument> francaArguments = createFrancaArgumentsArray();
    when(francaMethod.getOutArgs()).thenReturn(francaArguments);
    when(francaMethod.getErrorEnum()).thenReturn(francaEnum);

    CppMethodMapper.ReturnTypeData returnTypeData =
        CppMethodMapper.mapMethodReturnType(typeMapper, francaMethod);

    assertEquals(
        "here::internal::expected< " + TYPE_NAME + ", " + TYPE_NAME + " >",
        returnTypeData.type.name.toLowerCase());
    assertEquals("header for wrapper type included", 1, returnTypeData.type.includes.size());
    assertEquals(
        "correct include path",
        "cpp/internal/expected.h",
        returnTypeData.type.includes.iterator().next().fileName);

    verify(typeMapper).map(francaArgument);
    verify(typeMapper).mapEnum(francaEnum);
  }
}
