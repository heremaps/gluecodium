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
import com.here.ivi.api.model.cppmodel.CppTypeDefRef;
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

  @Before
  public void setUp() {

    PowerMockito.mockStatic(TemplateEngine.class);
  }

  @Parameterized.Parameters
  public static Collection<?> getValues() {
    return java.util.Arrays.asList(
        new Object[][] {
          {new CppPrimitiveTypeRef(CppPrimitiveTypeRef.Type.INT16)},
          {new CppPrimitiveTypeRef(CppPrimitiveTypeRef.Type.VOID)},
          {new CppPrimitiveTypeRef(CppPrimitiveTypeRef.Type.FLOAT)},
          {new CppPrimitiveTypeRef(CppPrimitiveTypeRef.Type.INT32)},
          {new CppPrimitiveTypeRef(CppPrimitiveTypeRef.Type.INT64)},
          {new CppPrimitiveTypeRef(CppPrimitiveTypeRef.Type.BOOL)},
          {new CppPrimitiveTypeRef(CppPrimitiveTypeRef.Type.INT8)},
          {new CppPrimitiveTypeRef(CppPrimitiveTypeRef.Type.UINT8)},
          {new CppPrimitiveTypeRef(CppPrimitiveTypeRef.Type.DOUBLE)},
          {new CppComplexTypeRef.Builder("UserDefined").build()},
          {new CppTypeDefRef("Typedef", new CppPrimitiveTypeRef(CppPrimitiveTypeRef.Type.INT64))}
        });
  }

  @Test
  public void convert() {
    CharSequence result = CppToJniConversionTemplateDelegator.generate(CPP_VARIABLE_NAME, type);
    verifyResult(type, result);
  }

  private static void verifyResult(final CppTypeRef cppType, final CharSequence result) {
    if (cppType instanceof CppPrimitiveTypeRef || cppType instanceof CppTypeDefRef) {
      assertEquals(CPP_VARIABLE_NAME, result.toString());
    } else if (cppType instanceof CppComplexTypeRef) {
      PowerMockito.verifyStatic();
      TemplateEngine.render("jni/CppToJniStructConversionCall", CPP_VARIABLE_NAME);
    } else {
      fail();
    }
  }
}
