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

package com.here.ivi.api.generator.common.java.templates;

import static org.junit.Assert.assertEquals;

import com.here.ivi.api.generator.common.TemplateEngine;
import com.here.ivi.api.model.javamodel.JavaImport;
import com.here.ivi.api.model.javamodel.JavaPackage;
import java.util.Arrays;
import java.util.List;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class JavaImportTemplateTest {

  private static final JavaPackage JAVA_PACKAGE =
      new JavaPackage(Arrays.asList("com", "here", "SomeImport"));

  private static final JavaPackage JAVA_PACKAGE2 =
      new JavaPackage(Arrays.asList("com", "here", "SomeImportZ"));

  private static final JavaPackage JAVA_PACKAGE3 =
      new JavaPackage(Arrays.asList("com", "here", "SomeImportY"));

  private static final JavaPackage JAVA_PACKAGE4 = new JavaPackage(Arrays.asList("com", "here"));

  @Test
  public void multipleImportsGeneration() {
    JavaImport import1 = new JavaImport("Class", JAVA_PACKAGE);
    JavaImport import2 = new JavaImport("Class", JAVA_PACKAGE2);
    JavaImport import3 = new JavaImport("Class", JAVA_PACKAGE3);
    JavaImport import4 = new JavaImport("Class", JAVA_PACKAGE4);

    List imports = Arrays.asList(import1, import2, import3, import4);

    String expected =
        "import com.here.SomeImport.Class;\n"
            + "import com.here.SomeImportZ.Class;\n"
            + "import com.here.SomeImportY.Class;\n"
            + "import com.here.Class;\n";

    String generated = TemplateEngine.render("java/Import", imports);

    assertEquals(expected, generated);
  }
}
