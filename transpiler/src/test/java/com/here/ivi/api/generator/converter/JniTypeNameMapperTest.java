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

package com.here.ivi.api.generator.converter;

import static org.junit.Assert.assertEquals;

import com.here.ivi.api.generator.jni.JniTypeNameMapper;
import com.here.ivi.api.model.javamodel.*;
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
