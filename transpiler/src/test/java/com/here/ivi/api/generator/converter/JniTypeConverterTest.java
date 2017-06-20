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

import com.here.ivi.api.generator.common.jni.JniTypeConverter;
import com.here.ivi.api.model.cppmodel.CppType;
import com.here.ivi.api.model.javamodel.JavaCustomType;
import com.here.ivi.api.model.javamodel.JavaPrimitiveType;
import com.here.ivi.api.model.javamodel.JavaPrimitiveType.Type;
import com.here.ivi.api.model.javamodel.JavaReferenceType;
import com.here.ivi.api.model.javamodel.JavaType;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.ExpectedException;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class JniTypeConverterTest {
  @Rule public final ExpectedException expectedException = ExpectedException.none();

  @Test
  public void convertVoidType() {
    // Arrange
    JavaType javaPrimitiveType = new JavaPrimitiveType(Type.VOID);

    // Act
    CppType voidType = JniTypeConverter.map(javaPrimitiveType);

    // Assert
    assertEquals("void", voidType.name);
  }

  @Test
  public void convertBooleanType() {
    // Arrange
    JavaType javaBool = new JavaPrimitiveType(Type.BOOL);

    // Act
    CppType jniBool = JniTypeConverter.map(javaBool);

    // Assert
    assertEquals(jniBool.name, ("j" + javaBool.getName()));
  }

  @Test
  public void convertByteType() {
    // Arrange
    JavaType javaByte = new JavaPrimitiveType(Type.BYTE);

    // Act
    CppType jniByte = JniTypeConverter.map(javaByte);

    // Assert
    assertEquals(jniByte.name, ("j" + javaByte.getName()));
  }

  @Test
  public void convertCharType() {
    // Arrange
    JavaType javaChar = new JavaPrimitiveType(Type.CHAR);

    // Act
    CppType jniChar = JniTypeConverter.map(javaChar);

    // Assert
    assertEquals(jniChar.name, ("j" + javaChar.getName()));
  }

  @Test
  public void convertDoubleType() {
    // Arrange
    JavaType javaDouble = new JavaPrimitiveType(Type.DOUBLE);

    // Act
    CppType jniDouble = JniTypeConverter.map(javaDouble);

    // Assert
    assertEquals(jniDouble.name, ("j" + javaDouble.getName()));
  }

  @Test
  public void convertFloatType() {
    // Arrange
    JavaType javaFloat = new JavaPrimitiveType(Type.FLOAT);

    // Act
    CppType jniFloat = JniTypeConverter.map(javaFloat);

    // Assert
    assertEquals(jniFloat.name, ("j" + javaFloat.getName()));
  }

  @Test
  public void convertIntType() {
    // Arrange
    JavaType javaInt = new JavaPrimitiveType(Type.INT);

    // Act
    CppType jniInt = JniTypeConverter.map(javaInt);

    // Assert
    assertEquals(jniInt.name, ("j" + javaInt.getName()));
  }

  @Test
  public void convertLongType() {
    // Arrange
    JavaType javaLong = new JavaPrimitiveType(Type.LONG);

    // Act
    CppType jniLong = JniTypeConverter.map(javaLong);

    // Assert
    assertEquals(jniLong.name, ("j" + javaLong.getName()));
  }

  @Test
  public void convertShortType() {
    // Arrange
    JavaType javaShort = new JavaPrimitiveType(Type.SHORT);

    // Act
    CppType jniShort = JniTypeConverter.map(javaShort);

    // Assert
    assertEquals(jniShort.name, ("j" + javaShort.getName()));
  }

  @Test
  public void convertClassType() {
    // Arrange
    JavaType javaClass = new JavaReferenceType(JavaReferenceType.Type.CLASS);

    // Act
    CppType jniString = JniTypeConverter.map(javaClass);

    // Assert
    assertEquals(jniString.name, "jclass");
  }

  @Test
  public void convertStringType() {
    // Arrange
    JavaType javaString = new JavaReferenceType(JavaReferenceType.Type.STRING);

    // Act
    CppType jniString = JniTypeConverter.map(javaString);

    // Assert
    assertEquals(jniString.name, "jstring");
  }

  @Test
  public void convertObjectArrayType() {
    // Arrange
    JavaType javaString = new JavaReferenceType(JavaReferenceType.Type.OBJECT_ARRAY);

    // Act
    CppType jniString = JniTypeConverter.map(javaString);

    // Assert
    assertEquals(jniString.name, "jobjectArray");
  }

  @Test
  public void convertByteArrayType() {
    // Arrange
    JavaType javaString = new JavaReferenceType(JavaReferenceType.Type.BYTE_ARRAY);

    // Act
    CppType jniString = JniTypeConverter.map(javaString);

    // Assert
    assertEquals(jniString.name, "jbyteArray");
  }

  @Test
  public void convertCharArrayType() {
    // Arrange
    JavaType javaString = new JavaReferenceType(JavaReferenceType.Type.CHAR_ARRAY);

    // Act
    CppType jniString = JniTypeConverter.map(javaString);

    // Assert
    assertEquals(jniString.name, "jcharArray");
  }

  @Test
  public void convertShortArrayType() {
    // Arrange
    JavaType javaString = new JavaReferenceType(JavaReferenceType.Type.SHORT_ARRAY);

    // Act
    CppType jniString = JniTypeConverter.map(javaString);

    // Assert
    assertEquals(jniString.name, "jshortArray");
  }

  @Test
  public void convertIntArrayType() {
    // Arrange
    JavaType javaString = new JavaReferenceType(JavaReferenceType.Type.INT_ARRAY);

    // Act
    CppType jniString = JniTypeConverter.map(javaString);

    // Assert
    assertEquals(jniString.name, "jintArray");
  }

  @Test
  public void convertLongArrayType() {
    // Arrange
    JavaType javaString = new JavaReferenceType(JavaReferenceType.Type.LONG_ARRAY);

    // Act
    CppType jniString = JniTypeConverter.map(javaString);

    // Assert
    assertEquals(jniString.name, "jlongArray");
  }

  @Test
  public void convertFloatArrayType() {
    // Arrange
    JavaType javaString = new JavaReferenceType(JavaReferenceType.Type.FLOAT_ARRAY);

    // Act
    CppType jniString = JniTypeConverter.map(javaString);

    // Assert
    assertEquals(jniString.name, "jfloatArray");
  }

  @Test
  public void convertDoubleArrayType() {
    // Arrange
    JavaType javaString = new JavaReferenceType(JavaReferenceType.Type.DOUBLE_ARRAY);

    // Act
    CppType jniString = JniTypeConverter.map(javaString);

    // Assert
    assertEquals(jniString.name, "jdoubleArray");
  }

  @Test
  public void convertThrowableType() {
    // Arrange
    JavaType javaString = new JavaReferenceType(JavaReferenceType.Type.THROWABLE);

    // Act
    CppType jniString = JniTypeConverter.map(javaString);

    // Assert
    assertEquals(jniString.name, "jthrowable");
  }

  @Test
  public void convertCustomType() {
    // Arrange
    JavaType javaCustom = new JavaCustomType("MyFancyType");

    // Act
    CppType jniCustom = JniTypeConverter.map(javaCustom);

    // Assert
    assertEquals(jniCustom.name, "jobject");
  }
}
