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

package com.here.genium.generator.cbridge;

import static com.here.genium.generator.cbridge.CppTypeInfo.TypeCategory.ARRAY;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import com.here.genium.model.common.InstanceRules;
import org.franca.core.franca.*;
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
@PrepareForTest(InstanceRules.class)
public final class CBridgeArrayMapperTest {

  @Mock private FTypeRef francaTypeRef;
  @Mock private FStructType francaStructType;
  @Mock private FEnumerationType francaEnumerationType;
  @Mock private FArrayType francaArray;
  private static final String PREFIX = "arrayCollection_";

  @Mock(answer = Answers.RETURNS_DEEP_STUBS)
  private FTypeDef francaTypeDef;

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);
    PowerMockito.mockStatic(InstanceRules.class);
  }

  @Test
  public void structArrayName() {
    when(francaStructType.getName()).thenReturn("StructTest");

    String arrayName = CArrayMapper.getArrayName(francaStructType);

    assertEquals("Should have the same name", PREFIX + "StructTest", arrayName);
  }

  @Test
  public void typeDefArrayName() {
    when(francaTypeDef.getActualType().getDerived()).thenReturn(null);
    when(francaTypeDef.getActualType().getPredefined()).thenReturn(FBasicTypeId.STRING);

    String arrayName = CArrayMapper.getArrayName(francaTypeDef);

    assertEquals("Should have the same name", PREFIX + "String", arrayName);
  }

  @Test
  public void typeDefInstanceIdArrayName() {
    when(InstanceRules.isInstanceId(any(FTypeDef.class))).thenReturn(true);
    when(francaTypeDef.getName()).thenReturn("TypeDefTest");

    String arrayName = CArrayMapper.getArrayName(francaTypeDef);

    assertEquals("Should have the same name", PREFIX + "TypeDefTest", arrayName);

    PowerMockito.verifyStatic();
    InstanceRules.isInstanceId(francaTypeDef);
  }

  @Test
  public void typeRefArrayNameWithDerived() {
    when(francaStructType.getName()).thenReturn("StructTest");
    when(francaTypeRef.getDerived()).thenReturn(francaStructType);

    String arrayName = CArrayMapper.getArrayName(francaTypeRef);

    assertEquals("Should have the same name", PREFIX + "StructTest", arrayName);
  }

  @Test
  public void typeRefArrayNameWithoutDerived() {
    when(francaTypeRef.getPredefined()).thenReturn(FBasicTypeId.INT32);

    String arrayName = CArrayMapper.getArrayName(francaTypeRef);

    assertEquals("Should have the same name", PREFIX + "Int32", arrayName);
  }

  @Test
  public void arrayName() {
    when(francaTypeRef.getPredefined()).thenReturn(FBasicTypeId.INT32);
    when(francaArray.getElementType()).thenReturn(francaTypeRef);

    String arrayName = CArrayMapper.getArrayName(francaArray);

    assertEquals("Should have the same name", PREFIX + "Int32Array", arrayName);
  }

  @Test
  public void enumArrayName() {
    when(francaEnumerationType.getName()).thenReturn("EnumTest");

    String arrayName = CArrayMapper.getArrayName(francaEnumerationType);

    assertEquals("Should have the same name", PREFIX + "EnumTest", arrayName);
  }

  @Test
  public void createArrayCppTypeInfo() {
    when(francaStructType.getName()).thenReturn("StructTest");
    when(francaTypeRef.getDerived()).thenReturn(francaStructType);

    CppTypeInfo innerType = CppTypeInfo.Companion.getSTRING();
    CppArrayTypeInfo arrayType = CArrayMapper.createArrayReference(innerType);

    assertNotNull("Array type should not be null", arrayType);
    assertNotNull("Inner type should not be null", arrayType.getInnerType());
    assertEquals("Should return array type", ARRAY, arrayType.getTypeCategory());
    assertEquals(
        "Return type name should match", "_baseRef", arrayType.getFunctionReturnType().name);
  }

  @Test
  public void createNestedArrayCppTypeInfo() {
    when(francaStructType.getName()).thenReturn("StructTest");
    when(francaTypeRef.getDerived()).thenReturn(francaStructType);

    CppTypeInfo innerType = CppTypeInfo.Companion.getSTRING();
    CppArrayTypeInfo arrayType = CArrayMapper.createArrayReference(innerType);
    CppArrayTypeInfo nestedArrayType = CArrayMapper.createArrayReference(arrayType);

    assertNotNull("Array type should not be null", nestedArrayType);
    assertNotNull("Inner type should not be null", nestedArrayType.getInnerType());
    assertEquals("Should return array type", ARRAY, nestedArrayType.getTypeCategory());
    assertEquals(
        "Should return array type", ARRAY, nestedArrayType.getInnerType().getTypeCategory());
    assertEquals(
        "Return type name should match", "_baseRef", nestedArrayType.getFunctionReturnType().name);
  }

  @Test
  public void multipleNestedArraysGetArraySuffix() {
    FTypeRef innerRef = mock(FTypeRef.class);
    FTypeRef innerInnerRef = mock(FTypeRef.class);
    FArrayType innerArray = mock(FArrayType.class);
    FArrayType innerInnerArray = mock(FArrayType.class);

    when(innerRef.getDerived()).thenReturn(innerArray);
    when(innerInnerRef.getDerived()).thenReturn(innerInnerArray);

    when(francaArray.getElementType()).thenReturn(innerRef);
    when(innerArray.getElementType()).thenReturn(innerInnerRef);
    when(innerInnerArray.getElementType()).thenReturn(francaTypeRef);
    when(francaTypeRef.getPredefined()).thenReturn(FBasicTypeId.INT32);

    String arrayName = CArrayMapper.getArrayName(francaArray);

    assertEquals("All arrays have array suffix", "arrayCollection_Int32ArrayArrayArray", arrayName);
  }

  @Test
  public void mapName() {
    FMapType map = mock(FMapType.class);
    FTypeRef key = mock(FTypeRef.class);
    FTypeRef value = mock(FTypeRef.class);

    when(map.getKeyType()).thenReturn(key);
    when(map.getValueType()).thenReturn(value);
    when(key.getPredefined()).thenReturn(FBasicTypeId.INT32);
    when(value.getPredefined()).thenReturn(FBasicTypeId.STRING);

    String arrayName = CArrayMapper.getArrayName(map);

    assertEquals(PREFIX + "Int32ToStringMap", arrayName);
  }
}
