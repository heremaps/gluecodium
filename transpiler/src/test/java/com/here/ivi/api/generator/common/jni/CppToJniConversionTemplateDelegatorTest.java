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

import com.here.ivi.api.generator.common.TemplateEngine;
import com.here.ivi.api.model.cppmodel.CppComplexTypeRef;
import com.here.ivi.api.model.cppmodel.CppPrimitiveTypeRef;
import com.here.ivi.api.model.cppmodel.CppTypeRef;
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

@PrepareForTest(TemplateEngine.class)
@RunWith(Parameterized.class)
public class CppToJniConversionTemplateDelegatorTest {

  private static final String CPP_VARIABLE_NAME = "var";

  @Rule public PowerMockRule rule = new PowerMockRule();

  @Parameter public CppTypeRef type;

  @Parameter(1)
  public Class<? extends Exception> expectedException;

  @Before
  public void setUp() {

    PowerMockito.mockStatic(TemplateEngine.class);
  }

  @Parameterized.Parameters
  public static Collection<?> getValues() {
    return java.util.Arrays.asList(
        new Object[][] {
          // cppType, expected exception
          {new CppPrimitiveTypeRef(CppPrimitiveTypeRef.Type.INT16), null},
          {new CppPrimitiveTypeRef(CppPrimitiveTypeRef.Type.VOID), IllegalArgumentException.class},
          {new CppPrimitiveTypeRef(CppPrimitiveTypeRef.Type.FLOAT), null},
          {new CppPrimitiveTypeRef(CppPrimitiveTypeRef.Type.INT32), null},
          {new CppPrimitiveTypeRef(CppPrimitiveTypeRef.Type.INT64), null},
          {new CppPrimitiveTypeRef(CppPrimitiveTypeRef.Type.BOOL), null},
          {new CppPrimitiveTypeRef(CppPrimitiveTypeRef.Type.INT8), null},
          {new CppPrimitiveTypeRef(CppPrimitiveTypeRef.Type.UINT8), null},
          {new CppPrimitiveTypeRef(CppPrimitiveTypeRef.Type.DOUBLE), null},
          {new CppComplexTypeRef.Builder("UserDefined").build(), null}
        });
  }

  @Test
  public void convert() {
    boolean exceptionExpected = expectedException != null;
    Throwable caughtThrowable = null;

    try {
      try {
        CharSequence result = CppToJniConversionTemplateDelegator.generate(CPP_VARIABLE_NAME, type);
        verifyResult(type, result);
      } catch (Throwable t) {
        caughtThrowable = t;
      }
    } finally {
      //check if exception throwing behaves as expected
      if (exceptionExpected
              && caughtThrowable != null
              && expectedException.isAssignableFrom(caughtThrowable.getClass())
          || !exceptionExpected && caughtThrowable == null) {
        return;
      }
      fail();
    }
  }

  private static void verifyResult(final CppTypeRef cppType, final CharSequence result) {
    if (cppType instanceof CppPrimitiveTypeRef) {
      assertEquals(CPP_VARIABLE_NAME, result.toString());
    } else if (cppType instanceof CppComplexTypeRef) {
      PowerMockito.verifyStatic();
      TemplateEngine.render("jni/CppToJniStructConversionCall", CPP_VARIABLE_NAME);
    } else {
      fail();
    }
  }
}
