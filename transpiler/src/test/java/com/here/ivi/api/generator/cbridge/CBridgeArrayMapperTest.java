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

import static com.here.ivi.api.generator.cbridge.CppTypeInfo.TypeCategory.ARRAY;
import static org.mockito.Mockito.when;

import org.franca.core.franca.*;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
@PrepareForTest(FBasicTypeId.class)
public class CBridgeArrayMapperTest {

  @Mock private FTypeRef francaTypeRef;
  @Mock private FTypeDef francaTypeDef;
  @Mock private FStructType francaStructType;
  @Mock private FArrayType francaArray;
  @Mock private FBasicTypeId francaBasic;

  @Test
  public void structArrayName() {
    when(francaStructType.getName()).thenReturn("StructTest");

    String arrayName = CArrayMapper.getName(francaStructType);

    Assert.assertEquals("Should have the same name", "StructTest", arrayName);
  }

  @Test
  public void typeDefArrayName() {
    when(francaTypeDef.getName()).thenReturn("TypeDefTest");

    String arrayName = CArrayMapper.getName(francaTypeDef);

    Assert.assertEquals("Should have the same name", "TypeDefTest", arrayName);
  }

  @Test
  public void typeRefArrayNameWithDerived() {
    when(francaStructType.getName()).thenReturn("StructTest");
    when(francaTypeRef.getDerived()).thenReturn(francaStructType);

    String arrayName = CArrayMapper.getName(francaTypeRef);

    Assert.assertEquals("Should have the same name", "StructTest", arrayName);
  }

  @Test
  public void typeRefArrayNameWithoutDerived() {
    when(francaBasic.getName()).thenReturn("IntTest");
    when(francaTypeRef.getPredefined()).thenReturn(francaBasic);

    String arrayName = CArrayMapper.getName(francaTypeRef);

    Assert.assertEquals("Should have the same name", "IntTest", arrayName);
  }

  @Test
  public void arrayName() {
    when(francaBasic.getName()).thenReturn("IntTest");
    when(francaTypeRef.getPredefined()).thenReturn(francaBasic);
    when(francaArray.getElementType()).thenReturn(francaTypeRef);

    String arrayName = CArrayMapper.getName(francaArray);

    Assert.assertEquals("Should have the same name", "IntTest", arrayName);
  }

  @Test
  public void unknowTypeReturnUndefinded() {
    String arrayName = CArrayMapper.getName(null);
    Assert.assertEquals("Should return undefined", "undefined", arrayName);
  }

  @Test
  public void createArrayCppTypeInfo() {
    when(francaStructType.getName()).thenReturn("StructTest");
    when(francaTypeRef.getDerived()).thenReturn(francaStructType);

    CppTypeInfo innerType = CppTypeInfo.STRING;
    CppTypeInfo arrayType = CArrayMapper.create(innerType, francaTypeRef);

    Assert.assertNotNull("Array type should not be null", arrayType);
    Assert.assertNotNull("Inner typ should not be null", arrayType.innerType);
    Assert.assertEquals("Should return array type", ARRAY, arrayType.typeCategory);
    Assert.assertEquals(
        "Array name should match", "arrayCollection_StructTest", arrayType.functionReturnType.name);
  }

  @Test
  public void createNestedArrayCppTypeInfo() {
    when(francaStructType.getName()).thenReturn("StructTest");
    when(francaTypeRef.getDerived()).thenReturn(francaStructType);

    CppTypeInfo innerType = CppTypeInfo.STRING;
    CppTypeInfo arrayType = CArrayMapper.create(innerType, francaTypeRef);
    CppTypeInfo nestedArrayType = CArrayMapper.create(arrayType, francaTypeRef);

    Assert.assertNotNull("Array type should not be null", nestedArrayType);
    Assert.assertNotNull("Inner type should not be null", nestedArrayType.innerType);
    Assert.assertEquals("Should return array type", ARRAY, nestedArrayType.typeCategory);
    Assert.assertEquals("Should return array type", ARRAY, nestedArrayType.innerType.typeCategory);
    Assert.assertEquals(
        "Array name should match",
        "arrayCollection_StructTestArray",
        nestedArrayType.functionReturnType.name);
  }

  @Test
  public void createArrayUndefinedWithNoFrancaType() {
    CppTypeInfo innerType = CppTypeInfo.STRING;
    CppTypeInfo arrayType = CArrayMapper.create(innerType, null);

    Assert.assertEquals(
        "Array name should be undefined",
        "arrayCollection_undefined",
        arrayType.functionReturnType.name);
  }
}
