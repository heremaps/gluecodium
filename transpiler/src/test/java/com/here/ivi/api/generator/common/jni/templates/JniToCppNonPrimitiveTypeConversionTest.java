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

package com.here.ivi.api.generator.common.jni.templates;

import static org.junit.Assert.assertEquals;

import com.here.ivi.api.generator.common.TemplateEngine;
import com.here.ivi.api.generator.common.jni.JniToCppTypeConversionTemplateDelegator;
import java.util.HashMap;
import java.util.Map;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class JniToCppNonPrimitiveTypeConversionTest {
  @Test
  public void generate() {
    // Arrange
    String cppName = "cppVariable";
    String jniName = "jniVariable";
    Map<String, String> names = new HashMap<>();
    names.put(JniToCppTypeConversionTemplateDelegator.CPP_VARIABLE_NAME, cppName);
    names.put(JniToCppTypeConversionTemplateDelegator.JNI_VARIABLE_NAME, jniName);

    String expected = "here::internal::convert_from_jni( env, " + jniName + ", " + cppName + " )";

    // Act
    String result = TemplateEngine.render("jni/JniToCppNonPrimitiveTypeConversion", names);

    // Assert
    assertEquals(expected, result);
  }
}
