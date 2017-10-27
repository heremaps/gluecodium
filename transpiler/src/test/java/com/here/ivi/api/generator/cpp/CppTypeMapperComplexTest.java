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
import com.here.ivi.api.model.rules.InstanceRules;
import org.franca.core.franca.*;
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
  private static final String DUMMY_NAME = "nonsense";

  @Rule public ExpectedException exception = ExpectedException.none();

  @Mock(answer = Answers.RETURNS_DEEP_STUBS)
  private FStructType structType;

  @Mock(answer = Answers.RETURNS_DEEP_STUBS)
  private FEnumerationType enumType;

  @Mock(answer = Answers.RETURNS_DEEP_STUBS)
  private FArrayType francaArrayType;

  @Mock(answer = Answers.RETURNS_DEEP_STUBS)
  private FMapType francaMapType;

  @Mock private FTypeRef francaTypeRef;

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
    when(francaTypeRef.getDerived()).thenReturn(structType);
    when(structType.getName()).thenReturn(STRUCT_NAME);
    when(structType.getElements().isEmpty()).thenReturn(false);

    //mock CppNameRules
    when(CppNameRules.getFullyQualifiedName(structType)).thenReturn("::a::b::c::" + STRUCT_NAME);

    //act
    CppTypeRef result = typeMapper.map(francaTypeRef);

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
    when(francaTypeRef.getDerived()).thenReturn(enumType);
    when(enumType.getName()).thenReturn(ENUM_NAME);
    when(enumType.getEnumerators().isEmpty()).thenReturn(false);

    //mock CppNameRules
    when(CppNameRules.getFullyQualifiedName(enumType)).thenReturn("::" + ENUM_NAME);

    CppTypeRef result = typeMapper.map(francaTypeRef);

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
    FIntegerInterval intervalType = mock(FIntegerInterval.class);
    when(francaTypeRef.getPredefined()).thenReturn(FBasicTypeId.UNDEFINED);
    when(francaTypeRef.getInterval()).thenReturn(intervalType);

    // pre-verify expected exception
    exception.expect(TranspilerExecutionException.class);

    //act
    typeMapper.map(francaTypeRef);
  }

  @Test
  public void mapArrayTypeRef() {
    // Arrange
    FTypeRef fTypeRefDouble = mockPredefinedType(FBasicTypeId.DOUBLE);
    when(francaArrayType.getElementType()).thenReturn(fTypeRefDouble);
    when(francaTypeRef.getDerived()).thenReturn(francaArrayType);
    when(CppNameRules.getFullyQualifiedName(any())).thenReturn(DUMMY_NAME);

    // Act
    CppTypeRef result = typeMapper.map(francaTypeRef);

    // Assert
    assertTrue(result instanceof CppTypeDefRef);

    CppTypeDefRef cppTypeDefRef = (CppTypeDefRef) result;
    assertEquals(DUMMY_NAME, cppTypeDefRef.name);
    assertTrue(cppTypeDefRef.actualType instanceof CppTemplateTypeRef);

    CppTemplateTypeRef cppTemplateTypeRef = (CppTemplateTypeRef) cppTypeDefRef.actualType;
    assertEquals(CppTemplateTypeRef.TemplateClass.VECTOR, cppTemplateTypeRef.templateClass);
    assertEquals(1, cppTemplateTypeRef.templateParameters.size());
    assertEquals(CppPrimitiveTypeRef.DOUBLE, cppTemplateTypeRef.templateParameters.get(0));
  }

  @Test
  public void mapMapTypeRef() {
    // Arrange
    FTypeRef francaIntTypeRef = mockPredefinedType(FBasicTypeId.UINT64);
    FTypeRef francaStringTypeRef = mockPredefinedType(FBasicTypeId.STRING);
    when(francaMapType.getKeyType()).thenReturn(francaIntTypeRef);
    when(francaMapType.getValueType()).thenReturn(francaStringTypeRef);
    when(francaTypeRef.getDerived()).thenReturn(francaMapType);
    when(CppNameRules.getFullyQualifiedName(any())).thenReturn(DUMMY_NAME);

    // Act
    CppTypeRef result = typeMapper.map(francaTypeRef);

    // Assert
    assertTrue(result instanceof CppTypeDefRef);

    CppTypeDefRef cppTypeDefRef = (CppTypeDefRef) result;
    assertEquals(DUMMY_NAME, cppTypeDefRef.name);
    assertTrue(cppTypeDefRef.actualType instanceof CppTemplateTypeRef);

    CppTemplateTypeRef cppTemplateTypeRef = (CppTemplateTypeRef) cppTypeDefRef.actualType;
    assertEquals(CppTemplateTypeRef.TemplateClass.MAP, cppTemplateTypeRef.templateClass);
    assertEquals(2, cppTemplateTypeRef.templateParameters.size());
    assertEquals(CppPrimitiveTypeRef.UINT64, cppTemplateTypeRef.templateParameters.get(0));
    assertEquals(CppTypeMapper.STRING_TYPE, cppTemplateTypeRef.templateParameters.get(1));
  }

  @Test
  public void mapTypeDefRef() {
    // Arrange
    FTypeDef fTypeDef = mock(FTypeDef.class);
    FTypeRef fActualType = mockPredefinedType(FBasicTypeId.INT64);
    when(fTypeDef.getName()).thenReturn(TYPEDEF_NAME);
    when(fTypeDef.getActualType()).thenReturn(fActualType);
    when(francaTypeRef.getDerived()).thenReturn(fTypeDef);
    when(fTypeDef.eContainer()).thenReturn(francaTypeRef);
    when(CppNameRules.getFullyQualifiedName(fTypeDef)).thenReturn("::" + TYPEDEF_NAME);

    // Act
    CppTypeRef cppTypeRef = typeMapper.map(francaTypeRef);

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
    when(francaTypeRef.getDerived()).thenReturn(fTypeDef);
    when(fTypeDef.eContainer()).thenReturn(francaTypeRef);
    when(InstanceRules.isInstanceId(fTypeDef)).thenReturn(true);
    when(CppNameRules.getFullyQualifiedName(fTypeDef)).thenReturn("::MyClazz");

    // Act
    CppTypeRef cppTypeRef = typeMapper.map(francaTypeRef);

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
    when(francaTypeRef.getDerived()).thenReturn(fTypeDef);
    when(fTypeDef.eContainer()).thenReturn(francaTypeRef);
    when(CppNameRules.getFullyQualifiedName(fTypeDef)).thenReturn("::a::b::" + className);
    when(InstanceRules.isInstanceId(fTypeDef)).thenReturn(true);

    // Act
    CppTypeRef cppTypeRef = typeMapper.map(francaTypeRef);

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
