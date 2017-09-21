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
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import com.here.ivi.api.model.common.Include;
import com.here.ivi.api.model.cppmodel.CppComplexTypeRef;
import com.here.ivi.api.model.cppmodel.CppIncludeResolver;
import com.here.ivi.api.model.cppmodel.CppPrimitiveTypeRef;
import com.here.ivi.api.model.cppmodel.CppTypeRef;
import com.here.ivi.api.model.franca.FrancaElement;
import java.util.Arrays;
import org.franca.core.franca.FBasicTypeId;
import org.franca.core.franca.FStructType;
import org.franca.core.franca.FTypeCollection;
import org.franca.core.franca.FTypeRef;
import org.franca.core.franca.FTypedElement;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Answers;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.powermock.api.mockito.PowerMockito;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
@PrepareForTest(CppNameRules.class)
public class CppTypeMapperArrayTest {

  @Mock private FTypeCollection fTypeCollection;

  @Mock private CppIncludeResolver includeResolver;

  private CppTypeMapper typeMapper;

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);
    PowerMockito.mockStatic(CppNameRules.class);

    typeMapper = new CppTypeMapper(includeResolver);
  }

  @Test
  public void mapArrayOfPrimitiveType() {

    //mock franca elements
    FTypedElement typedElement = mock(FTypedElement.class);
    when(typedElement.isArray()).thenReturn(true);

    FTypeRef actualTypeRef = mock(FTypeRef.class);
    when(actualTypeRef.getPredefined()).thenReturn(FBasicTypeId.UINT32);

    when(typedElement.getType()).thenReturn(actualTypeRef);

    //act
    CppTypeRef result = typeMapper.map(typedElement);

    //assert
    assertTrue(result instanceof CppComplexTypeRef);
    CppComplexTypeRef complexResult = (CppComplexTypeRef) result;
    assertEquals(
        "::std::vector< " + CppPrimitiveTypeRef.Type.UINT32.value + " >", complexResult.name);
    assertTrue(
        complexResult.includes.containsAll(
            Arrays.asList(CppLibraryIncludes.VECTOR, CppLibraryIncludes.INT_TYPES)));
  }

  @Test
  public void mapArrayOfComplexType() {

    //mock franca elements
    FrancaElement mockFrancaModel = mock(FrancaElement.class, Answers.RETURNS_DEEP_STUBS);
    when(mockFrancaModel.getFrancaTypeCollection()).thenReturn(fTypeCollection);

    FStructType structType = mock(FStructType.class);
    FTypeRef typeRef = mock(FTypeRef.class);
    when(typeRef.getDerived()).thenReturn(structType);
    when(structType.getName()).thenReturn("MyStruct");
    when(structType.eContainer()).thenReturn(fTypeCollection);

    FTypedElement typedElement = mock(FTypedElement.class);
    when(typedElement.isArray()).thenReturn(true);
    when(typedElement.getType()).thenReturn(typeRef);

    Include internalInclude = Include.createInternalInclude("nonsense");
    when(includeResolver.resolveInclude(any())).thenReturn(internalInclude);

    //mock CppNameRules
    when(CppNameRules.getFullyQualifiedName(structType)).thenReturn("::a::b::c::MyStruct");

    //act
    CppTypeRef result = typeMapper.map(typedElement);

    //assert
    assertTrue(result instanceof CppComplexTypeRef);
    CppComplexTypeRef complexResult = (CppComplexTypeRef) result;
    assertEquals("::std::vector< ::a::b::c::MyStruct >", complexResult.name);

    verify(includeResolver).resolveInclude(structType);

    assertTrue(
        complexResult.includes.containsAll(
            Arrays.asList(CppLibraryIncludes.VECTOR, internalInclude)));
  }
}
