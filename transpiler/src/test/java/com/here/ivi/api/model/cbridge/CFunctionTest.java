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

package com.here.ivi.api.model.cbridge;

import static java.util.Collections.singletonList;
import static org.junit.Assert.*;

import com.here.ivi.api.generator.cbridge.CppTypeInfo;
import com.here.ivi.api.generator.cbridge.CppTypeInfo.TypeCategory;
import org.junit.Before;
import org.junit.Test;

public class CFunctionTest {

  private CFunction.CFunctionBuilder builder;

  @Before
  public void setUp() {
    builder = CFunction.builder("FUNCTION_NAME");
  }

  @Test
  public void generateEmptyFunction() {
    CFunction function = builder.build();

    assertEquals("FUNCTION_NAME", function.name);
    assertEquals(
        "By default function return void", function.returnType.functionReturnType, CType.VOID);
    assertEquals("For empty function there is no parameters", 0, function.parameters.size());
  }

  @Test
  public void providedParametersArePropagatedToFunction() {
    CParameter param = new CParameter("FLAG", new CppTypeInfo(CType.BOOL));
    CFunction function = builder.parameters(singletonList(param)).build();

    assertNotNull("Function parameters should be not null", function.parameters);
    assertEquals("Function should have 1 input parameter", 1, function.parameters.size());
    assertSame(param, function.parameters.get(0));
  }

  @Test
  public void providedDelegateCallTemplateIsPropagated() {
    CFunction function = builder.delegateCall("delegateCall()").build();
    assertEquals("delegateCall()", function.delegateCall);
  }

  @Test
  public void errorIsNullIfNotProvided() {
    CFunction function = builder.build();

    assertNull(function.error);
  }

  @Test
  public void providedErrorIsPropagated() {
    CppTypeInfo error = new CppTypeInfo(new CType("SomeError"), TypeCategory.ENUM);

    CFunction function = builder.error(error).build();

    assertNotNull(function.error);
    assertSame(error, function.error);
  }

  @Test
  public void isReturningVoidForVoidFunction() {
    CFunction function = builder.build();

    assertTrue(function.isReturningVoid());
  }

  @Test
  public void isReturningVoidForNonVoidFunction() {
    CFunction function = builder.returnType(new CppTypeInfo(CType.FLOAT)).build();

    assertFalse(function.isReturningVoid());
  }
}
