/*
 * Copyright (C) 2016-2018 HERE Europe B.V.
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

package com.here.genium.generator.cbridge;

import static com.here.genium.generator.cbridge.CBridgeNameRules.BASE_HANDLE_IMPL_FILE;
import static com.here.genium.generator.cbridge.CBridgeNameRules.BASE_REF_NAME;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;
import static org.powermock.api.mockito.PowerMockito.mockStatic;

import com.here.genium.common.FrancaTypeHelper;
import com.here.genium.generator.cpp.CppLibraryIncludes;
import com.here.genium.generator.cpp.CppNameResolver;
import com.here.genium.model.cbridge.CBridgeIncludeResolver;
import com.here.genium.model.cbridge.CType;
import com.here.genium.model.common.Include;
import com.here.genium.model.cpp.CppIncludeResolver;
import com.here.genium.model.franca.DefinedBy;
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
public final class CBridgeTypeMapperTest {

  private static final Include CPP_INCLUDE = Include.Companion.createInternalInclude("CPP_INCLUDE");
  private static final Include CBRIDGE_INCLUDE =
      Include.Companion.createInternalInclude("CBRIDGE_INCLUDE");

  @Mock private FTypeRef francaTypeRef;
  @Mock private FTypeRef francaTypeRef2;
  @Mock private FTypeDef francaTypeDef;
  @Mock private FStructType francaStructType;
  @Mock private FTypeCollection francaTypeCollection;
  @Mock private FEnumerationType francaEnum;

  @Mock(answer = Answers.RETURNS_DEEP_STUBS)
  private FMapType francaMap;

  @Mock private CppIncludeResolver cppIncludeResolver;
  @Mock private CBridgeIncludeResolver includeResolver;
  @Mock private CppNameResolver cppNameResolver;

  private CBridgeTypeMapper typeMapper;

  @Before
  public void setUp() {
    mockStatic(FrancaTypeHelper.class, DefinedBy.class);

    typeMapper =
        new CBridgeTypeMapper(
            cppIncludeResolver, cppNameResolver, includeResolver, "::FooHash", null);

    when(francaStructType.getName()).thenReturn("someStruct");

    when(DefinedBy.findDefiningTypeCollection(any(FModelElement.class)))
        .thenReturn(francaTypeCollection);

    when(cppIncludeResolver.resolveInclude(any())).thenReturn(CPP_INCLUDE);
    when(includeResolver.resolveInclude(any())).thenReturn(CBRIDGE_INCLUDE);
  }

  @Test
  public void mapTypeDefStruct() {
    when(francaTypeRef.getDerived()).thenReturn(francaTypeDef);
    when(francaTypeDef.getActualType()).thenReturn(francaTypeRef2);
    when(francaTypeRef2.getDerived()).thenReturn(francaStructType);
    when(cppNameResolver.getFullyQualifiedName(any())).thenReturn("::Foo");

    CppTypeInfo mapped = typeMapper.mapType(francaTypeRef);

    assertEquals("::Foo", mapped.name);
  }

  @Test
  public void mapTypeDefPredefine() {
    when(francaTypeRef.getDerived()).thenReturn(francaTypeDef);
    when(francaTypeDef.getActualType()).thenReturn(francaTypeRef2);
    when(francaTypeRef2.getPredefined()).thenReturn(FBasicTypeId.BOOLEAN);

    CppTypeInfo mapped = typeMapper.mapType(francaTypeRef);

    assertEquals(CType.BOOL.name, mapped.name);
  }

  @Test
  public void mapStructType() {
    when(francaTypeRef.getDerived()).thenReturn(francaStructType);
    when(cppNameResolver.getFullyQualifiedName(any())).thenReturn("::Foo");

    CppTypeInfo resultType = typeMapper.mapType(francaTypeRef);

    assertEquals("::Foo", resultType.name);
    assertTrue(resultType.includes.contains(CPP_INCLUDE));
    assertTrue(resultType.includes.contains(CBRIDGE_INCLUDE));
  }

  @Test
  public void mapPredefinedType() {
    when(francaTypeRef.getPredefined()).thenReturn(FBasicTypeId.BOOLEAN);

    CppTypeInfo mapped = typeMapper.mapType(francaTypeRef);
    assertEquals(CType.BOOL.name, mapped.name);
  }

  @Test
  public void mapEnumerationType() {
    when(francaTypeRef.getDerived()).thenReturn(francaEnum);
    when(cppNameResolver.getFullyQualifiedName(any())).thenReturn("::Foo");

    CppTypeInfo resultType = typeMapper.mapType(francaTypeRef);

    assertEquals("::Foo", resultType.name);
    assertTrue(resultType.includes.contains(CPP_INCLUDE));
    assertTrue(resultType.includes.contains(CBRIDGE_INCLUDE));
  }

  @Test
  public void mapArrayInlineType() {
    when(francaTypeRef.getPredefined()).thenReturn(FBasicTypeId.UINT64);
    when(FrancaTypeHelper.isImplicitArray(any())).thenReturn(true);

    CppTypeInfo actualType = typeMapper.mapType(francaTypeRef);

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
    when(cppNameResolver.getFullyQualifiedName(francaStructType)).thenReturn("::Foo");
    when(cppNameResolver.getFullyQualifiedName(francaMap)).thenReturn("::FooMap");

    CppTypeInfo result = typeMapper.mapType(francaTypeRef);

    assertEquals(CppTypeInfo.TypeCategory.MAP, result.typeCategory);
    assertTrue(result instanceof CppMapTypeInfo);

    CppMapTypeInfo resultMapType = (CppMapTypeInfo) result;
    assertEquals("::FooMap", resultMapType.name);
    assertEquals(BASE_REF_NAME, resultMapType.cType.name);
    assertEquals(BASE_REF_NAME, resultMapType.functionReturnType.name);
    assertEquals("std::unordered_map<std::string, ::Foo>", resultMapType.baseApi);
    assertEquals(2, resultMapType.includes.size());
    assertEquals(BASE_HANDLE_IMPL_FILE, resultMapType.includes.get(0).getFileName());
    assertEquals(CppLibraryIncludes.MAP, resultMapType.includes.get(1));
  }

  @Test
  public void mapMapTypeWithPrimitiveEnumType() {
    when(francaTypeRef.getDerived()).thenReturn(francaMap);
    when(francaMap.getKeyType().getDerived()).thenReturn(francaEnum);
    when(francaMap.getValueType().getDerived()).thenReturn(francaStructType);
    when(cppNameResolver.getFullyQualifiedName(francaEnum)).thenReturn("::Foo");
    when(cppNameResolver.getFullyQualifiedName(francaStructType)).thenReturn("::Bar");

    CppTypeInfo result = typeMapper.mapType(francaTypeRef);

    assertEquals(CppTypeInfo.TypeCategory.MAP, result.typeCategory);
    assertTrue(result instanceof CppMapTypeInfo);

    CppMapTypeInfo resultMapType = (CppMapTypeInfo) result;
    assertEquals("std::unordered_map<::Foo, ::Bar, ::FooHash>", resultMapType.baseApi);
    assertEquals(3, resultMapType.includes.size());
    assertEquals(CppLibraryIncludes.ENUM_HASH, resultMapType.includes.get(2));
  }
}
