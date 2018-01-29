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

import com.here.ivi.api.common.FrancaTypeHelper;
import com.here.ivi.api.model.common.BuiltInValueRules;
import com.here.ivi.api.model.common.Include;
import com.here.ivi.api.model.cpp.*;
import java.util.Optional;
import org.franca.core.franca.*;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.powermock.api.mockito.PowerMockito;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
@PrepareForTest({BuiltInValueRules.class, FrancaTypeHelper.class})
public final class CppValueMapperTest {

  @Mock private CppIncludeResolver includeResolver;

  private final Include internalInclude = Include.createInternalInclude("nonsense");

  private CppValueMapper valueMapper;

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);
    PowerMockito.mockStatic(BuiltInValueRules.class, FrancaTypeHelper.class);
    when(BuiltInValueRules.resolveReference(any())).thenReturn(Optional.empty());

    valueMapper = new CppValueMapper(includeResolver);

    when(includeResolver.resolveInclude(any())).thenReturn(internalInclude);
  }

  @Test
  public void mapConstantValue() {
    FConstantDef fConstant = mock(FConstantDef.class);
    when(fConstant.getName()).thenReturn("SomeFancyName");

    FQualifiedElementRef qualifiedElementRef = mock(FQualifiedElementRef.class);
    when(qualifiedElementRef.getElement()).thenReturn(fConstant);

    //actual test
    CppValue mappedValue = valueMapper.map(null, qualifiedElementRef);

    assertEquals("SOME_FANCY_NAME", mappedValue.name);
    assertTrue(mappedValue.includes.contains(internalInclude));
  }

  @Test
  public void mapEnumerator() {
    //constant
    final CppTypeRef cppType = new CppComplexTypeRef.Builder("MyFancyType").build();

    FEnumerator fEnumerator = mock(FEnumerator.class);
    when(fEnumerator.getName()).thenReturn("EnumeratorIn");

    FQualifiedElementRef qualifiedElementRef = mock(FQualifiedElementRef.class);
    when(qualifiedElementRef.getElement()).thenReturn(fEnumerator);

    //actual test
    CppValue mappedValue = valueMapper.map(cppType, qualifiedElementRef);

    assertEquals("MyFancyType::ENUMERATOR_IN", mappedValue.name);
    assertTrue(mappedValue.includes.contains(internalInclude));
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
