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

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;
import static org.powermock.api.mockito.PowerMockito.doCallRealMethod;
import static org.powermock.api.mockito.PowerMockito.mockStatic;
import static org.powermock.api.mockito.PowerMockito.verifyStatic;
import static org.powermock.api.mockito.PowerMockito.whenNew;

import com.here.ivi.api.TranspilerExecutionException;
import com.here.ivi.api.model.common.LazyInternalInclude;
import com.here.ivi.api.model.cppmodel.CppComplexTypeRef;
import com.here.ivi.api.model.cppmodel.CppPrimitiveTypeRef;
import com.here.ivi.api.model.cppmodel.CppTypeDefRef;
import com.here.ivi.api.model.cppmodel.CppTypeRef;
import com.here.ivi.api.model.franca.DefinedBy;
import com.here.ivi.api.model.franca.FrancaElement;
import java.util.Arrays;
import java.util.LinkedList;
import org.franca.core.franca.FArrayType;
import org.franca.core.franca.FBasicTypeId;
import org.franca.core.franca.FEnumerationType;
import org.franca.core.franca.FIntegerInterval;
import org.franca.core.franca.FStructType;
import org.franca.core.franca.FTypeCollection;
import org.franca.core.franca.FTypeDef;
import org.franca.core.franca.FTypeRef;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.ExpectedException;
import org.junit.runner.RunWith;
import org.mockito.Answers;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
@PrepareForTest({DefinedBy.class, CppTypeMapper.class, CppNameRules.class})
public class CppTypeMapperComplexTest {

  private static final String STRUCT_NAME = "MYSTRUCT";
  private static final String ENUM_NAME = "MYENUMERATION";
  private static final String TYPEDEF_NAME = "MYTYPEDEF";

  @Rule public ExpectedException exception = ExpectedException.none();

  @Mock(answer = Answers.RETURNS_DEEP_STUBS)
  private FrancaElement<?> mockFrancaModel;

  @Mock(answer = Answers.RETURNS_DEEP_STUBS)
  private FStructType structType;

  @Mock(answer = Answers.RETURNS_DEEP_STUBS)
  private FEnumerationType enumType;

  @Mock private FTypeCollection fTypeCollection;

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);
    mockStatic(CppNameRules.class);
    mockStatic(DefinedBy.class);
  }

  @Test
  public void mapStringType() {
    //arrange
    FTypeRef typeRef = mockPredefinedType(FBasicTypeId.STRING);

    //act
    CppTypeRef cppType = CppTypeMapper.map(mockFrancaModel, typeRef);

    //assert
    assertTrue(cppType instanceof CppComplexTypeRef);
    CppComplexTypeRef expectedTypeRef = (CppComplexTypeRef) cppType;
    assertEquals(CppComplexTypeRef.STRING_TYPE_NAME, expectedTypeRef.name);
    assertEquals(1, expectedTypeRef.includes.size());
    assertTrue(expectedTypeRef.includes.contains(CppLibraryIncludes.STRING));
  }

  @Test
  public void mapByteBufferType() {
    //arrange
    FTypeRef typeRef = mockPredefinedType(FBasicTypeId.BYTE_BUFFER);

    //act
    CppTypeRef cppType = CppTypeMapper.map(mockFrancaModel, typeRef);

    //assert
    assertTrue(cppType instanceof CppComplexTypeRef);
    CppComplexTypeRef expectedTypeRef = (CppComplexTypeRef) cppType;
    assertEquals(CppComplexTypeRef.BYTE_VECTOR_TYPE_NAME, expectedTypeRef.name);
    assertEquals(2, expectedTypeRef.includes.size());
    assertTrue(expectedTypeRef.includes.contains(CppLibraryIncludes.INT_TYPES));
    assertTrue(expectedTypeRef.includes.contains(CppLibraryIncludes.VECTOR));
  }

  @Test
  public void mapNonEmptyStruct() throws Exception {

    //mock franca related stuff
    FTypeRef typeRef = mock(FTypeRef.class);
    when(typeRef.getDerived()).thenReturn(structType);
    when(structType.getName()).thenReturn(STRUCT_NAME);
    when(structType.getElements().isEmpty()).thenReturn(false);

    when(mockFrancaModel.getFrancaTypeCollection()).thenReturn(fTypeCollection);
    DefinedBy defined = mockDefinedBy();
    LazyInternalInclude lazyInclude = mockLazyInclude(defined);

    //mock CppNameRules
    when(CppNameRules.getStructName(structType.getName())).thenReturn(STRUCT_NAME);
    when(CppNameRules.getNestedNameSpecifier(structType)).thenReturn(Arrays.asList("a", "b", "c"));

    //act
    CppTypeRef result = CppTypeMapper.map(mockFrancaModel, typeRef);

    //assert
    assertTrue(result instanceof CppComplexTypeRef);
    CppComplexTypeRef complexResult = (CppComplexTypeRef) result;
    assertEquals("::a::b::c::" + STRUCT_NAME, complexResult.name);
    assertEquals(1, complexResult.includes.size());
    assertTrue(complexResult.includes.contains(lazyInclude));

    //verify
    verifyStatic();
    DefinedBy.createFromFModelElement(structType);
  }

  @Test
  public void mapNonEmptyEnum() throws Exception {

    //mock type reference
    FTypeRef typeRef = mock(FTypeRef.class);
    when(typeRef.getDerived()).thenReturn(enumType);
    when(enumType.getName()).thenReturn(ENUM_NAME);
    when(enumType.getEnumerators().isEmpty()).thenReturn(false);

    when(mockFrancaModel.getFrancaTypeCollection()).thenReturn(fTypeCollection);
    DefinedBy defined = mockDefinedBy();
    LazyInternalInclude lazyInclude = mockLazyInclude(defined);

    //mock CppNameRules
    when(CppNameRules.getEnumName(enumType.getName())).thenReturn(ENUM_NAME);
    when(CppNameRules.getNestedNameSpecifier(enumType)).thenReturn(new LinkedList<>());

    CppTypeRef result = CppTypeMapper.map(mockFrancaModel, typeRef);

    //assert
    assertTrue(result instanceof CppComplexTypeRef);
    CppComplexTypeRef complexResult = (CppComplexTypeRef) result;
    assertEquals("::" + ENUM_NAME, complexResult.name);
    assertEquals(1, complexResult.includes.size());
    assertTrue(complexResult.includes.contains(lazyInclude));

    //verify
    verifyStatic();
    DefinedBy.createFromFModelElement(enumType);
  }

  @Test
  public void mapIntegerRangeTypeThrowsTranspilerException() {
    //mock type reference
    FTypeRef typeRef = mock(FTypeRef.class);
    FIntegerInterval intervalType = mock(FIntegerInterval.class);
    when(typeRef.getPredefined()).thenReturn(FBasicTypeId.UNDEFINED);
    when(typeRef.getInterval()).thenReturn(intervalType);

    // pre-verify expected exceptipon
    exception.expect(TranspilerExecutionException.class);

    //act
    CppTypeMapper.map(mockFrancaModel, typeRef);
  }

  @Test
  public void mapArrayTypeRef() {
    // Arrange
    FTypeRef fTypeRefDouble = mockPredefinedType(FBasicTypeId.DOUBLE);
    FArrayType fArrayType = mock(FArrayType.class);
    when(fArrayType.getElementType()).thenReturn(fTypeRefDouble);
    FTypeRef typeRef = mock(FTypeRef.class);
    when(typeRef.getDerived()).thenReturn(fArrayType);
    when(fArrayType.eContainer()).thenReturn(typeRef);

    CppComplexTypeRef expected = new CppComplexTypeRef.Builder("::std::vector< double >").build();

    // Act
    CppTypeRef result = CppTypeMapper.map(mockFrancaModel, typeRef);

    // Assert
    assertTrue(result instanceof CppComplexTypeRef);
    CppComplexTypeRef complexResult = (CppComplexTypeRef) result;
    assertEquals(expected, complexResult);
    assertTrue(complexResult.includes.contains(CppLibraryIncludes.VECTOR));
  }

  @Test
  public void mapTypeDefRef() {
    // Arrange
    FTypeDef fTypeDef = mock(FTypeDef.class);
    FTypeRef fActualType = mockPredefinedType(FBasicTypeId.INT64);
    when(fTypeDef.getName()).thenReturn(TYPEDEF_NAME);
    when(fTypeDef.getActualType()).thenReturn(fActualType);
    FTypeRef typeRef = mock(FTypeRef.class);
    when(typeRef.getDerived()).thenReturn(fTypeDef);
    when(fTypeDef.eContainer()).thenReturn(typeRef);
    when(CppNameRules.getStructName(fTypeDef.getName())).thenReturn(TYPEDEF_NAME);

    // Act
    CppTypeRef cppTypeRef = CppTypeMapper.map(mockFrancaModel, typeRef);

    // Assert
    assertTrue(cppTypeRef instanceof CppTypeDefRef);
    CppTypeDefRef cppTypeDefRef = (CppTypeDefRef) cppTypeRef;
    assertEquals("::" + TYPEDEF_NAME, cppTypeDefRef.name);
    assertEquals(new CppPrimitiveTypeRef(CppPrimitiveTypeRef.Type.INT64), cppTypeDefRef.actualType);
  }

  private DefinedBy mockDefinedBy() {
    //DefinedBy's constructor is private, so static creator method is excluded from mocking
    //and utilized to create an instance of DefinedBy
    doCallRealMethod().when(DefinedBy.class);
    DefinedBy.createFromFrancaElement(any(FrancaElement.class));
    DefinedBy defined = DefinedBy.createFromFrancaElement(mockFrancaModel);
    when(DefinedBy.createFromFModelElement(any())).thenReturn(defined);
    return defined;
  }

  private static LazyInternalInclude mockLazyInclude(DefinedBy definer) throws Exception {
    LazyInternalInclude lazyInclude = new LazyInternalInclude(definer);
    whenNew(LazyInternalInclude.class).withArguments(definer).thenReturn(lazyInclude);
    return lazyInclude;
  }

  private FTypeRef mockPredefinedType(FBasicTypeId predefinedType) {
    FTypeRef typeRef = mock(FTypeRef.class);
    when(typeRef.getPredefined()).thenReturn(predefinedType);
    return typeRef;
  }
}
