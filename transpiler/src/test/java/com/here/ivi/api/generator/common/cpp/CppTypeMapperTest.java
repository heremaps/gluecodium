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

import static com.here.ivi.api.generator.common.cpp.CppLibraryIncludes.INT_TYPES;
import static junit.framework.TestCase.assertTrue;
import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import com.here.ivi.api.model.common.Includes;
import com.here.ivi.api.model.cppmodel.CppCustomType;
import com.here.ivi.api.model.cppmodel.CppElements;
import com.here.ivi.api.model.cppmodel.CppPrimitiveType;
import com.here.ivi.api.model.cppmodel.CppType;
import com.here.ivi.api.model.franca.FrancaElement;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import org.franca.core.franca.FBasicTypeId;
import org.franca.core.franca.FTypeRef;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Answers;
import org.mockito.Mock;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
public class CppTypeMapperTest {

  @Mock(answer = Answers.RETURNS_DEEP_STUBS)
  private FrancaElement<?> mockFrancaModel;

  @Test
  public void mapBoolType() {
    FTypeRef typeRef = mockPredefinedType(FBasicTypeId.BOOLEAN);

    CppType cppType = CppTypeMapper.map(mockFrancaModel, typeRef);

    verifyPrimitiveType(cppType, CppPrimitiveType.Type.BOOL, Collections.emptyList());
  }

  @Test
  public void mapFloatType() {
    FTypeRef typeRef = mockPredefinedType(FBasicTypeId.FLOAT);

    CppType cppType = CppTypeMapper.map(mockFrancaModel, typeRef);

    verifyPrimitiveType(cppType, CppPrimitiveType.Type.FLOAT, Collections.emptyList());
  }

  @Test
  public void mapDoubleType() {
    FTypeRef typeRef = mockPredefinedType(FBasicTypeId.DOUBLE);

    CppType cppType = CppTypeMapper.map(mockFrancaModel, typeRef);

    verifyPrimitiveType(cppType, CppPrimitiveType.Type.DOUBLE, Collections.emptyList());
  }

  @Test
  public void mapInt8Type() {
    FTypeRef typeRef = mockPredefinedType(FBasicTypeId.INT8);

    CppType cppType = CppTypeMapper.map(mockFrancaModel, typeRef);

    verifyPrimitiveType(
        cppType, CppPrimitiveType.Type.INT8, Arrays.asList(CppLibraryIncludes.INT_TYPES));
  }

  @Test
  public void mapInt16Type() {
    FTypeRef typeRef = mockPredefinedType(FBasicTypeId.INT16);

    CppType cppType = CppTypeMapper.map(mockFrancaModel, typeRef);

    verifyPrimitiveType(
        cppType, CppPrimitiveType.Type.INT16, Arrays.asList(CppLibraryIncludes.INT_TYPES));
  }

  @Test
  public void mapInt32Type() {
    FTypeRef typeRef = mockPredefinedType(FBasicTypeId.INT32);

    CppType cppType = CppTypeMapper.map(mockFrancaModel, typeRef);

    verifyPrimitiveType(
        cppType, CppPrimitiveType.Type.INT32, Arrays.asList(CppLibraryIncludes.INT_TYPES));
  }

  @Test
  public void mapInt64Type() {
    FTypeRef typeRef = mockPredefinedType(FBasicTypeId.INT64);

    CppType cppType = CppTypeMapper.map(mockFrancaModel, typeRef);

    verifyPrimitiveType(
        cppType, CppPrimitiveType.Type.INT64, Arrays.asList(CppLibraryIncludes.INT_TYPES));
  }

  @Test
  public void mapUInt8Type() {
    FTypeRef typeRef = mockPredefinedType(FBasicTypeId.UINT8);

    CppType cppType = CppTypeMapper.map(mockFrancaModel, typeRef);

    verifyPrimitiveType(
        cppType, CppPrimitiveType.Type.UINT8, Arrays.asList(CppLibraryIncludes.INT_TYPES));
  }

  @Test
  public void mapUInt16Type() {
    FTypeRef typeRef = mockPredefinedType(FBasicTypeId.UINT16);

    CppType cppType = CppTypeMapper.map(mockFrancaModel, typeRef);

    verifyPrimitiveType(
        cppType, CppPrimitiveType.Type.UINT16, Arrays.asList(CppLibraryIncludes.INT_TYPES));
  }

  @Test
  public void mapUInt32Type() {
    FTypeRef typeRef = mockPredefinedType(FBasicTypeId.UINT32);

    CppType cppType = CppTypeMapper.map(mockFrancaModel, typeRef);

    verifyPrimitiveType(
        cppType, CppPrimitiveType.Type.UINT32, Arrays.asList(CppLibraryIncludes.INT_TYPES));
  }

  @Test
  public void mapUInt64Type() {
    FTypeRef typeRef = mockPredefinedType(FBasicTypeId.UINT64);

    CppType cppType = CppTypeMapper.map(mockFrancaModel, typeRef);

    verifyPrimitiveType(
        cppType, CppPrimitiveType.Type.UINT64, Arrays.asList(CppLibraryIncludes.INT_TYPES));
  }

  @Test
  public void mapStringType() {
    FTypeRef typeRef = mockPredefinedType(FBasicTypeId.STRING);

    CppType cppType = CppTypeMapper.map(mockFrancaModel, typeRef);

    assertTrue(cppType instanceof CppCustomType);
    CppCustomType customType = (CppCustomType) cppType;
    assertEquals(CppCustomType.STRING_TYPE_NAME, customType.name);
    assertEquals(CppElements.TypeInfo.Complex, customType.info);
    assertEquals(new HashSet<>(Arrays.asList(CppLibraryIncludes.STRING)), customType.includes);
  }

  @Test
  public void mapByteBufferType() {
    FTypeRef typeRef = mockPredefinedType(FBasicTypeId.BYTE_BUFFER);

    CppType cppType = CppTypeMapper.map(mockFrancaModel, typeRef);

    assertTrue(cppType instanceof CppCustomType);
    CppCustomType customType = (CppCustomType) cppType;
    assertEquals("std::vector< uint8_t >", customType.name);
    assertEquals(CppElements.TypeInfo.Complex, customType.info);
    assertEquals(
        new HashSet<>(Arrays.asList(CppLibraryIncludes.VECTOR, INT_TYPES)), customType.includes);
  }

  private FTypeRef mockPredefinedType(FBasicTypeId predefinedType) {
    FTypeRef typeRef = mock(FTypeRef.class);
    when(typeRef.getPredefined()).thenReturn(predefinedType);
    return typeRef;
  }

  private void verifyPrimitiveType(
      CppType actual, CppPrimitiveType.Type expectedType, List<Includes.SystemInclude> includes) {
    assertTrue(actual instanceof CppPrimitiveType);
    CppPrimitiveType primitiveType = (CppPrimitiveType) actual;
    assertEquals(expectedType, primitiveType.type);
    assertEquals(new HashSet<>(includes), primitiveType.includes);
  }
}
