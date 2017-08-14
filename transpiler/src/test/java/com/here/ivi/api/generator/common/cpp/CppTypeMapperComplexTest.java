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
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;
import static org.powermock.api.mockito.PowerMockito.doCallRealMethod;
import static org.powermock.api.mockito.PowerMockito.mockStatic;
import static org.powermock.api.mockito.PowerMockito.verifyNew;
import static org.powermock.api.mockito.PowerMockito.verifyStatic;
import static org.powermock.api.mockito.PowerMockito.whenNew;

import com.here.ivi.api.TranspilerExecutionException;
import com.here.ivi.api.model.common.Include;
import com.here.ivi.api.model.common.LazyInternalInclude;
import com.here.ivi.api.model.common.LazyTypeRefName;
import com.here.ivi.api.model.cppmodel.CppComplexTypeRef;
import com.here.ivi.api.model.cppmodel.CppTypeInfo;
import com.here.ivi.api.model.cppmodel.CppTypeRef;
import com.here.ivi.api.model.franca.DefinedBy;
import com.here.ivi.api.model.franca.FrancaElement;
import java.util.LinkedList;
import org.franca.core.franca.FBasicTypeId;
import org.franca.core.franca.FEnumerationType;
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

  private static final String STRUCT_NAME = "MYSTRUCT";
  private static final String ENUM_NAME = "MYENUMERATION";

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
    LazyTypeRefName lazyName = new LazyTypeRefName(STRUCT_NAME, new LinkedList<>());

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
    verify(builder).includes(lazyInclude);
    verify(builder).build();
  }

  @Test
  public void mapNonEmptyEnum() throws Exception {
    LazyTypeRefName lazyName = new LazyTypeRefName(ENUM_NAME, new LinkedList<>());

    //mock type reference
    FTypeRef typeRef = mock(FTypeRef.class);
    when(typeRef.getDerived()).thenReturn(enumType);
    when(enumType.getName()).thenReturn(ENUM_NAME);
    when(enumType.getEnumerators().isEmpty()).thenReturn(false);

    when(mockFrancaModel.getFrancaTypeCollection()).thenReturn(fTypeCollection);
    DefinedBy defined = mockDefinedBy();

    //mock CppNameRules
    when(CppNameRules.getEnumName(enumType.getName())).thenReturn(ENUM_NAME);
    when(CppNameRules.getNestedNameSpecifier(enumType)).thenReturn(new LinkedList<>());

    CppTypeRef result = CppTypeMapper.map(mockFrancaModel, typeRef);

    //assert
    assertTrue(result instanceof CppComplexTypeRef);
    CppComplexTypeRef complexResult = (CppComplexTypeRef) result;
    assertTrue(complexResult.hasLazyName());
    assertEquals(lazyName, complexResult.lazyName);
    assertEquals(1, complexResult.includes.size());
    Include include = complexResult.includes.iterator().next();
    assertTrue(include instanceof LazyInternalInclude);
    LazyInternalInclude lazyInclude = (LazyInternalInclude) include;
    assertEquals(defined.type, lazyInclude.typeCollection);
    assertEquals(defined.model, lazyInclude.model);

    //verify
    verifyStatic();
    DefinedBy.createFromFModelElement(enumType);
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
