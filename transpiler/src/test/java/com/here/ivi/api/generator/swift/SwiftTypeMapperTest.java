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

import static java.util.Collections.emptyList;
import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.when;

import com.here.ivi.api.model.franca.FrancaElement;
import com.here.ivi.api.model.franca.ModelInfo;
import com.here.ivi.api.model.swift.SwiftType;
import org.franca.core.franca.FBasicTypeId;
import org.franca.core.franca.FStructType;
import org.franca.core.franca.FTypeRef;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
@PrepareForTest(FBasicTypeId.class)
public class SwiftTypeMapperTest {
  @Mock private FrancaElement francaElement;
  @Mock private ModelInfo modelInfo;
  @Mock private FTypeRef typeRef;
  @Mock private FStructType francaStructType;
  @Mock private FBasicTypeId francaBasicTypeId;

  @Before
  public void setUp() {
    when(francaElement.getModelInfo()).thenReturn(modelInfo);
    when(modelInfo.getPackageNames()).thenReturn(emptyList());
    when(typeRef.getPredefined()).thenReturn(francaBasicTypeId);
    when(francaStructType.getName()).thenReturn("Struct");
  }

  @Test
  public void StringAsReturnValueIsMappedToOptionalType() {
    when(francaBasicTypeId.getValue()).thenReturn(FBasicTypeId.STRING_VALUE);

    SwiftType mappedType = SwiftTypeMapper.mapOutputType(francaElement, typeRef);

    assertEquals(
        "Return value of String type should be mapped as optional", true, mappedType.optional);
  }

  @Test
  public void ByteBufferAsReturnValueIsMappedToOptionalType() {
    when(francaBasicTypeId.getValue()).thenReturn(FBasicTypeId.BYTE_BUFFER_VALUE);

    SwiftType mappedType = SwiftTypeMapper.mapOutputType(francaElement, typeRef);

    assertEquals(
        "Return value of Data type should be mapped as optional", true, mappedType.optional);
  }

  @Test
  public void DoubleAsReturnValueIsMappedToOptionalType() {
    when(francaBasicTypeId.getValue()).thenReturn(FBasicTypeId.DOUBLE_VALUE);

    SwiftType mappedType = SwiftTypeMapper.mapOutputType(francaElement, typeRef);

    assertEquals(
        "Return value of Double type should not be mapped as optional", false, mappedType.optional);
  }

  @Test
  public void StructAsReturnValueIsMappedToOptionalType() {
    when(typeRef.getDerived()).thenReturn(francaStructType);

    SwiftType mappedType = SwiftTypeMapper.mapOutputType(francaElement, typeRef);

    assertEquals(
        "Return value of Struct type should be mapped as optional", true, mappedType.optional);
  }
}
