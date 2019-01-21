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

package com.here.genium.generator.java;

import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.when;

import com.here.genium.model.java.JavaPackage;
import com.here.genium.model.java.JavaType;
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

  private final JavaTypeMapper typeMapper =
      new JavaTypeMapper(JavaPackage.Companion.getDEFAULT(), null, null);

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
          {FBasicTypeId.UINT8, "short"},
          {FBasicTypeId.UINT16, "int"},
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

    JavaType returnedJavaType = typeMapper.map(francaTypeRef, null);

    assertEquals(expectedJavaTypeName, returnedJavaType.name);
  }
}
