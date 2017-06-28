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

package com.here.ivi.api.generator.common.jni;

import com.here.ivi.api.generator.common.jni.templates.CppToJniPrimitiveTypeConversionTemplate;
import com.here.ivi.api.generator.common.jni.templates.CppToJniStringConversionTemplate;
import com.here.ivi.api.model.javamodel.JavaPrimitiveType;
import com.here.ivi.api.model.javamodel.JavaReferenceType;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.ExpectedException;
import org.junit.runner.RunWith;
import org.powermock.api.mockito.PowerMockito;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
@PrepareForTest({
  CppToJniPrimitiveTypeConversionTemplate.class,
  CppToJniStringConversionTemplate.class
})
public final class CppToJniConversionTemplateDelegatorTest {
  @Rule public final ExpectedException expectedException = ExpectedException.none();

  @Before
  public void setUp() {
    PowerMockito.mockStatic(CppToJniPrimitiveTypeConversionTemplate.class);
    PowerMockito.mockStatic(CppToJniStringConversionTemplate.class);
  }

  @Test
  public void convertString() {

    //arrange
    JavaReferenceType stringType = new JavaReferenceType(JavaReferenceType.Type.STRING);

    //act
    CppToJniConversionTemplateDelegator.generate(null, stringType);

    //verify
    PowerMockito.verifyStatic();
    CppToJniStringConversionTemplate.generate(null);
  }

  @Test
  public void convertNonSupportedReferenceType() {

    //arrange
    JavaReferenceType unsupportedType = new JavaReferenceType(JavaReferenceType.Type.BOOLEAN_ARRAY);

    //act
    expectedException.expect(IllegalArgumentException.class);
    CppToJniConversionTemplateDelegator.generate(null, unsupportedType);
  }

  @Test
  public void convertBool() {

    //arrange
    JavaPrimitiveType boolType = new JavaPrimitiveType(JavaPrimitiveType.Type.BOOL);

    //act
    CppToJniConversionTemplateDelegator.generate(null, boolType);

    //verify
    PowerMockito.verifyStatic();
    CppToJniPrimitiveTypeConversionTemplate.generate("jboolean", null);
  }

  @Test
  public void convertByte() {

    //arrange
    JavaPrimitiveType byteType = new JavaPrimitiveType(JavaPrimitiveType.Type.BYTE);

    //act
    CppToJniConversionTemplateDelegator.generate(null, byteType);

    //verify
    PowerMockito.verifyStatic();
    CppToJniPrimitiveTypeConversionTemplate.generate("jbyte", null);
  }

  @Test
  public void convertDouble() {

    //arrange
    JavaPrimitiveType doubleType = new JavaPrimitiveType(JavaPrimitiveType.Type.DOUBLE);

    //act
    CppToJniConversionTemplateDelegator.generate(null, doubleType);

    //verify
    PowerMockito.verifyStatic();
    CppToJniPrimitiveTypeConversionTemplate.generate("jdouble", null);
  }

  @Test
  public void convertChar() {

    //arrange
    JavaPrimitiveType charType = new JavaPrimitiveType(JavaPrimitiveType.Type.CHAR);

    //act
    CppToJniConversionTemplateDelegator.generate(null, charType);

    //verify
    PowerMockito.verifyStatic();
    CppToJniPrimitiveTypeConversionTemplate.generate("jchar", null);
  }

  @Test
  public void convertFloat() {

    //arrange
    JavaPrimitiveType floatType = new JavaPrimitiveType(JavaPrimitiveType.Type.FLOAT);

    //act
    CppToJniConversionTemplateDelegator.generate(null, floatType);

    //verify
    PowerMockito.verifyStatic();
    CppToJniPrimitiveTypeConversionTemplate.generate("jfloat", null);
  }

  @Test
  public void convertInt() {

    //arrange
    JavaPrimitiveType int8Type = new JavaPrimitiveType(JavaPrimitiveType.Type.INT);

    //act
    CppToJniConversionTemplateDelegator.generate(null, int8Type);

    //verify
    PowerMockito.verifyStatic();
    CppToJniPrimitiveTypeConversionTemplate.generate("jint", null);
  }

  @Test
  public void convertShort() {

    //arrange
    JavaPrimitiveType shortType = new JavaPrimitiveType(JavaPrimitiveType.Type.SHORT);

    //act
    CppToJniConversionTemplateDelegator.generate(null, shortType);

    //verify
    PowerMockito.verifyStatic();
    CppToJniPrimitiveTypeConversionTemplate.generate("jshort", null);
  }

  @Test
  public void convertVoid() {

    //arrange
    JavaPrimitiveType voidType = new JavaPrimitiveType(JavaPrimitiveType.Type.VOID);

    //act
    expectedException.expect(IllegalArgumentException.class);
    CppToJniConversionTemplateDelegator.generate(null, voidType);

    //verify
    PowerMockito.verifyStatic();
    CppToJniPrimitiveTypeConversionTemplate.generate("void", null);
  }
}
