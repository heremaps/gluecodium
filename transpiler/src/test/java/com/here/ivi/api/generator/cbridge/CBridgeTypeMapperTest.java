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

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;
import static org.powermock.api.mockito.PowerMockito.mockStatic;

import com.here.ivi.api.model.cmodel.CType;
import com.here.ivi.api.model.cmodel.IncludeResolver;
import org.franca.core.franca.FBasicTypeId;
import org.franca.core.franca.FStructType;
import org.franca.core.franca.FTypeRef;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
@PrepareForTest(CppTypeInfo.class)
public class CBridgeTypeMapperTest {

  @Mock private FTypeRef francaTypeRef;
  @Mock private FStructType francaStructType;
  @Mock private IncludeResolver resolver;
  @Mock private CppTypeInfo typeInfo;

  @Before
  public void setUp() {
    mockStatic(CppTypeInfo.class);
  }

  @Test
  public void mapStructType() {
    when(francaTypeRef.getDerived()).thenReturn(francaStructType);
    when(CppTypeInfo.createStructTypeInfo(any(), any())).thenReturn(typeInfo);

    CppTypeInfo mapped = CTypeMapper.mapType(resolver, francaTypeRef);

    Assert.assertSame(typeInfo, mapped);
  }

  @Test
  public void mapPredefinedType() {
    when(francaTypeRef.getPredefined()).thenReturn(FBasicTypeId.BOOLEAN);

    CppTypeInfo mapped = CTypeMapper.mapType(resolver, francaTypeRef);
    Assert.assertEquals(CType.BOOL.name, mapped.baseType);
  }
}
