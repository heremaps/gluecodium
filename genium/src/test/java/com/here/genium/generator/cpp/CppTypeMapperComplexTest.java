/*
 * Copyright (C) 2016-2019 HERE Europe B.V.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
 * License-Filename: LICENSE
 */

package com.here.genium.generator.cpp;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import com.here.genium.model.common.Include;
import com.here.genium.model.common.InstanceRules;
import com.here.genium.model.cpp.*;
import com.here.genium.model.franca.DefinedBy;
import com.here.genium.model.franca.FrancaDeploymentModel;
import java.util.Arrays;
import java.util.Collections;
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
@PrepareForTest({InstanceRules.class, DefinedBy.class})
public class CppTypeMapperComplexTest {

  private static final String DUMMY_NAME = "Nonsense";

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
  @Mock private FTypeCollection francaTypeCollection;

  @Mock private CppIncludeResolver includeResolver;
  @Mock private CppNameResolver nameResolver;
  @Mock private FrancaDeploymentModel deploymentModel;

  private final Include internalInclude = Include.Companion.createInternalInclude("nonsense");

  private CppTypeMapper typeMapper;

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);
    PowerMockito.mockStatic(InstanceRules.class, DefinedBy.class);

    typeMapper =
        new CppTypeMapper(
            includeResolver, nameResolver, Arrays.asList("lorem", "ipsum"), deploymentModel);

    when(DefinedBy.findDefiningTypeCollection(any(FModelElement.class)))
        .thenReturn(francaTypeCollection);
    when(DefinedBy.getModelName(any())).thenReturn("foo");

    when(includeResolver.resolveIncludes(any()))
        .thenReturn(Collections.singletonList(internalInclude));
  }

  @Test
  public void mapStringType() {
    // arrange
    FTypeRef typeRef = mockPredefinedType(FBasicTypeId.STRING);

    // act
    CppTypeRef cppType = typeMapper.map(typeRef);

    // assert
    assertEquals(CppTypeMapper.STRING_TYPE, cppType);
  }

  @Test
  public void mapByteBufferType() {
    // arrange
    FTypeRef typeRef = mockPredefinedType(FBasicTypeId.BYTE_BUFFER);

    // act
    CppTypeRef cppType = typeMapper.map(typeRef);

    // assert
    assertTrue(cppType instanceof CppTemplateTypeRef);
    CppComplexTypeRef expectedTypeRef = (CppTemplateTypeRef) cppType;
    assertEquals("::std::shared_ptr< ::std::vector< uint8_t > >", expectedTypeRef.name);
    assertEquals(3, expectedTypeRef.includes.size());
    assertTrue(expectedTypeRef.includes.contains(CppLibraryIncludes.VECTOR));
    assertTrue(expectedTypeRef.includes.contains(CppLibraryIncludes.MEMORY));
    assertTrue(expectedTypeRef.includes.contains(CppLibraryIncludes.INT_TYPES));
  }

  @Test
  public void mapStruct() {
    // mock franca related stuff
    when(francaTypeRef.getDerived()).thenReturn(structType);
    when(nameResolver.getFullyQualifiedName(any())).thenReturn("MyStruct");

    // act
    CppTypeRef result = typeMapper.map(francaTypeRef);

    // assert
    assertTrue(result instanceof CppComplexTypeRef);
    CppComplexTypeRef complexResult = (CppComplexTypeRef) result;
    assertEquals("MyStruct", complexResult.name);
    assertEquals(1, complexResult.includes.size());
    assertTrue(complexResult.includes.contains(internalInclude));
  }

  @Test
  public void mapEnum() {
    // mock type reference
    when(francaTypeRef.getDerived()).thenReturn(enumType);
    when(nameResolver.getFullyQualifiedName(any())).thenReturn("MyEnumeration");

    CppTypeRef result = typeMapper.map(francaTypeRef);

    // assert
    assertTrue(result instanceof CppComplexTypeRef);
    CppComplexTypeRef complexResult = (CppComplexTypeRef) result;
    assertEquals("MyEnumeration", complexResult.name);
    assertEquals(1, complexResult.includes.size());
    assertTrue(complexResult.includes.contains(internalInclude));
  }

  @Test
  public void mapArrayTypeRef() {
    // Arrange
    FTypeRef fTypeRefDouble = mockPredefinedType(FBasicTypeId.DOUBLE);
    when(francaArrayType.getElementType()).thenReturn(fTypeRefDouble);
    when(francaTypeRef.getDerived()).thenReturn(francaArrayType);
    when(nameResolver.getFullyQualifiedName(any())).thenReturn(DUMMY_NAME);

    // Act
    CppTypeRef result = typeMapper.map(francaTypeRef);

    // Assert
    assertTrue(result instanceof CppTypeDefRef);

    CppTypeDefRef cppTypeDefRef = (CppTypeDefRef) result;
    assertEquals(DUMMY_NAME, cppTypeDefRef.name);
    assertTrue(cppTypeDefRef.getActualType() instanceof CppTemplateTypeRef);

    CppTemplateTypeRef cppTemplateTypeRef = (CppTemplateTypeRef) cppTypeDefRef.getActualType();
    assertEquals(CppTemplateTypeRef.TemplateClass.VECTOR, cppTemplateTypeRef.getTemplateClass());
    assertEquals(1, cppTemplateTypeRef.getTemplateParameters().size());
    assertEquals(
        CppPrimitiveTypeRef.Companion.getDOUBLE(),
        cppTemplateTypeRef.getTemplateParameters().get(0));
  }

  @Test
  public void mapMapTypeRef() {
    // Arrange
    FTypeRef francaIntTypeRef = mockPredefinedType(FBasicTypeId.UINT64);
    FTypeRef francaStringTypeRef = mockPredefinedType(FBasicTypeId.STRING);
    when(francaMapType.getKeyType()).thenReturn(francaIntTypeRef);
    when(francaMapType.getValueType()).thenReturn(francaStringTypeRef);
    when(francaTypeRef.getDerived()).thenReturn(francaMapType);
    when(nameResolver.getFullyQualifiedName(any())).thenReturn(DUMMY_NAME);

    // Act
    CppTypeRef result = typeMapper.map(francaTypeRef);

    // Assert
    assertTrue(result instanceof CppTypeDefRef);

    CppTypeDefRef cppTypeDefRef = (CppTypeDefRef) result;
    assertEquals(DUMMY_NAME, cppTypeDefRef.name);
    assertTrue(cppTypeDefRef.getActualType() instanceof CppTemplateTypeRef);

    CppTemplateTypeRef cppTemplateTypeRef = (CppTemplateTypeRef) cppTypeDefRef.getActualType();
    assertEquals(CppTemplateTypeRef.TemplateClass.MAP, cppTemplateTypeRef.getTemplateClass());
    assertEquals(2, cppTemplateTypeRef.getTemplateParameters().size());
    assertEquals(
        CppPrimitiveTypeRef.Companion.getUINT64(),
        cppTemplateTypeRef.getTemplateParameters().get(0));
    assertEquals(CppTypeMapper.STRING_TYPE, cppTemplateTypeRef.getTemplateParameters().get(1));
  }

  @Test
  public void mapTypeDefRef() {
    // Arrange
    FTypeDef fTypeDef = mock(FTypeDef.class);
    FTypeRef fActualType = mockPredefinedType(FBasicTypeId.INT64);
    when(fTypeDef.getActualType()).thenReturn(fActualType);
    when(francaTypeRef.getDerived()).thenReturn(fTypeDef);
    when(nameResolver.getFullyQualifiedName(any())).thenReturn(DUMMY_NAME);

    // Act
    CppTypeRef cppTypeRef = typeMapper.map(francaTypeRef);

    // Assert
    assertTrue(cppTypeRef instanceof CppTypeDefRef);
    CppTypeDefRef cppTypeDefRef = (CppTypeDefRef) cppTypeRef;

    assertEquals(DUMMY_NAME, cppTypeDefRef.name);
    assertEquals(CppPrimitiveTypeRef.Companion.getINT64(), cppTypeDefRef.getActualType());
    assertEquals(1, cppTypeDefRef.includes.size());
    assertTrue(cppTypeDefRef.includes.contains(internalInclude));
  }

  @Test
  public void mapInstanceTypeDef() {
    // Arrange
    FTypeDef fTypeDef = mock(FTypeDef.class);
    when(francaTypeRef.getDerived()).thenReturn(fTypeDef);
    when(InstanceRules.isInstanceId(fTypeDef)).thenReturn(true);
    when(nameResolver.getFullyQualifiedName(any())).thenReturn(DUMMY_NAME);

    // Act
    CppTypeRef cppTypeRef = typeMapper.map(francaTypeRef);

    // Assert
    assertTrue(cppTypeRef instanceof CppTemplateTypeRef);
    CppTemplateTypeRef cppTemplateTypeRef = (CppTemplateTypeRef) cppTypeRef;
    assertEquals("::std::shared_ptr< Nonsense >", cppTemplateTypeRef.name);
    assertEquals(1, cppTemplateTypeRef.getTemplateParameters().size());
    assertTrue(cppTemplateTypeRef.getTemplateParameters().get(0) instanceof CppComplexTypeRef);

    assertEquals(2, cppTemplateTypeRef.includes.size());
    assertTrue(cppTemplateTypeRef.includes.contains(CppLibraryIncludes.MEMORY));
    assertTrue(cppTemplateTypeRef.includes.contains(internalInclude));
  }

  @Test
  public void mapInstanceTypeDefExternal() {
    // Arrange
    FTypeDef fTypeDef = mock(FTypeDef.class);
    when(francaTypeRef.getDerived()).thenReturn(fTypeDef);
    when(InstanceRules.isInstanceId(fTypeDef)).thenReturn(true);
    when(nameResolver.getFullyQualifiedName(any())).thenReturn(DUMMY_NAME);
    when(deploymentModel.isExternalType(any())).thenReturn(true);

    // Act
    CppTypeRef cppTypeRef = typeMapper.map(francaTypeRef);

    // Assert
    assertTrue(cppTypeRef instanceof CppTemplateTypeRef);
    CppTemplateTypeRef cppTemplateTypeRef = (CppTemplateTypeRef) cppTypeRef;
    assertEquals(1, cppTemplateTypeRef.getTemplateParameters().size());
    CppTypeRef templateParameterTypeRef = cppTemplateTypeRef.getTemplateParameters().get(0);
    assertTrue(templateParameterTypeRef instanceof CppComplexTypeRef);
    assertFalse(((CppComplexTypeRef) templateParameterTypeRef).getNeedsForwardDeclaration());
  }

  private FTypeRef mockPredefinedType(FBasicTypeId predefinedType) {
    FTypeRef typeRef = mock(FTypeRef.class);
    when(typeRef.getPredefined()).thenReturn(predefinedType);
    return typeRef;
  }
}
