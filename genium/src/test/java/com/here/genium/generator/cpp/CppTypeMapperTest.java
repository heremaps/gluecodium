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

package com.here.genium.generator.cpp;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static org.mockito.Mockito.when;

import com.here.genium.model.common.Include;
import com.here.genium.model.cpp.*;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import org.franca.core.franca.FBasicTypeId;
import org.franca.core.franca.FTypeRef;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

@RunWith(JUnit4.class)
public final class CppTypeMapperTest {

  @Mock private FTypeRef francaTypeRef;

  private final CppTypeMapper typeMapper = new CppTypeMapper(null, "");

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);
  }

  @Test
  public void mapBoolType() {
    when(francaTypeRef.getPredefined()).thenReturn(FBasicTypeId.BOOLEAN);

    CppTypeRef cppType = typeMapper.map(francaTypeRef);

    verifyPrimitiveType(cppType, CppPrimitiveTypeRef.Type.BOOL, Collections.emptyList());
  }

  @Test
  public void mapFloatType() {
    when(francaTypeRef.getPredefined()).thenReturn(FBasicTypeId.FLOAT);

    CppTypeRef cppType = typeMapper.map(francaTypeRef);

    verifyPrimitiveType(cppType, CppPrimitiveTypeRef.Type.FLOAT, Collections.emptyList());
  }

  @Test
  public void mapDoubleType() {
    when(francaTypeRef.getPredefined()).thenReturn(FBasicTypeId.DOUBLE);

    CppTypeRef cppType = typeMapper.map(francaTypeRef);

    verifyPrimitiveType(cppType, CppPrimitiveTypeRef.Type.DOUBLE, Collections.emptyList());
  }

  @Test
  public void mapInt8Type() {
    when(francaTypeRef.getPredefined()).thenReturn(FBasicTypeId.INT8);

    CppTypeRef cppType = typeMapper.map(francaTypeRef);

    verifyPrimitiveType(
        cppType,
        CppPrimitiveTypeRef.Type.INT8,
        Collections.singletonList(CppLibraryIncludes.INT_TYPES));
  }

  @Test
  public void mapInt16Type() {
    when(francaTypeRef.getPredefined()).thenReturn(FBasicTypeId.INT16);

    CppTypeRef cppType = typeMapper.map(francaTypeRef);

    verifyPrimitiveType(
        cppType,
        CppPrimitiveTypeRef.Type.INT16,
        Collections.singletonList(CppLibraryIncludes.INT_TYPES));
  }

  @Test
  public void mapInt32Type() {
    when(francaTypeRef.getPredefined()).thenReturn(FBasicTypeId.INT32);

    CppTypeRef cppType = typeMapper.map(francaTypeRef);

    verifyPrimitiveType(
        cppType,
        CppPrimitiveTypeRef.Type.INT32,
        Collections.singletonList(CppLibraryIncludes.INT_TYPES));
  }

  @Test
  public void mapInt64Type() {
    when(francaTypeRef.getPredefined()).thenReturn(FBasicTypeId.INT64);

    CppTypeRef cppType = typeMapper.map(francaTypeRef);

    verifyPrimitiveType(
        cppType,
        CppPrimitiveTypeRef.Type.INT64,
        Collections.singletonList(CppLibraryIncludes.INT_TYPES));
  }

  @Test
  public void mapUInt8Type() {
    when(francaTypeRef.getPredefined()).thenReturn(FBasicTypeId.UINT8);

    CppTypeRef cppType = typeMapper.map(francaTypeRef);

    verifyPrimitiveType(
        cppType,
        CppPrimitiveTypeRef.Type.UINT8,
        Collections.singletonList(CppLibraryIncludes.INT_TYPES));
  }

  @Test
  public void mapUInt16Type() {
    when(francaTypeRef.getPredefined()).thenReturn(FBasicTypeId.UINT16);

    CppTypeRef cppType = typeMapper.map(francaTypeRef);

    verifyPrimitiveType(
        cppType,
        CppPrimitiveTypeRef.Type.UINT16,
        Collections.singletonList(CppLibraryIncludes.INT_TYPES));
  }

  @Test
  public void mapUInt32Type() {
    when(francaTypeRef.getPredefined()).thenReturn(FBasicTypeId.UINT32);

    CppTypeRef cppType = typeMapper.map(francaTypeRef);

    verifyPrimitiveType(
        cppType,
        CppPrimitiveTypeRef.Type.UINT32,
        Collections.singletonList(CppLibraryIncludes.INT_TYPES));
  }

  @Test
  public void mapUInt64Type() {
    when(francaTypeRef.getPredefined()).thenReturn(FBasicTypeId.UINT64);

    CppTypeRef cppType = typeMapper.map(francaTypeRef);

    verifyPrimitiveType(
        cppType,
        CppPrimitiveTypeRef.Type.UINT64,
        Collections.singletonList(CppLibraryIncludes.INT_TYPES));
  }

  @Test
  public void mapUndefinedType() {
    when(francaTypeRef.getPredefined()).thenReturn(FBasicTypeId.UNDEFINED);

    CppTypeRef cppType = typeMapper.map(francaTypeRef);

    verifyPrimitiveType(cppType, CppPrimitiveTypeRef.Type.VOID, Collections.emptyList());
  }

  @Test
  public void wrapMapType() {
    Include fooInclude = Include.createInternalInclude("bar/Foo.h");
    CppTypeRef cppTypeRef = new CppComplexTypeRef.Builder("Foo").include(fooInclude).build();

    CppTypeRef result = typeMapper.wrapMap(CppPrimitiveTypeRef.UINT32, cppTypeRef);

    assertTrue(result.includes.contains(CppLibraryIncludes.INT_TYPES));
    assertTrue(result.includes.contains(fooInclude));
    assertTrue(result.includes.contains(CppLibraryIncludes.MAP));
    assertTrue(result instanceof CppTemplateTypeRef);

    CppTemplateTypeRef cppTemplateTypeRef = (CppTemplateTypeRef) result;
    assertEquals(CppTemplateTypeRef.TemplateClass.MAP, cppTemplateTypeRef.templateClass);
    assertEquals(2, cppTemplateTypeRef.templateParameters.size());
    assertEquals(CppPrimitiveTypeRef.UINT32, cppTemplateTypeRef.templateParameters.get(0));
    assertEquals(cppTypeRef, cppTemplateTypeRef.templateParameters.get(1));
  }

  @Test
  public void wrapMapTypeWithEnumKeyType() {
    CppTypeRef cppTypeRef = new CppComplexTypeRef.Builder("Foo").refersToEnum(true).build();

    CppTypeRef result = typeMapper.wrapMap(cppTypeRef, CppPrimitiveTypeRef.VOID);

    assertTrue(result.includes.contains(CppLibraryIncludes.ENUM_HASH));
    assertTrue(result instanceof CppTemplateTypeRef);

    CppTemplateTypeRef cppTemplateTypeRef = (CppTemplateTypeRef) result;
    assertEquals(3, cppTemplateTypeRef.templateParameters.size());
    assertEquals(typeMapper.getEnumHashType(), cppTemplateTypeRef.templateParameters.get(2));
  }

  private void verifyPrimitiveType(
      CppTypeRef actual, CppPrimitiveTypeRef.Type expectedType, List<Include> includes) {
    assertTrue(actual instanceof CppPrimitiveTypeRef);
    CppPrimitiveTypeRef primitiveType = (CppPrimitiveTypeRef) actual;
    assertEquals(expectedType, primitiveType.type);
    assertEquals(new HashSet<>(includes), primitiveType.includes);
  }
}
