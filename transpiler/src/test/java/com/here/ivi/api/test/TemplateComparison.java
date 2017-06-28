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

package com.here.ivi.api.test;

import static junit.framework.TestCase.assertTrue;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.core.StringEndsWith.endsWith;
import static org.junit.Assert.assertEquals;

import java.time.Year;

public class TemplateComparison {

  static String ignoreWhitespace(String text) {
    return text.replaceAll("\\[ \\t]", " ") // ignore multiple spaces/tabs
        .replaceAll("\n+", "\n") // ignore empty lines
        .replaceAll("^\\s+", ""); // ignore leading empty lines
  }

  static String checkAndStripCopyright(String text) {
    String copyright =
        "//\n"
            + "// Copyright (C) "
            + Year.now().getValue()
            + " HERE Global B.V. and/or its affiliated companies. All rights reserved.\n"
            + "// \n"
            + "// This software, including documentation, is protected by copyright controlled by\n"
            + "// HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,\n"
            + "// adapting or translating, any or all of this material requires the prior written\n"
            + "// consent of HERE Global B.V. This material also contains confidential information,\n"
            + "// which may not be disclosed to others without prior written consent of HERE Global B.V.\n"
            + "//\n"
            + "// Automatically generated. Do not modify. Your changes will be lost.\n";
    assertTrue(text.startsWith(copyright));
    return text.substring(copyright.length());
  }

  public static void assertEqualImplementationContent(String expected, String actual) {
    assertEqualContent(expected, actual);
  }

  public static void assertEqualHeaderContent(String expected, String actual) {
    String content = checkAndStripCopyright(actual);
    content = checkAndStripPragmaAndExternC(content);
    assertEquals(ignoreWhitespace(expected), ignoreWhitespace(content));
  }

  public static void assertEqualContent(String expected, String actual) {
    String content = checkAndStripCopyright(actual);
    assertEquals(ignoreWhitespace(expected), ignoreWhitespace(content));
  }

  private static String checkAndStripPragmaAndExternC(String content) {
    content = ignoreWhitespace(content);
    String opening = "#pragma once\n" + "#ifdef __cplusplus\n" + "extern \"C\" {\n" + "#endif\n";
    String closing = "#ifdef __cplusplus\n" + "}\n" + "#endif\n";
    assertTrue("Should start with leading 'extern 'C'{'", content.startsWith(opening));
    content = content.substring(opening.length());
    assertThat(content, endsWith(closing));
    content = content.substring(0, content.length() - closing.length());
    return content;
  }
}
