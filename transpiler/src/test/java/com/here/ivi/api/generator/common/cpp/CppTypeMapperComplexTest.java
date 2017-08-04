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
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;
import static org.powermock.api.mockito.PowerMockito.doCallRealMethod;
import static org.powermock.api.mockito.PowerMockito.mockStatic;
import static org.powermock.api.mockito.PowerMockito.verifyNew;
import static org.powermock.api.mockito.PowerMockito.verifyStatic;
import static org.powermock.api.mockito.PowerMockito.whenNew;

import com.here.ivi.api.TranspilerExecutionException;
import com.here.ivi.api.model.common.LazyInternalInclude;
import com.here.ivi.api.model.common.LazyTypeRefName;
import com.here.ivi.api.model.cppmodel.CppComplexTypeRef;
import com.here.ivi.api.model.cppmodel.CppTypeInfo;
import com.here.ivi.api.model.cppmodel.CppTypeRef;
import com.here.ivi.api.model.franca.DefinedBy;
import com.here.ivi.api.model.franca.FrancaElement;
import java.util.LinkedList;
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
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
@PrepareForTest({DefinedBy.class, CppTypeMapper.class, CppNameRules.class})
public class CppTypeMapperComplexTest {

  @Rule public ExpectedException exception = ExpectedException.none();

  @Mock(answer = Answers.RETURNS_DEEP_STUBS)
  private FrancaElement<?> mockFrancaModel;

  @Mock(answer = Answers.RETURNS_DEEP_STUBS)
  private FStructType structType;

  @Mock private FTypeCollection fTypeCollection;

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);
    mockStatic(CppNameRules.class);
    mockStatic(DefinedBy.class);
  }

  @Test
  public void mapStringType() throws Exception {
    //arrange
    FTypeRef typeRef = mockPredefinedType(FBasicTypeId.STRING);
    CppComplexTypeRef cppTypeRef = new CppComplexTypeRef.Builder("").build();
    LazyTypeRefName lazyName =
        new LazyTypeRefName(
            CppComplexTypeRef.STRING_TYPE_NAME, CppComplexTypeRef.STD_NESTED_NAME_SPECIFIER);

    //mock builder
    CppComplexTypeRef.Builder builder = mock(CppComplexTypeRef.Builder.class);
    whenNew(CppComplexTypeRef.Builder.class).withAnyArguments().thenReturn(builder);
    when(builder.typeInfo(CppTypeInfo.Complex)).thenReturn(builder);
    when(builder.includes(CppLibraryIncludes.STRING)).thenReturn(builder);
    when(builder.build()).thenReturn(cppTypeRef);

    //act
    CppTypeRef cppType = CppTypeMapper.map(mockFrancaModel, typeRef);

    //assert
    assertEquals(cppTypeRef, cppType);

    //verify
    verifyNew(CppComplexTypeRef.Builder.class).withArguments(lazyName);
    verify(builder).includes(CppLibraryIncludes.STRING);
    verify(builder).build();
  }

  @Test
  public void mapByteBufferType() throws Exception {
    //arrange
    FTypeRef typeRef = mockPredefinedType(FBasicTypeId.BYTE_BUFFER);
    CppComplexTypeRef cppTypeRef = new CppComplexTypeRef.Builder("").build();
    LazyTypeRefName lazyName =
        new LazyTypeRefName(
            CppComplexTypeRef.BYTE_VECTOR_TYPE_NAME, CppComplexTypeRef.STD_NESTED_NAME_SPECIFIER);

    //mock builder
    CppComplexTypeRef.Builder builder = mock(CppComplexTypeRef.Builder.class);
    whenNew(CppComplexTypeRef.Builder.class).withArguments(lazyName).thenReturn(builder);
    when(builder.typeInfo(CppTypeInfo.Complex)).thenReturn(builder);
    when(builder.includes(CppLibraryIncludes.VECTOR, CppLibraryIncludes.INT_TYPES))
        .thenReturn(builder);
    when(builder.build()).thenReturn(cppTypeRef);

    //act
    CppTypeRef cppType = CppTypeMapper.map(mockFrancaModel, typeRef);

    //assert
    assertEquals(cppTypeRef, cppType);

    //verify
    verifyNew(CppComplexTypeRef.Builder.class).withArguments(lazyName);
    verify(builder).includes(CppLibraryIncludes.VECTOR, CppLibraryIncludes.INT_TYPES);
    verify(builder).build();
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
  public void mapNonEmptyStruct() throws Exception {

    CppComplexTypeRef cppTypeRef = new CppComplexTypeRef.Builder("").build();
    LazyTypeRefName lazyName = new LazyTypeRefName("MYSTRUCT", new LinkedList<>());

    //mock franca related stuff
    FTypeRef typeRef = mock(FTypeRef.class);
    when(typeRef.getDerived()).thenReturn(structType);
    when(structType.getName()).thenReturn("MYSTRUCT");
    when(structType.getElements().isEmpty()).thenReturn(false);

    //DefinedBy's constructor is private, so static creator method is excluded from mocking
    //and utilized to create an instance of DefinedBy
    when(mockFrancaModel.getFrancaTypeCollection()).thenReturn(fTypeCollection);
    doCallRealMethod().when(DefinedBy.class);
    DefinedBy.createFromFrancaElement(any(FrancaElement.class));
    DefinedBy defined = DefinedBy.createFromFrancaElement(mockFrancaModel);
    when(DefinedBy.createFromFModelElement(any())).thenReturn(defined);

    //mock LazyInternalInclude's constructor
    LazyInternalInclude lazyInclude = new LazyInternalInclude(defined);
    whenNew(LazyInternalInclude.class).withArguments(defined).thenReturn(lazyInclude);

    //mock CppNameRules
    when(CppNameRules.getStructName(structType.getName())).thenReturn("MYSTRUCT");
    when(CppNameRules.getNestedNameSpecifier(structType)).thenReturn(new LinkedList<>());

    //mock CppComplexTypeRef.Builder
    CppComplexTypeRef.Builder builder = mock(CppComplexTypeRef.Builder.class);
    whenNew(CppComplexTypeRef.Builder.class).withArguments(lazyName).thenReturn(builder);

    when(builder.typeInfo(CppTypeInfo.Complex)).thenReturn(builder);
    when(builder.includes(lazyInclude)).thenReturn(builder);
    when(builder.build()).thenReturn(cppTypeRef);

    //act
    CppTypeRef result = CppTypeMapper.map(mockFrancaModel, typeRef);

    //assert
    assertEquals(cppTypeRef, result);

    //verify
    verifyStatic();
    DefinedBy.createFromFModelElement(structType);
    verifyNew(LazyInternalInclude.class).withArguments(defined);
    verifyNew(CppComplexTypeRef.Builder.class).withArguments(lazyName);
  }

  private FTypeRef mockPredefinedType(FBasicTypeId predefinedType) {
    FTypeRef typeRef = mock(FTypeRef.class);
    when(typeRef.getPredefined()).thenReturn(predefinedType);
    return typeRef;
  }
}
