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

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;
import static org.powermock.api.mockito.PowerMockito.verifyStatic;

import com.here.ivi.api.TranspilerExecutionException;
import com.here.ivi.api.model.common.Include;
import com.here.ivi.api.model.cppmodel.*;
import com.here.ivi.api.model.franca.FrancaElement;
import com.here.ivi.api.model.rules.InstanceRules;
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
import org.powermock.api.mockito.PowerMockito;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
@PrepareForTest({CppNameRules.class, InstanceRules.class})
public class CppTypeMapperComplexTest {

  private static final String STRUCT_NAME = "MYSTRUCT";
  private static final String ENUM_NAME = "MYENUMERATION";
  private static final String TYPEDEF_NAME = "MYTYPEDEF";

  @Rule public ExpectedException exception = ExpectedException.none();

  @Mock(answer = Answers.RETURNS_DEEP_STUBS)
  private FrancaElement mockFrancaModel;

  @Mock(answer = Answers.RETURNS_DEEP_STUBS)
  private FStructType structType;

  @Mock(answer = Answers.RETURNS_DEEP_STUBS)
  private FEnumerationType enumType;

  @Mock private FTypeCollection fTypeCollection;

  @Mock private CppIncludeResolver includeResolver;

  private final Include internalInclude = Include.createInternalInclude("nonsense");

  private CppTypeMapper typeMapper;

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);
    PowerMockito.mockStatic(CppNameRules.class, InstanceRules.class);

    typeMapper = new CppTypeMapper(includeResolver);

    when(includeResolver.resolveInclude(any())).thenReturn(internalInclude);
  }

  @Test
  public void mapStringType() {
    //arrange
    FTypeRef typeRef = mockPredefinedType(FBasicTypeId.STRING);

    //act
    CppTypeRef cppType = typeMapper.map(typeRef);

    //assert
    assertEquals(CppTypeMapper.STRING_TYPE, cppType);
  }

  @Test
  public void mapByteBufferType() {
    //arrange
    FTypeRef typeRef = mockPredefinedType(FBasicTypeId.BYTE_BUFFER);

    //act
    CppTypeRef cppType = typeMapper.map(typeRef);

    //assert
    assertTrue(cppType instanceof CppTemplateTypeRef);
    CppComplexTypeRef expectedTypeRef = (CppTemplateTypeRef) cppType;
    assertEquals("::std::vector< uint8_t >", expectedTypeRef.name);
    assertEquals(2, expectedTypeRef.includes.size());
    assertTrue(expectedTypeRef.includes.contains(CppLibraryIncludes.INT_TYPES));
    assertTrue(expectedTypeRef.includes.contains(CppLibraryIncludes.VECTOR));
  }

  @Test
  public void mapNonEmptyStruct() {

    //mock franca related stuff
    FTypeRef typeRef = mock(FTypeRef.class);
    when(typeRef.getDerived()).thenReturn(structType);
    when(structType.getName()).thenReturn(STRUCT_NAME);
    when(structType.getElements().isEmpty()).thenReturn(false);

    when(mockFrancaModel.getFrancaTypeCollection()).thenReturn(fTypeCollection);

    //mock CppNameRules
    when(CppNameRules.getFullyQualifiedName(structType)).thenReturn("::a::b::c::" + STRUCT_NAME);

    //act
    CppTypeRef result = typeMapper.map(typeRef);

    //assert
    assertTrue(result instanceof CppComplexTypeRef);
    CppComplexTypeRef complexResult = (CppComplexTypeRef) result;
    assertEquals("::a::b::c::" + STRUCT_NAME, complexResult.name);
    assertEquals(1, complexResult.includes.size());
    assertTrue(complexResult.includes.contains(internalInclude));
  }

  @Test
  public void mapNonEmptyEnum() {

    //mock type reference
    FTypeRef typeRef = mock(FTypeRef.class);
    when(typeRef.getDerived()).thenReturn(enumType);
    when(enumType.getName()).thenReturn(ENUM_NAME);
    when(enumType.getEnumerators().isEmpty()).thenReturn(false);

    when(mockFrancaModel.getFrancaTypeCollection()).thenReturn(fTypeCollection);

    //mock CppNameRules
    when(CppNameRules.getFullyQualifiedName(enumType)).thenReturn("::" + ENUM_NAME);

    CppTypeRef result = typeMapper.map(typeRef);

    //assert
    assertTrue(result instanceof CppComplexTypeRef);
    CppComplexTypeRef complexResult = (CppComplexTypeRef) result;
    assertEquals("::" + ENUM_NAME, complexResult.name);
    assertEquals(1, complexResult.includes.size());
    assertTrue(complexResult.includes.contains(internalInclude));
  }

  @Test
  public void mapIntegerRangeTypeThrowsTranspilerException() {
    //mock type reference
    FTypeRef typeRef = mock(FTypeRef.class);
    FIntegerInterval intervalType = mock(FIntegerInterval.class);
    when(typeRef.getPredefined()).thenReturn(FBasicTypeId.UNDEFINED);
    when(typeRef.getInterval()).thenReturn(intervalType);

    // pre-verify expected exception
    exception.expect(TranspilerExecutionException.class);

    //act
    typeMapper.map(typeRef);
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

    CppTemplateTypeRef expected =
        CppTemplateTypeRef.create(
            CppTemplateTypeRef.TemplateClass.VECTOR, CppPrimitiveTypeRef.DOUBLE);

    // Act
    CppTypeRef result = typeMapper.map(typeRef);

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
    when(CppNameRules.getFullyQualifiedName(fTypeDef)).thenReturn("::" + TYPEDEF_NAME);

    // Act
    CppTypeRef cppTypeRef = typeMapper.map(typeRef);

    // Assert
    assertTrue(cppTypeRef instanceof CppTypeDefRef);
    CppTypeDefRef cppTypeDefRef = (CppTypeDefRef) cppTypeRef;

    assertEquals("::" + TYPEDEF_NAME, cppTypeDefRef.name);
    assertEquals(CppPrimitiveTypeRef.INT64, cppTypeDefRef.actualType);
    assertEquals(1, cppTypeDefRef.includes.size());
    assertTrue(cppTypeDefRef.includes.contains(internalInclude));

    //verify
    verifyStatic();
    CppNameRules.getFullyQualifiedName(fTypeDef);
  }

  @Test
  public void mapInstanceTypeDef() {
    // Arrange
    String className = "MyClazz";
    FTypeDef fTypeDef = mock(FTypeDef.class);
    when(fTypeDef.getName()).thenReturn(className);
    FTypeRef typeRef = mock(FTypeRef.class);
    when(typeRef.getDerived()).thenReturn(fTypeDef);
    when(fTypeDef.eContainer()).thenReturn(typeRef);
    when(InstanceRules.isInstanceId(fTypeDef)).thenReturn(true);
    when(CppNameRules.getFullyQualifiedName(fTypeDef)).thenReturn("::MyClazz");

    // Act
    CppTypeRef cppTypeRef = typeMapper.map(typeRef);

    // Assert
    assertTrue(cppTypeRef instanceof CppComplexTypeRef);
    CppComplexTypeRef cppComplexTypeRef = (CppComplexTypeRef) cppTypeRef;
    assertEquals("::std::shared_ptr< ::MyClazz >", cppComplexTypeRef.name);
    assertEquals(CppTypeInfo.Complex, cppComplexTypeRef.info);

    assertEquals(2, cppComplexTypeRef.includes.size());
    assertTrue(cppComplexTypeRef.includes.contains(CppLibraryIncludes.MEMORY));
    assertTrue(cppComplexTypeRef.includes.contains(internalInclude));

    //verify
    verifyStatic();
    CppNameRules.getFullyQualifiedName(fTypeDef);
    verifyStatic();
    InstanceRules.isInstanceId(fTypeDef);
  }

  @Test
  public void mapInstanceTypeDefWithNamespace() {
    // Arrange
    String className = "MyClazz";
    FTypeDef fTypeDef = mock(FTypeDef.class);
    when(fTypeDef.getName()).thenReturn(className);
    FTypeRef typeRef = mock(FTypeRef.class);
    when(typeRef.getDerived()).thenReturn(fTypeDef);
    when(fTypeDef.eContainer()).thenReturn(typeRef);
    when(CppNameRules.getFullyQualifiedName(fTypeDef)).thenReturn("::a::b::" + className);
    when(InstanceRules.isInstanceId(fTypeDef)).thenReturn(true);

    // Act
    CppTypeRef cppTypeRef = typeMapper.map(typeRef);

    // Assert
    assertTrue(cppTypeRef instanceof CppComplexTypeRef);
    CppComplexTypeRef cppComplexTypeRef = (CppComplexTypeRef) cppTypeRef;
    assertEquals("::std::shared_ptr< ::a::b::MyClazz >", cppComplexTypeRef.name);
    assertEquals(CppTypeInfo.Complex, cppComplexTypeRef.info);

    assertEquals(2, cppComplexTypeRef.includes.size());
    assertTrue(cppComplexTypeRef.includes.contains(CppLibraryIncludes.MEMORY));
    assertTrue(cppComplexTypeRef.includes.contains(internalInclude));

    //verify
    verifyStatic();
    CppNameRules.getFullyQualifiedName(fTypeDef);

    verifyStatic();
    InstanceRules.isInstanceId(fTypeDef);
  }

  private FTypeRef mockPredefinedType(FBasicTypeId predefinedType) {
    FTypeRef typeRef = mock(FTypeRef.class);
    when(typeRef.getPredefined()).thenReturn(predefinedType);
    return typeRef;
  }
}
