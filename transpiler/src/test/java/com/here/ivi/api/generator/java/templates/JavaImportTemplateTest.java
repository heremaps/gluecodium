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

package com.here.ivi.api.generator.java.templates;

import static org.junit.Assert.assertEquals;

import com.here.ivi.api.generator.common.TemplateEngine;
import com.here.ivi.api.model.java.JavaImport;
import com.here.ivi.api.model.java.JavaPackage;
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
