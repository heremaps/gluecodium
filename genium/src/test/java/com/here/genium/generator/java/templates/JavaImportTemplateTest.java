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

package com.here.genium.generator.java.templates;

import static org.junit.Assert.assertEquals;

import com.here.genium.generator.common.templates.TemplateEngine;
import com.here.genium.model.java.JavaImport;
import com.here.genium.model.java.JavaPackage;
import java.util.Arrays;
import java.util.List;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
@SuppressWarnings({"MethodName"})
public final class JavaImportTemplateTest {
  private static final JavaPackage TEST_JAVA_PACKAGE_A =
      new JavaPackage(Arrays.asList("com", "example", "SomeImport"));
  private static final JavaPackage TEST_JAVA_PACKAGE_B =
      new JavaPackage(Arrays.asList("com", "example", "SomeImportZ"));
  private static final JavaPackage TEST_JAVA_PACKAGE_C =
      new JavaPackage(Arrays.asList("com", "example", "SomeImportY"));
  private static final JavaPackage TEST_JAVA_PACKAGE_D =
      new JavaPackage(Arrays.asList("com", "example"));

  @Test
  public void render_multipleImports() {
    // Arrange
    List imports =
        Arrays.asList(
            new JavaImport("Class", TEST_JAVA_PACKAGE_A),
            new JavaImport("Class", TEST_JAVA_PACKAGE_B),
            new JavaImport("Class", TEST_JAVA_PACKAGE_C),
            new JavaImport("Class", TEST_JAVA_PACKAGE_D));

    String expected =
        "import com.example.SomeImport.Class;\n"
            + "import com.example.SomeImportZ.Class;\n"
            + "import com.example.SomeImportY.Class;\n"
            + "import com.example.Class;\n";

    // Act
    String generated = TemplateEngine.render("java/Import", imports);

    // Assert
    assertEquals(expected, generated);
  }
}
