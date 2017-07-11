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

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.fail;
import static org.mockito.Mockito.times;

import com.here.ivi.api.generator.common.jni.templates.CppToJniStringConversionTemplate;
import com.here.ivi.api.model.javamodel.JavaPrimitiveType;
import com.here.ivi.api.model.javamodel.JavaPrimitiveType.Type;
import com.here.ivi.api.model.javamodel.JavaReferenceType;
import com.here.ivi.api.model.javamodel.JavaType;
import java.util.Collection;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;
import org.junit.runners.Parameterized.Parameter;
import org.powermock.api.mockito.PowerMockito;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.rule.PowerMockRule;

@RunWith(Parameterized.class)
@PrepareForTest(CppToJniStringConversionTemplate.class)
public class CppToJniConversionTemplateDelegatorTest {

  @Rule public PowerMockRule powerMockRule = new PowerMockRule();

  @Before
  public void setUp() {

    PowerMockito.mockStatic(CppToJniStringConversionTemplate.class);
  }

  @Parameter public JavaType type;

  @Parameter(1)
  public Class<? extends Exception> expectedException;

  @Parameterized.Parameters
  public static Collection<?> getValues() {
    return java.util.Arrays.asList(
        new Object[][] {
          // javaType, expected exception
          {new JavaPrimitiveType(Type.SHORT), null},
          {new JavaPrimitiveType(Type.VOID), IllegalArgumentException.class},
          {new JavaPrimitiveType(Type.FLOAT), null},
          {new JavaPrimitiveType(Type.INT), null},
          {new JavaPrimitiveType(Type.LONG), null},
          {new JavaPrimitiveType(Type.BOOL), null},
          {new JavaPrimitiveType(Type.BYTE), null},
          {new JavaPrimitiveType(Type.CHAR), null},
          {new JavaPrimitiveType(Type.DOUBLE), null},
          {
            new JavaReferenceType(JavaReferenceType.Type.BOOLEAN_ARRAY),
            IllegalArgumentException.class
          },
          {new JavaReferenceType(JavaReferenceType.Type.STRING), null}
        });
  }

  @Test
  public void convert() {
    /*
     * explicit exception checking is required here as PowerMockRule does not work with
     * ExpectedException Rule
     *
     * compare:
     * https://stackoverflow.com/questions/28444919/test-with-expectedexception-fails-when-using-powemock-with-powermockrule
     * https://github.com/powermock/powermock/issues/396
     *
     */
    boolean exceptionExpected = expectedException != null;
    Exception caughtException = null;

    try {
      try {
        CharSequence result = CppToJniConversionTemplateDelegator.generate("var", type);
        verifyResult(type, "var", result);
      } catch (Exception e) {
        caughtException = e;
      }
    } finally {
      //check if exception throwing behaves as expected
      if (exceptionExpected
              && caughtException != null
              && expectedException.isAssignableFrom(caughtException.getClass())
          || !exceptionExpected && caughtException == null) {
        return;
      }
      fail();
    }
  }

  private static void verifyResult(
      final JavaType javaType, final String cppVariableName, final CharSequence result) {

    if (javaType instanceof JavaPrimitiveType) {
      assertEquals(cppVariableName, result.toString());
    } else if (javaType instanceof JavaReferenceType
        && ((JavaReferenceType) javaType).type == JavaReferenceType.Type.STRING) {
      PowerMockito.verifyStatic(times(1));
      CppToJniStringConversionTemplate.generate(null);
    } else {
      fail();
    }
  }
}
