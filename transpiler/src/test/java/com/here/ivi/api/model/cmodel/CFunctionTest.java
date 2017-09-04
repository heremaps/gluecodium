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

package com.here.ivi.api.model.cmodel;

import static java.util.Arrays.asList;
import static java.util.Collections.singletonList;
import static org.junit.Assert.*;

import com.here.ivi.api.generator.cbridge.TypeConverter;
import java.util.List;
import org.junit.Before;
import org.junit.Test;

public class CFunctionTest {

  private CFunction.Builder builder;

  @Before
  public void setUp() {
    builder = new CFunction.Builder("FUNCTION_NAME");
  }

  @Test
  public void generateEmptyFunction() {
    CFunction function = builder.build();

    assertEquals("FUNCTION_NAME", function.name);
    assertEquals("By default function return void", function.returnType, CType.VOID);
    assertNull("By default return value conversion is null", function.returnConversion);
    assertEquals("For empty function there is no parameters", 0, function.parameters.size());
    assertEquals(
        "For empty function there is no parameter conversioins", 0, function.conversions.size());
    assertFalse("A new function by default is public", function.internalOnlyFunction);
  }

  @Test
  public void providedParametersArePropagatedToFunction() {
    CParameter param = new CParameter("FLAG", CType.BOOL);
    CFunction function = builder.parameters(singletonList(param)).build();

    assertNotNull("Function parameters should be not null", function.parameters);
    assertEquals("Function should have 1 input parameter", 1, function.parameters.size());
    assertSame(param, function.parameters.get(0));
  }

  @Test
  public void providedParametersCausesConversionsBeingCreated() {
    CParameter param = new CParameter("FLAG", CType.BOOL);
    CFunction function = builder.parameters(singletonList(param)).build();

    assertEquals(
        "As there is input parameter, conversion should be created",
        1,
        function.conversions.size());
    assertEquals(
        "Conversion should be named 'cpp_<param.name>'",
        "cpp_" + param.name,
        function.conversions.get(0).name);
    assertEquals(
        "Conversion should be identity -  conv_expr = <param.name>",
        param.name,
        function.conversions.get(0).expression);
  }

  @Test
  public void providedConversionIsPropagated() {
    CParameter param = new CParameter("FLAG", CType.BOOL);
    TypeConverter.TypeConversion conversion = new TypeConverter.TypeConversion("TEST_CONVERSION");
    param.conversion = conversion;
    CFunction function = builder.parameters(singletonList(param)).build();

    assertEquals(
        "As there is input parameter, conversion should be created",
        1,
        function.conversions.size());
    assertSame(conversion, function.conversions.get(0));
  }

  @Test
  public void providedReturnTypeIsPropagatedAndReturnConversionCreated() {
    CType returnType = CType.INT32;
    CFunction function = builder.returnType(returnType).build();
    assertSame(returnType, function.returnType);
    assertNotNull(function.returnConversion);
  }

  @Test
  public void providedReturnConversionIsPropagated() {
    TypeConverter.TypeConversion retConversion = new TypeConverter.TypeConversion("result");
    CFunction function = builder.returnConversion(retConversion).build();
    assertSame(retConversion, function.returnConversion);
  }

  @Test
  public void providedDelegateCallTemplateIsPropagated() {
    CFunction function = builder.delegateCallTemplate("delegateCall()").build();
    assertEquals("delegateCall()", function.delegateCall);
  }

  @Test
  public void delegateCallTemplateIsFormatedWithConversions() {
    List<CParameter> params =
        asList(new CParameter("param_1", CType.BOOL), new CParameter("param_2", CType.UINT8));

    CFunction function =
        builder.parameters(params).delegateCallTemplate("delegateCall(%1$s)").build();
    assertEquals("delegateCall(cpp_param_1)", function.delegateCall);

    function = builder.parameters(params).delegateCallTemplate("delegateCall(%2$s)").build();
    assertEquals("delegateCall(cpp_param_2)", function.delegateCall);

    function = builder.parameters(params).delegateCallTemplate("delegateCall(%2$s, %1$s)").build();
    assertEquals("delegateCall(cpp_param_2, cpp_param_1)", function.delegateCall);
  }
}
