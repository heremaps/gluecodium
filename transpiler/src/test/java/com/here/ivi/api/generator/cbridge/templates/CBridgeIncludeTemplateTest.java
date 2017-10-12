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

package com.here.ivi.api.generator.cbridge.templates;

import static org.junit.Assert.assertEquals;

import com.here.ivi.api.generator.common.TemplateEngine;
import com.here.ivi.api.model.common.Include;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class CBridgeIncludeTemplateTest {

  private String generate(Include incl) {
    return TemplateEngine.render("common/Include", incl);
  }

  @Test
  public void systemInclude() {
    Include include = Include.createSystemInclude("header.h");
    String expected = "#include <header.h>\n";

    String generated = generate(include);

    assertEquals(expected, generated);
  }

  @Test
  public void projectInclude() {
    Include include = Include.createInternalInclude("header.h");
    String expected = "#include \"header.h\"\n";

    String generated = generate(include);

    assertEquals(expected, generated);
  }

  @Test
  public void unknownTypeInclude() {
    Include include = Include.createInternalInclude("");

    String generated = generate(include);

    final String expected = "// Unknown or unresolved include\n";
    assertEquals(expected, generated);
  }
}
