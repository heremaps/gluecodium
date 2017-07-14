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
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class JniToCppStringConversionTemplateTest {
  @Test
  public void generate() {
    // Arrange
    String baseName = "javaParameterName";
    String expected = "here::internal::convert_jstring_to_std_string(env, " + baseName + ")";

    // Act
    String result = TemplateEngine.render("jni/JniToCppStringConversion", baseName);

    // Assert
    assertEquals(expected, result);
  }
}
