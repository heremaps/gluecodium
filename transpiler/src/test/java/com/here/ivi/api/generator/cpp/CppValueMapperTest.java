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

package com.here.ivi.api.generator.cpp;

import static org.junit.Assert.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import com.here.ivi.api.model.common.Include;
import com.here.ivi.api.model.cpp.*;
import org.franca.core.franca.*;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

@RunWith(JUnit4.class)
public final class CppValueMapperTest {

  @Mock private CppIncludeResolver includeResolver;

  private final Include internalInclude = Include.createInternalInclude("nonsense");

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);

    when(includeResolver.resolveInclude(any())).thenReturn(internalInclude);
  }

  @Test
  public void mapNonConstantValue() {
    FQualifiedElementRef qualifiedElementRef = mock(FQualifiedElementRef.class);

    CppValue mappedValue = CppValueMapper.map(qualifiedElementRef);

    assertNull(mappedValue);
  }

  @Test
  public void mapDeploymentDefaultValueForString() {
    CppTypeRef cppTypeRef = CppTypeMapper.STRING_TYPE;

    CppValue result =
        CppValueMapper.mapDeploymentDefaultValue(cppTypeRef, "\\Jonny \"Magic\" Smith\n");

    assertEquals("\"\\\\Jonny \\\"Magic\\\" Smith\\n\"", result.name);
  }

  @Test
  public void mapDeploymentDefaultValueForEnum() {
    CppTypeRef cppTypeRef = new CppComplexTypeRef.Builder("SomeType").refersToEnum(true).build();

    CppValue result = CppValueMapper.mapDeploymentDefaultValue(cppTypeRef, "SomeString");

    assertEquals("SomeType::SOME_STRING", result.name);
  }

  @Test
  public void mapDeploymentDefaultValueForInteger() {
    CppTypeRef cppTypeRef = CppPrimitiveTypeRef.UINT64;

    CppValue result = CppValueMapper.mapDeploymentDefaultValue(cppTypeRef, "SomeString");

    assertEquals("SomeString", result.name);
  }
}
