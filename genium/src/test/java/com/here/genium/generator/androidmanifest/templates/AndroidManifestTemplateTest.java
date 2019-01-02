/*
 * Copyright (C) 2016-2018 HERE Europe B.V.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
 * License-Filename: LICENSE
 */

package com.here.genium.generator.androidmanifest.templates;

import static org.junit.Assert.assertEquals;

import com.here.genium.generator.common.templates.TemplateEngine;
import com.here.genium.model.java.JavaPackage;
import java.util.Arrays;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class AndroidManifestTemplateTest {
  private static final String TEST_COPYRIGHT_HEADER;

  static {
    TEST_COPYRIGHT_HEADER = TemplateEngine.INSTANCE.render("xml/CopyrightHeader", null);
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
    String generated =
        TemplateEngine.INSTANCE.render("android/AndroidManifest", javaPackage.flatten());

    // Assert
    assertEquals(expected, generated);
  }
}
