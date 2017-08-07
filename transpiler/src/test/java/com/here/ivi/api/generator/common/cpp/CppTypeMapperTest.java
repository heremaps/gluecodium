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
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import com.here.ivi.api.TranspilerExecutionException;
import com.here.ivi.api.model.common.Include;
import com.here.ivi.api.model.common.LazyInternalInclude;
import com.here.ivi.api.model.cppmodel.CppComplexTypeRef;
import com.here.ivi.api.model.cppmodel.CppPrimitiveTypeRef;
import com.here.ivi.api.model.cppmodel.CppTypeInfo;
import com.here.ivi.api.model.cppmodel.CppTypeRef;
import com.here.ivi.api.model.franca.DefinedBy;
import com.here.ivi.api.model.franca.FrancaElement;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import org.franca.core.franca.FBasicTypeId;
import org.franca.core.franca.FStructType;
import org.franca.core.franca.FTypeCollection;
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
@PrepareForTest({CppNamespaceUtils.class, DefinedBy.class})
public class CppTypeMapperTest {

  private static final String STRUCT_NAME = "MyStruct";

  @Rule public ExpectedException exception = ExpectedException.none();

  @Mock(answer = Answers.RETURNS_DEEP_STUBS)
  private FrancaElement<?> mockFrancaModel;

  @Mock(answer = Answers.RETURNS_DEEP_STUBS)
  private FStructType structType;

  @Mock private FTypeCollection fTypeCollection;

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);
    PowerMockito.mockStatic(CppNamespaceUtils.class);
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

  @Test
  public void mapStringType() {
    FTypeRef typeRef = mockPredefinedType(FBasicTypeId.STRING);

    CppTypeRef cppType = CppTypeMapper.map(mockFrancaModel, typeRef);

    assertTrue(cppType instanceof CppComplexTypeRef);
    CppComplexTypeRef customType = (CppComplexTypeRef) cppType;
    assertEquals(CppComplexTypeRef.STRING_TYPE_NAME, customType.name);
    assertEquals(CppTypeInfo.Complex, customType.info);
    assertEquals(new HashSet<>(Arrays.asList(CppLibraryIncludes.STRING)), customType.includes);
  }

  @Test
  public void mapByteBufferType() {
    FTypeRef typeRef = mockPredefinedType(FBasicTypeId.BYTE_BUFFER);

    CppTypeRef cppType = CppTypeMapper.map(mockFrancaModel, typeRef);

    assertTrue(cppType instanceof CppComplexTypeRef);
    CppComplexTypeRef customType = (CppComplexTypeRef) cppType;
    assertEquals("std::vector< uint8_t >", customType.name);
    assertEquals(CppTypeInfo.Complex, customType.info);
    assertEquals(
        new HashSet<>(Arrays.asList(CppLibraryIncludes.VECTOR, INT_TYPES)), customType.includes);
  }

  @Test
  public void mapEmptyStruct() {
    FTypeRef typeRef = mock(FTypeRef.class);
    exception.expect(TranspilerExecutionException.class);
    when(typeRef.getDerived()).thenReturn(structType);
    when(structType.getElements().isEmpty()).thenReturn(true);

    CppTypeMapper.map(mockFrancaModel, typeRef);
  }

  @Test
  public void mapNonEmptyStruct() {
    FTypeRef typeRef = mock(FTypeRef.class);
    //type reference and struct
    when(typeRef.getDerived()).thenReturn(structType);
    when(structType.getElements().isEmpty()).thenReturn(false);
    //add typeCollection to hierarchy
    when(structType.eContainer()).thenReturn(fTypeCollection);

    //cpp namespace utils
    when(CppNamespaceUtils.getCppTypename(mockFrancaModel, structType)).thenReturn(STRUCT_NAME);

    //DefinedBy's constructor is private, so static creator method is excluded from mocking
    //and utilized to create an instance of DefinedBy
    when(mockFrancaModel.getFrancaTypeCollection()).thenReturn(fTypeCollection);
    PowerMockito.doCallRealMethod().when(DefinedBy.class);
    DefinedBy.createFromFrancaElement(any(FrancaElement.class));
    DefinedBy defined = DefinedBy.createFromFrancaElement(mockFrancaModel);
    when(DefinedBy.createFromFModelElement(any())).thenReturn(defined);

    //act
    CppTypeRef result = CppTypeMapper.map(mockFrancaModel, typeRef);

    //assert
    assertEquals(STRUCT_NAME, result.name);
    assertTrue(result instanceof CppComplexTypeRef);
    CppComplexTypeRef complexResult = (CppComplexTypeRef) result;
    assertEquals(CppTypeInfo.Complex, complexResult.info);
    assertEquals(1, complexResult.includes.size());
    assertTrue(complexResult.includes.iterator().next() instanceof LazyInternalInclude);
    PowerMockito.verifyStatic();
    DefinedBy.createFromFModelElement(structType);
    PowerMockito.verifyStatic();
    CppNamespaceUtils.getCppTypename(mockFrancaModel, structType);
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
