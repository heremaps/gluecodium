/*
 * Copyright (C) 2016-2018 HERE Europe B.V.
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

package com.here.genium.model.cbridge;

import static java.util.Collections.singletonList;
import static org.junit.Assert.*;

import com.here.genium.generator.cbridge.CppTypeInfo;
import com.here.genium.generator.cbridge.CppTypeInfo.TypeCategory;
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
