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

import static org.mockito.Mockito.when;

import com.here.ivi.api.model.franca.Interface;
import java.util.ArrayList;
import org.franca.core.franca.FBasicTypeId;
import org.franca.core.franca.FStructType;
import org.franca.core.franca.FTypeRef;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Answers;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.MockitoJUnitRunner;

@RunWith(MockitoJUnitRunner.class)
public class CBridgeTypeMapperTest {

  @Mock private FTypeRef francaTypeRef;

  @Mock(answer = Answers.RETURNS_DEEP_STUBS)
  private Interface<?> rootModel;

  @Test
  public void mapStructType() {
    FStructType francaStructType = Mockito.mock(FStructType.class);
    when(francaTypeRef.getDerived()).thenReturn(francaStructType);
    when(francaStructType.getName()).thenReturn("TestStruct");
    when(rootModel.getModelInfo().getPackageNames()).thenReturn(new ArrayList<>());

    CppTypeInfo mapped = CTypeMapper.mapType(rootModel, francaTypeRef);
    Assert.assertEquals("TestStruct", mapped.baseType);
  }

  @Test
  public void mapPredefinedType() {
    when(francaTypeRef.getPredefined()).thenReturn(FBasicTypeId.BOOLEAN);

    CppTypeInfo mapped = CTypeMapper.mapType(rootModel, francaTypeRef);
    Assert.assertEquals("bool", mapped.baseType);
  }
}
