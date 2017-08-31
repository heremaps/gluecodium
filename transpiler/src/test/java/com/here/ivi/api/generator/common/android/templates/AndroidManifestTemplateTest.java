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

package com.here.ivi.api.generator.common.android.templates;

import static junit.framework.TestCase.assertEquals;

import com.here.ivi.api.generator.common.TemplateEngine;
import com.here.ivi.api.model.javamodel.JavaPackage;
import java.util.Arrays;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class AndroidManifestTemplateTest {
  private static final String TEST_COPYRIGHT_HEADER;

  static {
    TEST_COPYRIGHT_HEADER = TemplateEngine.render("xml/CopyrightHeader", null);
  }

  @Test
  public void generate() {
    // Arrange
    JavaPackage javaPackage = new JavaPackage(Arrays.asList("com", "example", "android"));
    String expected =
        TEST_COPYRIGHT_HEADER
            + "\n"
            + "<manifest\n"
            + "    xmlns:android=\"http://schemas.android.com/apk/res/android\"\n"
            + "    package=\"com.example.android\">\n"
            + "\n"
            + "    <uses-permission android:name=\"android.permission.INTERNET\"/>\n"
            + "\n"
            + "</manifest>";

    // Act
    String generated = AndroidManifestTemplate.generate(javaPackage);

    // Assert
    assertEquals(expected, generated);
  }
}
