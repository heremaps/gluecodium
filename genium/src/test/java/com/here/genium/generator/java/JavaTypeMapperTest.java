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
import static org.junit.Assert.assertTrue;
import static org.junit.Assume.assumeNotNull;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import com.here.genium.model.franca.FrancaDeploymentModel;
import com.here.genium.model.java.JavaPackage;
import com.here.genium.model.java.JavaPrimitiveType;
import com.here.genium.model.java.JavaReferenceType;
import com.here.genium.model.java.JavaReferenceType.Type;
import com.here.genium.model.java.JavaType;
import java.util.Arrays;
import java.util.Collection;
import org.franca.core.franca.FBasicTypeId;
import org.franca.core.franca.FField;
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
  private final JavaReferenceType.Type expectedReferenceType;

  @Mock private FTypeRef francaTypeRef;

  @Mock private FrancaDeploymentModel deploymentModel;

  private final JavaTypeMapper typeMapper =
      new JavaTypeMapper(JavaPackage.Companion.getDEFAULT(), null, null, JavaPrimitiveType.BOOL);

  public JavaTypeMapperTest(
      final FBasicTypeId francaBasicType,
      final String expectedJavaTypeName,
      final JavaReferenceType.Type referenceType) {
    this.francaBasicType = francaBasicType;
    this.expectedJavaTypeName = expectedJavaTypeName;
    this.expectedReferenceType = referenceType;
  }

  @Parameterized.Parameters
  public static Collection<Object[]> testData() {
    return Arrays.asList(
        new Object[][] {
          {FBasicTypeId.BOOLEAN, "boolean", Type.BOOL},
          {FBasicTypeId.FLOAT, "float", Type.FLOAT},
          {FBasicTypeId.DOUBLE, "double", Type.DOUBLE},
          {FBasicTypeId.INT8, "byte", Type.BYTE},
          {FBasicTypeId.INT16, "short", Type.SHORT},
          {FBasicTypeId.INT32, "int", Type.INT},
          {FBasicTypeId.INT64, "long", Type.LONG},
          {FBasicTypeId.UINT8, "short", Type.SHORT},
          {FBasicTypeId.UINT16, "int", Type.INT},
          {FBasicTypeId.UINT32, "long", Type.LONG},
          {FBasicTypeId.UINT64, "long", Type.LONG},
          {FBasicTypeId.STRING, "String", Type.STRING},
          {FBasicTypeId.BYTE_BUFFER, "byte[]", null},
          {FBasicTypeId.UNDEFINED, "void", null},
        });
  }

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);

    when(francaTypeRef.getPredefined()).thenReturn(francaBasicType);
    when(francaTypeRef.eContainer()).thenReturn(mock(FField.class));
  }

  @Test
  public void mapFrancaBasicTypeToJavaType() {
    JavaType returnedJavaType = typeMapper.map(francaTypeRef, deploymentModel);

    assertEquals(expectedJavaTypeName, returnedJavaType.name);
  }

  @Test
  public void mapFrancaBasicTypeToNullableJavaType() {
    assumeNotNull(expectedReferenceType);

    when(deploymentModel.isNullable(any())).thenReturn(true);

    JavaType returnedJavaType = typeMapper.map(francaTypeRef, deploymentModel);

    assertTrue(returnedJavaType instanceof JavaReferenceType);
    JavaReferenceType referenceType = (JavaReferenceType) returnedJavaType;
    assertEquals(expectedReferenceType, referenceType.type);
  }
}
