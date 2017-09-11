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

import static junit.framework.TestCase.assertTrue;
import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import com.here.ivi.api.model.common.Include;
import com.here.ivi.api.model.cppmodel.CppComplexTypeRef;
import com.here.ivi.api.model.cppmodel.CppPrimitiveTypeRef;
import com.here.ivi.api.model.cppmodel.CppTypeRef;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import org.franca.core.franca.FBasicTypeId;
import org.franca.core.franca.FMapType;
import org.franca.core.franca.FTypeRef;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.ExpectedException;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;
import org.mockito.Answers;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

@RunWith(JUnit4.class)
public class CppTypeMapperTest {

  @Rule public ExpectedException exception = ExpectedException.none();

  @Mock private FTypeRef francaTypeRef;

  private final CppTypeMapper typeMapper = new CppTypeMapper(null);

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);
  }

  @Test
  public void mapBoolType() {
    when(francaTypeRef.getPredefined()).thenReturn(FBasicTypeId.BOOLEAN);

    CppTypeRef cppType = typeMapper.map(francaTypeRef);

    verifyPrimitiveType(cppType, CppPrimitiveTypeRef.Type.BOOL, Collections.emptyList());
  }

  @Test
  public void mapFloatType() {
    when(francaTypeRef.getPredefined()).thenReturn(FBasicTypeId.FLOAT);

    CppTypeRef cppType = typeMapper.map(francaTypeRef);

    verifyPrimitiveType(cppType, CppPrimitiveTypeRef.Type.FLOAT, Collections.emptyList());
  }

  @Test
  public void mapDoubleType() {
    when(francaTypeRef.getPredefined()).thenReturn(FBasicTypeId.DOUBLE);

    CppTypeRef cppType = typeMapper.map(francaTypeRef);

    verifyPrimitiveType(cppType, CppPrimitiveTypeRef.Type.DOUBLE, Collections.emptyList());
  }

  @Test
  public void mapInt8Type() {
    when(francaTypeRef.getPredefined()).thenReturn(FBasicTypeId.INT8);

    CppTypeRef cppType = typeMapper.map(francaTypeRef);

    verifyPrimitiveType(
        cppType,
        CppPrimitiveTypeRef.Type.INT8,
        Collections.singletonList(CppLibraryIncludes.INT_TYPES));
  }

  @Test
  public void mapInt16Type() {
    when(francaTypeRef.getPredefined()).thenReturn(FBasicTypeId.INT16);

    CppTypeRef cppType = typeMapper.map(francaTypeRef);

    verifyPrimitiveType(
        cppType,
        CppPrimitiveTypeRef.Type.INT16,
        Collections.singletonList(CppLibraryIncludes.INT_TYPES));
  }

  @Test
  public void mapInt32Type() {
    when(francaTypeRef.getPredefined()).thenReturn(FBasicTypeId.INT32);

    CppTypeRef cppType = typeMapper.map(francaTypeRef);

    verifyPrimitiveType(
        cppType,
        CppPrimitiveTypeRef.Type.INT32,
        Collections.singletonList(CppLibraryIncludes.INT_TYPES));
  }

  @Test
  public void mapInt64Type() {
    when(francaTypeRef.getPredefined()).thenReturn(FBasicTypeId.INT64);

    CppTypeRef cppType = typeMapper.map(francaTypeRef);

    verifyPrimitiveType(
        cppType,
        CppPrimitiveTypeRef.Type.INT64,
        Collections.singletonList(CppLibraryIncludes.INT_TYPES));
  }

  @Test
  public void mapUInt8Type() {
    when(francaTypeRef.getPredefined()).thenReturn(FBasicTypeId.UINT8);

    CppTypeRef cppType = typeMapper.map(francaTypeRef);

    verifyPrimitiveType(
        cppType,
        CppPrimitiveTypeRef.Type.UINT8,
        Collections.singletonList(CppLibraryIncludes.INT_TYPES));
  }

  @Test
  public void mapUInt16Type() {
    when(francaTypeRef.getPredefined()).thenReturn(FBasicTypeId.UINT16);

    CppTypeRef cppType = typeMapper.map(francaTypeRef);

    verifyPrimitiveType(
        cppType,
        CppPrimitiveTypeRef.Type.UINT16,
        Collections.singletonList(CppLibraryIncludes.INT_TYPES));
  }

  @Test
  public void mapUInt32Type() {
    when(francaTypeRef.getPredefined()).thenReturn(FBasicTypeId.UINT32);

    CppTypeRef cppType = typeMapper.map(francaTypeRef);

    verifyPrimitiveType(
        cppType,
        CppPrimitiveTypeRef.Type.UINT32,
        Collections.singletonList(CppLibraryIncludes.INT_TYPES));
  }

  @Test
  public void mapUInt64Type() {
    when(francaTypeRef.getPredefined()).thenReturn(FBasicTypeId.UINT64);

    CppTypeRef cppType = typeMapper.map(francaTypeRef);

    verifyPrimitiveType(
        cppType,
        CppPrimitiveTypeRef.Type.UINT64,
        Collections.singletonList(CppLibraryIncludes.INT_TYPES));
  }

  @Test
  public void mapMapType() {
    FMapType francaMapType = mock(FMapType.class, Answers.RETURNS_DEEP_STUBS);
    when(francaMapType.getKeyType().getDerived()).thenReturn(null);
    when(francaMapType.getValueType().getDerived()).thenReturn(null);
    when(francaMapType.getKeyType().getPredefined()).thenReturn(FBasicTypeId.UINT32);
    when(francaMapType.getValueType().getPredefined()).thenReturn(FBasicTypeId.STRING);

    CppComplexTypeRef result = typeMapper.mapMapType(francaMapType);

    assertEquals("::std::unordered_map< uint32_t, ::std::string >", result.name);
    assertTrue(result.includes.contains(CppLibraryIncludes.INT_TYPES));
    assertTrue(result.includes.contains(CppLibraryIncludes.STRING));
    assertTrue(result.includes.contains(CppLibraryIncludes.MAP));
  }

  private void verifyPrimitiveType(
      CppTypeRef actual, CppPrimitiveTypeRef.Type expectedType, List<Include> includes) {
    assertTrue(actual instanceof CppPrimitiveTypeRef);
    CppPrimitiveTypeRef primitiveType = (CppPrimitiveTypeRef) actual;
    assertEquals(expectedType, primitiveType.type);
    assertEquals(new HashSet<>(includes), primitiveType.includes);
  }
}
