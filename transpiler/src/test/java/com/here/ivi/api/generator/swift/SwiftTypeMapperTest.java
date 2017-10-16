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

package com.here.ivi.api.generator.swift;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
import static org.mockito.Mockito.when;

import com.here.ivi.api.model.swift.SwiftType;
import org.franca.core.franca.FBasicTypeId;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FModel;
import org.franca.core.franca.FStructType;
import org.franca.core.franca.FTypeRef;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

@RunWith(JUnit4.class)
public class SwiftTypeMapperTest {

  @Mock private FTypeRef typeRef;
  @Mock private FStructType francaStructType;
  @Mock private FInterface francaInterface;
  @Mock private FModel francaModel;

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);

    when(francaStructType.eContainer()).thenReturn(francaInterface);
    when(francaInterface.eContainer()).thenReturn(francaModel);
    when(francaModel.getName()).thenReturn("");
  }

  @Test
  public void stringAsReturnValueIsMappedToOptionalType() {
    when(typeRef.getPredefined()).thenReturn(FBasicTypeId.STRING);

    SwiftType mappedType = SwiftTypeMapper.mapOutputType(typeRef);

    assertTrue("Return value of String type should be mapped as optional", mappedType.optional);
  }

  @Test
  public void byteBufferAsReturnValueIsMappedToOptionalType() {
    when(typeRef.getPredefined()).thenReturn(FBasicTypeId.BYTE_BUFFER);

    SwiftType mappedType = SwiftTypeMapper.mapOutputType(typeRef);

    assertFalse("Return value of Data type should be mapped as non optional", mappedType.optional);
  }

  @Test
  public void doubleAsReturnValueIsNotMappedToOptionalType() {
    when(typeRef.getPredefined()).thenReturn(FBasicTypeId.DOUBLE);

    SwiftType mappedType = SwiftTypeMapper.mapOutputType(typeRef);

    assertFalse(
        "Return value of Double type should not be mapped as optional", mappedType.optional);
  }

  @Test
  public void structAsReturnValueIsMappedToOptionalType() {
    when(typeRef.getDerived()).thenReturn(francaStructType);

    SwiftType mappedType = SwiftTypeMapper.mapOutputType(typeRef);

    assertTrue("Return value of Struct type should be mapped as optional", mappedType.optional);
  }
}
