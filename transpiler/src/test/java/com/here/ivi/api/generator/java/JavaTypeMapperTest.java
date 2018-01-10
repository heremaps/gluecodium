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

package com.here.ivi.api.generator.java;

import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.when;

import com.here.ivi.api.model.java.JavaPackage;
import com.here.ivi.api.model.java.JavaType;
import java.util.Arrays;
import java.util.Collection;
import org.franca.core.franca.FBasicTypeId;
import org.franca.core.franca.FTypeRef;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

@RunWith(Parameterized.class)
public class JavaTypeMapperTest {

  private final FBasicTypeId francaBasicType;
  private final String expectedJavaTypeName;

  @Mock private FTypeRef francaTypeRef;

  private final JavaTypeMapper typeMapper = new JavaTypeMapper(JavaPackage.DEFAULT);

  public JavaTypeMapperTest(final FBasicTypeId francaBasicType, final String expectedJavaTypeName) {
    this.francaBasicType = francaBasicType;
    this.expectedJavaTypeName = expectedJavaTypeName;
  }

  @Parameterized.Parameters
  public static Collection<Object[]> testData() {
    return Arrays.asList(
        new Object[][] {
          {FBasicTypeId.BOOLEAN, "boolean"},
          {FBasicTypeId.FLOAT, "float"},
          {FBasicTypeId.DOUBLE, "double"},
          {FBasicTypeId.INT8, "byte"},
          {FBasicTypeId.INT16, "short"},
          {FBasicTypeId.INT32, "int"},
          {FBasicTypeId.INT64, "long"},
          {FBasicTypeId.UINT8, "long"},
          {FBasicTypeId.UINT16, "long"},
          {FBasicTypeId.UINT32, "long"},
          {FBasicTypeId.UINT64, "long"},
          {FBasicTypeId.STRING, "String"},
          {FBasicTypeId.BYTE_BUFFER, "byte[]"},
          {FBasicTypeId.UNDEFINED, "void"},
        });
  }

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);
  }

  @Test
  public void mapFrancaBasicTypeToJavaType() {
    when(francaTypeRef.getPredefined()).thenReturn(francaBasicType);

    JavaType returnedJavaType = typeMapper.map(francaTypeRef);

    assertEquals(expectedJavaTypeName, returnedJavaType.name);
  }
}
