/*
 * Copyright (C) 2016-2018 HERE Europe B.V.
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

package com.here.genium.generator.jni;

import static org.junit.Assert.assertEquals;

import com.here.genium.model.java.*;
import java.util.Arrays;
import java.util.Collection;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;

@RunWith(Parameterized.class)
public final class JniTypeNameMapperTest {

  private final JavaType javaType;
  private final String expectedJniTypeName;

  public JniTypeNameMapperTest(final JavaType javaType, final String expectedJniTypeName) {
    this.javaType = javaType;
    this.expectedJniTypeName = expectedJniTypeName;
  }

  @Parameterized.Parameters
  public static Collection<Object[]> testData() {
    return Arrays.asList(
        new Object[][] {
          {JavaPrimitiveType.VOID, "void"},
          {JavaPrimitiveType.INT, "jint"},
          {JavaPrimitiveType.DOUBLE, "jdouble"},
          {JavaPrimitiveType.FLOAT, "jfloat"},
          {JavaPrimitiveType.LONG, "jlong"},
          {JavaPrimitiveType.BOOL, "jboolean"},
          {JavaPrimitiveType.BYTE, "jbyte"},
          {JavaPrimitiveType.SHORT, "jshort"},
          {JavaPrimitiveType.CHAR, "jchar"},
          {JavaArrayType.BOOL_ARRAY, "jbooleanArray"},
          {JavaArrayType.BYTE_ARRAY, "jbyteArray"},
          {JavaArrayType.CHAR_ARRAY, "jcharArray"},
          {JavaArrayType.DOUBLE_ARRAY, "jdoubleArray"},
          {JavaArrayType.FLOAT_ARRAY, "jfloatArray"},
          {JavaArrayType.INT_ARRAY, "jintArray"},
          {JavaArrayType.LONG_ARRAY, "jlongArray"},
          {JavaArrayType.SHORT_ARRAY, "jshortArray"},
          {new JavaReferenceType(JavaReferenceType.Type.BOOL), "jobject"},
          {new JavaReferenceType(JavaReferenceType.Type.BYTE), "jobject"},
          {new JavaReferenceType(JavaReferenceType.Type.CHAR), "jobject"},
          {new JavaReferenceType(JavaReferenceType.Type.CLASS), "jclass"},
          {new JavaReferenceType(JavaReferenceType.Type.DOUBLE), "jobject"},
          {new JavaReferenceType(JavaReferenceType.Type.FLOAT), "jobject"},
          {new JavaReferenceType(JavaReferenceType.Type.INT), "jobject"},
          {new JavaReferenceType(JavaReferenceType.Type.LONG), "jobject"},
          {new JavaReferenceType(JavaReferenceType.Type.OBJECT), "jobject"},
          {new JavaReferenceType(JavaReferenceType.Type.SHORT), "jobject"},
          {new JavaReferenceType(JavaReferenceType.Type.STRING), "jstring"},
          {new JavaReferenceType(JavaReferenceType.Type.THROWABLE), "jthrowable"},
          {new JavaCustomType("MyFancyType"), "jobject"}
        });
  }

  @Test
  public void mapTypeName() {

    // Act
    String result = JniTypeNameMapper.map(javaType);

    // Assert
    assertEquals(expectedJniTypeName, result);
  }
}
