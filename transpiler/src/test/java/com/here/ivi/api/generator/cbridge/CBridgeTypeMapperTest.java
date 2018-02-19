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

package com.here.ivi.api.generator.cbridge;

import static com.here.ivi.api.generator.cbridge.CBridgeNameRules.BASE_HANDLE_IMPL_FILE;
import static com.here.ivi.api.generator.cbridge.CBridgeNameRules.BASE_REF_NAME;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;
import static org.powermock.api.mockito.PowerMockito.mockStatic;

import com.here.ivi.api.common.FrancaTypeHelper;
import com.here.ivi.api.generator.cpp.CppLibraryIncludes;
import com.here.ivi.api.model.cbridge.CType;
import com.here.ivi.api.model.cbridge.IncludeResolver;
import com.here.ivi.api.model.franca.DefinedBy;
import org.franca.core.franca.*;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Answers;
import org.mockito.Mock;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
@PrepareForTest({FrancaTypeHelper.class, DefinedBy.class})
public class CBridgeTypeMapperTest {

  @Mock private FTypeRef francaTypeRef;
  @Mock private FTypeRef francaTypeRef2;
  @Mock private FTypeDef francaTypeDef;
  @Mock private FStructType francaStructType;
  @Mock private FTypeCollection francaTypeCollection;
  @Mock private FEnumerationType francaEnum;

  @Mock(answer = Answers.RETURNS_DEEP_STUBS)
  private FMapType francaMap;

  @Mock private IncludeResolver resolver;

  @Before
  public void setUp() {
    mockStatic(FrancaTypeHelper.class, DefinedBy.class);

    when(francaStructType.getName()).thenReturn("SomeStruct");

    when(DefinedBy.findDefiningTypeCollection(any(FModelElement.class)))
        .thenReturn(francaTypeCollection);
  }

  @Test
  public void mapTypeDefStruct() {
    when(francaTypeRef.getDerived()).thenReturn(francaTypeDef);
    when(francaTypeDef.getActualType()).thenReturn(francaTypeRef2);
    when(francaTypeRef2.getDerived()).thenReturn(francaStructType);

    CppTypeInfo mapped = CTypeMapper.mapType(resolver, francaTypeRef);

    assertEquals("SomeStruct", mapped.name);
  }

  @Test
  public void mapTypeDefPredefine() {
    when(francaTypeRef.getDerived()).thenReturn(francaTypeDef);
    when(francaTypeDef.getActualType()).thenReturn(francaTypeRef2);
    when(francaTypeRef2.getPredefined()).thenReturn(FBasicTypeId.BOOLEAN);

    CppTypeInfo mapped = CTypeMapper.mapType(resolver, francaTypeRef);

    assertEquals(CType.BOOL.name, mapped.name);
  }

  public void mapStructType() {
    when(francaTypeRef.getDerived()).thenReturn(francaStructType);

    CppTypeInfo mapped = CTypeMapper.mapType(resolver, francaTypeRef);

    assertEquals("Foo", mapped.name);
  }

  @Test
  public void mapPredefinedType() {
    when(francaTypeRef.getPredefined()).thenReturn(FBasicTypeId.BOOLEAN);

    CppTypeInfo mapped = CTypeMapper.mapType(resolver, francaTypeRef);
    assertEquals(CType.BOOL.name, mapped.name);
  }

  @Test
  public void mapEnumerationType() {
    FEnumerationType enumerationType = mock(FEnumerationType.class);
    when(enumerationType.getName()).thenReturn("foo");
    when(francaTypeRef.getDerived()).thenReturn(enumerationType);

    CppTypeInfo actualType = CTypeMapper.mapType(resolver, francaTypeRef);

    assertEquals("Foo", actualType.name);
  }

  @Test
  public void mapArrayInlineType() {
    when(francaTypeRef.getPredefined()).thenReturn(FBasicTypeId.UINT64);
    when(FrancaTypeHelper.isImplicitArray(any())).thenReturn(true);

    CppTypeInfo actualType = CTypeMapper.mapType(resolver, francaTypeRef);

    assertEquals(CppTypeInfo.TypeCategory.ARRAY, actualType.typeCategory);
    assertTrue(actualType instanceof CppArrayTypeInfo);

    CppArrayTypeInfo actualArrayType = (CppArrayTypeInfo) actualType;
    assertNotNull(actualArrayType.innerType);
    assertEquals(actualArrayType.innerType.functionReturnType.name, "uint64_t");
  }

  @Test
  public void mapMapTypeWithPrimitiveKeyType() {
    when(francaTypeRef.getDerived()).thenReturn(francaMap);
    when(francaMap.getKeyType().getDerived()).thenReturn(null);
    when(francaMap.getKeyType().getPredefined()).thenReturn(FBasicTypeId.STRING);
    when(francaMap.getValueType().getDerived()).thenReturn(francaStructType);
    when(francaMap.getName()).thenReturn("FooMap");

    CppTypeInfo result = CTypeMapper.mapType(resolver, francaTypeRef);

    assertEquals(CppTypeInfo.TypeCategory.MAP, result.typeCategory);
    assertTrue(result instanceof CppMapTypeInfo);

    CppMapTypeInfo resultMapType = (CppMapTypeInfo) result;
    assertEquals("FooMap", resultMapType.name);
    assertEquals(BASE_REF_NAME, resultMapType.cTypesNeededByConstructor.get(0).name);
    assertEquals(BASE_REF_NAME, resultMapType.functionReturnType.name);
    assertEquals("std::unordered_map<std::string, SomeStruct>", resultMapType.baseApi);
    assertEquals(2, resultMapType.includes.size());
    assertEquals(BASE_HANDLE_IMPL_FILE, resultMapType.includes.get(0).fileName);
    assertEquals(CppLibraryIncludes.MAP, resultMapType.includes.get(1));
  }

  @Test
  public void mapMapTypeWithPrimitiveEnumType() {
    when(francaTypeRef.getDerived()).thenReturn(francaMap);
    when(francaMap.getKeyType().getDerived()).thenReturn(francaEnum);
    when(francaMap.getValueType().getDerived()).thenReturn(francaStructType);
    when(francaEnum.getName()).thenReturn("BarEnum");

    CppTypeInfo result = CTypeMapper.mapType(resolver, francaTypeRef);

    assertEquals(CppTypeInfo.TypeCategory.MAP, result.typeCategory);
    assertTrue(result instanceof CppMapTypeInfo);

    CppMapTypeInfo resultMapType = (CppMapTypeInfo) result;
    assertEquals(
        "std::unordered_map<BarEnum, SomeStruct, ::transpiler::EnumHash>", resultMapType.baseApi);
    assertEquals(3, resultMapType.includes.size());
    assertEquals(CppLibraryIncludes.ENUM_HASH, resultMapType.includes.get(2));
  }
}
