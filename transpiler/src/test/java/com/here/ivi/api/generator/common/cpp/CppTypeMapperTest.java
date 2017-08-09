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

package com.here.ivi.api.generator.common.cpp;

import static junit.framework.TestCase.assertTrue;
import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import com.here.ivi.api.model.common.Include;
import com.here.ivi.api.model.cppmodel.CppPrimitiveTypeRef;
import com.here.ivi.api.model.cppmodel.CppTypeRef;
import com.here.ivi.api.model.franca.DefinedBy;
import com.here.ivi.api.model.franca.FrancaElement;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import org.franca.core.franca.FBasicTypeId;
import org.franca.core.franca.FTypeRef;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.ExpectedException;
import org.junit.runner.RunWith;
import org.mockito.Answers;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.powermock.api.mockito.PowerMockito;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
@PrepareForTest(DefinedBy.class)
public class CppTypeMapperTest {

  @Rule public ExpectedException exception = ExpectedException.none();

  @Mock(answer = Answers.RETURNS_DEEP_STUBS)
  private FrancaElement<?> mockFrancaModel;

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);
    PowerMockito.mockStatic(DefinedBy.class);
  }

  @Test
  public void mapBoolType() {
    FTypeRef typeRef = mockPredefinedType(FBasicTypeId.BOOLEAN);

    CppTypeRef cppType = CppTypeMapper.map(mockFrancaModel, typeRef);

    verifyPrimitiveType(cppType, CppPrimitiveTypeRef.Type.BOOL, Collections.emptyList());
  }

  @Test
  public void mapFloatType() {
    FTypeRef typeRef = mockPredefinedType(FBasicTypeId.FLOAT);

    CppTypeRef cppType = CppTypeMapper.map(mockFrancaModel, typeRef);

    verifyPrimitiveType(cppType, CppPrimitiveTypeRef.Type.FLOAT, Collections.emptyList());
  }

  @Test
  public void mapDoubleType() {
    FTypeRef typeRef = mockPredefinedType(FBasicTypeId.DOUBLE);

    CppTypeRef cppType = CppTypeMapper.map(mockFrancaModel, typeRef);

    verifyPrimitiveType(cppType, CppPrimitiveTypeRef.Type.DOUBLE, Collections.emptyList());
  }

  @Test
  public void mapInt8Type() {
    FTypeRef typeRef = mockPredefinedType(FBasicTypeId.INT8);

    CppTypeRef cppType = CppTypeMapper.map(mockFrancaModel, typeRef);

    verifyPrimitiveType(
        cppType, CppPrimitiveTypeRef.Type.INT8, Arrays.asList(CppLibraryIncludes.INT_TYPES));
  }

  @Test
  public void mapInt16Type() {
    FTypeRef typeRef = mockPredefinedType(FBasicTypeId.INT16);

    CppTypeRef cppType = CppTypeMapper.map(mockFrancaModel, typeRef);

    verifyPrimitiveType(
        cppType, CppPrimitiveTypeRef.Type.INT16, Arrays.asList(CppLibraryIncludes.INT_TYPES));
  }

  @Test
  public void mapInt32Type() {
    FTypeRef typeRef = mockPredefinedType(FBasicTypeId.INT32);

    CppTypeRef cppType = CppTypeMapper.map(mockFrancaModel, typeRef);

    verifyPrimitiveType(
        cppType, CppPrimitiveTypeRef.Type.INT32, Arrays.asList(CppLibraryIncludes.INT_TYPES));
  }

  @Test
  public void mapInt64Type() {
    FTypeRef typeRef = mockPredefinedType(FBasicTypeId.INT64);

    CppTypeRef cppType = CppTypeMapper.map(mockFrancaModel, typeRef);

    verifyPrimitiveType(
        cppType, CppPrimitiveTypeRef.Type.INT64, Arrays.asList(CppLibraryIncludes.INT_TYPES));
  }

  @Test
  public void mapUInt8Type() {
    FTypeRef typeRef = mockPredefinedType(FBasicTypeId.UINT8);

    CppTypeRef cppType = CppTypeMapper.map(mockFrancaModel, typeRef);

    verifyPrimitiveType(
        cppType, CppPrimitiveTypeRef.Type.UINT8, Arrays.asList(CppLibraryIncludes.INT_TYPES));
  }

  @Test
  public void mapUInt16Type() {
    FTypeRef typeRef = mockPredefinedType(FBasicTypeId.UINT16);

    CppTypeRef cppType = CppTypeMapper.map(mockFrancaModel, typeRef);

    verifyPrimitiveType(
        cppType, CppPrimitiveTypeRef.Type.UINT16, Arrays.asList(CppLibraryIncludes.INT_TYPES));
  }

  @Test
  public void mapUInt32Type() {
    FTypeRef typeRef = mockPredefinedType(FBasicTypeId.UINT32);

    CppTypeRef cppType = CppTypeMapper.map(mockFrancaModel, typeRef);

    verifyPrimitiveType(
        cppType, CppPrimitiveTypeRef.Type.UINT32, Arrays.asList(CppLibraryIncludes.INT_TYPES));
  }

  @Test
  public void mapUInt64Type() {
    FTypeRef typeRef = mockPredefinedType(FBasicTypeId.UINT64);

    CppTypeRef cppType = CppTypeMapper.map(mockFrancaModel, typeRef);

    verifyPrimitiveType(
        cppType, CppPrimitiveTypeRef.Type.UINT64, Arrays.asList(CppLibraryIncludes.INT_TYPES));
  }

  private FTypeRef mockPredefinedType(FBasicTypeId predefinedType) {
    FTypeRef typeRef = mock(FTypeRef.class);
    when(typeRef.getPredefined()).thenReturn(predefinedType);
    return typeRef;
  }

  private void verifyPrimitiveType(
      CppTypeRef actual, CppPrimitiveTypeRef.Type expectedType, List<Include> includes) {
    assertTrue(actual instanceof CppPrimitiveTypeRef);
    CppPrimitiveTypeRef primitiveType = (CppPrimitiveTypeRef) actual;
    assertEquals(expectedType, primitiveType.type);
    assertEquals(new HashSet<>(includes), primitiveType.includes);
  }
}
