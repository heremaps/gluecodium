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

import com.here.ivi.api.model.cppmodel.CppComplexTypeRef;
import com.here.ivi.api.model.cppmodel.CppParameter;
import com.here.ivi.api.model.cppmodel.CppPrimitiveTypeRef;
import com.here.ivi.api.test.ArrayEList;
import java.util.Collections;
import org.franca.core.franca.FEnumerationType;
import org.franca.core.franca.FMethod;
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
  private static final String TYPE_NAME = "typical";

  @Mock(answer = Answers.RETURNS_DEEP_STUBS)
  private FMethod francaMethod;

  @Mock private FEnumerationType francaEnum;

  private final CppComplexTypeRef cppCustomType = new CppComplexTypeRef.Builder(TYPE_NAME).build();
  private final CppParameter cppParameter = new CppParameter("nonsense", cppCustomType);

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);

    when(francaMethod.getErrorEnum()).thenReturn(null);
    when(francaMethod.getOutArgs()).thenReturn(new ArrayEList<>());
    when(francaMethod.getName()).thenReturn(METHOD_NAME);
  }

  @Test
  public void mapMethodReturnTypeNoArguments() {
    CppMethodMapper.ReturnTypeData returnTypeData =
        CppMethodMapper.mapMethodReturnType(francaMethod, Collections.emptyList(), null);

    assertEquals(CppPrimitiveTypeRef.VOID, returnTypeData.type);
  }

  @Test
  public void mapMethodReturnTypeWithErrorType() {
    when(francaMethod.getErrorEnum()).thenReturn(francaEnum);

    CppMethodMapper.ReturnTypeData returnTypeData =
        CppMethodMapper.mapMethodReturnType(francaMethod, Collections.emptyList(), cppCustomType);

    assertEquals(cppCustomType, returnTypeData.type);
  }

  @Test
  public void mapMethodReturnTypeOneOutputArgument() {
    CppMethodMapper.ReturnTypeData returnTypeData =
        CppMethodMapper.mapMethodReturnType(
            francaMethod, Collections.singletonList(cppParameter), null);

    assertEquals(cppCustomType, returnTypeData.type);
  }

  @Test
  public void mapMethodReturnTypeOneOutputArgumentWithErrorType() {
    when(francaMethod.getErrorEnum()).thenReturn(francaEnum);

    CppMethodMapper.ReturnTypeData returnTypeData =
        CppMethodMapper.mapMethodReturnType(
            francaMethod, Collections.singletonList(cppParameter), cppCustomType);

    assertEquals(
        "here::internal::expected< " + TYPE_NAME + ", " + TYPE_NAME + " >",
        returnTypeData.type.name.toLowerCase());
    assertEquals("header for wrapper type included", 1, returnTypeData.type.includes.size());
    assertEquals(
        "correct include path",
        "cpp/internal/expected.h",
        returnTypeData.type.includes.iterator().next().fileName);
  }
}
