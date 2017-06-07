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
import static org.mockito.Mockito.*;

import com.here.ivi.api.generator.converter.java.JavaJniTypeConverter;
import com.here.ivi.api.model.cppmodel.CppType;
import com.here.ivi.api.model.javamodel.JavaComplexType;
import com.here.ivi.api.model.javamodel.JavaPrimitiveType;
import com.here.ivi.api.model.javamodel.JavaPrimitiveType.Type;
import com.here.ivi.api.model.javamodel.JavaType;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.ExpectedException;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class JavaJniTypeConverterTest {

  @Rule public final ExpectedException expectedException = ExpectedException.none();

  @Test
  public void convertVoidType() {
    JavaType javaPrimitiveType = new JavaPrimitiveType(Type.VOID);
    expectedException.expect(IllegalArgumentException.class);
    JavaJniTypeConverter.convertToJniType(javaPrimitiveType);
  }

  @Test
  public void convertBooleanType() {
    JavaType javaBool = new JavaPrimitiveType(Type.BOOL);
    CppType jniBool = JavaJniTypeConverter.convertToJniType(javaBool);
    assertEquals(jniBool.name, ("j" + javaBool.getName()));
  }

  @Test
  public void convertByteType() {
    JavaType javaByte = new JavaPrimitiveType(Type.BYTE);
    CppType jniByte = JavaJniTypeConverter.convertToJniType(javaByte);
    assertEquals(jniByte.name, ("j" + javaByte.getName()));
  }

  @Test
  public void convertCharType() {
    JavaType javaChar = new JavaPrimitiveType(Type.CHAR);
    CppType jniChar = JavaJniTypeConverter.convertToJniType(javaChar);
    assertEquals(jniChar.name, ("j" + javaChar.getName()));
  }

  @Test
  public void convertDoubleType() {
    JavaType javaDouble = new JavaPrimitiveType(Type.DOUBLE);
    CppType jniDouble = JavaJniTypeConverter.convertToJniType(javaDouble);
    assertEquals(jniDouble.name, ("j" + javaDouble.getName()));
  }

  @Test
  public void convertFloatType() {
    JavaType javaFloat = new JavaPrimitiveType(Type.FLOAT);
    CppType jniFloat = JavaJniTypeConverter.convertToJniType(javaFloat);
    assertEquals(jniFloat.name, ("j" + javaFloat.getName()));
  }

  @Test
  public void convertIntType() {
    JavaType javaInt = new JavaPrimitiveType(Type.INT);
    CppType jniInt = JavaJniTypeConverter.convertToJniType(javaInt);
    assertEquals(jniInt.name, ("j" + javaInt.getName()));
  }

  @Test
  public void convertLongType() {
    JavaType javaLong = new JavaPrimitiveType(Type.LONG);
    CppType jniLong = JavaJniTypeConverter.convertToJniType(javaLong);
    assertEquals(jniLong.name, ("j" + javaLong.getName()));
  }

  @Test
  public void convertShortType() {
    JavaType javaShort = new JavaPrimitiveType(Type.SHORT);
    CppType jniShort = JavaJniTypeConverter.convertToJniType(javaShort);
    assertEquals(jniShort.name, ("j" + javaShort.getName()));
  }

  @Test
  public void convertComplexType() {
    JavaComplexType javaComplex = mock(JavaComplexType.class);
    when(javaComplex.getName()).thenReturn("MyFancyType");

    CppType jniComplex = JavaJniTypeConverter.convertToJniType(javaComplex);
    assertEquals(jniComplex.name, "jobject");
    verify(javaComplex).getName();
  }

  @Test
  public void convertStringType() {
    JavaComplexType javaString = mock(JavaComplexType.class);
    when(javaString.getName()).thenReturn("String");

    CppType jniString = JavaJniTypeConverter.convertToJniType(javaString);
    assertEquals(jniString.name, "jstring");
    verify(javaString).getName();
  }
}
