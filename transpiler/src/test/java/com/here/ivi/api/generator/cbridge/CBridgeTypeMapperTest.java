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

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;
import static org.powermock.api.mockito.PowerMockito.mockStatic;

import com.here.ivi.api.common.FrancaTypeHelper;
import com.here.ivi.api.model.cbridge.CType;
import com.here.ivi.api.model.cbridge.IncludeResolver;
import com.here.ivi.api.model.franca.DefinedBy;
import org.franca.core.franca.*;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
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

  @Mock private IncludeResolver resolver;

  @Before
  public void setUp() {
    mockStatic(FrancaTypeHelper.class, DefinedBy.class);

    when(francaStructType.getName()).thenReturn("foo");

    when(DefinedBy.findDefiningTypeCollection(any(FModelElement.class)))
        .thenReturn(francaTypeCollection);
  }

  @Test
  public void mapTypeDefStruct() {
    when(francaTypeRef.getDerived()).thenReturn(francaTypeDef);
    when(francaTypeDef.getActualType()).thenReturn(francaTypeRef2);
    when(francaTypeRef2.getDerived()).thenReturn(francaStructType);

    CppTypeInfo mapped = CTypeMapper.mapType(resolver, francaTypeRef);

    assertEquals("Foo", mapped.name);
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

    assertEquals(actualType.typeCategory, CppTypeInfo.TypeCategory.ARRAY);
    assertNotNull(actualType.innerType);
    assertEquals(actualType.innerType.functionReturnType.name, "uint64_t");
  }
}
